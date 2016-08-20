<?php
namespace Home\Controller;

use Common\Model\ViewLink;
use Vendor\Hiland\Utils\Datas\SystemConst;

class UserController extends BaseController
{
    public function user()
    {
        $shopId= $this->getCurrentShopId();
        $cookiePrefix = "shopbuyer$shopId";

        $condition = array("shopid" => $shopId);

        if (IS_POST) {
            if (I("post.userID") == "") {
                cookie("$cookiePrefix-userID", null);
            } else {
                cookie("$cookiePrefix-userID", I("userID"));
            }
        }
        $cookieUserID = cookie("$cookiePrefix-userID");
        if ($cookieUserID) {
            array_push($condition, array("userid" => $cookieUserID));
        }

        if (I("post.timeRange")) {
            $timeRange = I("post.timeRange");
            if ($timeRange == "") {
                cookie("$cookiePrefix-timeRange", null);
            } else {
                cookie("$cookiePrefix-timeRange", $timeRange);
            }
        }
        $cookieTimeRange = cookie("$cookiePrefix-timeRange");
        if ($cookieTimeRange) {
            $timeRange = explode(" --- ", $cookieTimeRange);
            array_push($condition, array("time" => array('between', array($timeRange[0], $timeRange[1]))));
        }

        $this->itemList("usershopscaned", $condition, 0, 0, "userList", ViewLink::getCommon_User());
    }

    public function employee()
    {
        $code_url = "http://" . I("server.HTTP_HOST") . U("App/Shop/bindShop", array("shopId" => session("homeShopId")));

        //商户自行增加处理流程
        //......
        vendor("phpqrcode.phpqrcode");
        // 纠错级别：L、M、Q、H
        $level = 'L';
        // 点的大小：1到10,用于手机端4就可以了
        $size = 8;

        $fileName = "Uploads/ShopBindUserQRCode/" . session("homeShopId") . ".png";
        $filePhysicalName = PUBLIC_PATH . $fileName;
        // 下面注释了把二维码图片保存到本地的代码,如果要保存图片,用$fileName替换第二个参数false

        if (!is_file($fileName)) {
            \QRcode::png($code_url, $filePhysicalName, $level, $size);
        }

        $this->assign("qrcode", "http://" . I("server.HTTP_HOST") . __ROOT__ . "/Public/$fileName");

        $shop = D("Shop")->getShop(array("id" => session("homeShopId")));
        if ($shop["employee"]) {
            $userList = D("User")->getUserList(array("id" => array("in", $shop["employee"])));
            $this->assign("userList", $userList);
        }

        $this->display();
    }

    public function delEmployee()
    {
        $shop = D("Shop")->getShop(array("id" => session("homeShopId")));
        $employee = explode(",", $shop["employee"]);

        foreach ($employee as $key => $value) {
            if ($value != "" && $value == I("get.id")) {
                unset($employee[$key]);
            }
        }

        D("Shop")->saveShop(array("id" => session("homeShopId"), "employee" => implode(",", $employee)));
        $this->success("删除成功", U("Home/User/employee"));
    }

    public function member()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Home/User/member/page/$p"));

        $userList = D("UserMember")->getList(array(), true, "id desc", $p, $num);
        $this->assign("userList", $userList);// 赋值数据集

        $count = D("UserMember")->getMethod(array(), "count");// 查询满足要求的总记录数
        $this->assignPaging($count, $num);
        $this->display();
    }

    public function delMember()
    {
        D("UserMember")->del(array("id" => I("get.id")));

        $this->success("删除成功", cookie("prevUrl"));
    }

    public function applyWatch()
    {
        $apply = D("FreeApply")->get(array("id" => I("get.id")));
        $this->assign("apply", $apply);
        $this->display("Buy:payFree");
    }

    public function delApply()
    {
        D("FreeApply")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", cookie("prevUrl"));
    }

    public function applyDo()
    {

        if (I("get.status") == 1) {
            D("FreeApply")->save(array("id" => I("get.id"), "status" => 1));

            $apply = D("FreeApply")->get(array("id" => I("get.id")));
            $order = D("UserMemberPay")->get(array("id" => $apply["pay_id"]));

            //pay calc
            D("UserMember")->add(array(
                "user_id" => $order["user_id"],
                "level" => $order["level"],
                "status" => 1,
                "member_pay_id" => $order["id"],
                "start_time" => date("Y-m-d H:i:s"),
                "end_time" => date("Y-m-d H:i:s", strtotime($order["month"] . " month")),
            ));
        } elseif (I("get.status") == -1) {
            D("FreeApply")->save(array("id" => I("get.id"), "status" => -1));
        }

        $this->success("操作成功", cookie("prevUrl"));
    }

    public function cert()
    {
        if (IS_POST) {
            $data = I("post.");
            $data["user_id"] = session("homeId");
            $data["status"] = 0;
            D("UserCert")->add($data);
        } else {
            $cert = M("UserCert")->where(array("user_id" => session("homeId")))->order("id desc")->find();
            $this->assign("cert", $cert);

            $this->display();
        }

    }

//崔

    public function addUser()
    {
        if (IS_POST) {
            $data = I("post.");
            if ($data["password"] != "") {
                $data["password"] = md5($data["password"]);
            } else {
                unset($data["password"]);
            }
            D("User")->add($data);

            $this->success("添加成功", cookie("prevUrl"));
        } else {
            $this->display();
        }
    }

    public function delUser()
    {
        D("User")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", cookie("prevUrl"));
    }

    public function modUser()
    {
        $user = D("User")->get(array("id" => I("get.id")), true);
        $this->assign("user", $user);

        $this->display("User:addUser");
    }

    public function admin()
    {
        $user = D("Admin")->getList(array(), true);

        $auth = new \Think\Auth();
        foreach ($user as $key => $value) {
            $groups = $auth->getGroups($value["id"]);
            $user[$key]["group"] = $groups[0];
        }
        $this->assign("userList", $user);
        $this->display();
    }

    public function addAdmin()
    {
        if (IS_POST) {
            $data = I("post.");
            if (!$data["group_id"]) {
                $this->error("操作失败", "Home/User/addAdmin");
            }

            if ($data["password"] != "") {
                $data["password"] = md5($data["password"]);
            } else {
                unset($data["password"]);
            }

            $groupId = $data["group_id"];
            unset($data["group_id"]);
            // $data["shop_id"] = session("homeShopId");
            $userId = D("Admin")->add($data);

            if ($groupId > 0) {
                D("AuthGroupAccess")->add($userId, $groupId);
            }

            $this->success("添加成功", U("Home/User/admin"));
        } else {
            $authGroupList = D("AuthGroup")->getList(array(), false, "id asc");
            $this->assign("authGroupList", $authGroupList);
            $this->display();
        }
    }

    public function modAdmin()
    {
        $user = D("Admin")->get(array("id" => I("get.id")), true);
        $this->assign("user", $user);

        $authGroupList = D("AuthGroup")->getList(array(), false, "id asc");
        $this->assign("authGroupList", $authGroupList);

        $this->display("User:addAdmin");
    }
}