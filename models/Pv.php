<?php
namespace models;

class Pv extends Model
{
    // 设置这个模型对应的表
    protected $table = 'pv';
    // 设置允许接收的字段
    protected $fillable = ['ip','url','user_id'];
    
}