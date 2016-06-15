<?php
namespace Home\Controller;


class IndexController extends BaseController
{
    public function index()
    {
        $condition = array(
            "shop_id" => session("homeShopId"),
            "status" => 0
        );

        $newOrder = D("Order")->getOrderListCount($condition);
        $this->assign("newOrder", $newOrder);

        $newMoney = D("Order")->getOrderListSum($condition);
        $this->assign("newMoney", round($newMoney, 2));

        $user = D("User")->getUserListCount();
        $this->assign("user", $user);

        $order = D("Order")->getOrderListCount();
        $this->assign("order", $order);

        $artical = D("Artical")->getArticalList(array("type" => 1), false, "id desc", 0, 0, 10);
        $this->assign("artical", $artical);
        $this->display();
    }

    /**
     * 获取提醒中的新订单的数量
     * @return mixed
     */
    public function getNoticingOrderCount(){
        $condition = array(
            "shop_id" => session("homeShopId"),
            "notice_status" => 0
        );

        $orderCount = D("Order")->getOrderListCount();
        return $orderCount;
    }

    public function productChart()
    {
        $condition = array(
            "shop_id" => session("homeShopId")
        );

        $productList = D("Product")->getProductList($condition, false, "sales desc");
        $this->assign("productList", $productList);

        $this->display();
    }
    

    
    
    
    
}