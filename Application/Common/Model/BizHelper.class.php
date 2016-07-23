<?php
namespace Common\Model;

use Vendor\Hiland\Biz\Geo\GeoHelper;
use Vendor\Hiland\Biz\Tencent\WechatHelper;
use Vendor\Hiland\Utils\Data\RandHelper;
use Vendor\Hiland\Utils\Data\StringHelper;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\DataModel\ViewMate;

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

            $buyerShopMate->interact($data);
        }

        return $merchantScanedName;
    }

    /**
     * @param $cityName
     * @param string $shopName
     * @param int $shopCategory
     * @param int $pageIndex
     * @param int $itemCountPerPage
     * @return array
     */
    public static function getAreaShops($cityName = '', $shopName = '', $shopCategory = 0, $pageIndex = 0, $itemCountPerPage = 10)
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

        $map['status'] = 2;//2表示审核通过的店铺

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
            $distanceKM = 15;
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

        $map['status'] = 2;//2表示审核通过的店铺

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

    /**
     * @param $fileId
     * @param string $defaultImage 必须是/Public/Uploads/目录或子目录下存在的文件
     * @return string 图片对应的url完整地址
     */
    public static function getFileImageUrl($fileId, $defaultImage = 'defaultshopimage.jpg')
    {
        $appUrl = "http://" . I("server.HTTP_HOST") . __ROOT__;
        $fileMate = new ModelMate('file');
        $pictureUrl = '';
        $defaultFilePath = '/Public/Uploads/' . $defaultImage;
        if ($fileId) {
            $file = $fileMate->get($fileId);
            $filePath = '/Public/Uploads/' . $file["savepath"] . $file["savename"];

            $filePathLocal = PHYSICAL_ROOT_PATH . $filePath;
            $filePathLocal = str_replace("/", "\\", $filePathLocal);

            if (is_file($filePathLocal)) {
                $pictureUrl = $appUrl . $filePath;
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

    public static function generateOrderNo($shopId = 0)
    {
        return date("Ymdhis") . "-$shopId-" . RandHelper::rand(3, 'NUMBER');
    }
}

?>