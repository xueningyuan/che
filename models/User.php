<?php
namespace models;

class User extends Model
{
    // 设置这个模型对应的表
    protected $table = 'users';
    // 设置允许接收的字段
    protected $fillable = ['email','pass','phone'];

    public function login($email, $pass)
    {   
        $redis = \libs\Redis::getInstance(); 
        if($redis->hget('xemail',$email)==3){
            message('id冻结！禁止登陆', 0, '/users/register');
        }else{
            $stmt = $this->_db->prepare('SELECT * FROM users WHERE email=? AND pass=?');
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
            }
            else
            {   
                
                $redis->hincrby('xemail',$email,1);
                echo $redis->hget('xemail',$email);
                message('用户名或者密码错误', 0, '/users/index');
            }
        }
        
    }

    public function logout()
    {
        $_SESSION = [];
        session_destroy();
    }
}