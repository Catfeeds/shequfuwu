<?php
namespace Common\Model;

use Think\Model;
use Vendor\Hiland\Biz\Tencent\WechatHelper;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\DataModel\ViewMate;
use Vendor\Hiland\Utils\Web\NetHelper;
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

            $buyerShopMate->interact($data);
        }

        return $merchantScanedName;
    }

    /**
     * 获取附近的店铺
     * @param int $distanceKM 公里数
     */
    public static function getShopList($dataName = '', $shopCategory = 0, $searchContentType = '', $shopLng = 0, $shopLat = 0, $distanceKM = 0)
    {
        $name = $dataName;

        if (empty($lng)) {
            $lng = '117.359';
        }

        if (empty($lat)) {
            $lat = '34.8177';
        }

        if (empty($searchContentType)) {
            $searchContentType = 'shop';
        }

        if (empty($distanceKM)) {
            $distanceKM = 15;
        }

        $range = 180 / pi() * $distanceKM / 6372.797; //里面的 5 就代表搜索 5km 之内，单位km
        $lngR = $range / cos($lat * pi() / 180);
        $maxLat = $lat + $range;//最大纬度
        $minLat = $lat - $range;//最小纬度
        $maxLng = $lng + $lngR;//最大经度
        $minLng = $lng - $lngR;//最小经度

        $map['lng'] = array('between', array($minLng, $maxLng)); //经度值
        $map['lat'] = array('between', array($minLat, $maxLat)); //纬度值
        $map['name'] = array('like', "%$name%");//搜索
        $map['status'] = 2;

        if (!empty($shopCategory)) {
            $map['category_id'] = $shopCategory;
        }

        //$this->ajaxReturn('ssssssssssssss');

        if ($searchContentType == 'shop') {
            $list = D("Shop")->getShopList($map, true);
            $shopes = self::rank($lat, $lng, $list);
            //dump($shopes);
            //$this->ajaxReturn($shopes);
            //WebHelper::serverReturn($shopes);
            return $shopes;
        } else {
            $link = array(
                'Shop' => array(
                    'mapping_type' => self::BELONGS_TO,
                    'mapping_name' => 'shop',
                    'foreign_key' => 'shop_id',//关联id
                    'as_fields' => 'name:shopname',
                ),
                'File' => array(
                    'mapping_type' => self::BELONGS_TO,
                    'mapping_name' => 'file',
                    'foreign_key' => 'file_id',//关联id
                    'as_fields' => 'savename:savename,savepath:savepath',
                ),
            );
            $mate = new ViewMate('product', $link);
            $list = $mate->select($map);
        }
    }

    public static function rank($u_lat, $u_lng, $list)
    {
        /*
        *u_lat 用户纬度
        *u_lng 用户经度
        *list sql语句
        */
        if (!empty($u_lat) && !empty($u_lng)) {
            foreach ($list as $row) {
                $row['km'] = self::getDistance($u_lat, $u_lng, $row['lat'], $row['lng']);
                $row['km'] = round($row['km'], 1);
                $res[] = $row;
            }
            if (!empty($res)) {
                foreach ($res as $user) {
                    $ages[] = $user['km'];
                }
                array_multisort($ages, SORT_ASC, $res);
                return $res;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    //计算经纬度两点之间的距离
    public static function getDistance($lat1, $lng1, $lat2, $lng2)
    {
        $EARTH_RADIUS = 6378.137;
        $radLat1 = self::rad($lat1);
        $radLat2 = self::rad($lat2);
        $a = $radLat1 - $radLat2;
        $b = self::rad($lng1) - self::rad($lng2);
        $s = 2 * asin(sqrt(pow(sin($a / 2), 2) + cos($radLat1) * cos($radLat2) * pow(sin($b / 2), 2)));
        $s1 = $s * $EARTH_RADIUS;
        $s2 = round($s1 * 10000) / 10000;
        return $s2;
        //print_r($s2);
    }

    private static function rad($d)
    {
        return $d * 3.1415926535898 / 180.0;
    }


}

?>