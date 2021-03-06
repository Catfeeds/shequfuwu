<?php
namespace Common\Model;

use Vendor\Hiland\Biz\Geo\GeoHelper;
use Vendor\Hiland\Biz\Tencent\Common\WechatConfig;
use Vendor\Hiland\Biz\Tencent\Packet\WxPacket;
use Vendor\Hiland\Biz\Tencent\WechatHelper;
use Vendor\Hiland\Utils\Data\DateHelper;
use Vendor\Hiland\Utils\Data\RandHelper;
use Vendor\Hiland\Utils\Data\StringHelper;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\DataModel\ViewMate;
use Vendor\Hiland\Utils\Datas\SystemConst;
use Vendor\Hiland\Utils\IO\ImageHelper;
use Vendor\Hiland\Utils\Web\WebHelper;

class BizHelper
{
    /**
     * 获取带参数微信公众平台二维码的地址
     *
     * @param int $key
     *            需要传递进入二维码中的参数，int类型，这里通常传递宣传推广人的id
     * @param string $qrEffectType
     *            二维码有效期类型，取值于 配置文件 WEIXIN_QR_EFFECTTYPES，分为：
     *            1、TEMP 表示临时二维码
     *            2、LONG 表示长效二维码
     * @param int $qrEffectSeconds
     * @return string
     */
    public static function getQRCodeUrl($key, $qrEffectType = 'TEMP', $qrEffectSeconds = 0)
    {
        $qrticket = self::getQRTicket($key, $qrEffectType, $qrEffectSeconds);
        $url = 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=' . urlencode($qrticket);
        return $url;
    }


    /**
     * 获取生成带参数微信公众平台二维码的ticket
     *
     * @param int $key
     *            需要传递进入二维码中的参数，int类型，这里通常传递宣传推广人的id
     * @param string $qrEffectType
     *            二维码有效期类型，取值于 配置文件 WEIXIN_QR_EFFECTTYPES，分为：
     *            1、TEMP 表示临时二维码
     *            2、LONG 表示长效二维码
     * @param int $qrEffectSeconds
     * @return string 微信公众平台二维码的ticket
     */
    public static function getQRTicket($key, $qrEffectType = 'TEMP', $qrEffectSeconds = 0)
    {
        $accessToken = WechatHelper::getAccessToken();

        if (empty($qrEffectSeconds)) {
            $qrEffectSeconds = C('WEIXIN_QR_TEMP_EFFECT_SECONDS');
        }

        $qrEffectType = strtoupper($qrEffectType);
        switch ($qrEffectType) {
            case 'QR_SCENE':
            case 'QR_LIMIT_SCENE':
                break;
            case 'TEMP':
                $qrEffectType = 'QR_SCENE';
                break;
            case 'LONG':
                $qrEffectType = 'QR_LIMIT_SCENE';
                break;
            default:
                $qrEffectType = C('WEIXIN_QR_EFFECTTYPES.' . C('WEIXIN_QR_EFFECTTYPE'));
                break;
        }

        $ticket = WechatHelper::getQRTicket($key, $accessToken, $qrEffectType, $qrEffectSeconds);
        return $ticket;
    }

    /**
     * 构建显示在用户微信页面中的通知结果所需要的数据
     *
     * @param string $title
     *            通知的标题
     * @param string $content
     *            通知的内容
     * @param string $noticeType
     *            通知的类型,可以接受的几个值为：
     *            success 操作成功
     *            warn 操作失败
     *            info 提示信息
     *            waiting 提示等待
     *
     * @param string $detailsUrl
     *            如果有详细信息，那么详细信息对应的可以继续跳转的url
     * @return string 通知数据
     */
    public static function buildResultNoticePageData($title, $content, $noticeType = 'success', $detailsUrl = '')
    {
        $noticeTypes = array(
            'success',
            'warn',
            'info',
            'waiting'
        );
        if (!in_array($noticeType, $noticeTypes)) {
            $noticeType = 'info';
        }
        $data['title'] = $title;
        $data['content'] = $content;
        $data['noticeType'] = $noticeType;
        $data['detailsUrl'] = $detailsUrl;

        return $data;
    }

