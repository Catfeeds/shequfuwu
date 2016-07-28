<?php
namespace Admin\Controller;

use Vendor\Hiland\Utils\Datas\SystemConst;

class TradeController extends BaseController
{
    public function trade()
    {
        //      每页显示的记录数
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        $tradeList = D("Trade")->getList(array(), false, "id desc", $p, $num);
        $this->assign('tradeList', $tradeList);// 赋值数据集

        $count = D("Trade")->getMethod(array(), "count");// 查询满足要求的总记录数
        $this->assignPaging($count, $num);
        $this->display();
    }

    public function export()
    {
        if (I("get.id")) {
            $trade = D("Trade")->getList(array("id" => array("in", I("get.id"))));
        } else {
            $trade = D("Trade")->getList();
        }

        Vendor("PHPExcel.Excel#class");
        \Excel::export($trade);
    }

    public function tx()
    {
        $condition = array();
        if (I("post.id")) {
            array_push($condition, array("id" => I("post.id")));
        }
        if (I("post.txid")) {
            array_push($condition, array("txid" => I("post.txid")));
        }
        if (I("post.shop_id")) {
            array_push($condition, array("shop_id" => I("post.shop_id")));
        }
        if (I("post.account")) {
            array_push($condition, array("account" => I("post.account")));
        }
        if (I("post.name")) {
            array_push($condition, array("name" => I("post.name")));
        }
        if (I("post.timeRange")) {
            $timeRange = I("post.timeRange");
            $timeRange = explode(" --- ", $timeRange);
            array_push($condition, array("time" => array('between', array($timeRange[0], $timeRange[1]))));
        }

        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;

        $txList = D("Tx")->getTxList($condition, true, "id desc", $p, $num);
        $this->assign('txList', $txList);// 赋值数据集

        $count = D("Tx")->getTxListCount($condition);// 查询满足要求的总记录数
        $this->assignPaging($count, $num);

        $config = D("Config")->getConfig();
        $this->assign("config", $config);

        $this->display();
    }

    public function updateTx()
    {
        $data = I("get.");

        $tx = D("Tx")->getTx(array("id" => $data["id"]));
        if ($data["status"] == $tx["status"]) {
            $this->error("操作失败", "Admin/Trade/tx");
        }

        if ($tx["status"] == 0) {
            if ($data["status"] == -1) {
                D("Shop")->where(array("id" => $tx["shop_id"]))->setInc("money", floatval($tx["money"]));
            }

            D("Tx")->saveTx($data);
            $this->success("操作成功", U("Admin/Trade/tx"));
        } else {
            $this->error("操作失败", U("Admin/Trade/tx"));
        }

    }

    public function exportTx()
    {
        if (I("get.id")) {
            $trade = D("Tx")->getTxList(array("id" => array("in", I("get.id"))));
        } else {
            $condition = array();
            $trade = D("Tx")->getTxList($condition);
        }

        Vendor("PHPExcel.Excel#class");
        \Excel::export($trade, array('提现ID', '提现流水', '用户ID', '店铺ID', '账户', '申请人', '金额', '状态', '时间'));
    }

    public function cardLog()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;

        $condition = array();
        if (I("post.id")) {
            array_push($condition, array("id" => I("post.id")));
        }
        if (I("post.user_id")) {
            array_push($condition, array("user_id" => I("post.user_id")));
        }
        if (I("post.payid")) {
            array_push($condition, array("payid" => I("post.payid")));
        }
        if (I("post.pay_status") != "" && I("post.pay_status") != "-10") {
            array_push($condition, array("status" => I("post.pay_status")));
        }
        if (I("post.payment") != "" && I("post.payment") != "-10") {
            array_push($condition, array("payment" => I("post.payment")));
        }
        if (I("post.timeRange")) {
            $timeRange = I("post.timeRange");
            $timeRange = explode(" --- ", $timeRange);
            array_push($condition, array("time" => array('between', array($timeRange[0], $timeRange[1]))));
        }

        $tradeList = D("CardPay")->getList($condition, true, "id desc", $p, $num);
        $this->assign('tradeList', $tradeList);// 赋值数据集

        $count = D("CardPay")->getMethod($condition, "count");// 查询满足要求的总记录数
        $this->assignPaging($count, $num);

        $this->display();
    }

    public function memberLog()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        $tradeList = D("UserMemberPay")->getList(array(), true, "id desc", $p, $num);
        $this->assign('tradeList', $tradeList);// 赋值数据集

        $count = D("UserMemberPay")->getMethod(array(), "count");// 查询满足要求的总记录数
        $this->assignPaging($count, $num);

        $this->display();
    }
}