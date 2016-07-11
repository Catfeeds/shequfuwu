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
use Vendor\Hiland\Utils\Web\WebHelper;

class BizController extends Controller
{
    /**
     * 获取附近的店铺
     * @param int $distanceKM 公里数
     */
    public function getShopList()
    {
        $name = I('post.name');
        $searchShopCategory = I('post.searchShopCategory');

        $lng = I("post.lng");
        if (empty($lng)) {
            $lng = '117.359';
        }

        $lat = I("post.lat");
        if (empty($lat)) {
            $lat = '34.8177';
        }

        $searchContentType = I('post.searchContentType');
        if (empty($searchContentType)) {
            $searchContentType = 'shop';
        }

        $distanceKM = I('post.distanceKM');
        if (empty($distanceKM)) {
            $distanceKM = 15;
        }

        $result = BizHelper::getShopList($name, $searchShopCategory, $searchContentType, $lng, $lat, $distanceKM);
        WebHelper::serverReturn($result);
    }
}