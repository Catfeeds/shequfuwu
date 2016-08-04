<?php
namespace Vendor\Hiland\Utils\Controller;

use Think\Controller;
use Think\Page;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\DataModel\ViewMate;
use Vendor\Hiland\Utils\Datas\SystemConst;

/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/27
 * Time: 21:15
 * 本类型内主要是为（列表等）页面提供了常用了方法
 */
class HibaseController extends Controller
{
    /**
     * 单条信息的添加修改页面对应的action可以调用此方法
     * @param $modle
     * @param int|string $key 主键的值
     * @param string $keyName 主键的名称
     * @param array $savingData 前台提交过来要保存的数据，（默认为null，其会自动从post字节流中获取）
     * @param array $findingCondition 查找要显示在前台的记录信息，所需要使用的过滤条件（如果为null，其会自动根据主键进行组装此条件）
     */
    protected function item($modle, $key = 0, $keyName = '', $savingData = null, $findingCondition = null)
    {
        $mate = new ModelMate($modle);
        if (empty($keyName)) {
            $keyName = "id";
        }

        if (IS_POST) {
            if (empty($savingData)) {
                $savingData = I("post.");
            }

            $result = $mate->interact($savingData);
            if ($result) {
                $this->success("保存成功", cookie("prevUrl"));
            } else {
                $this->error("保存失败", cookie("prevUrl"));
            }

        } else {
            if (empty($findingCondition)) {
                $findingCondition = array(
                    "$keyName" => $key,
                );
            }

            $data = $mate->find($findingCondition);
            $this->assign("data", $data);

            $this->display();
        }
    }

    /**
     * 列表页对应的action可以对用此方法
     * @param $modle
     * @param null $condition
     * @param int $pageIndex
     * @param int $countPerPage
     * @param $dataListName string 传递到前端列表数据的名称
     * @param $link array 各表之间的逻辑关联数组
     */
    protected function itemList($modle, $condition = null, $pageIndex = 0, $countPerPage = 0, $dataListName = "", $link = null)
    {
        if (empty($pageIndex)) {
            $pageIndex = I("get.page") ? I("get.page") : 1;
        }

        if (empty($countPerPage)) {
            $countPerPage = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        }

        $this->assignListAndPaging($modle, $condition, $pageIndex, $countPerPage, $dataListName, $link);

        $this->recordBackingCookie();

        $this->display();
    }

    /**
     * 设置列表页的列表数据信息和分页信息(在列表页面中调用此代码)
     * @param $modle
     * @param $condition
     * @param $pageIndex
     * @param $countPerPage
     * @param $dataListName string 传递到前端列表数据的名称
     * @param $link array 各表之间的逻辑关联数组
     */
    protected function assignListAndPaging($modle, $condition, $pageIndex, $countPerPage, $dataListName = "", $link = null)
    {
        if (empty($dataListName)) {
            $dataListName = "dataList";
        }

        if (empty($link)) {
            $mate = new ModelMate($modle);
            $dataList = $mate->select($condition, "", $pageIndex, $countPerPage);
        } else {
            $mate = new ViewMate($modle, $link);
            $dataList = $mate->select($condition, true, "", $pageIndex, $countPerPage);
        }

        $this->assign("$dataListName", $dataList);

        $count = $mate->getCount($condition);
        $this->assignPaging($count, $countPerPage);
    }

    /**
     * 进行分页的逻辑处理，请在需要分页的子类方法中调用
     * @param $totalCount
     * @param int $countPerPage
     */
    protected function assignPaging($totalCount, $countPerPage = 0)
    {
        if (empty($countPerPage)) {
            $countPerPage = SystemConst::PC_ITEM_COUNT_PERPAGE_NORMAL;
        }

        $Page = new Page($totalCount, $countPerPage);// 实例化分页类 传入总记录数和每页显示的记录数
        $Page->setConfig('theme', "<ul class='pagination no-margin pull-right'></li><li>%FIRST%</li><li>%UP_PAGE%</li><li>%LINK_PAGE%</li><li>%DOWN_PAGE%</li><li>%END%</li><li><a> %HEADER%  %NOW_PAGE%/%TOTAL_PAGE% 页</a></ul>");
        $show = $Page->show();// 分页显示输出
        $this->assign('page', $show);// 赋值分页输出
    }

    /**
     * 记录可以返回来的地址（通常是列表页面中调用此代码，修改完成一个item后，返回到列表页面）
     */
    protected function recordBackingCookie()
    {
        cookie("prevUrl", $_SERVER['REQUEST_URI']);
    }

    /**
     * 更新项目记录并跳转到前一个页面
     * @param $modle
     * @param string $keys
     * @param null $data
     * @param string $keyName
     */
    protected function itemsUpdate($modle, $keys = "", $data = null, $keyName = 'id'){
        $mate = new ModelMate($modle);
        $mate->updateByKeys($keys, $data, $keyName);

        $this->success("保存成功", cookie("prevUrl"));
    }
}