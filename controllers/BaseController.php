<?php
/* 必须登录才能访问 */
namespace controllers;

use models\Pv;

class BaseController
{
    public function __construct()
    {
        // 判断登录
        if(!isset($_SESSION['id']))
        {
            redirect('/users/index');
        }

        $data['ip'] = $_SERVER["REMOTE_ADDR"];
        $data['url'] = $_SERVER['REQUEST_URI'];
        $data['user_id'] = $_SESSION['id'];
        $model = new Pv;
        $model->fill($data);
        $model->insert();

    }

}