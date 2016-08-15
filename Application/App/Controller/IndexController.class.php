<?php
namespace App\Controller;


use Common\Model\BizConst;
use Common\Model\ViewLink;
use Common\Model\WechatBiz;
use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Utils\Data\DateHelper;
use Vendor\Hiland\Utils\Data\MathHelper;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\DataModel\ViewMate;
use Vendor\Hiland\Utils\Datas\SystemConst;
use Vendor\Hiland\Utils\Web\EnvironmentHelper;

class IndexController extends BaseController
{
    public function index()
    {
        $oauth2Url = "App/Public/oauthLogin";
        $user = R($oauth2Url);

        if (C('BROWSE_MUST_SUBSCRIBE')) {
            $userMate = new ModelMate('user');
            $condition = array();
            $condition['openid'] = $user['openid'];
            $userFound = $userMate->find($condition);

            if ($userFound['subscribe'] != C("USER_COMEFROM_SUBSCRIBEDWEIXINUSER")) {
                //$currentUrl= $_SERVER['REQUEST_URI'];
                //$this->assign("url",$currentUrl);
                $shopId = I("shopId");

                $shop = array();
                $shopName = '福轮网络';
                $qrUrl = "__PUBLIC__/Uploads/qrcode_430.jpg";
                if ($shopId) {
                    $shopMate = new ModelMate('shop');
                    $shop = $shopMate->get($shopId);
                    $shopName = $shop['name'];
                    $qrUrl = WechatBiz::getQRCodeUrl($shopId);
                }

                $this->assign("shopid", $shopId);
                $this->assign("shopName", $shopName);
                $this->assign('qrUrl', $qrUrl);
                $this->display('mustsubscribe');
                exit;
            }
        }

        $user = json_encode($user);
        $this->assign("user", $user);
        $shopId = I("get.shopId");
        session("shop_id", $shopId);
        $this->assign("shopId", $shopId);

        $configs = D("Config")->get();
        $config = D("Shop")->getShop(array('id' => $shopId), true);
        //$config["delivery_time"] = explode(",", $config["delivery_time"]);
        //--[将换行分隔的，逗号分隔的都转换成数组元素]--------------------------------------
        $deliveryTime = $config["delivery_time"];
        $deliveryTime = str_replace("\r\n", ",", $deliveryTime);
        $deliveryTime = explode(",", $deliveryTime);
        $deliveryTime = array_filter($deliveryTime);
        $config["delivery_time"] = $deliveryTime;

        $config["balance_payment"] = $configs["balance_payment"];
        $config["wechat_payment"] = $configs["wechat_payment"];
        $config["alipay_payment"] = $configs["alipay_payment"];
        $config["cool_payment"] = $configs["cool_payment"];
        $this->assign("config", json_encode($config));
        $this->assign("shopData", $config);

        $menu = D("Menu")->getList(array("shop_id" => $shopId), true, "rank desc,id desc");
        $menu = list_to_tree($menu, 'id', 'pid', 'sub');
        $this->assign("menu", json_encode($menu));

        $hostName = EnvironmentHelper::getServerHostName();
        $this->assign("hostName", $hostName);

//        $product = D("Product")->getList(array("status" => array("neq", -1), "shop_id" => $shopId), true, "rank desc", 0, 0, 0);
//        $this->assign("product", json_encode($product));


        //$ads = D("Ads")->getList(array("shop_id" => $shopId), true,"rank desc");

        $mate = new ViewMate("ads", ViewLink::getCommon_File());
        $ads = $mate->select(array("shop_id" => $shopId), true, "rank desc");
        $this->assign("ads", json_encode($ads));

        //暂时先在base基类中实现
        $wxConfig = D("WxConfig")->getJsSign();
        $this->assign("wxConfig", json_encode($wxConfig));

        $bizConsts = BizConst::getConsts();
        $this->assign("bizConsts", json_encode($bizConsts, JSON_UNESCAPED_SLASHES));

        $bizConfig['SYSTEM_PAY_WEIXIN_COMMISSION'] = C("SYSTEM_PAY_WEIXIN_COMMISSION", null, 0);
        $bizConfig['SYSTEM_PAY_WEIXIN_COMMISSION_VALUE'] = MathHelper::percent2Float($bizConfig['SYSTEM_PAY_WEIXIN_COMMISSION']);
        $bizConfig['SYSTEM_PAY_ZHIFUBAO_COMMISSION'] = C("SYSTEM_PAY_ZHIFUBAO_COMMISSION", null, 0);
        $bizConfig['SYSTEM_PAY_ZHIFUBAO_COMMISSION_VALUE'] = MathHelper::percent2Float($bizConfig['SYSTEM_PAY_ZHIFUBAO_COMMISSION']);
        $this->assign("bizConfig", json_encode($bizConfig));

        //self::calcTime('html-main-page-begin');

        $this->display();
    }

