<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/10/18
 * Time: 9:22
 */

namespace General\Controller;


use Vendor\Hiland\Biz\Loger\CommonLoger;
use Vendor\Hiland\Utils\Controller\HibaseController;

class CommonController extends HibaseController
{
    public function UpdateItem($model){
        $this->itemsMaintenance($model);
    }
}