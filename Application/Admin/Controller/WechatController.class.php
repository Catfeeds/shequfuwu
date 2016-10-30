<?php
namespace Admin\Controller;

use Common\Model\BizConst;
use Common\Model\BizHelper;
use Think\Controller;
use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Biz\Tencent\WechatHelper;
use Vendor\Hiland\Utils\Data\BoolHelper;
use Vendor\Hiland\Utils\Data\StringHelper;

class WechatController extends Controller
{
    public static $weObj;
    public static $appUrl;
    public static $revData;
    public static $revFrom;

    public function _initialize()
    {
        self::$appUrl = "http://" . I("server.HTTP_HOST") . __ROOT__;
    }

    public function index()
    {
        $this->init();

        if (IS_GET) {
            self::$weObj->valid();
        } else {
            if (!self::$weObj->valid(true)) {
                die('no access!!!');
            }
        }

        $type = self::$weObj->getRev()->getRevType();
        self::$revData = self::$weObj->getRevData();
        self::$revFrom = self::$weObj->getRevFrom();

        $needResponse = WechatHelper:: checkNeedResponse(self::$weObj->getRevRawData());
        if ($needResponse) {
            $this->check($type);
        }
    }

    public function init()
    {
        Vendor("Wechat.wechat#class");
        $config = D("WxConfig")->get();

        $options = array(
            'token' => $config ["token"], //填写你设定的key
            'encodingaeskey' => $config ["encodingaeskey"], //填写加密用的EncodingAESKey
            'appid' => $config ["appid"], //填写高级调用功能的app id
            'appsecret' => $config ["appsecret"] //填写高级调用功能的密钥
        );
        self::$weObj = new \Wechat ($options);
    }

    public function check($type)
    {
        switch ($type) {
            case \Wechat::MSGTYPE_TEXT:
                $this->checkKeywords();
                break;
            case \Wechat::MSGTYPE_EVENT:
                $this->checkEvents(self::$revData['Event']);
                break;
            case \Wechat::MSGTYPE_IMAGE:
                self::$weObj->text('本系统暂不支持图片信息！')->reply();
                break;
            default:
                self::$weObj->text('本系统暂时无法识别您的指令！')->reply();
        }
    }

    public function checkKeyWords($key)
    {
        $key = $key ? $key : self::$weObj->getRev()->getRevContent();

        switch ($key) {
            case 'qqkf': {//QQ客服
                $replay = D("WxReply")->get(array("key" => $key), true);
                $qq = $replay["remark"];
                $str = "<a href='http://wpa.qq.com/msgrd?v=3&uin=" . $qq . "&site=qq&menu=yes&from=singlemessage'>" . htmlspecialchars_decode('点击联系QQ客服') . "</a>";
                self::$weObj->text($str)->reply();
                break;
            }
            case 'csgw':
            case 'menu_wdgz': {//我的关注
                //超市购物，弹出其当初扫描的超市
                $openId = self::$revData['FromUserName'];
                $newsArray = BizHelper::generateMyScanedShopsResponse($openId);//self::generateMyScanedShopsResponse($openId);
                self::$weObj->news($newsArray)->reply();
                break;
            }
            case 'menu_hdyzx': {//活动与资讯
                $newsArray = BizHelper::generateArticlesResponse(); //self::generateArticlesResponse();
                self::$weObj->news($newsArray)->reply();
                break;
            }
            case 'wyhb': {//红包发送测试
                $openId = self::$revData['FromUserName'];
                BizHelper::hongbao($openId, '天天好超市', 100, '开业庆典');
                break;
            }
            default: {
                $replay = D("WxReply")->get(array("key" => $key), true);
                if ($replay) {
                    if ($replay["type"] == "news") {
                        $newsArr = array(
                            array(
                                'Title' => $replay["title"],
                                'Description' => $replay["description"],
                                'PicUrl' => self::$appUrl . '/Public/Uploads/' . $replay["savepath"] . $replay["savename"],
                                'Url' => $replay["url"]
                            )
                        );
                        self::$weObj->news($newsArr)->reply();
                    } else {
                        self::$weObj->text($replay["title"])->reply();
                    }
                } else {
                    self::$weObj->text("请核对关键词!")->reply();
                }
            }
        }
    }

