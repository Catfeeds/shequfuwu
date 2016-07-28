<?php
namespace Home\Controller;

use Vendor\Hiland\Utils\Datas\SystemConst;

class HelpController extends BaseController
{
    public function manual()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Home/Artical/artical/page/$p"));

        $articalList = D("Artical")->getArticalList(array("type" => 2), true, "rank desc,id desc", $p, $num);
        $this->assign('articalList', $articalList);// 赋值数据集

        $count = D("Artical")->getArticalListCount(array("type" => 2));// 查询满足要求的总记录数
        $this->assignPaging($count, $num);
        $this->assign('url', "http://" . I("server.HTTP_HOST"));
        $this->display("list");
    }

    public function operate()
    {
        $num = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        $p = I("get.page") ? I("get.page") : 1;
        cookie("prevUrl", U("Home/Artical/artical/page/") . $p);

        $articalList = D("Artical")->getArticalList(array("type" => 3), true, "rank desc,id desc", $p, $num);
        $this->assign('articalList', $articalList);// 赋值数据集

        $count = D("Artical")->getArticalListCount(array("type" => 3));// 查询满足要求的总记录数
        $this->assignPaging($count, $num);
        $this->assign('url', "http://" . I("server.HTTP_HOST"));
        $this->display("list");
    }
}