    /**关联消费者和商铺
     * @param $openId
     * @param $merchantScanedID
     * @return mixed
     */
    public static function relateUserShopScaned($openId, $merchantScanedID)
    {
        $merchantMate = new ModelMate('shop');
        $merchantData = $merchantMate->get($merchantScanedID);
        $merchantScanedName = $merchantData['name'];

        $buyerShopMate = new ModelMate('usershopscaned');

        $where = array();
        $where['shopid'] = $merchantScanedID;
        $where['openid'] = $openId;
        $relation = $buyerShopMate->find($where);
        if (!$relation) {
            $data = array();
            $data['shopid'] = $merchantScanedID;
            $data['openid'] = $openId;
            //$data['time']= time();
            $data['isdefault'] = 0;

            $userMate = new ModelMate("user");
            $userData = $userMate->find(array("openid" => $openId));
            $data["userid"] = $userData["id"];

            $buyerShopMate->interact($data);
        }

        return $merchantScanedName;
    }

    /**
     * 获取地区商品
     * @param string $cityName
     * @param string $shopName
     * @param int $shopCategory
     * @param int $saleType 经营方式
     * @param int $pageIndex
     * @param int $itemCountPerPage
     * @return array
     */
    public static function getAreaShops($cityName = '', $shopName = '', $shopCategory = 0, $saleType = 0, $pageIndex = 0, $itemCountPerPage = 10)
    {
        if ($shopCategory) {
            $map['category_id'] = $shopCategory;
        }

        if ($cityName) {
            $map['city'] = array('like', "$cityName");//按城市搜索
        }

        if ($shopName) {
            $map['name'] = array('like', "%$shopName%");//按店铺名称搜索
        }

        $map['saletype'] = array(
            array('EQ', $saleType),
            array('EQ', BizConst::MARKETING_SALETYPE_WHOLERETAIL),
            'OR'
        );

        $map['status'] = BizConst::SHOP_REVIEW_STATUS_PASSED;
        $map['shoplist'] = SystemConst::COMMON_STATUS_YN_YES;

        $shopMate = new ViewMate('shop', ViewLink::getCommon_File());
        return $shopMate->select($map, true, "", $pageIndex, $itemCountPerPage);
    }

    public static function getExcellentShops($cityName = '', $shopName = '', $shopCategory = 0, $pageIndex = 0, $itemCountPerPage = 10)
    {
        if ($shopCategory) {
            $map['category_id'] = $shopCategory;
        }

        if ($cityName) {
            $map['city'] = array('like', "$cityName");//按城市搜索
        }

        if ($shopName) {
            $map['name'] = array('like', "%$shopName%");//按店铺名称搜索
        }

//        $map['saletype'] = array(
//            array('EQ', $saleType),
//            array('EQ', BizConst::MARKETING_SALETYPE_WHOLERETAIL),
//            'OR'
//        );

        $map['is_excellent'] = SystemConst::COMMON_STATUS_YN_YES;

        $map['status'] = BizConst::SHOP_REVIEW_STATUS_PASSED;
        $map['shoplist'] = SystemConst::COMMON_STATUS_YN_YES;

        $shopMate = new ViewMate('shop', ViewLink::getCommon_File());
        return $shopMate->select($map, true, "", $pageIndex, $itemCountPerPage);
    }

