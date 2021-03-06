<?php
namespace App\Controller;

use Think\Controller;
use Vendor\Hiland\Utils\DataModel\ModelMate;

class PublicController extends Controller
{
    public $appUrl = "";

    public function _initialize()
    {
        $this->appUrl = "http://" . I("server.HTTP_HOST");
    }

    public function login()
    {
        $condition["phone"] = I("post.phone");
        $condition["password"] = md5(I("post.password"));
        $user = D("User")->get($condition);
        if ($user && $user["status"]) {
            session("userId", $user["id"]);

            //reset token
            $user["token"] = getRandom(32);
            D("User")->save($user);

            $this->ajaxReturn($user);
        }
    }

    public function register()
    {
        $data ["openid"] = "appOpenId_" . date("ymdhis") . mt_rand(100, 999);
        $data ["username"] = I("post.username");
        $data ["phone"] = I("post.phone");
        $data ["password"] = md5(I("post.password"));
        $data ["status"] = 1;
        $user = D("User")->get(array("phone" => I("post.phone")));
        if ($user) {
            $this->ajaxReturn(array("info" => "error", "msg" => "注册失败", "status" => 0));
            return;
        }

        D("User")->add($data);
        $this->ajaxReturn(array("info" => "success", "msg" => "注册成功", "status" => 1));
    }

    public function oauthDebug()
    {
        $config = D("Config")->get();
        if ($config["oauth_debug"] && $config["oauth"]) {
            session("userId", 2);
        }
    }

    public function oauthLogin()
    {
        $this->oauthDebug();

        //dump('sssssssssssssssssf');
        if (!session("userId")) {
            //dump('ooooooooo');
            $mate = new ModelMate('config');
            $config = $mate->get(1);
            //dump($config);

            if ($config["oauth"]) {
                $weObj = D("WxConfig")->getWeObj();

                $token = $weObj->getOauthAccessToken();
//                if($token){
//                    dump('token ok');
//                }else{
//                    dump('token error');
//                }


                //dump(__SELF__);

                if (!$token) {
                    $currentPage = $this->appUrl . __SELF__;
                    $url = $weObj->getOauthRedirect($currentPage);

                    //dump($url);
                    header("location:$url");
                    die();
                } else {
//                    //dump('33333333333333');
                    $userInfo = $weObj->getOauthUserinfo($token["access_token"], $token["openid"]);
                    $this->oauthRegister($userInfo);
                }
            }
        }

        //dump('ppppppppppp');

        $user = D("User")->get(array("id" => session("userId")), true);
        if ($user["status"] == 0) {
            $this->redirect("Empty/index");
            return;
        }

        return $user;
    }

    private function oauthRegister($userInfo)
    {
        $user = D("User")->get(array("openid" => $userInfo["openid"]));
        $data = array(
            "username" => $userInfo["nickname"],
            "subscribe" => C("USER_COMEFROM_COMMONWEIXINUSER"),
            "sex" => $userInfo["sex"],
            "language" => $userInfo["language"],
            "city" => $userInfo["city"],
            "province" => $userInfo["province"],
            "avater" => $userInfo["headimgurl"],
            "status" => 1,
        );

        $userId = $user["id"] ? $user["id"] : 0;
        if ($user) {
//            $data["id"] = $user["id"];
//            D("User")->save($data);
        } else {
            $data["openid"] = $userInfo["openid"];
            $userId = D("User")->add($data);
        }

        session("userId", $userId);
    }

    public function logout()
    {
        D("User")->save(array("id" => session("userId"), "token" => ""));
        session(null);

        $this->ajaxReturn(array("info" => "success", "msg" => "注销成功", "status" => 1));
    }
}