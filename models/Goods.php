<?php
namespace models;

class Goods extends Model
{
    // 设置这个模型对应的表
    protected $table = 'goods';
    // 设置允许接收的字段
    protected $fillable = ['title','type','diji','user_id','comment','content'];

    public function search($POST){

        $where = 1;

        $value = [];
        if(isset($POST['title']) && $POST['title'] ){
            $value ='%'.$POST['title'].'%';
            $where .= " and (a.title like '{$value}' or a.content like '{$value}') ";
        }

        if(isset($POST['email']) && $POST['email'] ){
            $value = '%'.$POST['email'].'%';
            $where .= " and (b.email like '{$value}') ";
        }
        return $where;
    } 

    
}