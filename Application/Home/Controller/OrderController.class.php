<?php
namespace Home\Controller;

use Common\Model\BizConst;
use Common\Model\ViewLink;
use Vendor\Hiland\Utils\Data\ObjectHelper;
use Vendor\Hiland\Utils\DataModel\ViewMate;
use Vendor\Hiland\Utils\Datas\SystemConst;

class OrderController extends BaseController
{
    public function order()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Home/Order/order/page/$p"));

        $shopId = $this->getCurrentShopId();
        $condition = array(
            "shop_id" => $shopId,
        );

        /**
         * 更新订单的通知状态
         */
        D("Order")->updateNoticeStatus($condition);

        $shopQueryValues = array();
        $lastCookie = cookie("shopQueryValues$shopId-order");

        $queryOrderId = $this->getParamFromPostOrCookie("orderid", $lastCookie);
        $shopQueryValues["orderid"] = $queryOrderId;
        if ($queryOrderId) {
            array_push($condition, array("orderid" => $queryOrderId));
        }

        $queryUserId = $this->getParamFromPostOrCookie("user_id", $lastCookie);
        $shopQueryValues["user_id"] = $queryUserId;
        if ($queryUserId) {
            array_push($condition, array("user_id" => $queryUserId));
        }

        $queryPayment = $this->getParamFromPostOrCookie("payment", $lastCookie);
        $shopQueryValues["payment"] = $queryPayment;
        if ($queryPayment && !ObjectHelper::equal($queryPayment, -10)) {
            array_push($condition, array("payment" => $queryPayment));
        }

        $queryPayStatus = $this->getParamFromPostOrCookie("pay_status", $lastCookie);
        $shopQueryValues["pay_status"] = $queryPayStatus;
        if ($queryPayStatus && !ObjectHelper::equal($queryPayStatus, -10)) {
            array_push($condition, array("pay_status" => $queryPayStatus));
        }

        $queryStatus = $this->getParamFromPostOrCookie("status", $lastCookie);
        $shopQueryValues["status"] = $queryStatus;
        if ($queryStatus && !ObjectHelper::equal($queryStatus, -10)) {
            array_push($condition, array("status" => $queryStatus));
        }

        $queryTimeRange = $this->getParamFromPostOrCookie("timeRange", $lastCookie);
        $shopQueryValues["timeRange"] = $queryTimeRange;
        if ($queryTimeRange) {
            $timeRange = $queryTimeRange;
            $timeRange = explode(" --- ", $timeRange);
            array_push($condition, array("time" => array('between', array($timeRange[0], $timeRange[1]))));
        }

        cookie("shopQueryValues$shopId-order", $shopQueryValues);

        $this->assignListAndPaging("Order", $condition, $p, $num, "orderList", ViewLink::getOrder_OrderContact_OrderDetail_Shop());

        $orderPayTypes = BizConst::getConstArray("ORDER_PAYTYPE_", false);
        $this->assign('orderPayTypes', $orderPayTypes);

        $orderStatuses = BizConst::getConstArray("ORDER_STATUS_", false);
        $this->assign('orderStatuses', $orderStatuses);

        $orderPayStatuses = BizConst::getConstArray("ORDER_PAYSTATUS_", false);
        $this->assign('orderPayStatuses', $orderPayStatuses);

        $this->display();
    }

    public function commonPrint($id)
    {
        self::orderCommonPrint($id);
    }

    public function orderCommonPrint($id)
    {
        $mate = new ViewMate("order", ViewLink::getOrder_OrderContact_OrderDetail_Shop()); //D("Order")->getOrder(array("id" => $id), true);
        $result = $mate->get($id);

        if ($result["pay_status"] == 0) {
            $pay_status = "未付款";
        } else {
            $pay_status = "已付款";
        }

        $config = D("Shop")->getShop(array("id" => $result["shop_id"]));

        $msg = '';
        $msgtitle = $config['name'] . '欢迎您订购<br/>

订单编号：' . $result["orderid"] . '<br/>

条目        单价（元）      数量<br/>
------------------------------<br/>
';
        $detail = '';
        for ($j = 0; $j < count($result["detail"]); $j++) {
            $row = $result["detail"][$j];
            $title = $row['name'];
            $price = $row['price'];
            $num = $row['num'];

            $detail .= $title . "\n" . number_format($price, 2) . "           " . $num . "\n<br/>";
        }
        $msgcontent = $detail;

        $msgfooter = '
备注：' . $result["remark"] . '<br/>
------------------------------<br/>
合计：' . $result["totalprice"] . '元<br/>
付款状态：' . $pay_status . '<br/>

联系用户：' . $result["contact"]["name"] . '<br/>
送货地址：' . $result["contact"]["province"] . $result["contact"]["city"] . $result["contact"]["district"] . $result["contact"]["address"] . '<br/>
联系电话：' . $result["contact"]["phone"] . '<br/>
订购时间：' . $result["time"] . '<br/>

';//自由输出

        $msg .= $msgtitle . $msgcontent . $msgfooter;

        $this->assign('message', $msg);
        $this->display();
    }

    public function update()
    {
        $data = I("get.");
        $id = $data["id"];
        unset($data["id"]);
        D("Order")->updateAllOrder($id, $data);

        //发货通知
        if (I("get.status") == 1) {
            $ids = explode(",", I("get.id"));

            $orderModel = D("Order");
            foreach ($ids as $key => $value) {
                $order = $orderModel->getOrder(array("id" => $value));

                $getUrl = "http://" . I("server.HTTP_HOST") . U("Admin/Wechat/sendTplMsgDeliver", array("order_id" => $value, "shopId" => $order["shop_id"]));
                // 先暂时注销
                // http_get($getUrl);
            }
        } elseif (I("get.status") == 2) {
            $orders = D("Order")->getOrderList(array("id" => array("in", $id)));
            foreach ($orders as $key => $value) {
                if ($value["payment"] == 3) {
                    D("Order")->where(array("id" => $value["id"]))->save(array("pay_status" => 1));
                }
            }
        }

        $this->success("操作成功", cookie("prevUrl"));
    }

