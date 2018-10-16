<?php
namespace models;


class Goods extends Model
{
    // 设置这个模型对应的表
    protected $table = 'goods';
    // 设置允许接收的字段
    protected $fillable = ['title','type','diji','user_id','comment','content','cla1','cla2','cla3'];

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
            
                    // 如果有要删除的图片ID，那就删除
            if(isset($_POST['del_image']) && $_POST['del_image'] != '')
            {
                // 先根据ID把图片路径取出来
                $stmt = $this->_db->prepare("SELECT * FROM good_img WHERE id IN({$_POST['del_image']})");
                $stmt->execute();
                $path = $stmt->fetchAll(\PDO::FETCH_ASSOC);
                // 循环每个图片的路径并删除
                foreach($path as $v)
                {
                    @unlink(ROOT.'public/'.$v['image']);
                    @unlink(ROOT.'public/'.$v['img1']);
                    @unlink(ROOT.'public/'.$v['img2']);
                    @unlink(ROOT.'public/'.$v['img3']);
                }
                // 从数据库中把图片的记录删除
                $stmt = $this->_db->prepare("DELETE FROM good_img WHERE id IN({$_POST['del_image']})");
                $stmt->execute();
            }
            // echo '<pre>';
            // var_dump($_FILES);die;
            $stmt = $this->_db->prepare("select max(id) id from goods");
            $stmt->execute();
            $goodsId = $stmt->fetch( \PDO::FETCH_ASSOC );
            
            $goodsId =isset($_GET['id']) ? $_GET['id'] : $goodsId['id']+1;
            if($_FILES['image']['error'][0] == 0)
            {  
                $this->_delete_logo($goodsId);
                // 实现上传图片的代码
                $uploader = \libs\Uploader::make();
                $resize = \libs\Resize::make();
                $stmt = $this->_db->prepare("INSERT INTO good_img(good_id,image,img1,img2,img3) VALUES(?,?,?,?,?)");
                $_tmp = [];
                echo "<pre>";
                // 循环图片
                foreach($_FILES['image']['name'] as $k => $v)
                {
                    if($_FILES['image']['error'][$k] == 0){
                        // 拼出每张图片需要的数组
                        $_tmp['name'] = $v;
                        $_tmp['type'] = $_FILES['image']['type'][$k];
                        $_tmp['tmp_name'] = $_FILES['image']['tmp_name'][$k];
                        $_tmp['error'] = $_FILES['image']['error'][$k];
                        $_tmp['size'] = $_FILES['image']['size'][$k];
        
                        // 放到 $_FILES 数组中
                        $_FILES['tmp'] = $_tmp;
        
                        // upload 这个类会到 $_FILES 中去找图片
                        // 参数一、就代表图片在 $_FILES 数组中的名字
                        // upload 方法现在就可以直接到 $_FILES 中去找到 tmp 来上传了
                        $path = '/uploads/'.$uploader->upload('tmp', 'goods');
                        
                        $img1 = '/uploads/'.$resize->resize($path, 'Abbreviations',650,650);
                        $img2 = '/uploads/'.$resize->resize($path, 'Abbreviations',350,350);
                        $img3 = '/uploads/'.$resize->resize($path, 'Abbreviations',150,150);

                        // 执行SQL
                        $stmt->execute([
                            $goodsId,
                            $path,
                            $img1,
                            $img2,
                            $img3
                        ]);
                    }
                }
            }

        }

        protected function _delete_logo($id)
        {
            $stmt = $this->_db->prepare("select * from good_img where good_id=?");
            $stmt->execute([$id]);
            $data = $stmt->fetchAll( \PDO::FETCH_ASSOC );
            foreach($data as $k=>$v){
                @unlink(ROOT . 'public'. $data[$k]['image']);
                @unlink(ROOT . 'public'. $data[$k]['img1']);
                @unlink(ROOT . 'public'. $data[$k]['img2']);
                @unlink(ROOT . 'public'. $data[$k]['img3']);
            }
            $this->_db->exec("DELETE FROM good_img WHERE good_id={$id}");
        }

        public function getimg($id){
            $stmt = $this->_db->prepare("select * from good_img where good_id=?");
            $stmt->execute([$id]);
            return $stmt->fetchAll( \PDO::FETCH_ASSOC );
        }
    
}