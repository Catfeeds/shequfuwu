<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/5/30
 * Time: 16:42
 */

namespace Home\Controller;


use Common\Model\BizHelper;
use Think\Controller;
use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Biz\Tencent\WechatHelper;
use Vendor\Hiland\Utils\Data\HtmlHelper;
use Vendor\Hiland\Utils\DataModel\ModelMate;
use Vendor\Hiland\Utils\DataModel\ViewMate;
use Vendor\Hiland\Utils\IO\Drawing\CircleSeal;
use Vendor\Hiland\Utils\IO\Thread;
use Vendor\Hiland\Utils\Web\AsynHandle;
use Vendor\Hiland\Utils\Web\EnvironmentHelper;
use Vendor\Hiland\Utils\Web\HttpHeader;
use Vendor\Hiland\Utils\Web\HttpRequestHeader;
use Vendor\Hiland\Utils\Web\HttpRequstHeader;
use Vendor\Hiland\Utils\Web\HttpResponseHeader;
use Vendor\Hiland\Utils\Web\NetHelper;
use Vendor\Hiland\Utils\Web\WebHelper;

class FooController extends Controller
{
    public function pathop()
    {
        //dump('sssssssss');
        $targetUrl = U("Home/Config/address");
        dump($targetUrl);
        //WebHelper::redirectUrl($targetUrl);
        $this->assign('url', $targetUrl);
        $this->display();
    }

    public function redirecturlajax()
    {
        header('Content-Type:application/json; charset=utf-8');
        $data['info'] = 'sssssssssss';
        $data['status'] = 1;
        $data['url'] = 'www.sss.ff/gg/22/pp';

        exit(json_encode($data, 0));
    }

    public function configop($configname = 'PROJECT_NAME')
    {
        dump(C($configname));
    }

    public function configdbop()
    {
        $mate = new ModelMate('config');
        $data = $mate->get(1);
        dump($data);
    }

    public function buyershopop($shopid = 3)
    {
        $openid = 'gasdgawegewgew';
        $result = BizHelper::relateUserShopScaned($openid, $shopid);
        dump($result);
    }

    public function serverhostop()
    {
        dump('HostName:' . EnvironmentHelper::getServerHostName());
        dump('ServerName:' . EnvironmentHelper::getWebServerName());
        dump('Root:' . __ROOT__);
    }

    public function webphysicalrootpathop()
    {
        dump('file:' . __FILE__);
        dump('PHP_SELF:' . $_SERVER['PHP_SELF']);
        dump('SCRIPT_NAME' . $_SERVER['SCRIPT_NAME']);//它将返回包含当前脚本的路径。这在页面需要指向自己时非常有用
        dump('SCRIPT_FILENAME' . $_SERVER['SCRIPT_FILENAME']);//它将返回当前文件所在的绝对路径信息

        dump('REQUEST_URI' . $_SERVER['REQUEST_URI']);

        dump(realpath(dirname(__FILE__) . '/../'));
        dump(str_replace('\\', '/', realpath(dirname(__FILE__) . '/../')));
        dump('hostName:' . EnvironmentHelper::getServerHostName());
        //dump(WebHelper::getWebPhysicalRootPath());
    }

    public function wxmenuop()
    {
        $m = D("WxMenu");
        $menu = $m->getList(array("pid" => 0), false, array('rank' => 'desc', 'id' => 'desc'), 0, 0, 3);
        dump($menu);
    }

    public function paraUsed($order = array('id' => 'desc'))
    {
        dump($order);
    }

    public function paraop()
    {
        $this->paraUsed("rank desc,id");
    }

    public function skulistop()
    {
        $condition = array(
            "product_id" => 23,
        );
        $result = D("ProductSku")->getList($condition, true, "rank desc");
        dump($result);
    }

    /**
     * @param int $shopid
     */
    public function calctimeofshop($shopid = 146)
    {
        G('shopBeginTime');
        $product = D("Product")->getList(array("status" => array("neq", -1), "shop_id" => $shopid), false, "rank desc", 0, 0, 0);
        $jsons = json_encode($product);
        dump(G('shopBeginTime', 'shopEndTime'));
        //dump($product);
    }

    public function getshopop($shopid = 144)
    {
        $data = D('shop')->getShop();
    }

    public function wechatop()
    {
        $token = WechatHelper::getAccessToken();
        dump($token);

        $qrTicket = WechatHelper::getQRTicket(146, '', 'QR_LIMIT_SCENE');
        dump($qrTicket);
    }

    public function cookieop()
    {
        $cookieKey = "my-ss";
        cookie($cookieKey, 'qingdao');
        dump(cookie($cookieKey));
        cookie($cookieKey, null);
        //Cookie:
        dump(cookie($cookieKey));
    }