    public function checkEvents($event)
    {
        $event = strtolower($event);
        $openId = self::$revData['FromUserName'];
        $messageContent = '';

        switch ($event) {
            case 'subscribe': {
                $userID = $this->confirmUserAtLocal($openId);

                $projectName = C('PROJECT_NAME');
                $messageContent = "恭喜加入[$projectName],您是第[$userID]位会员,在家即可享受货品配送服务！";

                $eventkey = self::$revData['EventKey'];

                $merchantScanedID = 0;
                if ($eventkey) {
                    $merchantScanedID = StringHelper::getSeperatorAfterString($eventkey, 'qrscene_');
                }

                self::responseUserAction($openId, $merchantScanedID, $messageContent);
                break;
            }
            case 'unsubscribe': {
                $this->updateUserSubscribeStatus($openId, C("USER_COMEFROM_COMMONWEIXINUSER"));
                break;
            }
            case 'click': {
                $this->checkKeyWords(self::$revData['EventKey']);
                break;
            }
            case 'scan': {
                $projectName = C('PROJECT_NAME');
                $messageContent = "欢迎再次回到[$projectName]，我们将持续为你提供更优质的服务！";

                $eventkey = self::$revData['EventKey'];
                $merchantScanedID = 0;
                if ($eventkey) {
                    $merchantScanedID = $eventkey;//self::$revData['EventKey'];
                }

                self::responseUserAction($openId, $merchantScanedID, $messageContent);
                break;
            }
        }
    }

    /**
     * 确保微信用户信息已经在本地记录
     * @param $openId
     * @return int|mixed
     */
    public function confirmUserAtLocal($openId)
    {
        $userID = 0;
        $user = D("User")->get(array("openid" => $openId));
        if ($user) {
            D("User")->save(array("id" => $user["id"], "subscribe" => C("USER_COMEFROM_SUBSCRIBEDWEIXINUSER")));
            $userID = $user["id"];
        } else {
            $userInfo = self::$weObj->getUserInfo($openId);
            $user = array(
                "username" => $userInfo["nickname"],
                "openid" => $userInfo["openid"],
                "sex" => $userInfo["sex"],
                "language" => $userInfo["language"],
                "city" => $userInfo["city"],
                "province" => $userInfo["province"],
                "avater" => $userInfo["headimgurl"],
                "status" => C('USER_DEFAULT_STATUS'),
                "subscribe" => C("USER_COMEFROM_SUBSCRIBEDWEIXINUSER"),
            );
            $userID = D("User")->add($user);
        }

        return $userID;
    }

    private function responseUserAction($openId, $merchantScanedID = 0, $messageContent = '')
    {
        if ($merchantScanedID) {
            $merchantScanedName = BizHelper:: relateUserShopScaned($openId, $merchantScanedID);
        }

        if (!empty($merchantScanedName)) {
            $messageContent .= "您扫码的店铺为[$merchantScanedName]，您的购物活动将有本店铺为你提供服务。";
        }

        if ($merchantScanedID) {
            $messageContent .= BizHelper::generateRedPacketResponse($merchantScanedID, $openId);
        }

        $customerMsgStatus = WechatHelper::responseCustomerServiceText($openId, $messageContent);

        $newsArray = BizHelper::generateWecomeNewsResponse($merchantScanedID);
        self::$weObj->news($newsArray)->reply();
    }

    public function updateUserSubscribeStatus($openId, $newSubscribeStatus)
    {
        $user = D("User")->get(array("openid" => $openId));
        if ($user) {
            D("User")->save(array("id" => $user["id"], "subscribe" => $newSubscribeStatus));
        }
    }

    public function getQRCode()
    {
        $qrcode = self::generateQRCode("0");
        if ($qrcode) {
            D("Config")->save(array("id" => 1, "qrcode" => $qrcode));
            $this->success("生成二维码成功", U("Admin/Config/configSet"));
        } else {
            $this->error("生成二维码失败", U("Admin/Config/configSet"));
        }
    }

    /**
     * @param string $key
     * @return mixed
     */
    public function generateQRCode($key = "0")
    {
        $this->init();
        $ticket = self::$weObj->getQRCode($key, 1);
        $qrcode = self::$weObj->getQRUrl($ticket["ticket"]);
        return $qrcode;
    }

    public function getMenu()
    {
        $this->init();

        $result = self::$weObj->getMenu();
        dump($result);
    }

    public function createWxMenu()
    {
        $newMenu = self::prepareMenu();

        $this->init();
        $json = self::$weObj->createMenu($newMenu);
        $json = json_decode($json, true);

        if ($json["errcode"] == 0) {
            $this->success("重新创建菜单成功!", U("Admin/Weixin/wxMenuSet"));
        } else {
            $this->error("重新创建菜单失败!", U("Admin/Weixin/wxMenuSet"));
        }
    }

