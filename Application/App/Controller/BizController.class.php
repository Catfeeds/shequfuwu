<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/11
 * Time: 15:17
 */

namespace App\Controller;


use Common\Model\BizHelper;
use Think\Controller;
use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Utils\Web\WebHelper;

class BizController extends Controller
{
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
}