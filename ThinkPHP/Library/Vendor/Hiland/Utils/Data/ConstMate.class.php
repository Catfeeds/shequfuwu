<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/24
 * Time: 10:21
 */

namespace Vendor\Hiland\Utils\Data;


class ConstMate
{
    /**
     * 根据给定的前缀和值获取常量的显示信息
     * @param $prefix
     * @param $value
     * @return mixed
     */
    public static function getConstText($prefix, $value)
    {
        $all = self::getConsts($prefix);
        $constKey = self::getConstName($prefix, $value);
        return $all[$constKey . "_TEXT"];
    }

    /**
     * 获取所有的常量
     * @param string $prefix 常量的前缀字符串
     * @param bool $withText 是否将_TEXT后缀的条目一起获取到
     * @return array
     */
    public static function getConsts($prefix = '', $withText = true)
    {
        $cacheKey = "Common-Model-BizConst-$prefix";
        if (APP_DEBUG) {
            return self::getConstsDetail($prefix, $withText);
        } else {
            $dataCached = S($cacheKey);
            if ($dataCached) {
                return $dataCached;
            } else {
                $dataCached = self::getConstsDetail($prefix, $withText);
                S($cacheKey, $dataCached);
                return $dataCached;
            }
        }
    }

    private static function getConstsDetail($prefix, $withText)
    {
        $className = get_called_class();
        $reflectionClass = ReflectionHelper::getReflectionClass($className);
        $all = $reflectionClass->getConstants();

        $result = array();
        if (empty($prefix)) {
            $result = $all;
        } else {
            foreach ($all as $key => $value) {
                if (StringHelper::isStartWith($key, $prefix)) {
                    if ($withText) {
                        $result[$key] = $value;
                    } else {
                        if (!StringHelper::isEndWith($key, "_TEXT")) {
                            $result[$key] = $value;
                        }
                    }
                }
            }
        }

        return $result;
    }

    /**
     * 根据给定的前缀和值获取常量的名称
     * @param $prefix
     * @param $value
     * @return bool|int|string
     */
    public static function getConstName($prefix, $value)
    {
        $all = self::getConsts($prefix);
        foreach ($all as $k => $v) {
            if ($v == $value) {
                return $k;
            }
        }

        return false;
    }

    /**
     * 获取某前缀构成的数组，Key为不带_TEXT常量的值，Value为带_TEXT常量的值
     * @param $prefix
     * @return array
     */
    public static function getConstArray($prefix)
    {
        $all = self::getConsts($prefix, true);
        $result = array();
        foreach ($all as $key => $value) {
            if (!StringHelper::isEndWith($key, "_TEXT")) {
                $result[$value] = $all[$key . "_TEXT"];
            }
        }

        return $result;
    }
}