<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/5/30
 * Time: 16:42
 */

namespace Home\Controller;


use Common\Model\BizHelper;
use Think\Controller;
use Vendor\Hiland\Utils\DataModel\ModelMate;

class FooController extends Controller
{
    public function pathop()
    {
        //dump('sssssssss');
        $targetUrl = U("Home/Config/address");
        dump($targetUrl);
        //WebHelper::redirectUrl($targetUrl);
        $this->assign('url', $targetUrl);
        $this->display();
    }

    public function redirecturlajax()
    {
        header('Content-Type:application/json; charset=utf-8');
        $data['info'] = 'sssssssssss';
        $data['status'] = 1;
        $data['url'] = 'www.sss.ff/gg/22/pp';

        exit(json_encode($data, 0));
    }

    public function configop($configname='PROJECT_NAME'){
        dump(C($configname));
    }

    public function configdbop(){
        $mate= new ModelMate('config');
        $data= $mate->get(1);
        dump($data);
    }

    public function buyershopop($shopid=3){
        $openid='gasdgawegewgew';
        $result= BizHelper::relateUserShopScaned($openid,$shopid);
        dump($result);
    }
}