    /**
     * 获取店铺或产品列表
     * @param string $dataName 店铺或商品名称
     * @param int $shopCategory 店铺类别
     * @param string $searchContentType 检索类型（店铺（shop）还是产品（product））
     * @param int $shopLng 店铺的经度坐标
     * @param int $shopLat 店铺的纬度坐标
     * @param int $distanceKM 周围公里数
     * @return array|bool
     */
    public static function getShopList($dataName = '', $shopCategory = 0, $searchContentType = '', $shopLng = 0, $shopLat = 0, $distanceKM = 0)
    {
        $name = $dataName;

        if (empty($shopLng)) {
            $shopLng = '117.359';
        }

        if (empty($shopLat)) {
            $shopLat = '34.8177';
        }

        if (empty($searchContentType)) {
            $searchContentType = 'shop';
        }

        if (empty($distanceKM)) {
            $distanceKM = 5;
        }

        $range = 180 / pi() * $distanceKM / 6372.797; //里面的 5 就代表搜索 5km 之内，单位km
        $lngR = $range / cos($shopLat * pi() / 180);
        $maxLat = $shopLat + $range;//最大纬度
        $minLat = $shopLat - $range;//最小纬度
        $maxLng = $shopLng + $lngR;//最大经度
        $minLng = $shopLng - $lngR;//最小经度

        $map['lng'] = array('between', array($minLng, $maxLng)); //经度值
        $map['lat'] = array('between', array($minLat, $maxLat)); //纬度值


        if (!empty($shopCategory)) {
            $map['category_id'] = $shopCategory;
        }

        if ($searchContentType == 'shop') {
            $map['name'] = array('like', "%$name%");//搜索
        }


        $map['saletype'] = array(
            array('EQ', BizConst::MARKETING_SALETYPE_RETAIL),
            array('EQ', BizConst::MARKETING_SALETYPE_WHOLERETAIL),
            'OR'
        );
        $map['status'] = BizConst::SHOP_REVIEW_STATUS_PASSED;
        $map['shoplist'] = SystemConst::COMMON_STATUS_YN_YES;

        $shoplist = D("Shop")->getShopList($map, true);


        if ($searchContentType == 'shop') {
            $shopes = GeoHelper::rankDistance($shopLat, $shopLng, $shoplist);
            return $shopes;
        } else {
            $mate = new ViewMate('product', ViewLink::getProduct_Shop_File());

            $map['status'] = 1;
            $map['name'] = array('like', "%$name%");//搜索

            if (empty($shoplist)) {
                return false;
            } else {
                $shopIDs = '';
                foreach ($shoplist as $shop) {
                    //dump($shop['id']);
                    $shopIDs .= $shop['id'] . ",";
                }

                if (StringHelper::isEndWith($shopIDs, ",")) {
                    $shopIDs = substr($shopIDs, 0, strlen($shopIDs) - 1);
                }

                $map['shop_id'] = array('in', $shopIDs);
                $productList = $mate->select($map);
                $productList = GeoHelper::rankDistance($shopLat, $shopLng, $productList, "asc", "shop.lat", "shop.lng");
                return $productList;
            }
        }
    }

    public static function generateOrderNo($shopId = 0)
    {
        return date("Ymdhis") . "-$shopId-" . RandHelper::rand(3, 'NUMBER');
    }

    public static function getBizConstText($prefix, $value)
    {
        $resultArray = BizConst::getConstArray($prefix);
        $resultText = $resultArray[$value];
        return $resultText;
    }

    public static function getPayTypeText($paymentValue)
    {
        $resultArray = BizConst::getConstArray("ORDER_PAYTYPE_");
        $resultText = $resultArray[$paymentValue];
        return $resultText;
    }

    public static function getPayStatusText($payStatusValue)
    {
        $resultArray = BizConst::getConstArray("ORDER_PAYSTATUS_");
        $resultText = $resultArray[$payStatusValue];
        return $resultText;
    }

    public static function hongbao($openID, $merchantName = '', $amount = 1, $actionName = '', $wishing = '恭喜发财', $remark = '快来参加活动吧！')
    {
        if (empty($openID)) {
            $openID = $_GET['oauth2openid'];
        }

        if (empty($merchantName)) {
            $merchantName = WechatConfig::MCHNAME;
        }

        $data = array(
            'nonce_str' => RandHelper::rand(30), // 随机字符串
            'mch_billno' => date('YmdHis') . RandHelper::rand(10, ""), // 订单号
            'mch_id' => WechatConfig::MCHID, // 商户号
            'wxappid' => WechatConfig::APPID, // 微信的appid
            'nick_name' => $merchantName, // 提供方名称
            'send_name' => $merchantName, // 红包发送者名称
            're_openid' => $openID, // 接收人的openid
            'total_amount' => $amount, // 付款金额，单位分
            'min_value' => $amount, // 最小红包金额，单位分
            'max_value' => $amount, // 最大红包金额，单位分
            'total_num' => 1, // 红包収放总人数
            'wishing' => $wishing, // 红包祝福语
            'client_ip' => '127.0.0.1', // 调用接口的机器 Ip 地址
            'act_name' => $actionName, // 活动名称
            'remark' => $remark,
        ); // 备注信息

        $packet = new WxPacket();
        $result = $packet->send($data);
    }

