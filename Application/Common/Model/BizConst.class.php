<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/23
 * Time: 9:39
 */

namespace Common\Model;


use Vendor\Hiland\Utils\Data\ReflectionHelper;

class BizConst
{
    const ORDER_STATUS_ORIGINAL = 0;
    const ORDER_STATUS_DONE = 5;

    /**
     * 获取所有的常量
     * @return array
     */
    public static function getConsts()
    {
        $cacheKey = "Common-Model-BizConst-20160723";
        $dataCached = S($cacheKey);
        if ($dataCached) {
            return $dataCached;
        } else {
            $reflectionClass = ReflectionHelper::getReflectionClass(__CLASS__);
            $dataCached = $reflectionClass->getConstants();
            S($cacheKey, $dataCached);
            return $dataCached;
        }
    }
}