    public function calcTime($beginName = 'beginName', $endName = '')
    {
        if (empty($endName)) {
            G($beginName);
        } else {
            $timeUsed = G($beginName, $endName);
            CommonLoger::log("$beginName 到 $endName 耗时", $timeUsed);
        }
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
    /**
     * 附近店铺功能
     */
    public function shop()
    {
        CommonLoger::log('附近店铺加载');

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


    public function searchProducts($shopId, $keyword)
    {
        $condition = array();
        $condition['status'] = array("neq", -1);
        $condition['shop_id'] = $shopId;
        $condition['name'] = array("like", "%$keyword%");

        $products = D("Product")->getList($condition, true, "rank desc", 0, 0, 0);
        $this->ajaxReturn($products);
    }

    /**
     * 获取某个地区的零售店铺
     */
    public function AreaShops()
    {
        $categoryMate = new ViewMate("shopCategory", ViewLink::getCommon_File());
        $condition = array("usable" => SystemConst::COMMON_STATUS_YN_YES);
        $categories = $categoryMate->select($condition, true, "rank desc");
        $this->assign("categories", $categories);

        $wxConfig = D("WxConfig")->getJsSign();
        $this->assign("wxConfig", json_encode($wxConfig));

        $this->display();
    }

    /**
     * 获取某个地区的渠道店铺
     */
    public function ChannelShops()
    {
        $wxConfig = D("WxConfig")->getJsSign();
        $this->assign("wxConfig", json_encode($wxConfig));

        $this->display();
    }

    /**
     * 获取某个地区的渠道店铺
     */
    public function ExcellentShops()
    {
        $wxConfig = D("WxConfig")->getJsSign();
        $this->assign("wxConfig", json_encode($wxConfig));

        $this->display();
    }

    public function sendRedpacket($packetId, $openId = "")
    {
        $userMate = new ModelMate('user');

        if (empty($openId)) {
            $userId = $this->getCurrentUserID();
            $userData = $userMate->get($userId);
            $openId = $userData['openid'];
        }

        if (empty($userData)) {
            $userData = $userMate->find(array("openid" => $openId));
        }

        $redPacketMate = new ViewMate("weixinRedpacket", ViewLink::getCommon_Shop());
        $detailMate = new ModelMate("weixinRedpacketDetail");

        $redPacketData = $redPacketMate->get($packetId);

        $uniqeCondition = array("openid" => $openId, "packet_id" => $packetId);
        $currentUserJoinTiems = $detailMate->getCount($uniqeCondition);

        $nextDay = DateHelper::addInterval(time(), "d", 1);
        $todayUniqeCondition['drawtime'] = array(array('gt',DateHelper::format(null, "Y-m-d")),array('lt',DateHelper::format($nextDay, "Y-m-d")), 'and');
        $todayUniqeCondition = array_merge($uniqeCondition, $todayUniqeCondition);
        //dump($todayUniqeCondition);
        //dump($todayUniqeCondition['drawtime']);
        //$this->assign('message', $currentUserJoinTiems . '--' . $openId . '--' . $packetId);
        $todayjoinTimes = $detailMate->getCount($todayUniqeCondition);
        //dump($todayjoinTimes);

        if ($todayjoinTimes > 0) {
            $this->assign("redPacketSendStatus", false);
            $this->assign("redPacketSendInfo", "今日你已经参加过过本次活动" . $redPacketData['actionname'] . "了，明天再来吧:)");
        } else {
            if ($redPacketData['openidplayonce'] == SystemConst::COMMON_STATUS_YN_YES && $currentUserJoinTiems > 0) {
                $this->assign("redPacketSendStatus", false);
                $this->assign("redPacketSendInfo", "本次活动" . $redPacketData['actionname'] . "你已经参加过了，下次再来吧:)");

            } else {
                $unDrawedPackets = $detailMate->select(array("packet_id" => $packetId, "status" => BizConst::REDPACKET_DRAW_STATUS_NO), "id asc");
                if (count($unDrawedPackets) <= 1) {
                    $redPacketMate->setValue($packetId, "status", BizConst::REDPACKET_ACTION_STATUS_STOPBYBIZ);
                }

                $lastRecord = $unDrawedPackets[0];
                $lastRecord['username'] = $userData['username'];
                $lastRecord['openid'] = $openId;
                $lastRecord['drawtime'] = DateHelper::format();
                $lastRecord['status'] = BizConst::REDPACKET_DRAW_STATUS_YES;
                $detailMate->interact($lastRecord);

                if (floatval($lastRecord['amount'])) {
                    BizHelper::hongbao($openId, $redPacketData['shop']['name'], $lastRecord['amount'] * 100, $redPacketData['actionname'], "祝你购物愉快！");
                    $this->assign("redPacketSendStatus", true);
                    $this->assign("redPacketSendInfo", "红包发送成功，请关闭本页回到微信对话框点击领取！");
                } else {
                    $this->assign("redPacketSendStatus", true);
                    $this->assign("redPacketSendInfo", "真难以置信，" . $redPacketData['shop']['name'] . "使出了洪荒之力给你推送红包，你居然只得到一个空包，这运气真是\"好到爆\"了。");
                }
            }
        }

        $this->display();
    }
}