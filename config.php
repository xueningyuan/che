<?php
return [
    'mode' => 'dev',     //  dev （开发模式）   pro（上线模式)
    'redis' => [
        'scheme'=>'tcp',
        'host'=>'127.0.0.1',
        'post'=>'6379'
    ],
    'db'=>[
        'host'=>'127.0.0.1',
        'dbname'=>'bock',
        'user'=>'root',
        'pass'=>'123',
        'chaeset'=>'utf8',
    ],
    'email'=>[
        'mode'=>'debug',//debug 调试模式 production 正式
        'port'=>25,
        'host'=>'smtp.126.com',
        'name'=>'xueninyuan@126.com',
        'pass'=>'2298593298a',
        'from_email'=>'xueninyuan@126.com',
        'from_name'=>'雪凝渊',
    ]
];