    public function prepareMenu()
    {
        $m = D("WxMenu");
        $menu = $m->getList(array("pid" => 0), false, array('rank' => 'desc', 'id' => 'desc'), 0, 0, 3);

        $newMenu["button"] = array();
        $menuCount = count($menu);
        for ($i = 0; $i < $menuCount; $i++) {

            $menuItem = $this->builderMenuItems($menu[$i], $m);
            array_push($newMenu["button"], $menuItem);
        }

        return $newMenu;
    }


    private function builderMenuItems($menuItemData, $wxMenuModel)
    {
        $sub = $wxMenuModel->getList(array("pid" => $menuItemData["id"]), false, array("rank" => "desc", "id" => "desc"), 0, 0, 5);
        if ($sub) {
            $sub_button = array();

            for ($j = 0; $j < count($sub); $j++) {
                if ($sub[$j]["type"] == "view") {
                    array_push($sub_button, array('type' => 'view', 'name' => $sub[$j]["name"], 'url' => $sub[$j]["url"]));
                } else {
                    array_push($sub_button, array('type' => 'click', 'name' => $sub[$j]["name"], 'key' => $sub[$j]["key"]));
                }
            }
            return array('name' => $menuItemData["name"], 'sub_button' => $sub_button);
        } else {
            if ($menuItemData["type"] == "view") {
                return array('type' => 'view', 'name' => $menuItemData["name"], 'url' => $menuItemData["url"]);
            } else {
                return array('type' => 'click', 'name' => $menuItemData["name"], 'key' => $menuItemData["key"]);
            }
        }
    }

    /**
     * @param $user_id
     * @param $order_id
     */
    public function sendTplMsgOrder($user_id, $order_id)
    {
        $this->init();

        $order = D("Order")->get(array("id" => $order_id), true);
        $customer = D("User")->get(array("id" => $user_id));

        $shop = D("Shop")->getShop(array("id" => $order["shop_id"]));
        $employee = explode(',', $shop["employee"]);

        $customerTitle = "尊敬的客户,您的订单已成功提交。\n";
        $this->sendTplMessageOrderDetail($customer["openid"], $order, $customerTitle);

        foreach ($employee as $key => $value) {
            if (!$value) {
                continue;
            }
            $admin = D("User")->get(array("id" => $value));
            $detailUrl = "http://" . I("server.HTTP_HOST") . U("App/Admin/order/shopId") . "/" . $order["shop_id"];
            $adminTitle = "客户新订单提醒。";
            $this->sendTplMessageOrderDetail($admin["openid"], $order, $adminTitle, $detailUrl);
        }
    }

    private function sendTplMessageOrderDetail($openId, $order, $title, $detailUrl = "")
    {
        $template_id = $this->getTplMessageId("OPENTM201785396");

        $orderScore = $order['totalscore'];
        $scoreString = "";
        if ($orderScore > 0) {
            $scoreString = "(积分:$orderScore)";
        }

        $totalpreprice = $order['totalpreprice'];
        $totalprepriceString = "";
        if ($totalpreprice > 0) {
            $totalprepriceString = "(预付款:$totalpreprice)";
        }

        $paymentText= BizConst::getConstText("ORDER_PAYTYPE_", $order["payment"]);

        $msg = array();
        $msg["touser"] = $openId;
        $msg["template_id"] = $template_id;
        $msg["url"] = $detailUrl;
        $msg["topcolor"] = "";
//        $msg["data"] = array(
//            "first" => array(
//                "value" => $title,
//                "color" => "red"
//            ),
//            "keyword1" => array(
//                "value" => $order["orderid"],
//                "color" => "black"
//            ),
//            "keyword2" => array(
//                "value" => $paymentText . "," . BizHelper::getPayStatusText($order["pay_status"]),
//                "color" => "black"
//            ),
//            "keyword3" => array(
//                "value" => $order["totalprice"] . $scoreString . $totalprepriceString,
//                "color" => "black"
//            ),
//            "keyword4" => array(
//                "value" => $order["time"],
//                "color" => "black"
//            ),
//            "keyword5" => array(
//                "value" => $order["contact"]["name"] . "," . $order["contact"]["phone"] . "," . $order["contact"]["province"] . $order["contact"]["city"] . $order["contact"]["address"],
//                "color" => "black"
//            ),
//            "remark" => array(
//                "value" => $order["remark"],
//                "color" => "red"
//            ),
//        );

        $msg["data"] = array(
            "first" => array(
                "value" => 'sssssssssssssss',
                "color" => "red"
            ),
            "keyword1" => array(
                "value" => $order["orderid"],
                "color" => "black"
            ),
            "keyword2" => array(
                "value" => 'ggggggggggggggggg',
                "color" => "black"
            ),
            "keyword3" => array(
                "value" => 'nnnnnnnnnnnnnnnnnn',
                "color" => "black"
            ),
            "keyword4" => array(
                "value" => 'iiiiiiiiiiiiii',
                "color" => "black"
            ),
            "keyword5" => array(
                "value" => 'hhhhhhhhhhhhhhhh',
                "color" => "black"
            ),
            "remark" => array(
                "value" => 'vvvvvvvvvvvvv',
                "color" => "red"
            ),
        );

        //CommonLoger::log("ssssssssssss",json_encode($msg["data"],JSON_UNESCAPED_UNICODE));

        $result= self::$weObj->sendTemplateMessage($msg);
//        if($result){
//            CommonLoger::log("weixinNoticeMessageStatus",'true');
//        }else{
//            CommonLoger::log("weixinNoticeMessageStatus",'false');
//        }
    }