    public function modelmateop($shopId = 0)
    {
        $mate = new ModelMate('menu');
        $condition = array();
        $condition['shop_id'] = $shopId;
        $result = $mate->delete($condition);
        dump($result);
    }

    public function keywordop($shopId = 144)
    {
        $mate = new ModelMate('menu');
        $sql = "select * from __TABLE__ where shop_id= $shopId";
        $result = $mate->query($sql);
        dump($result);
    }

    public function copydataop($sourceShopId = 144, $targetShopId = 2)
    {
        $mateMenu = new ModelMate('menu');
        $sqlMenu = "INSERT INTO __TABLE__(`name`,pid,file_id,remark,rank,time,shop_id,copysourceid) SELECT `name`,pid,file_id,remark,rank,time,$targetShopId,id FROM __TABLE__ where shop_id=$sourceShopId";
        $menuResult = $mateMenu->execute($sqlMenu);
        dump($menuResult);

        $mateProduct = new ModelMate('product');
        $sqlProduct = "INSERT INTO __TABLE__(shop_id,menu_id,`name`,subname,price,old_price,unit,score,sales,store,albums,visiter,psku,file_id,detail,`status`,label,remark,rank,time,copysourceid) SELECT $targetShopId,menu_id,`name`,subname,price,old_price,unit,score,sales,store,albums,visiter,psku,file_id,detail,`status`,label,remark,rank,time,id FROM __TABLE__ where shop_id=$sourceShopId";
        $resultProduct = $mateProduct->execute($sqlProduct);
        dump($resultProduct);

        $mateSku = new ModelMate('productSku');
        $sqlSku = "INSERT INTO __TABLE__(shop_id,product_id,`name`,path,price,freight,store,sales,remark,time,rank,file_id,albums,copysourceid) SELECT $targetShopId,product_id,`name`,path,price,freight,store,sales,remark,time,rank,file_id,albums,id FROM __TABLE__ where shop_id=$sourceShopId";
        $resultSku = $mateSku->execute($sqlSku);
        dump($resultSku);
    }
    
    public function logop(){
        CommonLoger::log('logtest',time());
    }

    public function asynop(){
        dump(22222222222);
        CommonLoger::log('asynCalled','1111111111111');
        //self::asynCalled();

        $url= U("asynCalled","info=9999999999");
        dump($url);

        Thread::asynExec($url);

        dump('hhhh');

//        $thread= new Thread();
//        $thread->add(asynCalled);
        //dump($asyn->makeRequest($url));
        //dump($asyn->request($url));
        //NetHelper::request($url);
        //dump($asyn->Get("http://www.wtoutiao.com/p/147Sf8z.html"));


    }

    public function asynCalled($info){
        sleep(10);
        //dump('ccccccccccccccccc-called');
        CommonLoger::log('asynCalled',$info);
        dump('oooooooooo');
        //return 'ok';
    }

    public function CircleSealop(){
        $seal = new CircleSeal('你我他坐站走东西南北中',75,6,24,0,0,16,40);
        $seal->draw();
    }

    public function viewmodelop(){
        $link = array(
            'File' => array(
                'mapping_type' => ViewMate::BELONGS_TO,
                'mapping_name' => 'file',
                'foreign_key' => 'file_id',//关联id
                'as_fields' => 'savename:savename,savepath:savepath',
            ),
        );
        $viewMate= new ViewMate('menu',$link);

        $viewData= $viewMate->get(100,'id',true);
        dump($viewData);

        $modelMate= new ModelMate('menu');
        $modelData= $modelMate->get(100);
        dump($modelData);

        $condition['id']= array('NEQ','1');
        $list= $viewMate->select($condition);
        dump($list);
    }

    public function physicalpathop(){
        //dump($_SERVER['PHP_SELF']);
        dump(realpath(dirname(__FILE__)));
    }

    public function cleancommnetop(){
        $html= '<meta charset="UTF-8">
	<!--引入标题，关键之，描述等-->
	<title>易联云-API开发文档</title>
	<meta name="keywords" content="">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<link rel="stylesheet" type="text/css" href="Common/style/base.min.css">
	<link rel="stylesheet" href="Common/style/download.min.css">
	<link rel="stylesheet" type="text/css" href="Common/style/home-common.min.css">
	<style type="text/css">
		body{
			background:#f5f8fb;
		}
	</style>';//NetHelper::get("http://www.10ss.net/doc.html");
        dump($html);
        $result= HtmlHelper::cleanComment($html);
        dump($result);
    }

    public function compressop(){
        $url= "http://app.rainytop.com/mm/index.php?s=/Home/Public/login";
        $result= EnvironmentHelper::getServerCompressType($url);
        dump($result);

        dump(HttpRequestHeader::getAll());

        $data= HttpResponseHeader::getAll($url);
        dump($data);
    }
}