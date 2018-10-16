<?php
namespace controllers;

class IndexController extends BaseController
{
    public function index ()
    {   
        // 显示页面
        view('index/index');
    }
}