<?php
namespace Admin\Controller;

use Think\Controller;
use Think\Page;
use Vendor\Hiland\Utils\Datas\SystemConst;

class BaseController extends Controller
{
    public function _initialize()
    {
        //url中的pjax参数影响数据分页
        if (I("get._pjax")) {
            unset($_GET["_pjax"]);
        }

        if (!$this->is_login() || session("adminGroupId") == null) {
            $this->redirect('Admin/Public/login');
        }

        if (session("adminGroupId") > 1) {
            $auth = new \Think\Auth();
            if (!$auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, session("adminId"))) {
                $this->error('你没有权限');
            }
        }
    }

    public function is_login()
    {
        if (session("adminName") && session("adminId")) {
            return true;
        } else {
            return false;
        }
    }


    /**
     * @param string $templateFile
     * @param bool $toggle
     */
    public function display($templateFile = '', $toggle = true)
    {
        if ($toggle) {
            if ($this->is_pjax()) {
                layout(false);
            } else {
                if (ACTION_NAME == 'login' || ACTION_NAME == 'getVerify') {
                    layout(false);
                } else {
                    layout('layout');
                }
            }
        } else {
            layout(false);
        }

        return parent::display($templateFile);
    }

    public function is_pjax()
    {
        return array_key_exists('HTTP_X_PJAX', $_SERVER) && $_SERVER['HTTP_X_PJAX'];
    }

    public function getNotify()
    {
        $notify = $this->http_get("http://notify.inuoer.com/notify.php?version=" . APP_VERSION . "&domain=http://" . I("server.HTTP_HOST"));
        echo $notify;
    }

    /**
     * GET 请求
     * @param string $url
     * @return bool|mixed
     */
    private function http_get($url)
    {
        $oCurl = curl_init();
        if (stripos($url, "https://") !== FALSE) {
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
        }
        curl_setopt($oCurl, CURLOPT_URL, $url);
        curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1);
        $sContent = curl_exec($oCurl);
        $aStatus = curl_getinfo($oCurl);
        curl_close($oCurl);
        if (intval($aStatus["http_code"]) == 200) {
            return $sContent;
        } else {
            return false;
        }
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
}