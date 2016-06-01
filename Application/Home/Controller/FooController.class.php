<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/5/30
 * Time: 16:42
 */

namespace Home\Controller;


use Think\Controller;
use Vendor\Hiland\Utils\Web\WebHelper;

class FooController extends  Controller
{
    public function pathop(){
        //dump('sssssssss');
        $targetUrl= U("Home/Config/address");
        dump($targetUrl);
        //WebHelper::redirectUrl($targetUrl);
        $this->assign('url',$targetUrl);
        $this->display();
    }
    
    public function redirecturlajax(){
        header('Content-Type:application/json; charset=utf-8');
        $data['info'] = 'sssssssssss';
        $data['status'] = 1;
        $data['url'] = 'www.sss.ff/gg/22/pp';

        exit(json_encode($data, 0));
}
}