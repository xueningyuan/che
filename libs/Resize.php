<?php
/* 这个项目中无论使用多少次这个类，其实只需要一个对象，如果多个对象就是浪费内存
    单例：三私一公（无论new 多少个都只有一个对象）
*/
namespace libs;

use Intervention\Image\ImageManagerStatic as Image;

class Resize
{
    // 不允许被 new 来生成 对象
    private function __construct(){}
    // 不允许克隆
    private function __clone(){}
    // 保存唯一的对象（只有静态的属性属于这个类是唯一的）
    private static $_obj = null;

    // 提供一个公开的方法获取对象
    public static function make()
    {
        if(self::$_obj === null)
        {
            // 生成一个对象
            self::$_obj = new self;
        }
        return self::$_obj;
    }

    private $_root = ROOT . 'public/uploads/';   // 图片保存的一级目录
    private $_ext = ['image/jpeg','image/jpg','image/ejpeg','image/png','image/gif','image/bmp'];  // 允许上传的扩展名
    private $_maxSize = 1024*1024*1.8;  // 最大允许上传的尺寸，1.8M

    private $_subDir;

    // 上传图片
    // 参数一、表单中文件名
    // 参数二、保存到的二级目录
    public function resize($path, $subdir,$w,$h)
    {
        // 把用户图片的信息保存到属性上
        $this->_file = $path;
        $this->_subDir = $subdir;


        // 创建目录
        $dir = $this->_makeDir();

        // 生成唯一的名字
        $name = $this->_makeName();

        // 打开图片
        echo $this->_file;
        $img = Image::make(ROOT . 'public'.$this->_file);
        // 缩放图片
        $img->resize($w,$h);
        // 保存图片
        $img->save($this->_root.$dir.$name);

        // 返回二级目录开始的路径
        return $dir.$name;    // avatar/20180809/1.png
    }

    // 创建目录
    private function _makeDir()
    {
        $dir = $this->_subDir . '/' . date('Ymd');
        if(!is_dir($this->_root . $dir))
            mkdir($this->_root . $dir, 0777, TRUE);  // 循环创建所有目录及子目录

        return $dir.'/';
    }

    // 生成唯一的名字
    private function _makeName()
    {
        $name = md5( time() . rand(1,9999) );
        $ext = strrchr($this->_file, '.');
        return $name . $ext;
    }
}