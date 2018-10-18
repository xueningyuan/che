<?php
namespace models;

class Role extends Model
{
    // 设置这个模型对应的表
    protected $table = 'role';
    // 设置允许接收的字段
    protected $fillable = ['role_name'];

    public function _after_write(){
        if(isset($_GET['id']) ){
            $this->_db->exec("DELETE FROM role_privlege WHERE role_id={$_GET['id']}");
            $id = $_GET['id'];
        }else{
            $id = $this->_db->lastInsertId();
        }
        
        echo $id;
        var_dump($_POST);
        foreach($_POST['pri_id'] as $v){
            $stmt = $this->_db->exec("insert into role_privlege(pri_id,role_id) values ({$v},{$id})");
        }
    }
    
    public function _before_delete(){
        $this->_db->exec("DELETE FROM role_privlege WHERE role_id={$_GET['id']}");
    }

    // 取出拥有的权限ID
    public function getPriIds($roleId)
    {
        // 预处理
        $stmt = $this->_db->prepare('SELECT pri_id FROM role_privlege WHERE role_id=?');
        // 执行
        $stmt->execute([
            $roleId
        ]);
        // 取数据
        $data = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        // 转成一维的
        $_ret = [];
        foreach($data as $k => $v)
        {
            $_ret[] = $v['pri_id'];
        }
        // 把一维的返回
        return $_ret;
    }
}