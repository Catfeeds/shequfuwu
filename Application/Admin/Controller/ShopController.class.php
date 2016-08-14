<?php
namespace Admin\Controller;

use Common\Model\ViewLink;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\DataModel\ViewMate;
use Vendor\Hiland\Utils\Datas\SystemConst;

class ShopController extends BaseController
{
    public function categoryList()
    {
        cookie("prevUrl", U("Admin/Shop/categoryList"));
        $categoryMate = new ViewMate('shopCategory', ViewLink::getCommon_File());
        $categoryList = $categoryMate->select();
        $this->assign("categoryList", $categoryList);
        $this->display();
    }

    public function category($id = 0)
    {
        $categoryMate = new ViewMate('shopCategory', ViewLink::getCommon_File());

        if (IS_POST) {
            $data = I("post.");
            $categoryMate->interact($data);
            $this->success("保存成功", cookie("prevUrl"));
        } else {
            if (!empty($id)) {
                $category = $categoryMate->get($id);
                $this->assign("category", $category);
            }
            $this->display();
        }
    }

    public function menu()
    {
        $menu = D("Menu")->getList(array(), true);
        $this->assign("menu", $menu);
        $this->display();
    }

    public function product()
    {
        //每页显示的记录数
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Admin/Shop/product/page/$p"));

        $productList = D("Product")->getList(array(), array("menu", "file"), "id desc", $p, $num);
        $this->assign('productList', $productList);// 赋值数据集

        $count = D("Product")->getMethod(array(), "count");// 查询满足要求的总记录数
        $this->assignPaging($count, $num);

        $this->assign('url', "http://" . I("server.HTTP_HOST"));
        $this->display();
    }

    public function addMenu()
    {
        if (IS_POST) {
            D("Menu")->add(I("post."));

            $this->success("保存成功", U("Admin/Shop/menu"));
        } else {
            $menuList = D("Menu")->getList(array("pid" => 0));
            $this->assign("menuList", $menuList);
            $this->display();
        }
    }

    public function modMenu()
    {
        $menu = D("Menu")->get(array("id" => I("get.id")), true);
        $this->assign("menu", $menu);

        $menuList = D("Menu")->getList(array("pid" => 0));
        $this->assign("menuList", $menuList);

        $this->display("Shop:addMenu");
    }

    public function delMenu()
    {
        D("Menu")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", U("Admin/Shop/menu"));
    }

    public function addProduct()
    {
        if (IS_POST) {
            $data = I("post.");
            $data['detail'] = I("post.detail", '', '');
            $data['label'] = implode(',', I("post.label"));
            $data['albums'] = implode(',', I("post.albums"));
            D("Product")->add($data);

            $this->success("保存成功", cookie("prevUrl"));
        } else {
            $menuList = D("Menu")->getList();
            $this->assign("menuList", $menuList);

            $labelList = D("ProductLabel")->getList();
            $this->assign("labelList", $labelList);

            $this->display();
        }
    }

    public function modProduct()
    {
        $product = D("Product")->get(array("id" => I("get.id")), array('menu', 'file'));
        $product["label"] = explode(",", $product["label"]);

        $albums = explode(",", $product["albums"]);
        $product["albums"] = $albums ? D("File")->getList(array("id" => array("in", $albums))) : "";
        $this->assign("product", $product);

        $menuList = D("Menu")->getList();
        $this->assign("menuList", $menuList);

        $labelList = D("ProductLabel")->getList();
        $this->assign("labelList", $labelList);

        // dump($product);

        $this->display("Shop:addProduct");
    }

    public function updateProduct()
    {
        $data = I("get.");
        $data["id"] = array("in", $data["id"]);
        D("Product")->save($data);

        $this->success("保存成功", cookie("prevUrl"));
    }


    public function delProduct()
    {
        D("Product")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", cookie("prevUrl"));
    }

    public function ads()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Admin/Shop/ads/page/$p"));

        $adsList = D("Ads")->getList(array(), true, "id desc", $p, $num);
        $this->assign('ads', $adsList);// 赋值数据集

