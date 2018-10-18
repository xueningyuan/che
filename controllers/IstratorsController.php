<?php
namespace controllers;

use models\Admin;
use models\Privilege;
use models\Role;

class IstratorsController extends BaseController
{
    public function test(){
        $model = new Admin;
        echo "<pre>";
        $model->getUalPath(2);
    }
    public function design()
    {   
        $model = new Admin;

        $data = $model->findAll([
            'fields' => 'a.*,c.role_name',
            'order_by' => 'a.id',
            'order_way' => '',
            'join'=>' a left join admin_role b on a.id = b.admin_id left join role c on b.role_id=c.id '
        ]);
        // 显示页面
        // echo "<pre>";
        // var_dump($data);
        view('admin/design',[
            'data'=>$data,
            ]);
    }
    // 显示添加的表单
    public function create()
    {
        $Role = new Role;
        $role = $Role->findAll();
        view('admin/insert',[
            'role'=>$role['data'],
        ]);
    }

    // 处理添加表单
    public function insert()
    {   
        $Admin = new Admin;
        $_POST['pass']=md5($_POST['pass']);
        $Admin->fill($_POST);
        $Admin->insert();
        redirect('/istrators/design');
    }

    // 显示修改的表单
    public function edit()
    {   
        $Role = new Role;
        $role = $Role->findAll();
        $Admin = new Admin;
        $Admin = $Admin->findOne($_GET['id']);
        // var_dump($Admin);
        view('admin/edit', [
            'role'=>$role['data'],
            'Admin'=>$Admin,
        ]);
    }

    // 修改表单的方法
    public function update()
    {
        $model = new Admin;
        $model->fill($_POST);
        $model->update($_GET['id']);
        redirect('/istrators/design');
    }

    // 删除
    public function delete()
    {
        $Admin = new Admin;
        $Admin->delete($_GET['id']);
        message("删除成功", 0, "/istrators/design");
    }
}