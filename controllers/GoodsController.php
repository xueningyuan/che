<?php
namespace controllers;

use models\Goods;

class GoodsController
{
    public function design()
    {   
        $model = new Goods;

        $where = $model->search($_POST);
        $data = $model->findAll([
            'fields'=>'a.*,b.email',
            'where' => $where,
            'join'=>'a LEFT JOIN users b ON a.user_id=b.id',
            'per_page'=>5
        ]);
        
        @$data['select']['title'] = $_POST['title'];
        @$data['select']['email'] = $_POST['email'];
        // 显示页面
        view('goods/design',$data);
    }

    public function select()
    {   

    }
    // 显示添加的表单
    public function create()
    {

        view('goods/insert');
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
        $model = new Goods;
        $data=$model->findOne($_GET['id']);

        view('goods/edit', [
            'data' => $data    
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