//    public function search()
//    {
//        $condition = array(
//            "shop_id" => session("homeShopId")
//        );
//
//        if (I("post.id")) {
//            array_push($condition, array("id" => I("post.id")));
//        }
//        if (I("post.orderid")) {
//            array_push($condition, array("orderid" => I("post.orderid")));
//        }
//        if (I("post.user_id")) {
//            array_push($condition, array("user_id" => I("post.user_id")));
//        }
//        if (I("post.payment") != -10) {
//            array_push($condition, array("payment" => I("post.payment")));
//        }
//        if (I("post.pay_status") != -10) {
//            array_push($condition, array("pay_status" => I("post.pay_status")));
//        }
//        if (I("post.status") != -10) {
//            array_push($condition, array("status" => I("post.status")));
//        }
//
//        if (I("post.timeRange")) {
//            $timeRange = I("post.timeRange");
//            $timeRange = explode(" --- ", $timeRange);
//            array_push($condition, array("time" => array('between', array($timeRange[0], $timeRange[1]))));
//        }
//
//        $orderList = D("Order")->getOrderList($condition, true, "id desc");
//
//        if (I("post.product_id") != -10) {
//            foreach ($orderList as $key => $value) {
//                $flag = true;
//                foreach ($value["detail"] as $k => $v) {
//                    if ($v["product_id"] == I("post.product_id")) {
//                        $flag = false;
//                        break;
//                    }
//                }
//
//                if ($flag) {
//                    unset($orderList[$key]);
//                }
//            }
//        }
//
//        $productList = D("Product")->getProductList(array(), true);
//        $this->assign('productList', $productList);// 赋值分页输出
//
//        $this->assign("orderPost", I("post."));
//        $this->assign("orderList", $orderList);
//
//        $orderPayTypes = BizConst::getConstArray("ORDER_PAYTYPE_", false);
//        $this->assign('orderPayTypes', $orderPayTypes);
//
//        $orderStatuses = BizConst::getConstArray("ORDER_STATUS_", false);
//        $this->assign('orderStatuses', $orderStatuses);
//
//        $orderPayStatuses = BizConst::getConstArray("ORDER_PAYSTATUS_", false);
//        $this->assign('orderPayStatuses', $orderPayStatuses);
//
//        $this->display("order");
//    }

    public function export()
    {
        $condition = array(
            "shop_id" => session("homeShopId")
        );

        $data = I("get.");
        if ($data["status"] != "") {
            array_push($condition, array(
                "status" => $data["status"]
            ));
        }
        if ($data["get.pay_status"] != "") {
            array_push($condition, array(
                "pay_status" => $data["pay_status"]
            ));
        }
        if ($data["day"] != "") {
            array_push($condition, array(
                "time" => array("like", $data["day"] . "%")
            ));
        }
        if ($data["id"] != "") {
            array_push($condition, array(
                "id" => array("in", $data["id"])
            ));
        }

        $order = D('Order')->getOrderList($condition, true, "id desc");
        foreach ($order as $key => $value) {
            unset($value["contact"]["id"]);
            unset($value["contact"]["user_id"]);
            unset($value["contact"]["time"]);

            foreach ($value["contact"] as $k => $v) {
                $order[$key][$k] = $v;
            }
            unset($order[$key]["contact"]);

            $detail = '';
            foreach ($value["detail"] as $k => $v) {
                $detail .= $v["name"] . "[属性:" . $v["attr"] . "]" . "[数量:" . $v["num"] . "]" . "[价格:" . $v["price"] . "],";
            }

            $order[$key]["detail"] = $detail;
        }

        Vendor("PHPExcel.Excel#class");
        \Excel::export($order, array('订单ID', '店铺ID', '用户ID', '联系人ID', '订单编号', '总价格', '支付方式', '支付状态', '配送时间', '运费', '折扣', '备注', '状态', '是否评论', '时间', '用户', '订单详情', '店铺', '订单人', '联系方式', '省份', '城市', '地域', '详细地址', '邮编'));
    }

    public function wxPrint()
    {
        $ids = explode(",", I("get.id"));
        foreach ($ids as $key => $value) {
            wxPrint($value);
        }

        $this->success("操作成功", cookie("prevUrl"));
    }

    // public function test(){
    //     wxPrint(134);
    // }


}