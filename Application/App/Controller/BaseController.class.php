<?php
namespace App\Controller;

use Common\Model\WechatBiz;
use Think\Controller;
use Vendor\Hiland\Biz\Tencent\WechatHelper;
use Vendor\Hiland\Utils\Data\RandHelper;


class BaseController extends Controller
{
    public $appUrl = "";

    public function _initialize()
    {
        $this->appUrl = "http://" . I("server.HTTP_HOST");

        //设置主题
        $config = D("Config")->get();
        C("DEFAULT_THEME", $config ["theme"]);
        C("TMPL_PARSE_STRING", array(
            '__IMG__' => __ROOT__ . '/Theme/' . C("DEFAULT_THEME") . '/Public/image',
            '__CSS__' => __ROOT__ . '/Theme/' . C("DEFAULT_THEME") . '/Public/css',
            '__JS__' => __ROOT__ . '/Theme/' . C("DEFAULT_THEME") . '/Public/js',
            '__TPL_PUBLIC__' => __ROOT__ . '/Theme/' . C("DEFAULT_THEME") . '/Public',
        ));

        /**
         * 添加jsapi的签名
         */

//        $url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
//        $timeStamp = time();
//        $nonceString = RandHelper::rand(16);
//

//        //$signPackage = WechatHelper::getJSAPISignPackage();
        $wechat = WechatBiz::getWechat();
        $url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $timeStamp = time();
        $nonceString = RandHelper::rand(16);
        $signPackage = $wechat->getJsSign($url,$timeStamp,$nonceString);
        $this->assign('signPackage', $signPackage);

        //自动登录
        if (I("get.token")) {
            $user = D("User")->get(array("token" => I("get.token")), true);
            if ($user) {
                session("userId", $user["id"]);
            }
            unset($_GET["token"]);
        }
    }

    public function is_login()
    {
        if (session("userId")) {
            return true;
        } else {
            return false;
        }
    }

    function is_weixin()
    {
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) {
            return true;
        }
        return false;
    }

    function getCurrentUserID(){
        return session("userId");
    }
}
