<?php
namespace controllers;

use models\Goods;
use models\Classs;

class GoodsController
{
    public function design()
    {   
        $model = new Goods;
        $Classs = new Classs;

        $cla = $Classs->findAll();

        $where = $model->search($_POST);
        $data = $model->findAll([
            'fields'=>'a.*,b.email,c.name',
            'where' => $where,
            'join'=>'a LEFT JOIN users b ON a.user_id=b.id LEFT JOIN classs c ON a.class_id=c.id ',
            'per_page'=>5
        ]);
        @$data['select']['title'] = $_POST['title'];
        @$data['select']['email'] = $_POST['email'];
        @$data['select']['class'] = $_POST['class'];
        // 显示页面
        view('goods/design',[
            'data'=>$data,
            'class'=>$cla['data'],
            ]);
    }
    // 显示添加的表单
    public function create()
    {
        $Classs = new Classs;
        $cla = $Classs->findAll();

        view('goods/insert',$cla);
    }

    // 处理添加表单
    public function insert()
    {
        $model = new Goods;
        $_POST['user_id'] = $_SESSION['id'];
        $model->fill($_POST);
        $model->insert();
        redirect('/goods/design');
    }

    // 显示修改的表单
    public function edit()
    {   
        $Classs = new Classs;
        $cla = $Classs->findAll();

        $model = new Goods;
        $data=$model->findOne($_GET['id']);
        
        view('goods/edit', [
            'data' => $data,
            'class'=>$cla['data']    
        ]);
    }

    // 修改表单的方法
    public function update()
    {
        $model = new Goods;
        $model->fill($_POST);
        $model->update($_GET['id']);
        redirect('/goods/design');
    }

    // 删除
    public function delete()
    {
        $model = new Goods;
        $model->delete($_GET['id']);
        redirect('/goods/design');
    }
}