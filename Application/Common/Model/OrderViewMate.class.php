<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/14
 * Time: 14:30
 */

namespace Common\Model;


use Vendor\Hiland\Utils\DataModel\ViewMate;

class OrderViewMate extends ViewMate
{
    private $link = array(
        'OrderContact' => array(
            'mapping_type' => self::HAS_ONE,
            'mapping_name' => 'contact',
            'foreign_key' => 'order_id',//关联id
        ),
        'OrderDetail' => array(
            'mapping_type' => self::HAS_MANY,
            'mapping_name' => 'detail',
            'foreign_key' => 'order_id',
        ),
        'Shop' => array(
            'mapping_type' => self::BELONGS_TO,
            'mapping_name' => 'shop',
            'foreign_key' => 'shop_id',//关联id
        ),
    );

    /**
     * 构造函数
     */
    public function __construct()
    {
        parent::__construct('order',$this->link);
    }
}