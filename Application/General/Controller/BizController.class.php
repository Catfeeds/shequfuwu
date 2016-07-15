<?php
namespace General\Controller;

use Common\Model\BizHelper;
use Common\Model\OrderViewMate;
use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Utils\Data\ArrayHelper;
use Vendor\Hiland\Utils\Web\WebHelper;

/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/15
 * Time: 14:13
 */
class BizController
{
    public function index()
    {
        dump('welcome');
    }

    /**
     * 获取店铺或产品列表
     */
    public function getShopList()
    {
        $name = I('name');
        $shopCategory = I('shopCategory');

        $lng = I("lng");
        if (empty($lng)) {
            $lng = '117.359';
        }

        $lat = I("lat");
        if (empty($lat)) {
            $lat = '34.8177';
        }

        CommonLoger::log('weixin坐标',"lng:$lng-- lat:$lat");
        $searchContentType = I('searchContentType');
        if (empty($searchContentType)) {
            $searchContentType = 'shop';
        }

        $distanceKM = I('distanceKM');
        if (empty($distanceKM)) {
            $distanceKM = 15;
        }

        $result = BizHelper::getShopList($name, $shopCategory, $searchContentType, $lng, $lat, $distanceKM);
        //CommonLoger::log('getproducts',json_encode($result));
        WebHelper::serverReturn($result);
    }

    public function getOrders($userId = 802, $reorgnize = false)
    {
        $mate = new OrderViewMate();
        $result = $mate->select(array("user_id" => $userId, "status" => array("gt", -1)));
        if ($reorgnize) {
            $orderCount = sizeof($result);
            for ($i = 0; $i < $orderCount; $i++) {
                $result[$i] = ArrayHelper::convert2DTo1D($result[$i]);
            }
        }

        WebHelper::serverReturn($result);
    }
}