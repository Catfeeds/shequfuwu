<?php
namespace App\Controller;


use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Utils\DataModel\ModelMate;

class IndexController extends BaseController
{
    public function index()
    {
        G('weixin_mainPageBegin');
        G('weixin_oauthBegin');

        $oauth2Url = "App/Public/oauthLogin";
        $user = R($oauth2Url);
        
//        if(C('BROWSE_MUST_SUBSCRIBE')){
//            $userMate= new ModelMate('user');
//            $condition= array();
//            $condition['openid']= $user['openid'];
//            $userFound= $userMate->find($condition);
//
//            if(empty($userFound)){
//                $this->display('mustsubscribe');
//            }
//        }

        $oautTimeUsed = G('weixin_oauthBegin', 'weixin_oauthEnd');
        CommonLoger::log('微信认证加载耗时', $oautTimeUsed);

        $user = json_encode($user);
        $this->assign("user", $user);
        $shopId = I("get.shopId");
        session("shop_id", $shopId);
        $this->assign("shopId", $shopId);

        $configs = D("Config")->get();
        $config = D("Shop")->getShop(array('id' => $shopId), true);
        $config["delivery_time"] = explode(",", $config["delivery_time"]);
        $config["balance_payment"] = $configs["balance_payment"];
        $config["wechat_payment"] = $configs["wechat_payment"];
        $config["alipay_payment"] = $configs["alipay_payment"];
        $config["cool_payment"] = $configs["cool_payment"];
        $this->assign("config", json_encode($config));

        $menu = D("Menu")->getList(array("shop_id" => $shopId), true, "rank desc,id desc");
        $menu = list_to_tree($menu, 'id', 'pid', 'sub');
        $this->assign("menu", json_encode($menu));

//        $product = D("Product")->getList(array("status" => array("neq", -1), "shop_id" => $shopId), true, "rank desc", 0, 0, 0);
//        $this->assign("product", json_encode($product));

        $ads = D("Ads")->getList(array("shop_id" => $shopId), true);
        $this->assign("ads", json_encode($ads));

        $wxConfig = D("WxConfig")->getJsSign();
        $this->assign("wxConfig", json_encode($wxConfig));

        $timeUsed = G('weixin_mainPageBegin', 'weixin_mainPageEnd');
        CommonLoger::log('微信首页加载耗时', $timeUsed);

        $this->display();
    }


    public function aop()
    {
        $oauth2Url = "App/Public/oauthLogin";

        $user = R($oauth2Url);

        dump('aopppppppppppppppp');
    }

    //pidong 通过shopid获取当前店铺信息
    public function getThisShop()
    {
        $this->display();
    }

    //pidong 通过shopid获取当前店铺信息
    public function shop()
    {
        $user = R("App/Public/oauthLogin");
        $user = json_encode($user);
        $this->assign("user", $user);

        if (I("get.shopid")) {
            $shopId = I("get.shopid");
            session("shop_id", $shopId);
        }

        $configs = D("Config")->get();
        $config = D("Shop")->getShop(array('id' => $shopId));
        $config["delivery_time"] = explode(",", $config["delivery_time"]);
        $config["balance_payment"] = $configs["balance_payment"];
        $config["wechat_payment"] = $configs["wechat_payment"];
        $config["alipay_payment"] = $configs["alipay_payment"];
        $config["cool_payment"] = $configs["cool_payment"];
        $this->assign("config", json_encode($config));

        $wxConfig = D("WxConfig")->getJsSign();
        $this->assign("wxConfig", json_encode($wxConfig));

        $this->display();
    }


    public function init()
    {
        $data = array();
        $config = D("Config")->get();
        $config["delivery_time"] = explode(",", $config["delivery_time"]);
        $data["config"] = $config;

        $data["ads"] = D("Ads")->getList(array(), true);

        $menu = D("Menu")->getList(array(), true, "rank desc,id desc");
        $menu = list_to_tree($menu, 'id', 'pid', 'sub');
        $data["menu"] = $menu;

        $data["product"] = D("Product")->getList(array("status" => array("neq", -1)), true, "rank desc", 0, 0, 0);
        $this->ajaxReturn($data);
    }

    /**
     * 按照类别获取产品
     * @param int $menuId 产品类别id（菜单id）
     */
    public function getProducts($menuId = 0)
    {
        $products = D("Product")->getList(array("status" => array("neq", -1), "menu_id" => $menuId), true, "rank desc", 0, 0, 0);
        $this->ajaxReturn($products);
    }


    public function searchProducts($shopId,$keyword){
        $condition= array();
        $condition['status']= array("neq", -1);
        $condition['shop_id']= $shopId;
        $condition['name']= array("like","%$keyword%");

        $products = D("Product")->getList($condition, true, "rank desc", 0, 0, 0);
        $this->ajaxReturn($products);
    }
}