    /**
     * 更新用户积分
     * @param $userId
     * @param $shopId
     * @param $score
     * @param int $orderId
     * @param string $reason
     * @param $remark string
     * @return bool|number
     */
    public static function updateUserScore($userId, $shopId, $score, $orderId = 0, $reason = '', $remark = '')
    {
        //0 更新某订单对应的积分
        if ($orderId) {
            $orderMate = new ModelMate("order");
            $orderMate->setValue($orderId, "totalscore", $score);
        }

        //1 更新用户的总积分情况
        $userMate = new ModelMate('user');
        $userCondition = array("id" => $userId);
        $userMate->setInc($userCondition, "score", $score);

        //2更新用户在某个商户的积分情况
        $scoreMate = new ModelMate('userScore');
        $scoreCondition = array("userid" => $userId, "shop_id" => $shopId);
        $scoreData = $scoreMate->find($scoreCondition);
        if ($scoreData) {
            $scoreData['scores'] = $scoreData['scores'] + $score;
        } else {
            $scoreData['userid'] = $userId;
            $scoreData['shop_id'] = $shopId;
            $scoreData['scores'] = $score;
        }

        $scoreID = $scoreMate->interact($scoreData);

        //3更新积分明细
        $detailMate = new ModelMate('userScoreDetail');
        $direction = SystemConst::COMMON_FINANCE_FOUNDDIRECTION_INCOME;

        if ($score < 0) {
            $direction = SystemConst::COMMON_FINANCE_FOUNDDIRECTION_PAY;
        }

        $detailData = array(
            "scoreid" => $scoreID,
            "score" => $score,
            "direction" => $direction,
            "reason" => $reason,
            "remark" => $remark,
            "createtime" => DateHelper::format()
        );

        return $detailMate->interact($detailData);
    }


    /**
     * 更新团购商品的售出数量
     * @param int $groupBuyID 商品id
     * @param int $saleCount 本次售出数量
     */
    public static function updateGroupBuyCount($groupBuyID,$saleCount){
        $mate= new ModelMate("groupbuy");
        $entity= $mate->get($groupBuyID);

        if($entity){
            $originalCount= $entity["soldcount"];
            $newCount= $originalCount+ $saleCount;

            if($newCount>= $entity["piececount"]){
                $entity["soldcount"] = $newCount;
                $entity["successfulstatus"]= SystemConst::COMMON_STATUS_SOF_SUCCESS;
                $mate->interact($entity);
            }else{
                $mate->setValue($groupBuyID,"soldcount",$newCount);
            }
        }
    }

    /**
     * 获取某店铺的标签
     * @param int $shopId 店铺id
     * @param bool $includeDefault 是否包含系统默认的标签
     * @return array
     */
    public static function getShopLabels($shopId, $includeDefault = true)
    {
        $labelCondition = array();
        if ($includeDefault) {
            $labelCondition['shop_id'] = array(array('eq', 0), array('eq', $shopId), 'or');
        } else {
            $labelCondition['shop_id'] = $shopId;
        }

        $labelMate = new ModelMate("productLabel");
        $labelList = $labelMate->select($labelCondition, "id asc");

        return $labelList;
    }

    public static function generateRedPacketResponse($shopId, $openId)
    {
        $redPacket = self::getLastEffectRedPacketAction($shopId);
        if ($redPacket) {
            $content = "本店有活动[$redPacket[actionname]]正在进展中，有大批量红包派送，点击此处领取！";
            $packetId = $redPacket['id'];
            $url = WebHelper::getHostNameFull() . U("App/Index/sendRedpacket", "packetId=$packetId&openId=$openId");
            $result = "<a href='$url'>$content</a>";
            return $result;
        } else {
            return "";
        }
    }

