<?php
namespace Admin\Controller;

use Vendor\Hiland\Utils\Datas\SystemConst;

class ArticalController extends BaseController
{
    public function artical()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Admin/Artical/artical/page/$p"));

        $articalList = D("Artical")->getList(array(), true, "id desc", $p, $num);
        $this->assign('articalList', $articalList);// 赋值数据集

        $count = D("Artical")->getMethod(array(), "count");// 查询满足要求的总记录数
        $this->assignPaging($count, $num);

        $this->assign('url', "http://" . I("server.HTTP_HOST"));
        $this->display();
    }

    public function modArtical()
    {
        $artical = D("Artical")->get(array("id" => I("get.id")), true);
        $this->assign("artical", $artical);
        $this->display("Artical:addArtical");
    }

    public function delArtical()
    {
        D("Artical")->del(array("id" => array("in", I("get.id"))));
        $this->success("删除成功", cookie("prevUrl"));
    }

    public function addArtical()
    {
        if (IS_POST) {
            $data = I("post.");
            $data['content'] = I("post.content", '', '');
            D("Artical")->add($data);

            $this->success("保存成功", cookie("prevUrl"));
        } else {
            $this->display();
        }
    }
}