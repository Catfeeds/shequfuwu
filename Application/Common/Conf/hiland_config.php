<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/6/3
 * Time: 8:28
 */

return array(
    'PROJECT_NAME' => '福轮网络社区服务系统',
    'PROJECT_NAME_SHORT' => '福轮网络',
    'PROJECT_DESCRIPTION' => '福轮网络拉近你好！购物就从福轮开始。',

    'BROWSE_MUST_SUBSCRIBE' => true, //用户订阅公众号之后才能浏览购物


    'APP_ITEM_COUNT_PER_PAGE' => 5, //在手机app中每页显示信息的条目数
    'SYSTEM_ITEM_COUNT_PER_PAGE' => 10, //在电脑中每页显示信息的条目数
    'SYSTEM_ITEM_COUNT_PER_PAGE_SMALL' => 5,//在电脑中每页显示信息的条目数
    'SYSTEM_ITEM_COUNT_PER_PAGE_LARGE' => 20,//在电脑中每页显示信息的条目数


    'USER_DEFAULT_STATUS' => 1, //用户注册后默认启用

    'USER_COMEFROM_NOWEIXINUSER' => 0,// 后台注册用户，非微信用户
    'USER_COMEFROM_COMMONWEIXINUSER' => 1,// 微信用户，尚未关注公众号
    'USER_COMEFROM_SUBSCRIBEDWEIXINUSER' => 2,// 微信用户，已经关注公众号
);