    /**
     * 获取微信模板消息的id
     * @param $shortId
     * @return mixed
     */
    public function getTplMessageId($shortId)
    {
        $this->init();

        $tempMsg = D("WxTplmsg")->get(array("template_id_short" => $shortId));
        if ($tempMsg) {
            $template_id = $tempMsg["template_id"];
        } else {
            $template_id = self::$weObj->addTemplateMessage($shortId);
            if ($template_id) {
                D("WxTplmsg")->addWxTplmsg(array("template_id_short" => $shortId, "template_id" => $template_id));
            }
        }

        return $template_id;
    }

    public function sendTplMsgPay($user_id, $order_id, $paytype = '')
    {
        $this->init();

        $template_id = $this->getTplMessageId("OPENTM207791277");
        $order = D("Order")->get(array("id" => $order_id), true);
        $user = D("User")->get(array("id" => $user_id));

        if ($paytype == "prepay") {
            $customerTitle = "尊敬的客户,您的订单预付款已成功支付。\n";
        } else {
            $customerTitle = "尊敬的客户,您的订单已成功支付。\n";
        }

        $this->sendTplMsgPayDetail($user['openid'], $order, $customerTitle, $paytype);

        $shop = D("Shop")->getShop(array("id" => $order["shop_id"]));
        $employee = explode(',', $shop["employee"]);
        foreach ($employee as $key => $value) {
            if (!$value) {
                continue;
            }
            $admin = D("User")->get(array("id" => $value));

            if ($paytype == "prepay") {
                $adminTitle = "客户新订单预付款已成功支付。";
            } else {
                $adminTitle = "客户新订单已成功支付。";
            }
            $this->sendTplMsgPayDetail($admin["openid"], $order, $adminTitle, $paytype);
        }
    }

    private function sendTplMsgPayDetail($openId, $order, $title, $paytype = '')
    {
        if ($paytype == "prepay") {
            $priceLocal = $order["totalpreprice"];
        } else {
            $priceLocal = $order["totalprice"];
        }

        $template_id = $this->getTplMessageId("OPENTM207791277");
        $msg = array();
        $msg["touser"] = $openId;//$user["openid"];
        $msg["template_id"] = $template_id;
        $msg["url"] = "";
        $msg["topcolor"] = "";
        $msg["data"] = array(
            "first" => array(
                "value" => $title,
                "color" => "red"
            ),
            "keyword1" => array(
                "value" => $order["orderid"],
                "color" => "black"
            ),
            "keyword2" => array(
                "value" => $priceLocal,
                "color" => "black"
            ),
            "remark" => array(
                "value" => $order["remark"],
                "color" => "red"
            ),
        );
        self::$weObj->sendTemplateMessage($msg);
    }

    public function sendTplMsgDeliver()
    {
        $order_id = I("get.order_id");
        $this->init();

        $order = D("Order")->get(array("id" => $order_id), true);
        $template_id = $this->getTplMessageId("OPENTM207763419");

        $detail = "";
        foreach ($order["detail"] as $key => $value) {
            $detail .= $value["name"] . "(" . $value["price"] . "元 * " . $value["num"] . ")";
        }
        $user = D("User")->get(array("id" => $order["user_id"]));
        $data = '{
            "touser":"' . $user["openid"] . '",
            "template_id":"' . $template_id . '",
            "url":"",
            "topcolor":"#FF0000",
            "data":{
                "first": {
                    "value":"尊敬的客户,您的订单已发货。",
                    "color":"#ff0000"
                },
                "keyword1":{
                    "value":"' . $order["totalprice"] . '",
                    "color":"#0000ff"
                },
                "keyword2":{
                    "value":"' . $order["orderid"] . '",
                    "color":"#0000ff"
                },
                "remark":{
                    "value":"' . $detail . '",
                    "color":"#0000ff"
                }
            }
        }';

        $data = json_decode($data, true);
        self::$weObj->sendTemplateMessage($data);
    }
}