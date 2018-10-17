<?php
namespace models;

class Admin extends Model
{
    // 设置这个模型对应的表
    protected $table = 'admin';
    // 设置允许接收的字段
    protected $fillable = ['email','pass','phone','role_id'];

    public function login($email, $pass)
    {   
        $redis = \libs\Redis::getInstance(); 
        if($redis->hget('xemail',$email)==3){
            message('id冻结！禁止登陆', 0, '/admin/register');
        }else{
            $stmt = $this->_db->prepare('SELECT * FROM admin WHERE email=? AND pass=?');
            $stmt->execute([
                $email,
                md5($pass),
            ]);
            $info = $stmt->fetch(\PDO::FETCH_ASSOC);
            if($info)
            {
                $_SESSION['id'] = $info['id'];
                $_SESSION['email'] = $info['email'];
                $redis->hdel('xemail',$email);  
                
                if($info['role_id']==1){
                    $_SESSION['root'] = true;
                    // echo $_SESSION['root'];
                    $stmt = $this->_db->prepare('SELECT a.role_name FROM role a left join admin_role b on a.id=b.role_id WHERE admin_id=? ');
                    $stmt->execute([
                        $info['role_id']
                    ]);
                    $a = $stmt->fetch(\PDO::FETCH_ASSOC);
                    $_SESSION['adminType'] = $a['role_name'];
                }                
                else{
                    // echo $info['role_id'];
                    $_SESSION['root'] = false;
                     // 取出这个管理员有限访问的路径
                    $_SESSION['url_path'] = $this->getUalPath($_SESSION['id']);

                    $stmt = $this->_db->prepare('SELECT a.role_name FROM role a left join admin_role b on a.id=b.role_id WHERE admin_id=? ');
                    $stmt->execute([
                        $info['role_id']
                    ]);
                    $a = $stmt->fetch(\PDO::FETCH_ASSOC);
                    $_SESSION['adminType'] = $a['role_name'];
                    // var_dump($_SESSION['url_path']);
                }
            }
            else
            {   
                
                $redis->hincrby('xemail',$email,1);
                echo $redis->hget('xemail',$email);
                message('用户名或者密码错误', 0, '/admin/index');
            }
        }
        
    }

    public function logout()
    {
        $_SESSION = [];
        session_destroy();
    }

    public function _after_write(){
        // echo "<pre>";
        // var_dump($_POST);        
        if(isset($_GET['id'])){
            $admin_id = $_GET['id'];
            $stmt = $this->_db->prepare("DELETE FROM admin_role WHERE admin_id=?");
            $stmt->execute([$admin_id]);
        }else{
            $admin_id = $this->_db->lastInsertId();
        }
        // echo $admin_id;
        $stmt = $this->_db->prepare("INSERT INTO admin_role(role_id,admin_id) VALUES(?,?)");
        $stmt->execute([
            $_POST['role_id'],
            $admin_id
        ]);
        // exit;
    }
    public function _before_delete(){
        $id = $_GET['id'];
        $stmt = $this->_db->prepare("DELETE FROM admin_role WHERE admin_id=?");
        $stmt->execute([$id]);
    }


    // 获取一个管理员有权访问的路径
    public function getUalPath($adminId)
    {
        $sql = "SELECT c.url_path
                    FROM admin_role a 
                    LEFT JOIN role_privlege b ON a.role_id=b.role_id
                    LEFT JOIN privilege c ON b.pri_id=c.id
                    WHERE a.admin_id=? AND c.url_path!=''";
        $stmt = $this->_db->prepare($sql);
        $stmt->execute([$adminId]);
        $data = $stmt->fetchAll(\PDO::FETCH_ASSOC);


        // 把二维数组转成一维数组
        $_ret = [];

        foreach($data as $v)
        {
            // 判断是否有多个URL（包含,）
            if(FALSE === strpos($v['url_path'], ','))
            {
                // 如果没有,，就直接拿过来
                $_ret[] = $v['url_path'];
            }
            else
            {
                // 如果有，，就转成数组
                $_tt = explode(',', $v['url_path']);
                // 把转完之后的数组合并到一维数组中
                $_ret = array_merge($_ret, $_tt);
            }
            
        }
        return $_ret;
    }

}