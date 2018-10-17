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
            redirect('/admin/index');
        }
        

        if(isset($_SESSION['root']) && $_SESSION['root']==true )
        {   
            return ;
        }
        // 获取将要访问的路径 
        $path = isset($_SERVER['PATH_INFO'])? trim($_SERVER['PATH_INFO'], '/') : 'index/index';
        // 设置一个白名单
        $whiteList = ['/upload/upload','index/index','goods/ajax_get_cat'];
        // 判断是否有权访问
        
        if(!in_array($path, array_merge($whiteList, $_SESSION['url_path'])))
        {
            message('无权访问！', 0, '/goods/design');

        }



        $data['ip'] = $_SERVER["REMOTE_ADDR"];
        $data['url'] = $_SERVER['REQUEST_URI'];
        $data['user_id'] = $_SESSION['id'];
        $model = new Pv;
        $model->fill($data);
        $model->insert();

    }

}