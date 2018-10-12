<?php

define('ROOT', __DIR__ . '/../');

// 设置时区
date_default_timezone_set('PRC');

// 使用 redis 保存 SESSION
ini_set('session.save_handler', 'redis');
// 设置 redis 服务器的地址、端
ini_set('session.save_path', 'tcp://127.0.0.1:6379?database=3');

session_start();

// 引入函数文件
require(ROOT.'libs/functions.php');
// 引入 composer 自动加载文件
require(ROOT.'vendor/autoload.php');
/**
 * 类的自动加载
 */
function load($class)
{
    $path = str_replace('\\', '/', $class);
    require(ROOT . $path . '.php');
}
spl_autoload_register('load');


/**
 * 解析路由
 */
//添加路由：解析URL上的路径：控制器/方法
if(php_sapi_name() == 'cli'){
    $controller = ucfirst($argv[1]).'Controller';
    $action = $argv[2];
}else{
    // 获取URL上的路径
    if(isset($_SERVER['PATH_INFO'])){
        $pathInfo = $_SERVER['PATH_INFO'];
        $pathInfo = explode('/',$pathInfo);
        $controller = ucfirst($pathInfo[1]).'Controller';
        $action = $pathInfo[2];
    }else{
        //默认控制器
        $controller = 'IndexController';
        $action = 'index';
    }
}
$fullController = 'controllers\\'.$controller;
$c = new $fullController;
$c->$action();

