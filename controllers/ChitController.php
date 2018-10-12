<?php
namespace controllers;


// 引入短信类
use Flc\Dysms\Client;
use Flc\Dysms\Request\SendSms;

class ChitController{
    public static function getChit()
    {
        $redis = \libs\Redis::getInstance([
            'scheme' => 'tcp',
            'host'   => 'localhost',
            'port'   => 6379,
            'read_write_timeout' => 0,  // 读、写超时时间（0：无限）
            'database' => 0,            // 数据库
            'password' => null,           // 密码
        ]);
        // 创建发短信对象
        $user = [
            'accessKeyId'    => 'LTAIsduZor6uivS5',
            'accessKeySecret' => 'VhxpdWdZuXMm95Zv7lC1euG14PxA7I',
        ];
        $client  = new Client($user);
        $sendSms = new SendSms;
        $sendSms->setSignName('全栈9组sns项目');
        $sendSms->setTemplateCode('SMS_135043386');
        /* 循环阻塞监听队列，当队列中传入数据时就取出数据并发短信*/
        ini_set('default_socket_timeout', -1);
        echo "开始监听\r\n";
        while(1)
        {
        
            $data = $redis->brpop('sms_list',0);
            $data = explode('-', $data[1]);
            echo $data[0]."\r\n";
            $sendSms->setPhoneNumbers($data[0]);
            $sendSms->setTemplateParam(['code' => $data[1]]);
            // 发送
            $d = $client->execute($sendSms);
            var_dump($d);
            echo "\r\n发送完毕，等待下一个\r\n";
        }
    }
}