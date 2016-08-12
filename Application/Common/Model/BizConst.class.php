<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/23
 * Time: 9:39
 */

namespace Common\Model;

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
 * Class BizConst
 * @package Common\Model
 */
class BizConst extends ConstMate
{
    const ORDER_STATUS_CANCLED = -1;
    const ORDER_STATUS_CANCLED_TEXT = "已取消";
    const ORDER_STATUS_ORIGINAL = 0;
    const ORDER_STATUS_ORIGINAL_TEXT = "未处理";
    const ORDER_STATUS_SENDING = 1;
    const ORDER_STATUS_SENDING_TEXT = "正在配送";
    const ORDER_STATUS_DONE = 2;
    const ORDER_STATUS_DONE_TEXT = "已完成";
    const ORDER_STATUS_BACKING = -2;
    const ORDER_STATUS_BACKING_TEXT = "退货中";
    const ORDER_STATUS_BACKED = -3;
    const ORDER_STATUS_BACKED_TEXT = "已退货";
    const ORDER_STATUS_ASKBACK = -4;
    const ORDER_STATUS_ASKBACK_TEXT = "申请退货";
    //----------------------------------------------------
    const ORDER_PAYSTATUS_UNPAY = 0;
    const ORDER_PAYSTATUS_UNPAY_TEXT = "未付款";
    const ORDER_PAYSTATUS_PAID = 1;
    const ORDER_PAYSTATUS_PAID_TEXT = "已付款";
    //-----------------------------------------------------
    const ORDER_PAYTYPE_LOCAL = 0;
    const ORDER_PAYTYPE_LOCAL_TEXT = "账户支付";
    const ORDER_PAYTYPE_WEIXIN = 1;
    const ORDER_PAYTYPE_WEIXIN_TEXT = "微信支付";
    const ORDER_PAYTYPE_ZHIFUBAO = 2;
    const ORDER_PAYTYPE_ZHIFUBAO_TEXT = "支付宝支付";
    const ORDER_PAYTYPE_FACE2FACE = 3;
    const ORDER_PAYTYPE_FACE2FACE_TEXT = "货到付款";
    //------------------------------------------------------
    const MARKETING_SALETYPE_RETAIL = 0;
    const MARKETING_SALETYPE_RETAIL_TEXT = "零售";
    const MARKETING_SALETYPE_WHOLE = 1;
    const MARKETING_SALETYPE_WHOLE_TEXT = "批发";
    //----------------------------------------------------------------------
    const SHOP_REVIEW_STATUS_ORIGINAL = 0;
    const SHOP_REVIEW_STATUS_ORIGINAL_TEXT = "未审核";
    const SHOP_REVIEW_STATUS_ORIGINAL_S_TEXT = "未审核";
    const SHOP_REVIEW_STATUS_REFUSED = -1;
    const SHOP_REVIEW_STATUS_REFUSED_TEXT = "关闭";
    const SHOP_REVIEW_STATUS_REFUSED_S_TEXT = "已关闭";
    const SHOP_REVIEW_STATUS_REST = 1;
    const SHOP_REVIEW_STATUS_REST_TEXT = "休息";
    const SHOP_REVIEW_STATUS_REST_S_TEXT = "休息中";
    const SHOP_REVIEW_STATUS_PASSED = 2;
    const SHOP_REVIEW_STATUS_PASSED_TEXT = "营业";
    const SHOP_REVIEW_STATUS_PASSED_S_TEXT = "营业中";
}