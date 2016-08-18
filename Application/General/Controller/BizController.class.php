<?php
namespace General\Controller;

use Common\Model\BizConst;
use Common\Model\BizHelper;
use Common\Model\ViewLink;
use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Utils\Data\ArrayHelper;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\DataModel\ViewMate;
use Vendor\Hiland\Utils\Datas\SystemConst;
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

    public function getAreaShops()
    {
        $shopName = I('name');
        $cityName = I('city');
        $shopCategory = I('category');
        $pageIndex = I('pageIndex');
        $saletype = I("saletype", 0);
        $itemCountPerPage = SystemConst::APP_ITEM_COUNT_PERPAGE;
        if (empty($itemCountPerPage)) {
            $itemCountPerPage = 10;
        }

        $data = "shopName-- $shopName;cityName-- $cityName;shopCategory-- $shopCategory;pageIndex-- $pageIndex;itemCountPerPage-- $itemCountPerPage;saletype-- $saletype";
        CommonLoger::log('getAreaShops',$data);

        $result = BizHelper::getAreaShops($cityName, $shopName, $shopCategory, $saletype, $pageIndex, $itemCountPerPage);
        WebHelper::serverReturn($result);
    }

    public function getExcellentShops()
    {
        $shopName = I('name');
        $cityName = I('city');
        $shopCategory = I('category');
        $pageIndex = I('pageIndex');

        $itemCountPerPage = SystemConst::APP_ITEM_COUNT_PERPAGE;
        if (empty($itemCountPerPage)) {
            $itemCountPerPage = 10;
        }

        $data = "shopName-- $shopName;cityName-- $cityName;shopCategory-- $shopCategory;pageIndex-- $pageIndex;itemCountPerPage-- $itemCountPerPage;";

        $result = BizHelper::getExcellentShops($cityName, $shopName, $shopCategory, $pageIndex, $itemCountPerPage);
        WebHelper::serverReturn($result);
    }

    /**
     * 获取店铺或产品列表
     */
    public function getShopList()
    {
        $name = I('name');
        $shopCategory = I('shopCategory');

        $lng = I("lng", '117.359');
        $lat = I("lat", '34.8177');

        //CommonLoger::log('weixin坐标', "lng:$lng-- lat:$lat");
        $searchContentType = I('searchContentType', 'shop');
        $distanceKM = I('distanceKM', 5);

        $result = BizHelper::getShopList($name, $shopCategory, $searchContentType, $lng, $lat, $distanceKM);
        WebHelper::serverReturn($result);
    }

    public function getConstText($prefix, $constValue)
    {
        WebHelper::serverReturn(BizConst::getConstText($prefix, $constValue));
    }

    public function getOrders($userId = 802, $reOrgnize = false)
    {
        $mate = new ViewMate('order', ViewLink::getOrder_OrderContact_OrderDetail_Shop());
        $result = $mate->select(array("user_id" => $userId, "status" => array("gt", -1)));
        if ($reOrgnize) {
            $orderCount = sizeof($result);
            for ($i = 0; $i < $orderCount; $i++) {
                $result[$i] = ArrayHelper::convert2DTo1D($result[$i]);
            }
        }

        WebHelper::serverReturn($result);
    }

    public function getOrder($orderId = 84)
    {
        $mate = new ViewMate('order', ViewLink::getOrder_OrderContact_OrderDetail_Shop());
        $order = $mate->get($orderId);//
        //$order = D("Order")->get(array("id" => $orderId), true);
        WebHelper::serverReturn($order, '', JSON_UNESCAPED_UNICODE);
    }

    public function getKeyValueArrayTest()
    {
        $arrayA = array("A1", "A2", "A3");
        $arrayB = array("B1", "B2", "B3");
        $arrayC = array("C1", "C2", "C3");
        $result = array(
            "A" => $arrayA,
            "B" => $arrayB,
            "C" => $arrayC
        );

        WebHelper::serverReturn($result);
    }

    /**
     *按照label分组获取店铺可以显示在首页上的产品类别
     */
    public function getProductsOfShopHotLabels()
    {
        $shopID = I("get.shopId");

        //1 获取店铺所有可以显示在首页的label，包括默认的“今日特价”（其id为3）
        $labelMate = new ModelMate("productLabel");
        $labelDatas = $labelMate->select(array("shop_id" => $shopID, "isshowmainpage" => SystemConst::COMMON_STATUS_YN_YES));
        $labelOfDefalut = $labelMate->select(array("id" => 3));
        $labelDatas = array_merge($labelOfDefalut, $labelDatas);

        //2 分组获取产品
        $result = array();
        $productMate = new ViewMate("product", ViewLink::getCommon_File());
        foreach ($labelDatas as $lable) {
            $labelName = $lable["name"];
            $condition = array();
            $condition["shop_id"] = $shopID;
            $condition["label"] = array('like', "%$labelName%");
            $products = $productMate->select($condition);
            $result[$labelName] = $products;
        }

        WebHelper::serverReturn($result, '', JSON_UNESCAPED_UNICODE);
    }
}