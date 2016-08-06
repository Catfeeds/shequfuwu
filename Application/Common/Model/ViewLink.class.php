<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/21
 * Time: 17:16
 */

namespace Common\Model;


use Vendor\Hiland\Utils\DataModel\ViewMate;

class ViewLink
{
    public static function getOrder_OrderContact_OrderDetail_Shop()
    {
        $localArray = array(
            'OrderContact' => array(
                'mapping_type' => ViewMate::HAS_ONE,
                'mapping_name' => 'contact',
                'foreign_key' => 'order_id',//关联id
            ),
            'OrderDetail' => array(
                'mapping_type' => ViewMate::HAS_MANY,
                'mapping_name' => 'detail',
                'foreign_key' => 'order_id',
            ),
        );

        return array_merge($localArray, self::getCommon_Shop());
    }

    /**
     * 获取其他业务逻辑表跟Shop表联合查询的时候的连接表达式数组
     * @param string $foreignKeyName 业务逻辑表的外键名称，缺省为shop_id
     * @return array
     */
    public static function getCommon_Shop($foreignKeyName = 'shop_id')
    {
        return array(
            'Shop' => array(
                'mapping_type' => ViewMate::BELONGS_TO,
                'mapping_name' => 'shop',
                'foreign_key' => $foreignKeyName,
            ),
        );
    }

    /**
     * @return array
     */
    public static function getProduct_Shop_File()
    {
        $localArray = self::getCommon_Shop();
        return array_merge($localArray, self::getCommon_File());
    }

    /**
     * 获取其他业务逻辑表跟File表联合查询的时候的连接表达式数组
     * @param string $foreignKeyName 业务逻辑表的外键名称，缺省为file_id
     * @return array
     */
    public static function getCommon_File($foreignKeyName = 'file_id')
    {
        return array(
            'File' => array(
                'mapping_type' => ViewMate::BELONGS_TO,
                'mapping_name' => 'file',
                'foreign_key' => $foreignKeyName,//关联id
                'as_fields' => 'savename:savename,savepath:savepath',
            ),
        );
    }

    /**
     * 获取其他业务逻辑表跟Shop表联合查询的时候的连接表达式数组
     * @param string $foreignKeyName 业务逻辑表的外键名称，缺省为shop_id
     * @return array
     */
    public static function getCommon_User($foreignKeyName = 'userid')
    {
        return array(
            'User' => array(
                'mapping_type' => ViewMate::BELONGS_TO,
                'mapping_name' => 'user',
                'foreign_key' => $foreignKeyName,
            ),
        );
    }
}