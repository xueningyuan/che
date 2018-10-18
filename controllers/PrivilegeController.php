<?php
namespace controllers;

use models\Admin;
use models\Privilege;
use models\Role;

class PrivilegeController extends BaseController
{
    public function design()
    {   
        $model = new Privilege;

        $data = $model->tree();
        // 显示页面
        // echo "<pre>";
        // var_dump($data);
        view('privilege/design',[
            'data'=>$data,
            ]);
    }
    // 显示添加的表单
    public function create()
    {
        view('privilege/insert');
    }

    // 处理添加表单
    public function insert()
    {   
        $Privilege = new Privilege;
        $Privilege->moke();
        redirect('/privilege/design');
    }

    // 显示修改的表单
    public function edit()
    {   
        $Admin = new Privilege;
        $data = $Admin->findOne($_GET['id']);
        var_dump($data);
        view('privilege/edit', [
            'data'=>$data,
        ]);
    }

    // 修改表单的方法
    public function update()
    {
        $model = new Privilege;
        $model->fill($_POST);
        $model->update($_GET['id']);
        redirect('/privilege/design');
    }

    // 删除
    public function delete()
    {   
        $Admin = new Privilege;
        $Admin->delete($_GET['id']);
        message("删除成功", 0, "/privilege/design");
    }
}