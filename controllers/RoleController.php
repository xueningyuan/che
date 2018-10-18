<?php
namespace controllers;

use models\Admin;
use models\Privilege;
use models\Role;

class RoleController extends BaseController
{
    public function design()
    {   
        $model = new Role;

        $data = $model->findAll([
            'order_way' => ''
        ]);
        // 显示页面
        // echo "<pre>";
        // var_dump($data);
        view('role/design',[
            'data'=>$data,
            ]);
    }
    // 显示添加的表单
    public function create()
    {
        $Privilege = new Privilege;
        $Privilege = $Privilege->tree();
        // echo "<pre>";
        // var_dump($Privilege);
        view('role/insert',[
            'Privilege'=>$Privilege,
        ]);
    }

    // 处理添加表单
    public function insert()
    {   
        $Admin = new Role;
        $Admin->fill($_POST);
        $Admin->insert();
        redirect('/role/design');
    }

    // 显示修改的表单
    public function edit()
    {   
        $Privilege = new Privilege;
        $Privilege = $Privilege->tree();

        $Role = new Role;
        $data = $Role->findOne($_GET['id']);
        $priIds = $Role->getPriIds($_GET['id']);

        // var_dump($Admin);
        view('role/edit', [
            'Privilege'=>$Privilege,
            'data'=>$data,
            'priIds'=>$priIds
        ]);
    }

    // 修改表单的方法
    public function update()
    {
        $model = new Role;
        $model->fill($_POST);
        $model->update($_GET['id']);
        redirect('/role/design');
    }

    // 删除
    public function delete()
    {
        $Admin = new Role;
        $Admin->delete($_GET['id']);
        message("删除成功", 0, "/role/design");
    }
}