    /**
     * 获取店铺最新的可用的红包活动
     * @param $shopId
     * @return array
     */
    public static function getLastEffectRedPacketAction($shopId)
    {
        $mate = new ModelMate("weixinRedpacket");
        $condition = array(
            "shop_id" => $shopId,
            "status" => BizConst::REDPACKET_ACTION_STATUS_RUN,
            "adminstatus" => SystemConst::COMMON_REVIEW_STATUS_PASSED,
        );

        $condition['begintime'] = array('lt', DateHelper::format());
        $condition['endtime'] = array('gt', DateHelper::format());

        $data = $mate->find($condition, "id desc");
        return $data;
    }

    public static function generateMyScanedShopsResponse($openId)
    {
        $webRoot = WebHelper::getWebRootFull();
        //超市购物，弹出其当初扫描的超市
        $usershopscanedMate = new ModelMate('usershopscaned');
        $where = array();
        $where['openid'] = $openId;
        $shopscaned = $usershopscanedMate->select($where, "", 0, 0, 10);

        $shopMate = new ModelMate('shop');

        $newsArray = array();
        $newsCover = array(
            'Title' => "欢迎使用" . C('PROJECT_NAME'),
            'Description' => "请选择以下列表中你关注过的店铺进行采购吧！",
            'PicUrl' => $webRoot . '/Public/Uploads/wechat_news_cover.jpg',
            'Url' => '',
        );
        $newsArray[] = $newsCover;

        if ($shopscaned) {
            foreach ($shopscaned as $shopScaned) {
                $shopId = $shopScaned['shopid'];
                $shopWhere = array();
                $shopWhere['id'] = $shopId;
                $shop = $shopMate->find($shopWhere);
                if ($shop) {
                    $fileId = $shop['file_id'];
                    $pictureUrl = BizHelper::getFileImageUrl($fileId);

                    $news = array(
                        'Title' => $shop["name"],
                        'Description' => $shop["notification"],
                        'PicUrl' => $pictureUrl,
                        'Url' => $webRoot . "/index.php?s=/App/Index/index/shopId/$shopId",
                    );

                    $newsArray[] = $news;
                }
            }
        }

        return $newsArray;
    }

    /**
     *
     * @param $fileId
     * @param string $defaultImage 必须是/Public/Uploads/目录或子目录下存在的文件
     * @param bool $corp4WeixinCover 是否为微信生成消息封面图片（封面图片是宽高5:4，从上往下裁切）
     * @return string 图片对应的url完整地址
     */
    public static function getFileImageUrl($fileId, $defaultImage = 'defaultshopimage.jpg', $corp4WeixinCover = false)
    {
        if (empty($defaultImage)) {
            $defaultImage = 'defaultshopimage.jpg';
        }

        $appUrl = "http://" . I("server.HTTP_HOST") . __ROOT__;
        $fileMate = new ModelMate('file');
        $pictureUrl = '';
        $defaultFilePath = '/Public/Uploads/' . $defaultImage;
        if ($fileId) {
            $file = $fileMate->get($fileId);

            $originalPath = '/Public/Uploads/' . $file["savepath"] . $file["savename"];

            if ($corp4WeixinCover) {
                $filePath = '/Public/Uploads/' . $file["savepath"] . "cover_" . $file["savename"];
            } else {
                $filePath = '/Public/Uploads/' . $file["savepath"] . $file["savename"];
            }

            $filePathLocal = PHYSICAL_ROOT_PATH . $filePath;
            $filePathLocal = str_replace("/", "\\", $filePathLocal);

            if ($corp4WeixinCover) {
                if (is_file($filePathLocal)) {
                    $pictureUrl = $appUrl . $filePath;
                } else {
                    $originalPathLocal = PHYSICAL_ROOT_PATH . $originalPath;
                    $originalPathLocal = str_replace("/", "\\", $originalPathLocal);

                    if (is_file($originalPathLocal)) {
                        $originalIamge = ImageHelper::loadImage($originalPathLocal);
                        $originalWidth = imagesx($originalIamge);
                        $originalHeight = imagesy($originalIamge);

                        $newHeight = intval($originalWidth * 4 / 9);
                        //dump($originalHeight - $newHeight);

                        if ($originalHeight - $newHeight > 0) {
                            $removedHeight = $originalHeight - $newHeight;
                            $newImage = ImageHelper::cropImage($originalIamge, 0, $removedHeight, 0, 0);
                            //ImageHelper::display($newImage);
                            //dump($newImage);
                            ImageHelper::save($newImage, $filePathLocal);
                        } else {
                            ImageHelper::save($originalIamge, $filePathLocal);
                        }
                        $pictureUrl = $appUrl . $filePath;
                    }
                }
            } else {
                if (is_file($filePathLocal)) {
                    $pictureUrl = $appUrl . $filePath;
                }
            }
        }

        if (empty($pictureUrl)) {
            if (empty($defaultImage)) {
                $pictureUrl = '';
            } else {
                $pictureUrl = $appUrl . $defaultFilePath;
            }
        }

        $pictureUrl = str_replace("\\", "/", $pictureUrl);

        return $pictureUrl;
    }

