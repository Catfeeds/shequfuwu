<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/5/30
 * Time: 16:42
 */

namespace Home\Controller;


use Common\Model\BizConst;
use Common\Model\BizHelper;
use Common\Model\OrderViewMate;
use Common\Model\ViewLink;
use Common\Model\WechatBiz;
use Think\Controller;
use Vendor\Hiland\Biz\Geo\GeoHelper;
use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Biz\Misc\RedPacketHelper;
use Vendor\Hiland\Biz\Tencent\WechatHelper;
use Vendor\Hiland\Utils\Data\BoolHelper;
use Vendor\Hiland\Utils\Data\CipherHelper;
use Vendor\Hiland\Utils\Data\DateHelper;
use Vendor\Hiland\Utils\Data\Enum;
use Vendor\Hiland\Utils\Data\HtmlHelper;
use Vendor\Hiland\Utils\Data\MathHelper;
use Vendor\Hiland\Utils\Data\ObjectHelper;
use Vendor\Hiland\Utils\Data\RandHelper;
use Vendor\Hiland\Utils\Data\StringHelper;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\DataModel\ViewMate;
use Vendor\Hiland\Utils\IO\Drawing\CircleSeal;
use Vendor\Hiland\Utils\IO\ImageHelper;
use Vendor\Hiland\Utils\IO\Thread;
use Vendor\Hiland\Utils\Web\AsynHandle;
use Vendor\Hiland\Utils\Web\EnvironmentHelper;
use Vendor\Hiland\Utils\Web\HttpHeader;
use Vendor\Hiland\Utils\Web\HttpRequestHeader;
use Vendor\Hiland\Utils\Web\HttpRequstHeader;
use Vendor\Hiland\Utils\Web\HttpResponseHeader;

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

    public function configop($configname = 'PROJECT_NAME')
    {
        dump(C($configname));
    }

    public function configdbop()
    {
        $mate = new ModelMate('config');
        $data = $mate->get(1);
        dump($data);
    }

    public function buyershopop($shopid = 3)
    {
        $openid = 'gasdgawegewgew';
        $result = BizHelper::relateUserShopScaned($openid, $shopid);
        dump($result);
    }

    public function serverhostop()
    {
        dump('HostName:' . EnvironmentHelper::getServerHostName());
        dump('ServerName:' . EnvironmentHelper::getWebServerName());
        dump('Root:' . __ROOT__);
    }

    public function webphysicalrootpathop()
    {
        dump('file:' . __FILE__);
        dump('PHP_SELF:' . $_SERVER['PHP_SELF']);
        dump('SCRIPT_NAME' . $_SERVER['SCRIPT_NAME']);//它将返回包含当前脚本的路径。这在页面需要指向自己时非常有用
        dump('SCRIPT_FILENAME' . $_SERVER['SCRIPT_FILENAME']);//它将返回当前文件所在的绝对路径信息

        dump('REQUEST_URI' . $_SERVER['REQUEST_URI']);

        dump(realpath(dirname(__FILE__) . '/../'));
        dump(str_replace('\\', '/', realpath(dirname(__FILE__) . '/../')));
        dump('hostName:' . EnvironmentHelper::getServerHostName());
        //dump(WebHelper::getWebPhysicalRootPath());
    }

    public function wxmenuop()
    {
        $m = D("WxMenu");
        $menu = $m->getList(array("pid" => 0), false, array('rank' => 'desc', 'id' => 'desc'), 0, 0, 3);
        dump($menu);
    }

    public function paraop()
    {
        $this->paraUsed("rank desc,id");
    }

    public function paraUsed($order = array('id' => 'desc'))
    {
        dump($order);
    }

    public function skulistop()
    {
        $condition = array(
            "product_id" => 23,
        );
        $result = D("ProductSku")->getList($condition, true, "rank desc");
        dump($result);
    }

    /**
     * @param int $shopid
     */
    public function calctimeofshop($shopid = 146)
    {
        G('shopBeginTime');
        $product = D("Product")->getList(array("status" => array("neq", -1), "shop_id" => $shopid), false, "rank desc", 0, 0, 0);
        $jsons = json_encode($product);
        dump(G('shopBeginTime', 'shopEndTime'));
        //dump($product);
    }

    public function getshopop($shopid = 144)
    {
        $data = D('shop')->getShop();
    }

    public function wechatop()
    {
        $token = WechatHelper::getAccessToken();
        dump($token);

        $qrTicket = WechatHelper::getQRTicket(146, '', 'QR_LIMIT_SCENE');
        dump($qrTicket);
    }

    public function cookieop()
    {
        $cookieKey = "my-ss";
        cookie($cookieKey, 'qingdao');
        dump(cookie($cookieKey));
        cookie($cookieKey, null);
        //Cookie:
        dump(cookie($cookieKey));
    }

    public function modelmateop($shopId = 0)
    {
        $mate = new ModelMate('menu');
        $condition = array();
        $condition['shop_id'] = $shopId;
        $result = $mate->delete($condition);
        dump($result);
    }

    public function keywordop($shopId = 144)
    {
        $mate = new ModelMate('menu');
        $sql = "select * from __TABLE__ where shop_id= $shopId";
        $result = $mate->query($sql);
        dump($result);
    }

    public function copydataop($sourceShopId = 144, $targetShopId = 2)
    {
        $mateMenu = new ModelMate('menu');
        $sqlMenu = "INSERT INTO __TABLE__(`name`,pid,file_id,remark,rank,time,shop_id,copysourceid) SELECT `name`,pid,file_id,remark,rank,time,$targetShopId,id FROM __TABLE__ where shop_id=$sourceShopId";
        $menuResult = $mateMenu->execute($sqlMenu);
        dump($menuResult);

        $mateProduct = new ModelMate('product');
        $sqlProduct = "INSERT INTO __TABLE__(shop_id,menu_id,`name`,subname,price,old_price,unit,score,sales,store,albums,visiter,psku,file_id,detail,`status`,label,remark,rank,time,copysourceid) SELECT $targetShopId,menu_id,`name`,subname,price,old_price,unit,score,sales,store,albums,visiter,psku,file_id,detail,`status`,label,remark,rank,time,id FROM __TABLE__ where shop_id=$sourceShopId";
        $resultProduct = $mateProduct->execute($sqlProduct);
        dump($resultProduct);

        $mateSku = new ModelMate('productSku');
        $sqlSku = "INSERT INTO __TABLE__(shop_id,product_id,`name`,path,price,freight,store,sales,remark,time,rank,file_id,albums,copysourceid) SELECT $targetShopId,product_id,`name`,path,price,freight,store,sales,remark,time,rank,file_id,albums,id FROM __TABLE__ where shop_id=$sourceShopId";
        $resultSku = $mateSku->execute($sqlSku);
        dump($resultSku);
    }

    public function logop($level = 30)
    {
        $option = array(
            'status' => 'sssssssssssssss',
            'category' => 'ok',
            'other' => '88888',
            'misc' => 9,
        );
        CommonLoger::log('logtest', time(), $level, $option);
    }

    public function asynop()
    {
        dump(22222222222);
        CommonLoger::log('asynCalled', '1111111111111');
        //self::asynCalled();

        $url = U("asynCalled", "info=9999999999");
        dump($url);

        Thread::asynExec($url);

        dump('hhhh');

//        $thread= new Thread();
//        $thread->add(asynCalled);
        //dump($asyn->makeRequest($url));
        //dump($asyn->request($url));
        //NetHelper::request($url);
        //dump($asyn->Get("http://www.wtoutiao.com/p/147Sf8z.html"));


    }

    public function asynCalled($info)
    {
        sleep(10);
        //dump('ccccccccccccccccc-called');
        CommonLoger::log('asynCalled', $info);
        dump('oooooooooo');
        //return 'ok';
    }

    public function CircleSealop()
    {
        $seal = new CircleSeal('你我他坐站走东西南北中', 75, 6, 24, 0, 0, 16, 40);
        $seal->draw();
    }

    public function viewmodelop()
    {
        $viewMate = new ViewMate('menu', ViewLink::getCommon_File());

        $viewData = $viewMate->get(100, 'id', true);
        dump($viewData);

        $modelMate = new ModelMate('menu');
        $modelData = $modelMate->get(100);
        dump($modelData);

        $condition['id'] = array('NEQ', '1');
        $list = $viewMate->select($condition);
        dump($list);
    }

    public function physicalpathop()
    {
        //dump($_SERVER['PHP_SELF']);
        dump(realpath(dirname(__FILE__)));
    }

    public function cleancommnetop()
    {
        $html = '<meta charset="UTF-8">
	<!--引入标题，关键之，描述等-->
	<title>易联云-API开发文档</title>
	<meta name="keywords" content="">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<link rel="stylesheet" type="text/css" href="Common/style/base.min.css">
	<link rel="stylesheet" href="Common/style/download.min.css">
	<link rel="stylesheet" type="text/css" href="Common/style/home-common.min.css">
	<style type="text/css">
		body{
			background:#f5f8fb;
		}
	</style>';//NetHelper::get("http://www.10ss.net/doc.html");
        dump($html);
        $result = HtmlHelper::cleanComment($html);
        dump($result);
    }

    public function compressop()
    {
        $url = EnvironmentHelper::getServerHostName() . U("Home/Public/login");
        dump($url);
        $result = EnvironmentHelper::getServerCompressType($url);
        dump($result);

        dump(HttpRequestHeader::getAll());

        $data = HttpResponseHeader::getAll($url);
        dump($data);
    }

    public function modelMateop2($openid = 'oqfK9vsaghlVPWev6l6Nuz1TZd9M')
    {
        $userMate = new ModelMate('user');
        $condition = array();
        $condition['openid'] = $openid;
        $userFound = $userMate->find($condition);
        dump($userFound);
    }

    public function jsapiop()
    {
        $accessToken = WechatHelper::getAccessToken();
        dump("accessToken1-- $accessToken");

        $jsApiTicket1 = WechatHelper::getJsApiTicket();
        dump("jsApiTicket1-- $jsApiTicket1");

        $wechat = WechatBiz::getWechat();

        $ticket = $wechat->getJsTicket();
        dump("jsApiTicket2-- $ticket");

        $url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $timeStamp = time();
        $nonceString = RandHelper::rand(16);
        $signPackage = $wechat->getJsSign($url, $timeStamp, $nonceString);
        dump($signPackage);
    }

    public function jstestop()
    {
        $this->display();
    }

    public function pageop()
    {
        $this->display();
    }

    public function getFileImageUrlop($fileid = 41)
    {
        dump(BizHelper::getFileImageUrl($fileid, "", true));
    }

    public function getorders($userID = 802)
    {
        //$result = D("Order")->getList(array("user_id" => $userID, "status" => array("gt", -1)), true);
        //dump($result);


        $mate = new ViewMate('order', ViewLink::getOrder_OrderContact_OrderDetail_Shop());
        //$result= $mate->get(82);
        $result = $mate->select(array("user_id" => $userID, "status" => array("gt", -1)));

        dump($result);
    }

    public function classkeyop()
    {
        dump(__NAMESPACE__);
        dump(__CLASS__);

//        $ns= __NAMESPACE__;
//        $cn= __CLASS__;
//
//        $nsLength= strlen($ns);
//        if($nsLength){
//            $cn= substr($cn,$nsLength+1);
//        }
//
//        $postFixPostion= strpos($cn,'Controller');
//        $cn= substr($cn,0,$postFixPostion);

        $ns = __NAMESPACE__;
        $cn = __CLASS__;
        $cn = StringHelper::getSeperatorAfterString($cn, $ns);
        $cn = StringHelper::getSeperatorBeforeString($cn, 'Controller');
        $cn = StringHelper::getSeperatorAfterString($cn, "\\");
        dump($cn);
    }

    public function templateop()
    {
        $this->display();
    }

    public function imageop($fileName = 'http://ww4.sinaimg.cn/mw1024/5efbc0fajw1f5xsthllblj21hc1hckjn.jpg')
    {
        dump(ImageHelper::isImage($fileName));
        dump(ImageHelper::getImageOutputFunctionParamCount("png"));
        dump(ImageHelper::getImageOutputFunctionParamCount("jpeg"));
    }

    public function delop()
    {
        $condition = array("id" => 2);
        //D("File")->del($condition);
    }

    public function timespanop($span = 1468740651)
    {
        dump(date('Y-m-d H:i:s', $span));
    }

    public function geoop($lat = 34.8177, $lng = 117.359)
    {
        $result = GeoHelper::getGeoInformation($lat, $lng, 'amap');
        dump($result);
    }

    public function lessop()
    {
        $this->display();
    }

    public function getAreaShopsop($city = '枣庄市')
    {
        dump(BizHelper::getAreaShops($city, '', 0, 1, 1, 3));
    }

    public function constop($prefix = '', $withText = false)
    {
        $consts = BizConst::getConsts($prefix, $withText);
        dump($consts);

        $constName = BizConst::getConstName('ORDER_STATUS_', 1);
        dump($constName);
        $constText = BizConst::getConstText('ORDER_STATUS_', 1);
        dump($constText);

        dump("ORDER_STATUS_ - true---------------------------------");
        $constArray = BizConst::getConstArray('ORDER_STATUS_');
        dump($constArray);

        dump("ORDER_STATUS_ - false---------------------------------");
        $constArray = BizConst::getConstArray('ORDER_STATUS_', false);
        dump($constArray);

        dump("all - true---------------------------------");
        $constArray = BizConst::getConstArray('', true);
        dump($constArray);

        dump("all - false---------------------------------");
        $constArray = BizConst::getConstArray('', false, "_S_TEXT");
        dump($constArray);

        dump("MARKETING_SALETYPE_  KV mode---------------------------------");
        $saleTypeList = BizConst::getConstArray("MARKETING_SALETYPE_");
        dump($saleTypeList);

        dump("MARKETING_SALETYPE_  common mode---------------------------------");
        $saleTypeList = BizConst::getConstArray("MARKETING_SALETYPE_", false);
        dump($saleTypeList);
    }

    public function appop()
    {
        dump(__APP__);
        dump(_PHP_FILE_);
        dump(__ACTION__);

        dump(__ROOT__);

        $webFullRoot = "http://" . I("server.HTTP_HOST") . __ROOT__;
        dump($webFullRoot);
    }

    public function mathop()
    {
        $float = 0.456789;
        $percent = MathHelper::float2Percent($float, 3);

        dump($percent);
        dump(MathHelper::percent2Float($percent));

        dump(8 / 3);
    }

    public function arrayrandop()
    {
        $arr = array();
        for ($i = 0; $i < 10; $i++) {
            $arr[$i] = 0;
        }

        $rand = array_rand($arr, 5);

        $index = 1;
        foreach ($rand as $k => $v) {
            $arr[$k] = $index;
            $index++;
        }
        //$arr= array_values($arr);
        shuffle($arr);
        dump($arr);
    }

    public function getLastRedPacketAction($shopId = 144)
    {
        $result = BizHelper::getLastEffectRedPacketAction($shopId);
        dump($result);
    }

    public function redpacket2op($id = 7)
    {
        $keys = "$id";
        $mate = new ModelMate('weixinRedpacket');
        $mate->maintenanceData($keys, array("status" => -10));
    }

    public function redpacketop()
    {
        $bonus_total = 200;
        $bonus_count = 50;
        $bonus_max = 10;//此算法要求设置的最大值要大于平均值
        $bonus_min = 1;
        $result_bonus = RedPacketHelper:: getBonus($bonus_total, $bonus_count, $bonus_max, $bonus_min);
        $total_money = 0;
        $arr = array();
        foreach ($result_bonus as $key => $value) {
            $total_money += $value;
            if (isset($arr[$value])) {
                $arr[$value] += 1;
            } else {
                $arr[$value] = 1;
            }

        }

        //输出总钱数，查看是否与设置的总数相同
        echo $total_money;
        //输出所有随机红包值
        dump($result_bonus);
        //统计每个钱数的红包数量，检查是否接近正态分布
        ksort($arr);
        dump($arr);

        dump("------------------------------------------");
        for ($i = 0; $i < 10; $i++) {
            $result_bonus[] = 0;
        }

        shuffle($result_bonus);
        dump($result_bonus);
    }

    public function adsop($shopid = 146)
    {
        $condition = array(
            "shop_id" => $shopid,
            "adsname" => 3,
        );
        $mate = new ModelMate("ads");
        $ads = $mate->select($condition, "rank desc");//D("Ads")->getList($condition, true);
        dump($ads);
    }

    public function userscoreop($userid = 802)
    {
        BizHelper::updateUserScore($userid, 144, 1, 0, '购买商品');
    }

    public function deliverytimeop()
    {
        $mate = new ModelMate("shop");
        $data = $mate->get(144);
        $deliveryTime = $data['delivery_time'];
        dump($deliveryTime);
        dump("------------------------");
        $deliveryTime = str_replace("\r\n", ",", $deliveryTime);
        $deliveryTime = explode(",", $deliveryTime);
        $deliveryTime = array_filter($deliveryTime);
        dump($deliveryTime);
    }

    public function converterop()
    {
        $string = "ab12cd4";
        dump((int)$string);
        dump(intval($string));
        dump(is_int("23"));
        dump(is_numeric("23"));
        dump(is_numeric("23a"));

        $original = "w12345abcdefg";
        $encrpted = CipherHelper::encrypt($original);
        $encrptedChaged = $encrpted . "rx";
        $decrypted = CipherHelper::decrypt($encrpted);
        dump('---------------------------------------');
        dump(CipherHelper::decrypt($encrptedChaged));

        dump($encrpted);
        dump(encrypt($original));
        dump($decrypted);
        dump(decrypt($encrpted));

        $base64 = base64_encode(RandHelper::rand(20));
        dump($base64);
        dump(base64_decode($base64));
    }

    public function wxcustomermsgop()
    {
        $result = WechatHelper::responseCustomerServiceText("oqfK9vsaghlVPWev6l6Nuz1TZd9M", "hello world!");
        dump($result);
    }

    public function betweenop($openId = 'oqfK9vsaghlVPWev6l6Nuz1TZd9M', $packetId = 3)
    {
        $detailMate = new ModelMate("weixinRedpacketDetail");

        $nextDay = DateHelper::addInterval(time(), "d", 1);
        $todayUniqeCondition = array(
            "openid" => $openId,
            "packet_id" => $packetId,
            //"drawtime"=>array("between", DateHelper::format(null, "Y-m-d"), DateHelper::format($nextDay, "Y-m-d")),
            "drawtime" => array(array('gt', DateHelper::format(null, "Y-m-d")), array('lt', DateHelper::format($nextDay, "Y-m-d")), 'and'),
        );

        dump($todayUniqeCondition);

        $todayjoinTimes = $detailMate->getCount($todayUniqeCondition);
        dump($todayjoinTimes);
    }

    public function boolop()
    {
        $data = array(
            v1 => 0,
            v2 => "",
            v3 => "false",
            v4 => false,
            v5 => true,
            v6 => "hello"
        );


        dump("传统判法--------------------------------");
        foreach ($data as $k => $v) {
            if ($v) {
                dump("$v YYYYYYYYYYYY");
            } else {
                dump("$v NNNNNNNNNNNN");
            }
        }


        dump("独立判法isRealFalse--------------------------------");
        foreach ($data as $k => $v) {
            if (BoolHelper::isRealFalse($v)) {
                dump("$v 是真实的false");
            } else {
                dump("$v 不是真实的false");
            }
        }
        dump("独立判法isRealTrue--------------------------------");
        foreach ($data as $k => $v) {
            if (BoolHelper::isRealTrue($v)) {
                dump("$v 是真实的true");
            } else {
                dump("$v 不是真实的true");
            }
        }
    }

    public function objectop()
    {
        $data = array(
            v1 => 0,
            v2 => "",
            v3 => "false",
            v4 => false,
            v5 => true,
            v6 => "hello",
            v7 => -100,
            v8 => "-100",
        );

        dump("判断数据类型--------------------------------");
        foreach ($data as $k => $v) {
            $t = ObjectHelper::getType($v);
            dump("$k 的值为$v,类型为$t");
        }

        dump("--非严格比较-------------------------------");
        dump(ObjectHelper::equal($data['v7'], $data['v8']));
        dump("--**严格比较-------------------------------");
        dump(ObjectHelper::equal($data['v7'], $data['v8'], true));
    }

    public function orderop($id = 132)
    {
        $order = D("Order")->get(array("id" => $id), true);
        dump($order["shop"]["name"]);
        dump($order);
    }

    public function paytypetextop()
    {
        $result = BizHelper::getPayTypeText(15);
        dump($result);
        dump(BizConst::getConstText("ORDER_PAYTYPE_", 15));

        $mate = new ModelMate("order");
        $order = $mate->get(188);
        dump(BizConst::getConstText("ORDER_PAYTYPE_", $order["payment"]));
    }

    public function usermedalop($userScore = 150)
    {
        $medalS = C("USER_SCORES_MEDALS");

        //$medalS= C("SYSTEM_PAY_WEIXIN_COMMISSION");
        dump($medalS);
        $userMedal = "";
        foreach ($medalS as $k => $v) {
            if ($userScore >= $v['MIN'] && $userScore < $v['MAX']) {
                $userMedal = $v["NAME"];
                break;
            }
        }



        dump($userMedal);
    }

    public function substringop()
    {
        $data = array(
            v1 => "abcdefg",
            v2 => "**严格比较",
            v3 => "ab严格比较",
            v4 => "1234567890",
            v5 => "运算后严格比较",
        );

        foreach ($data as $k => $v) {
            $r = StringHelper::subString($v, 0, 3);
            dump("$k 的值为$v,运算后结果为$r");
        }
    }

    public function enumop()
    {
        //dump('ssssss');
        dump(BizConst::ORDER_PAYSTATUS_PAID);
        dump(MyEnum::HI);
        dump(new MyEnum(MyEnum::HI));
        dump(new MyEnum("Hi"));
    }

    public function getGroupBuysOp($shopId = 144)
    {
        dump(BizHelper::getGroupBuys($shopId));
    }
}


class MyEnum extends Enum
{
    const HI = "Hi";
    const BY = "By";
    const NUMBER = 1;
    const __default = self::BY;
}

