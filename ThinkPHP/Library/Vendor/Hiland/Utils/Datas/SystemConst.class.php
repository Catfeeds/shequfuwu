<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/23
 * Time: 9:39
 */

namespace Vendor\Hiland\Utils\Datas;

use Vendor\Hiland\Utils\DataConstructure\ConstMate;

/**
 * 常量命名有3部分（或4部分组成）
 *  第一部分为业务领域，比如订单、比如员工等
 *  第二部分为业务属性，比如订单配送状态、员工性别等
 *  第三部分为业务属性的取值，比如订单已经配送，订单已经取消等
 *  第四部分（如果有的话）为固定的字符串“TEXT”，表示对对应常量的文字解释
 *
 * 前两部分确定某几条常量为一个组。同一个组的常量有逻辑上的关联。
 * 逻辑上无联系的常量不要使用相同的第一二部分构成的前缀。
 * Class SystemConst
 * @package Common\Model
 */
class SystemConst extends ConstMate
{
    const APP_ITEM_COUNT_PERPAGE = 5;
    const APP_ITEM_COUNT_PERPAGE_TEXT = "在手机app中每页显示信息的条目数";
    //---------------------------------------------------------------------
    const PC_ITEM_COUNT_PERPAGE_SMALL = 5;
    const PC_ITEM_COUNT_PERPAGE_SMALL_TEXT = "在电脑中每页显示信息的条目数";
    const PC_ITEM_COUNT_PERPAGE_NORMAL = 10;
    const PC_ITEM_COUNT_PERPAGE_NORMAL_TEXT = "在电脑中每页显示信息的条目数";
    const PC_ITEM_COUNT_PERPAGE_LARGE = 20;
    const PC_ITEM_COUNT_PERPAGE_LARGE_TEXT = "在电脑中每页显示信息的条目数";

}