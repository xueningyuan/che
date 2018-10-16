<?php
namespace controllers;

use models\Goods;
use models\Classs;

class GoodsController extends BaseController
{
    public function ajax_get_cat(){
        $id = $_GET['id'];
        $Classs = new Classs;
        $cla = $Classs->findAll([
            'where'=> " class_id={$id}"
        ]);
        echo json_encode($cla);
    }
    public function design()
    {   
        $model = new Goods;
        $Classs = new Classs;

        $cla = $Classs->findAll([
            'where'=> " class_id=0"
        ]);

        $where = $model->search($_POST);
        $data = $model->findAll([
            'fields'=>'a.*,b.email',
            'where' => $where,
            'join'=>'a LEFT JOIN users b ON a.user_id=b.id ',
        ]);
        @$data['select']['title'] = $_POST['title'];
        @$data['select']['email'] = $_POST['email'];
        @$data['select']['cla1'] = $_POST['cla1'];
        @$data['select']['cla2'] = $_POST['cla2'];
        @$data['select']['cla3'] = $_POST['cla3'];
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
        $cla = $Classs->findAll([
            'where'=>' class_id=0'
        ]);

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
        $cla = $Classs->findAll([
            'where'=>' class_id=0'
        ]);



        $model = new Goods;
        $data=$model->findOne($_GET['id']);
        $data['image']=$model->getimg($_GET['id']);

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
        message("删除成功", 0, "/goods/design");
    }
}