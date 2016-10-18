<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/10/17
 * Time: 17:10
 */

namespace Home\Controller;


use Common\Model\ViewLink;
use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Utils\Data\StringHelper;

class GroupBuyController extends BaseController
{
    public function index()
    {
        $shopId = $this->getCurrentShopId();//session("homeShopId");
        $condition = array(
            "shop_id" => $shopId
        );

        $this->itemList('groupbuy', $condition, 0, 0, '', ViewLink::getCommon_File());
    }

    public function item()
    {
        $modle = 'groupbuy';

        $savingData = I("post.");
        if(empty($savingData['shop_id'])){
            $savingData['shop_id'] = $this->getCurrentShopId();
        }

        $this->itemInteract($modle, 0, '', $savingData, null, ViewLink::getCommon_File());
    }
}