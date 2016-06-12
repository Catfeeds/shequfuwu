<?php
namespace Admin\Controller;

use Common\Model\BizHelper;
use Think\Controller;
use Vendor\Hiland\Utils\Data\StringHelper;
use Vendor\Hiland\Utils\DataModel\ModelMate;

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

        $this->check($type);
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

    public function checkEvents($event)
    {
        $event = strtolower($event);
        $openId = self::$revData['FromUserName'];
        $messageContent = '';

        switch ($event) {
            case 'subscribe':
                $userID = $this->checkUser($openId);

                $projectName = C('PROJECT_NAME');
                $messageContent = "恭喜加入[$projectName],您是第[$userID]位会员,在家即可享受货品配送服务！";

                $eventkey = self::$revData['EventKey'];

                $merchantScanedID = 0;
                $merchantScanedName = '';
                if (!empty($eventkey)) {
                    $merchantScanedID = StringHelper::getSeperatorAfterString($eventkey, 'qrscene_');
                    $merchantScanedName = BizHelper:: relateUserShopScaned($openId, $merchantScanedID);
                }

                if (!empty($merchantScanedName)) {
                    $messageContent .= "您扫码的店铺为[$merchantScanedName]，您的购物活动将有本店铺为你提供服务。";
                }

                self::$weObj->text($messageContent)->reply();
                break;
            case 'unsubscribe':
                $this->updateUser($openId);
                break;
            case 'click':
                $this->checkKeyWords(self::$revData['EventKey']);
                break;
            case 'scan':
                $projectName = C('PROJECT_NAME');
                $messageContent = "欢迎再次回到[$projectName]，我们将持续为你提供更优质的服务！";

                $eventkey = self::$revData['EventKey'];
                $merchantScanedID = 0;
                $merchantScanedName = '';
                if (!empty($eventkey)) {
                    $merchantScanedID = $eventkey;//self::$revData['EventKey'];
                    $merchantScanedName = BizHelper:: relateUserShopScaned($openId, $merchantScanedID);
                }

                if (!empty($merchantScanedName)) {
                    $messageContent .= "您扫码的店铺为[$merchantScanedName]，您的购物活动将有本店铺为你提供服务。";
                }

                self::$weObj->text($messageContent)->reply();
                break;
        }
    }

    public function checkKeyWords($key)
    {
        $key = $key ? $key : self::$weObj->getRev()->getRevContent();

        switch ($key) {
            case 'qqkf': //QQ客服
                $replay = D("WxReply")->get(array("key" => $key), true);
                $qq = $replay["remark"];
                $str = "<a href='http://wpa.qq.com/msgrd?v=3&uin=" . $qq . "&site=qq&menu=yes&from=singlemessage'>" . htmlspecialchars_decode('点击联系QQ客服') . "</a>";
                self::$weObj->text($str)->reply();
                break;
            case 'csgw':
                //超市购物，弹出其当初扫描的超市
                $openId = self::$revData['FromUserName'];
                $usershopscanedMate = new ModelMate('usershopscaned');
                $where = array();
                $where['openid'] = $openId;
                $shopscaned= $usershopscanedMate->select($where);

                $shopMate= new ModelMate('shop');
                $fileMate= new ModelMate('file');

                if($shopscaned){
                    $newsArray= array();
                    foreach ($shopscaned as $shopScaned){
                        $shopId= $shopScaned['shopid'];
                        $shopWhere= array();
                        $shopWhere['id']= $shopId;
                        $shop= $shopMate->find($shopWhere);
                        if($shop){
                            $fileId= $shop['file_id'];
                            $pictureUrl= '';
                            if($fileId){
                                $file= $fileMate->get($fileId);
                                $pictureUrl= self::$appUrl . '/Public/Uploads/' . $file["savepath"] . $file["savename"];
                            }else{
                                $pictureUrl=
                            }


                            $news= array(
                                'Title' => $shop["name"],
                                'Description' => $shop["notification"],
                                'PicUrl' => $pictureUrl,
                                'Url' => $replay["url"]
                            )
                        }
                    }
                }else{

                }
                break;
            default:
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

    public function checkUser($openId)
    {
        $userID = 0;
        $user = D("User")->get(array("openid" => $openId));
        if ($user) {
            D("User")->save(array("id" => $user["id"], "subscribe" => 1));
            $userID = $user["id"];
        } else {
            $userInfo = self::$weObj->getUserInfo($openId);
            $user = array(
                "username" => $userInfo["nickname"],
                "openid" => $userInfo["openid"],
                "subscribe" => 1,
                "sex" => $userInfo["sex"],
                "language" => $userInfo["language"],
                "city" => $userInfo["city"],
                "province" => $userInfo["province"],
                "avater" => $userInfo["headimgurl"],
                "status" => C('USER_DEFAULT_STATUS'),
            );
            $userID = D("User")->add($user);
        }

        return $userID;
    }

    public function updateUser($openId)
    {
        $user = D("User")->get(array("openid" => $openId));
        if ($user) {
            D("User")->save(array("id" => $user["id"], "subscribe" => 0));
        }
    }

    public function getQRCode()
    {
        $this->init();
        $ticket = self::$weObj->getQRCode("1", 1);
        $qrcode = self::$weObj->getQRUrl($ticket["ticket"]);
        if ($qrcode) {
            D("Config")->add(array("qrcode" => $qrcode));
            $this->success("生成二维码成功", U("Admin/Config/shopSet"));
        } else {
            $this->error("生成二维码失败", U("Admin/Config/shopSet"));
        }
    }

    public function getMenu()
    {
        $this->init();

        self::$weObj->getMenu();
    }

    public function createWxMenu()
    {
        $m = D("WxMenu");
        $menu = $m->getList(array("pid" => 0), false, "rank desc,id desc", 0, 0, 3);

        $newmenu["button"] = array();
        for ($i = 0; $i < count($menu); $i++) {
            if ($menu[$i]["type"] == "view") {
                $sub = $m->getList(array("pid" => $menu[$i]["id"]), false, "rank desc,id desc", 0, 0, 5);
                if ($sub) {
                    $sub_button = array();

                    for ($j = 0; $j < count($sub); $j++) {
                        if ($sub[$j]["type"] == "view") {
                            array_push($sub_button, array('type' => 'view', 'name' => $sub[$j]["name"], 'url' => $sub[$j]["url"]));
                        } else {
                            array_push($sub_button, array('type' => 'click', 'name' => $sub[$j]["name"], 'key' => $sub[$j]["key"]));
                        }
                    }
                    array_push($newmenu["button"], array('name' => $menu[$i]["name"], 'sub_button' => $sub_button));
                } else {
                    array_push($newmenu["button"], array('type' => 'view', 'name' => $menu[$i]["name"], 'url' => $menu[$i]["url"]));
                }
            } else {
                $sub = $m->getList(array("pid" => $menu[$i]["id"]), false, "rank desc,id desc", 0, 0, 5);
                if ($sub) {
                    $sub_button = array();

                    for ($j = 0; $j < count($sub); $j++) {
                        if ($sub[$j]["type"] == "view") {
                            array_push($sub_button, array('type' => 'view', 'name' => $sub[$j]["name"], 'url' => $sub[$j]["url"]));
                        } else {
                            array_push($sub_button, array('type' => 'click', 'name' => $sub[$j]["name"], 'key' => $sub[$j]["key"]));
                        }
                    }
                    array_push($newmenu["button"], array('name' => $menu[$i]["name"], 'sub_button' => $sub_button));
                } else {
                    array_push($newmenu["button"], array('type' => 'click', 'name' => $menu[$i]["name"], 'key' => $menu[$i]["key"]));
                }
            }
        }

        $this->init();
        $json = self::$weObj->createMenu($newmenu);
        $json = json_decode($json, true);

        if ($json["errcode"] == 0) {
            $this->success("重新创建菜单成功!", U("Admin/Weixin/wxMenuSet"));
        } else {
            $this->error("重新创建菜单失败!", U("Admin/Weixin/wxMenuSet"));
        }

    }

    public function addTplMessageId($id)
    {
        $this->init();

        $tempMsg = D("WxTplmsg")->get(array("template_id_short" => $id));
        if ($tempMsg) {
            $template_id = $tempMsg["template_id"];
        } else {
            $template_id = self::$weObj->addTemplateMessage($id);
            if ($template_id) {
                D("WxTplmsg")->addWxTplmsg(array("template_id_short" => $id, "template_id" => $template_id));
            }
        }

        return $template_id;
    }

    public function sendTplMsgOrder($user_id, $order_id)
    {
        $this->init();

        $template_id = $this->addTplMessageId("OPENTM201785396");
        $order = D("Order")->get(array("id" => $order_id), true);
        $user = D("User")->get(array("id" => $user_id));

        switch ($order["payment"]) {
            case 0:
                $order["payment"] = "账户支付";
                break;
            case 1:
                $order["payment"] = "微信支付";
                break;
            case 2:
                $order["payment"] = "支付宝支付";
                break;
            case 3:
                $order["payment"] = "货到付款";
                break;
        }

        switch ($order["pay_status"]) {
            case 0:
                $order["pay_status"] = "未支付";
                break;
            case 1:
                $order["pay_status"] = "支付成功";
                break;
        }

        $msg = array();
        $msg["touser"] = $user["openid"];
        $msg["template_id"] = $template_id;
        $msg["url"] = "";
        $msg["topcolor"] = "";
        $msg["data"] = array(
            "first" => array(
                "value" => "尊敬的客户,您的订单已成功提交。\n",
                "color" => "red"
            ),
            "keyword1" => array(
                "value" => $order["orderid"],
                "color" => "black"
            ),
            "keyword2" => array(
                "value" => $order["payment"] . "," . $order["pay_status"],
                "color" => "black"
            ),
            "keyword3" => array(
                "value" => $order["totalprice"],
                "color" => "black"
            ),
            "keyword4" => array(
                "value" => $order["time"],
                "color" => "black"
            ),
            "keyword5" => array(
                "value" => "姓名:" . $order["contact"]["name"] . ",电话:" . $order["contact"]["phone"] . ",地址: " . $order["contact"]["province"] . $order["contact"]["city"] . $order["contact"]["address"],
                "color" => "black"
            ),
            "remark" => array(
                "value" => $order["remark"],
                "color" => "red"
            ),
        );

        self::$weObj->sendTemplateMessage($msg);

        $this->sendTplMessageOrderAdmin($order_id);
    }

    public function sendTplMessageOrderAdmin($order_id)
    {
        $this->init();

        $order = D("Order")->getOrder(array("id" => $order_id), true);
        $template_id = $this->addTplMessageId("OPENTM201785396");

        switch ($order["payment"]) {
            case 0:
                $order["payment"] = "账户支付";
                break;
            case 1:
                $order["payment"] = "微信支付";
                break;
            case 2:
                $order["payment"] = "支付宝支付";
                break;
            case 3:
                $order["payment"] = "货到付款";
                break;
        }

        switch ($order["pay_status"]) {
            case 0:
                $order["pay_status"] = "未支付";
                break;
            case 1:
                $order["pay_status"] = "支付成功";
                break;
        }
        // file_put_contents("2.txt",$order["shop_id"]);
        $shop = D("Shop")->getShop(array("id" => $order["shop_id"]));
        $employee = explode(',', $shop["employee"]);
        foreach ($employee as $key => $value) {
            if (!$value) {
                continue;
            }
            $user = D("User")->get(array("id" => $value));
            $data = '{
                "touser":"' . $user["openid"] . '",
                "template_id":"' . $template_id . '",
                "url":"' . "http://" . I("server.HTTP_HOST") . U("App/Admin/order/shopId") . "/" . $order["shop_id"] . '",
                "topcolor":"#FF0000",
                "data":{
                    "first": {
                        "value":"客户新订单提醒。---' . $order["pay_status"] . '",
                        "color":"#FF0000"
                        },
                    "keyword1":{
                        "value":"' . $order["orderid"] . '",
                        "color":"#0000ff"
                        },
                    "keyword2":{
                        "value":"' . $order["payment"] . '",
                        "color":"#0000ff"
                        },
                    "keyword3":{
                        "value":"' . $order["totalprice"] . '",
                        "color":"#0000ff"
                        },
                    "keyword4":{
                        "value":"' . $order["time"] . '",
                        "color":"#0000ff"
                        },
                    "keyword5":{
                        "value":"' . $order["contact"]["name"] . '-' . $order["contact"]["phone"] . '-' . $order["contact"]["province"] . $order["contact"]["city"] . $order["contact"]["address"] . '",
                        "color":"#0000ff"
                        },
                    "remark":{
                        "value":"' . $order["remark"] . '",
                        "color":"#0000ff"
                        }
                }
            }';

            $data = json_decode($data, true);
            self::$weObj->sendTemplateMessage($data);
        }


    }


    public function sendTplMsgPay($user_id, $order_id)
    {
        $this->init();

        $template_id = $this->addTplMessageId("OPENTM207791277");
        $order = D("Order")->get(array("id" => $order_id), true);
        $user = D("User")->get(array("id" => $user_id));

        $msg = array();
        $msg["touser"] = $user["openid"];
        $msg["template_id"] = $template_id;
        $msg["url"] = "";
        $msg["topcolor"] = "";
        $msg["data"] = array(
            "first" => array(
                "value" => "尊敬的客户,您的订单已成功支付。\n",
                "color" => "red"
            ),
            "keyword1" => array(
                "value" => $order["orderid"],
                "color" => "black"
            ),
            "keyword2" => array(
                "value" => $order["totalprice"],
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
        $template_id = $this->addTplMessageId("OPENTM207763419");

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

        // print_r($data);

        $data = json_decode($data, true);
        self::$weObj->sendTemplateMessage($data);
    }


}