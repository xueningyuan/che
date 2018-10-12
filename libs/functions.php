<?php
function view($file,$data=[]){
    extract($data);
    include(ROOT.'views/'.$file.'.html');
}

function redirect($url)
{
    header('Location:'.$url);
    exit;
}

// 配置文件
function config($name){
    static $config = null;
    if($config === null){
        $config = require(ROOT.'config.php');
    }
    return $config[$name];
}

// 提示消息的函数
// type 0:alert   1:显示单独的消息页面  2：在下一个页面显示
// 说明：$seconds 只有在 type=1时有效，代码几秒自动跳动
function message($message, $type, $url, $seconds = 5)
{
    if($type == 0)
    {
        echo "<script>alert('{$message}');location.href='{$url}';</script>";
        exit;

    }
    else if($type == 1)
    {
        // 加载消息页面
        view('common/success', [
            'message' => $message,
            'url' => $url,
            'seconds' => $seconds
        ]);
    }
    else if($type==2)
    {
        // 把消息保存到 SESSION
        $_SESSION['_MESS_'] = $message;
        // 跳转到下一个页面
        redirect($url);
    }
}