        $count = D("Ads")->getMethod(array(), "count");// 查询满足要求的总记录数
        $this->assignPaging($count, $num);
        $this->display();
    }

    public function addAds()
    {
        if (IS_POST) {
            D("Ads")->add(I("post."));

            $this->success("保存成功", cookie("prevUrl"));
        } else {
            $this->display();
        }
    }

    public function modAds()
    {
        $ads = D("Ads")->get(array("id" => I("get.id")), true);
        $this->assign("ads", $ads);

        $this->display("Shop:addAds");
    }

    public function delAds()
    {
        D("Ads")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", cookie("prevUrl"));
    }

    public function comment()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Admin/Shop/comment/page/$p"));

        $comment = D("Comment")->getList(array(), true, "id desc", $p, $num);
        $this->assign("comment", $comment);

        $count = D("Comment")->getMethod(array(), "count");// 查询满足要求的总记录数
        $this->assignPaging($count, $num);
        $this->display();
    }

    public function delComment()
    {
        D("Comment")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", cookie("prevUrl"));
    }

    public function productSearch()
    {
        $condition = array();
        if (I("post.id")) {
            array_push($condition, array("id" => I("post.id")));
        }
        if (I("post.name")) {
            array_push($condition, array("name" => array("like", array("%" . I("post.name") . "%", "%" . I("post.name"), I("post.name") . "%"), 'OR')));
        }
        if (I("post.recommend") != -10) {
            array_push($condition, array("recommend" => I("post.recommend")));
        }
        if (I("post.status") != -10) {
            array_push($condition, array("status" => I("post.status")));
        }
        if (I("post.timeRange")) {
            $timeRange = I("post.timeRange");
            $timeRange = explode(" --- ", $timeRange);
            array_push($condition, array("time" => array('between', array($timeRange[0], $timeRange[1]))));
        }

        $productList = D("Product")->getList($condition, true);

        $this->assign("productPost", I("post."));
        $this->assign("productList", $productList);
        $this->display("product");
    }

    public function exportProduct()
    {
        $product = D('Product')->getList(array(), true);
        foreach ($product as $key => $value) {
            unset($product[$key]["comment"]);
        }
        Vendor("PHPExcel.Excel#class");
        \Excel::export($product);
    }

    public function feedback()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Admin/Shop/feedback/page/$p"));

        $feedbackList = D("Feedback")->getList(array(), false, "id desc", $p, $num);
        $this->assign('feedback', $feedbackList);// 赋值数据集

        $count = D("Feedback")->getMethod(array(), "count");// 查询满足要求的总记录数
        $this->assignPaging($count, $num);
        $this->display();
    }

    public function exportFeedback()
    {
        if (I("get.id")) {
            $feedback = D("Feedback")->getList(array("id" => array("in", I("get.id"))));
        } else {
            $feedback = D("Feedback")->getList();
        }

        Vendor("PHPExcel.Excel#class");
        \Excel::export($feedback);
    }

    public function label()
    {
        $label = D("ProductLabel")->getList();
        $this->assign("label", $label);
        $this->display();
    }

    public function modLabel()
    {
        $label = D("ProductLabel")->get(array("id" => I("get.id")), false);
        $this->assign("label", $label);

        $this->display("Shop:addLabel");
    }

    public function addLabel()
    {
        if (IS_POST) {
            D("ProductLabel")->add(I("post."));

            $this->success("保存成功", U("Admin/Shop/label"));
        } else {
            $this->display();
        }
    }

    public function delLabel()
    {
        D("ProductLabel")->del(array("id" => array("in", I("get.id"))));

        $this->success("删除成功", U("Admin/Shop/label"));
    }

    public function sku()
    {
        $productID = I("get.id");
        cookie("prevUrl", U("Admin/Shop/sku/id/$productID"));

        $sku = D("ProductSku")->getList(array("product_id" => $productID));
        $this->assign("sku", $sku);

        $this->display();
    }

    public function addSku()
    {
        $new = I("post.new");
        $old = I("post.old");

        $skuModel = D("ProductSku");
        foreach ($new as $key => $value) {
            $new[$key]["product_id"] = I("post.product_id");
            $skuModel->add($new[$key]);
        }

        foreach ($old as $key => $value) {
            $old[$key]["product_id"] = I("post.product_id");
            $skuModel->save($old[$key]);
        }

        $this->success("操作成功", cookie("prevUrl"));
    }

    public function delSku()
    {
        D("ProductSku")->del(array("id" => I("get.id")));

        $this->success("删除成功", cookie("prevUrl"));
    }

    public function shop()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Admin/Shop/shop/page/$p"));

        $condition = array();
        if (I("post.id")) {
            array_push($condition, array("id" => I("post.id")));
        }
        if (I("post.name")) {
            array_push($condition, array("name" => array("like", array("%" . I("post.name") . "%", "%" . I("post.name"), I("post.name") . "%"), 'OR')));
        }

        if (I("post.status") != "") {
            array_push($condition, array("status" => I("post.status")));
        }
        if (I("post.timeRange")) {
            $timeRange = I("post.timeRange");
            $timeRange = explode(" --- ", $timeRange);
            array_push($condition, array("time" => array('between', array($timeRange[0], $timeRange[1]))));
        }

        $shopList = D("Shop")->getShopList($condition, true, "id desc", $p, $num);
        $this->assign('shopList', $shopList);// 赋值数据集

        $count = D("Shop")->getShopListCount($condition);// 查询满足要求的总记录数
        $this->assignPaging($count, $num);
        $this->assign('url', "http://" . I("server.HTTP_HOST"));
        $this->display();
    }

    //pidong 新增店铺
    public function addShop()
    {
        if (IS_POST) {
            $data = I("post.");

            if (!$data["id"]) {
                $data["user_id"] = session("adminId");
            }

            unset($data["wd"]);

            D("Shop")->addShop($data);

            $this->success("保存成功", U("Admin/Shop/shop"));
        } else {
            $this->display();
        }
    }

    //pidong 店铺审核成功
    public function updateShop()
    {
        $data = I("get.");
        M("Shop")->where(array("id" => array("in", I("get.id"))))->save(array("status" => I("get.status")));

        $this->success("审核成功", cookie("prevUrl"));
    }

    public function excellentShop()
    {
        M("Shop")->where(array("id" => array("in", I("get.id"))))->save(array("is_excellent" => I("get.excellent")));

        $this->success("成功", cookie("prevUrl"));
    }

    //pidong 店铺删除
    public function delShop()
    {
        D("Shop")->delShop(I("get.id"));

        $this->success("删除成功", cookie("prevUrl"));
    }

    //pidong 关闭店铺
    public function closeShop()
    {
        $data = I("get.");
        M("Shop")->where(array("id" => array("in", I("get.id"))))->save(array("status" => I("get.status")));

        $this->success("关闭成功", cookie("prevUrl"));
    }

    //pidong 开启店铺
    public function openShop()
    {
        $data = I("get.");
        M("Shop")->where(array("id" => array("in", I("get.id"))))->save(array("status" => I("get.status")));

        $this->success("开启成功", cookie("prevUrl"));
    }

    /**
     * 店铺复制
     */
    public function copy()
    {
        if (IS_POST) {

        } else {
            $shopMate = new ModelMate('shop');

            $shopList = $shopMate->select();
            $this->assign("shopList", $shopList);

            $this->display();
        }
    }

    /**
     *
     * @param int $sourceShopId
     * @param int $targetShopId
     * @param bool $isOffSaleAll 是否下架所有商品
     */
    public function reorganizeProduct($sourceShopId = 0, $targetShopId = 0, $isOffSaleAll = false)
    {
        $menus = $this->getMenus($targetShopId, false);
        $mateProduct = new ModelMate('product');
        foreach ($menus as $menu) {
            $menuIDNew = $menu['id'];
            $menuIDOld = $menu['copysourceid'];

            $sqlOfChangeMenu = "Update __TABLE__ set menu_id=$menuIDNew where shop_id=$targetShopId and  menu_id=$menuIDOld";
            $mateProduct->execute($sqlOfChangeMenu);
        }

        //CommonLoger::log('$isOffSaleAll',"$isOffSaleAll");

        if ((is_bool($isOffSaleAll) && $isOffSaleAll == true) || $isOffSaleAll == "true") {
            $sqlOfOffSaleAll = "Update __TABLE__ set status=-1 where shop_id=$targetShopId";
            $mateProduct->execute($sqlOfOffSaleAll);
        }

        $this->ajaxReturn('success');
    }

    private function getMenus($shopId, $returnAjax = true)
    {
        $mate = new ModelMate('menu');
        $condition = array();
        $condition['shop_id'] = $shopId;
        $result = $mate->select($condition);

        if ($returnAjax) {
            $this->ajaxReturn($result);
        } else {
            return $result;
        }
    }

    public function reorganizeSku($sourceShopId = 0, $targetShopId = 0)
    {
        $products = $this->getProducts($targetShopId, false);
        foreach ($products as $product) {
            $productIDNew = $product['id'];
            $productIDOld = $product['copysourceid'];
            $sql = "Update __TABLE__ set product_id=$productIDNew where shop_id=$targetShopId and  product_id=$productIDOld";
            $mateProduct = new ModelMate('productSku');
            $mateProduct->execute($sql);
        }

        $this->ajaxReturn('success');
    }

    private function getProducts($shopId, $returnAjax = true)
    {
        $mate = new ModelMate('product');
        $condition = array();
        $condition['shop_id'] = $shopId;
        $result = $mate->select($condition);

        if ($returnAjax) {
            $this->ajaxReturn($result);
        } else {
            return $result;
        }
    }

    public function copyData($sourceShopId = 0, $targetShopId = 0)
    {
        $mateMenu = new ModelMate('menu');
        $sqlMenu = "INSERT INTO __TABLE__(`name`,pid,file_id,remark,rank,time,shop_id,copysourceid) SELECT `name`,pid,file_id,remark,rank,time,$targetShopId,id FROM __TABLE__ where shop_id=$sourceShopId";
        $menuResult = $mateMenu->execute($sqlMenu);
        //dump($menuResult);

        $mateProduct = new ModelMate('product');
        $sqlProduct = "INSERT INTO __TABLE__(shop_id,menu_id,`name`,subname,price,old_price,unit,score,sales,store,albums,visiter,psku,file_id,detail,`status`,label,remark,rank,time,copysourceid) SELECT $targetShopId,menu_id,`name`,subname,price,old_price,unit,score,sales,store,albums,visiter,psku,file_id,detail,`status`,label,remark,rank,time,id FROM __TABLE__ where shop_id=$sourceShopId";
        $resultProduct = $mateProduct->execute($sqlProduct);
        //dump($resultProduct);

        $mateSku = new ModelMate('productSku');
        $sqlSku = "INSERT INTO __TABLE__(shop_id,product_id,`name`,path,price,freight,store,sales,remark,time,rank,file_id,albums,copysourceid) SELECT $targetShopId,product_id,`name`,path,price,freight,store,sales,remark,time,rank,file_id,albums,id FROM __TABLE__ where shop_id=$sourceShopId";
        $resultSku = $mateSku->execute($sqlSku);

        $mateLabel = new ModelMate('productLabel');
        $sqlLabel = "INSERT INTO __TABLE__(shop_id,`name`,subname,remark,isshowmainpage,time,onlyforshop) SELECT $targetShopId,`name`,subname,remark,isshowmainpage,time,onlyforshop FROM __TABLE__ where shop_id=$sourceShopId";
        $resultLabel = $mateLabel->execute($sqlLabel);

        $this->ajaxReturn('success');
    }

    public function cleanShop($shopId)
    {
        $condition = array();
        $condition['shop_id'] = $shopId;

        $mateMenu = new ModelMate('menu');
        $resultMenu = $mateMenu->delete($condition);

        $mateProduct = new ModelMate('product');
        $resultMenu = $mateProduct->delete($condition);

        $mateProductSku = new ModelMate('productSku');
        $resultMenu = $mateProductSku->delete($condition);

        $this->ajaxReturn('success');
    }


}