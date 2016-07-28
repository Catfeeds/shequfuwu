<?php
namespace Home\Controller;

use Vendor\Hiland\Utils\Datas\SystemConst;

class CouponController extends BaseController
{
    public function config()
    {
        if (IS_POST) {
            $data = I("post.");
            $data["id"] = session("homeShopId");

            D("Shop")->addShop($data);
            $this->success("保存成功", cookie("prevUrl"));
        } else {
            $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
            $p = I("get.page") ? I("get.page") : 1;
            cookie("prevUrl", U("Home/Coupon/config/page/$p"));

            $condition = array("shop_id" => session("homeShopId"));
            $coupon = D("CouponCategory")->getList($condition, true, "id desc", $p, $num);
            $this->assign("coupons", $coupon);

            $count = D("CouponCategory")->getMethod($condition, "count");// 查询满足要求的总记录数
            $this->assignPaging($count, $num);

            $config = D("Shop")->getShop(array("id" => session("homeShopId")));
            $this->assign("coupon", $config["coupon"]);

            $this->display();
        }

    }

    public function delCoupon()
    {
        D("CouponCategory")->del(array("id" => array("in", I("get.id"))));
        $this->success("删除成功", cookie("prevUrl"));
    }

    public function detail()
    {
        $condition = array("coupon_category_id" => I("get.id"));
        $details = D("Coupon")->getList($condition, true);
        $this->assign("details", $details);
        $this->display();
    }

    public function addCoupon()
    {
        if (IS_POST) {
            $data = I("post.");
            $data["last_number"] = $data["number"];

            $valid = explode(" - ", $data["validity"]);
            unset($data["validity"]);

            $data["ctime"] = $valid[0];
            $data["last_time"] = $valid[1];

            $data["shop_id"] = session("homeShopId");
            $data["user_id"] = session("homeId");

            D("CouponCategory")->add($data);
            $this->success("新增成功", cookie("prevUrl"));
        } else {
            $this->display();
        }
    }
}