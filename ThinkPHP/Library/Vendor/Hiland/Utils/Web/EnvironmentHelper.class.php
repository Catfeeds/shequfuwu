<?php
namespace Vendor\Hiland\Utils\Web;

use Vendor\Hiland\Utils\Data\StringHelper;

class EnvironmentHelper
{
    /**
     * 判断当前服务器系统
     * @return string
     */
    public static function getOS()
    {
        if (PATH_SEPARATOR == ':') {
            return 'Linux';
        } else {
            return 'Windows';
        }
    }

    /**
     * 获取数字表示的php版本号（主版本号用整数表示，其他版本号在小数点后面排列）
     * @return number
     */
    public static function getPHPVersion()
    {
        $version = '';
        $array = explode('.', PHP_VERSION);
        foreach ($array as $k) {
            if (!StringHelper::isContains($version, '.')) {
                $version .= $k . '.';
            } else {
                $version .= $k;
            }
        }
        return (float)$version;
    }

    /**
     * 获取Web服务器名称
     * @return mixed
     */
    public static function getWebServerName(){
        return $_SERVER['SERVER_SOFTWARE'];
    }


    /**
     * 获取托管平台的名称
     * @return string
     */
    public static function getDepositoryPlateformName()
    {
        // 自动识别SAE环境
        if (function_exists('saeAutoLoader')) {
            return 'sae';
        }else{
            return 'file';
        }
    }
}

?>