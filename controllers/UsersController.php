<?php
namespace controllers;

use models\User;
use Flc\Dysms\Client;
use Flc\Dysms\Request\SendSms;
use Illuminate\Support\Facades\Cache;

class UsersController
{   

    public function sns(){
        $code = rand(100000,999999);
        $redis = \libs\Redis::getInstance();

        $name = 'code-'.$_GET['mobile'];
        $_SESSION['code'] = $code;

       $redis->lpush('sms_list',$_GET['mobile'].'-'.$code);
    }

    public function index(){
        $a = ['a1'=>rand(1,99),'a2'=>rand(1,99)];
        $_SESSION['code2'] = $a['a1']+$a['a2'];
        echo  $_SESSION['code2'];
        view('login/index',$a);
    }
    public function login(){        
        if(!isset($_POST['code2']) || $_POST['code2'] != $_SESSION['code2'])
        {
            message('验证码错误！', 0, '/users/index');
            return;
        }

        $email = $_POST['email'];
        $pass = $_POST['pass'];

        // var_dump($_POST);die;
        $model = new User;
        try
        {   
            $model->login($email,$pass);
            // 如果登录成功进入后台
            redirect('/');
        }
        catch(\Exception $e)
        {   
            // 如果这个方法中抛出了异常就执行到这里
            redirect('/users/index');
        }
    }

    public function logout()
    {
        $model = new User;
        $model->logout();
        redirect('/users/index');
    }
    public function register(){
        view('login/register');
    }
    public function doregister(){
        $code = $_POST['code'];
        if($code && $code != $_SESSION['code']){
            $_SESSION['code']=null;
            message('验证码错误！', 1, '/users/register'); 
           return;
        }else{
            $_SESSION['code']=null;
             // 1. 接收表单
            $email = $_POST['email'];
            $password = md5($_POST['pass']);
            $phone = $_POST['phone'];

            // 2. 生成激活码(32位的随机的字符串)（原则：让用户猜不出来规律）
            $code = md5( rand(1,99999) );

            // 3. 保存到 Redis
            $redis = \libs\Redis::getInstance();
            // 序列化（数组转成 JSON 字符串）
            // 序列化
            $values = json_encode([
                'email'=>$email,
                'pass'=>$password,
                'phone'=>$phone
            ]);
            $key = "temp_user:{$code}";
            $redis->setex($key,300,$values);


            // 从邮箱地址中取出姓名     
            $name = explode('@',$email);
             // 构造收件人地址
            $from = [$email,$name[0]];

            // 构造信息数组
            $message = [
                'title'=>'欢迎加入全栈一班',
                'content'=>"点击以下链接进行激活：\r\n <br>
                <a href='http://xue.ngrok.xiaomiqiu.cn/users/active_user?code={$code}'>
                http://xue.ngrok.xiaomiqiu.cn/users/active_user?code={$code}\r\n<br></a>如果不能点击，请复制地址",
                'from'=>$from,
            ];
             // 把消息转成字符串(JSON ==> 序列化)
             $message = json_encode($message);
             $redis = \libs\Redis::getInstance();
            // 收入信息队列
            $redis->lpush('email',$message);
            message('邮件发送成功！', 1, '/users/index');
        }
       
    }
    // 激活
    public function active_user(){
        $code = $_GET['code'];
        $redis = \libs\redis::getInstance();
        $key = 'temp_user:'.$code;
        $data = $redis->get($key);
        if($data){
            $redis->del($key);
            $data = json_decode($data,true);
            $user = new User;
            $user->fill($data);
            $user->insert();
            // die("激活成功！");
            header('Location:/users/index');

        }
        else
        {
            die('激活码无效！');
        }
    }




}