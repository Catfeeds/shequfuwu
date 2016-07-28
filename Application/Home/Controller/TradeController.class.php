<?php
namespace Home\Controller;

use Common\Model\ViewLink;
use Vendor\Hiland\Utils\Datas\SystemConst;

class TradeController extends BaseController
{
    public function trade()
    {
        $condition = array(
            "shop_id" => session("homeShopId")
        );

        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        $tradeList = D("Trade")->getTradeList($condition, true, "id desc", $p, $num);
        $this->assign('tradeList', $tradeList);// 赋值数据集

        $count = D("Trade")->getTradeListCount($condition);// 查询满足要求的总记录数
        $this->assignPaging($count, $num);

        $shop = D("Shop")->getShop(array("id" => session("homeShopId")));
        $this->assign("money", $shop["money"]);

        $tradeListMoney = M("Trade")->where(array("shop_id" => session("homeShopId")))->sum("money");
        $this->assign("allMoney", $tradeListMoney);

        $this->display();
    }

    public function tx()
    {
        // $user = D("User")->get(array("id" => session("homeId")));
        // if (!$user["is_cert"]) {
        //     $this->success("跳转认证页面", "Home/User/cert");
        // }

        $condition = array(
            "shop_id" => session("homeShopId")
        );

        $txConfig = D("Tx")->getTx($condition);
        $this->assign('txConfig', $txConfig);

        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;

        $txList = D("Tx")->getTxList($condition, true, "id desc", $p, $num);
        $this->assign('txList', $txList);// 赋值数据集

        $count = D("Tx")->getTxListCount($condition);// 查询满足要求的总记录数
        $this->assignPaging($count, $num);

        if (session("homeShopId")) {
            $shop = D("Shop")->getShop(array("id" => session("homeShopId")));
            $this->assign("maxMoney", $shop["money"]);
        }

        $config = D("Config")->getConfig();
        $this->assign("config", $config);

        $this->display();
    }

    public function addTx()
    {
        if (I("post.money") < 100) {
            $this->error("最少提现100元", "Home/Trade/tx");
        }

        $data = I("post.");
        $data["user_id"] = session("homeId");
        $data["shop_id"] = session("homeShopId");

        $shop = D("Shop")->getShop(array("id" => $data["shop_id"]));
        if (floatval($shop["money"]) - floatval($data["money"]) >= 0) {

            $config = D("Config")->getConfig();
            $data["fee"] = floatval($data["money"]) * floatval($config["tx_fee"]);
            $data["tx"] = $data["money"] - $data["fee"];

            D("Tx")->addTx($data);
            D("Shop")->where(array("id" => $data["shop_id"]))->setDec("money", $data["money"]);
            $this->success("申请成功", U("Home/Trade/tx"));
        } else {
            $this->error("申请失败", U("Home/Trade/tx"));
        }

    }

    public function updateTx()
    {
        $data = I("get.");

        $tx = D("Tx")->getTx(array("id" => $data["id"]));
        if ($data["status"] == $tx["status"]) {
            $this->error("操作失败", "Home/Trade/tx");
        }

        if ($tx["status"] == 0) {
            if ($data["status"] == -1) {
                D("Shop")->where(array("id" => $tx["shop_id"]))->setInc("money", floatval($tx["money"]));
            }

            D("Tx")->saveTx($data);
            $this->success("操作成功", U("Home/Trade/tx"));
        } else {
            $this->error("操作失败", U("Home/Trade/tx"));
        }

    }

    public function export()
    {
        if (I("get.id")) {
            $trade = D("Trade")->getTradeList(array("id" => array("in", I("get.id"))));
        } else {
            $condition = array(
                "shop_id" => session("homeShopId")
            );

            $trade = D("Trade")->getTradeList($condition);
        }

        Vendor("PHPExcel.Excel#class");
        \Excel::export($trade, array('交易ID', '店铺ID', '交易流水', '用户ID', '金额', '支付方式', '备注', '时间'));
    }

    public function exportTx()
    {
        if (I("get.id")) {
            $trade = D("Tx")->getTxList(array("id" => array("in", I("get.id"))));
        } else {
            $condition = array(
                "shop_id" => session("homeShopId")
            );

            $trade = D("Tx")->getTxList($condition);
        }

        Vendor("PHPExcel.Excel#class");
        \Excel::export($trade, array('提现ID', '提现流水', '用户ID', '店铺ID', '账户', '申请人', '金额', '状态', '时间'));
    }

    public function redPacketList()
    {
        $condition = array(
            "shop_id" => session("homeShopId")
        );

        $this->itemList('weixinRedpacket', $condition, 0, 0, '', ViewLink::getCommon_Shop());
    }

    public function redPacket($id = 0)
    {
        //TODO
        //1\判断不能修改别店铺的红包
        //2\已经审核的不能修改

        $savingData = I("post.");
        $savingData['shop_id'] = session("homeShopId");

        $findingCondition = array(
            "shop_id" => session("homeShopId"),
            "id" => $id,
        );

        $this->item('weixinRedpacket', $id, '', $savingData, $findingCondition);
    }

}