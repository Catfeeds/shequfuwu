<?php
namespace App\Controller;

use Common\Model\BizHelper;
use Common\Model\OrderViewMate;
use Vendor\Hiland\Utils\Data\ArrayHelper;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\Web\WebHelper;

class UserController extends BaseController
{
    public function _initialize()
    {
        parent::_initialize();

        $isLogin = $this->is_login();
        if (!$isLogin) {
            $this->ajaxReturn(array("info" => "error", "msg" => "未登陆", "status" => 0));
        }
    }

    public function getUser()
    {
        $user = D("User")->get(array("id" => session("userId")), true);

        if (I("get.getOrder")) {
            //"id desc", $p, $num
            $pageIndex = I("get.pageIndex");
            if (empty($pageIndex)) {
                $pageIndex = 1;
            }


            $itemCountPerPage = C('APP_ITEM_COUNT_PER_PAGE');
            if (empty($itemCountPerPage)) {
                $itemCountPerPage = 10;
            }

            $mate = new OrderViewMate();
            $result = $mate->select(array("user_id" => session("userId"), "status" => array("gt", -1)), true, '', $pageIndex, $itemCountPerPage);
            if ($result) {
                $orderCount = sizeof($result);
                for ($i = 0; $i < $orderCount; $i++) {
                    $result[$i] = ArrayHelper::convert2DTo1D($result[$i]);
                }
            }
            $user["order"] = $result;
        }

        if (I("get.getProvince")) {
            $user["province"] = D("LocProvince")->getList(array("shop_id" => session("shop_id")), true);
        }

        $configMate = new ModelMate('config');
        $systemConfig = $configMate->get(1);
        $user['systemConfig'] = $systemConfig;

        $this->ajaxReturn($user);
    }

    public function getContactList()
    {
        $contact = D("Contact")->getList(array("user_id" => session("userId")));
        if (I("get.getProvince")) {
            $contact["province"] = D("LocProvince")->getList(array(), true);
        }

        $this->ajaxReturn($contact);
    }

    public function addContact()
    {
        $data = I("post.");
        $data["id"] = session("userId");
        D("Contact")->add($data);
    }

    public function delContact()
    {
        D("Contact")->del(array("id" => array("in", I("get.id"))));
    }

    public function getFavoritesList()
    {
        $list = D("UserFavorites")->getList(array("id" => session("userId")), true);
        $this->ajaxReturn($list);
    }

    public function addFavorites()
    {
        $data = array();
        $userFavorites = D("UserFavorites");
        if (strpos(I("get.product_id"), ',') != false) {
            $product_ids = explode(',', I("get.product_id"));
            foreach ($product_ids as $key => $value) {
                array_push($data, array("product_id" => $value, "user_id" => session("userId")));
            }
        } else {
            array_push($data, array("product_id" => I("get.product_id"), "user_id" => session("userId")));
        }

        foreach ($data as $key => $value) {
            $find = $userFavorites->get(array("user_id" => session("userId"), "product_id" => $value));
            if ($find) {
                unset($data[$key]);
            }
        }

        $userFavorites->addAll($data);
    }

    public function delFavorites()
    {
        D("UserFavorites")->del(array("id" => array("in", I("get.id"))));
    }
    // public function getShopList()
    // {
    // $lng = I("post.lng");
    // $lat = I("post.lat");

    // $lng = '113.875';
    // $lat = '34.0485';
    // $lngMin = returnSquarePoint($lng, $lat)["left-top"]["lng"];
    // $lngMax = returnSquarePoint($lng, $lat)["right-top"]["lng"];

    // $latMin = returnSquarePoint($lng, $lat)["left-top"]["lat"];
    // $latMax = returnSquarePoint($lng, $lat)["right-top"]["lat"];


    // $shop = D("Shop")->getShopList(array("status"=>I("post.status"),"lat" => array(array('gt', $latMin), array('lt', $latMax)), "lng" => array(array('gt', $lngMin), array('lt', $lngMax))),true,"id desc",$p,10,10);
    // $u_lat = '40.017349';
    // $u_lon = '116.407143,';
    // $p = I("post.lazyNum") ? I("post.lazyNum") : 1;
    // $shop = D("Shop")->getShopList(array("status"=>I("post.status")),true,"id desc",$p,10,10);
    // $this->ajaxReturn($shop);
    // }


    public function shopSelector()
    {
        //dump('shopSelector');
        $oauth2Url = "App/Public/oauthLogin";
        $user = R($oauth2Url);
    }

    /**
     * 获取消费者通过扫码关注的店铺
     */
    public function getShopScanedList()
    {
        $openId = '';
        $shopScanedMate = new ModelMate('usershopscaned');

        $where = array();
        $where['openid'] = $openId;
        $shopScaneds = $shopScanedMate->select($where);

        if (!$shopScaneds) {

        }
    }


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
        WebHelper::serverReturn($result);
    }
}