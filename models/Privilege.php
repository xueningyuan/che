<?php
namespace models;
class Privilege extends Model
{
    // 设置这个模型对应的表
    protected $table = 'privilege';
    // 设置允许接收的字段
    protected $fillable = ['pri_name','url_path','parent_id'];

    public function moke(){
        $pri_list = $_POST['pri_name'];
        // 1. 接收参数（生成代码的表名）
        $tableName = $_POST['tableName'];
        $stmt = $this->_db->prepare("SELECT id FROM privilege WHERE pri_name=?");
        $stmt->execute([
            $_POST['m_pri_name'].'模块'
        ]);
        $id = $stmt->fetch( \PDO::FETCH_ASSOC );
        
        if(!$id){
            $sql = "insert into privilege(pri_name,url_path,parent_id) values ('{$_POST['m_pri_name']}模块','',0)";
            $psm = $this->_db->exec($sql);
            $id = $this->_db->lastinsertid();
        }else{
            $id = $id['id'];
        }
        

        $stmt = $this->_db->prepare("SELECT id FROM privilege WHERE pri_name=?");
        $stmt->execute([
            $pri_list.'列表'
        ]);
        $sid = $stmt->fetch( \PDO::FETCH_ASSOC );

        
        if(!$sid){
            $ssql = "insert into privilege(pri_name,url_path,parent_id) values    
            ('{$pri_list}列表','{$tableName}/design',$id)";
            $psm = $this->_db->exec($ssql);
            $sid = $this->_db->lastinsertid();
            $ssql = "insert into privilege(pri_name,url_path,parent_id) values    
                ('添加{$pri_list}','{$tableName}/create,{$tableName}/design',$sid),
                ('删除{$pri_list}','{$tableName}/delete',$sid),
                ('修改{$pri_list}','{$tableName}/edit,{$tableName}/update',$sid)";
            
            $psm = $this->_db->exec($ssql);
        }else{
            echo "列表重复，不可重复添加";
            return;
        }
    }

    public function _before_delete(){
        $stmt = $this->_db->prepare("SELECT * FROM privilege WHERE id=?");
        $stmt->execute([
            $_GET['id'],
        ]);
        $mid = $stmt->fetch( \PDO::FETCH_ASSOC );
        // echo "<pre>";
        // var_dump($mid);
        // echo $mid['parent_id'];

        if($mid['parent_id']==0){
            $stmt = $this->_db->prepare("SELECT * FROM privilege WHERE parent_id=?");
            $stmt->execute([
                $mid['id'],
            ]);
            $lid = $stmt->fetch( \PDO::FETCH_ASSOC );
            // var_dump($lid);
            $this->_db->exec("DELETE FROM privilege WHERE parent_id={$lid['id']}");
            $this->_db->exec("DELETE FROM privilege WHERE parent_id={$mid['id']}");
        }else{
            $this->_db->exec("DELETE FROM privilege WHERE parent_id={$mid['id']}");
        }
        
    }
    
}