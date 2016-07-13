<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/13
 * Time: 15:27
 */

namespace Home\Controller;


use Think\Controller;

class MinController extends Controller
{
    public function index()
    {
        //header('Content-Type:text/html; charset=utf-8');

        $cacheDir = PHYSICAL_ROOT_PATH . '\\Public\\Uploads\\Minify';
        define("MINIFY_TEMP_PATH", $cacheDir);
        define("SYSTEM_ROOT_PATH", PHYSICAL_ROOT_PATH);

        //echo PHYSICAL_ROOT_PATH;
        //dump(I('f'));
        //dump(PHYSICAL_ROOT_PATH);
        import('index', VENDOR_PATH . 'Minify', '.php');
        exit();
    }
}