    public static function generateArticlesResponse()
    {
        $webRoot = WebHelper::getWebRootFull();

        $articleMate = new ModelMate('artical');
        $where = array();
        $where['shop_id'] = 0; //仅展现平台发布的信息
        $articles = $articleMate->select($where, "", 0, 0, 10);

        $newsArray = array();
        $newsCover = array(
            'Title' => "欢迎访问" . C('PROJECT_NAME') . "最新资讯与活动",
            'Description' => "以下是为你精心准备的资讯信息，请点击阅读！",
            'PicUrl' => $webRoot . '/Public/Uploads/platform_article.jpg',
            'Url' => '',
        );
        $newsArray[] = $newsCover;

        if ($articles) {
            foreach ($articles as $article) {
                $fileId = $article['file_id'];
                $articleId = $article['id'];
                $pictureUrl = BizHelper::getFileImageUrl($fileId);

                $news = array(
                    'Title' => $article["title"],
                    'Description' => $article["content"],
                    'PicUrl' => $pictureUrl,
                    'Url' => $webRoot . "/index.php?s=/App/Artical/index/id/$articleId",
                );

                $newsArray[] = $news;
            }
        }

        return $newsArray;
    }

    public static function getGroupBuys($shopID)
    {
        $mate = new ViewMate("groupbuy", ViewLink::getCommon_File());
        $condition = Array(
            "shop_id" => $shopID,
            "managestatus" => SystemConst::COMMON_STATUS_SS_START,
        );

        $list = $mate->select($condition);

        return $list;
    }

    public static function getGroupBuy($groupBuyId)
    {
        $mate = new ViewMate("groupbuy", ViewLink::getCommon_File());
        $entity = $mate->get($groupBuyId);

        return $entity;
    }

    public function generateWecomeNewsResponse($shopID = 0)
    {
        $title = '';
        $description = '';
        $picUrl = '';
        $url = '';

        if (empty($shopID)) {
            if (empty($title)) {
                $projectName = C('PROJECT_NAME');
                $title = "欢迎光临[$projectName]，我们将持续为你提供更优质的服务！";
            }
            $description = C("PROJECT_DESCRIPTION");
            $picUrl = BizHelper::getFileImageUrl(0, "platform_mission.jpg");
            $url = WebHelper::getHostName() . U('App/Index/shop');
        } else {
            $shopMate = new ModelMate('shop');
            $shopData = $shopMate->get($shopID);

            if (empty($title)) {
                $title = $shopData['name'];
            }

            $description = $shopData['remark'];
            $picUrl = BizHelper::getFileImageUrl($shopData['file_id'], "platform_mission.jpg", true);
            $url = WebHelper::getHostName() . U('App/Index/index', 'shopId=' . $shopID);
        }

        $newsArray = array(
            array(
                'Title' => $title,
                'Description' => $description,
                'PicUrl' => $picUrl,
                'Url' => $url,
            )
        );

        return $newsArray;
    }

}

?>