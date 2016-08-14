<?php
namespace Admin\Controller;

use Common\Model\ViewLink;
use Vendor\Hiland\Utils\Datas\SystemConst;

class TradeController extends BaseController
{
    public function trade()
    {
        //每页显示的记录数
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

    public function redPacketList()
    {
        $condition = array();

        $this->itemList('weixinRedpacket', $condition, 0, 0, '', ViewLink::getCommon_Shop());
    }

    public function redPacketDetailList($id)
    {
        $condition= array("packet_id"=>$id);
        $this-> itemList("weixinRedpacketDetail",$condition);
    }

    public function  redPacketMaintenance(){
        $this->itemsMaintenance("weixinRedpacket");
    }

    public function scoreList()
    {
        $code_url = "http://" . I("server.HTTP_HOST") . U("App/Shop/getUserIdByWeixin", array("shopId" => session("homeShopId")));

        //商户自行增加处理流程
        //......
        vendor("phpqrcode.phpqrcode");
        // 纠错级别：L、M、Q、H
        $level = 'L';
        // 点的大小：1到10,用于手机端4就可以了
        $size = 8;


        $fileName = "Uploads/SearchWeixinUserQRCode/" . session("homeShopId") . ".png";
        $filePhysicalName = PUBLIC_PATH . $fileName;
        // 下面注释了把二维码图片保存到本地的代码,如果要保存图片,用$fileName替换第二个参数false

        if (!is_file($fileName)) {
            \QRcode::png($code_url, $filePhysicalName, $level, $size);
        }

        $this->assign("qrcode", "http://" . I("server.HTTP_HOST") . __ROOT__ . "/Public/$fileName");


        $condition = array(
            "shop_id" => $this->getCurrentShopId(),
        );

        $shopId = $this->getCurrentShopId();
        $cookiePrefix = "score$shopId";

        if (IS_POST) {
            if (I("post.userID")) {
                cookie("$cookiePrefix-userID", I("post.userID"));
            } else {
                cookie("$cookiePrefix-userID", null);
            }
        }

        $cookieUserID = cookie("$cookiePrefix-userID");
        if ($cookieUserID) {
            array_push($condition, array("userid" => $cookieUserID));
        }


        if (IS_POST) {
            cookie("$cookiePrefix-scoreStatus", I("post.scoreStatus"));
        }

        $cookieStatus = cookie("$cookiePrefix-scoreStatus");


        if (IS_POST) {
            if (I("post.scoreValue") || I("post.scoreValue") == 0) {
                cookie("$cookiePrefix-scoreValue", I("post.scoreValue"));
            } else {
                cookie("$cookiePrefix-scoreValue", null);
            }
        }
        $cookieScoreValue = cookie("$cookiePrefix-scoreValue");
        if ($cookieStatus && $cookieScoreValue) {
            array_push($condition, array("scores" => array("$cookieStatus", $cookieScoreValue)));
        }

        $this->itemList('userScore', $condition, 0, 0, '', ViewLink::getCommon_User());
    }
}