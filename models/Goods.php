<?php
namespace models;

class Goods extends Model
{
    // 设置这个模型对应的表
    protected $table = 'goods';
    // 设置允许接收的字段
    protected $fillable = ['title','type','diji','user_id','comment','content','cla1','cla2','cla3','image'];

    public function search($POST){

        $where = 1;

        $value = [];
        if(isset($POST['cla1']) && $POST['cla1'] ){
            $where .= " and (a.cla1 = {$POST['cla1']}) ";
        }
        if(isset($POST['cla2']) && $POST['cla2'] ){
            $where .= " and (a.cla2 = {$POST['cla2']}) ";
        }
        if(isset($POST['cla3']) && $POST['cla3'] ){
            $where .= " and (a.cla3 = {$POST['cla3']}) ";
        }
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

        // 添加、修改之前执行
        public function _before_write()
        {
            // echo '<pre>';
            // var_dump($_FILES);die;
            // 判断如果上传了LOGO，就删除原LOGO然后上传新LOGO 
                // 删除原LOGO
            if($_FILES['image']['error'] == 0)
            {  
                $this->_delete_logo();
                // 实现上传图片的代码
                $uploader = \libs\Uploader::make();
                $logo = '/uploads/' . $uploader->upload('image', 'goods');
                // $this->data ：将要插入到数据库中的数据（数组）
                // 把 logo 加到数组中，就可以插入到数据库
                $this->data['image'] = $logo; 
            }

        }

        protected function _delete_logo()
        {
            // 如果是修改就删除原图片
            if(isset($_GET['id']))
            {
                // 先从数据库中取出原LOGO
                $ol = $this->findOne($_GET['id']);
                // 删除
                @unlink(ROOT . 'public'. $ol['logo']);
            }
        }

    
}