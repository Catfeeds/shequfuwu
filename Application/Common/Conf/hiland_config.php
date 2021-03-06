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


    'USER_DEFAULT_STATUS' => 1, //用户注册后默认启用

    'USER_COMEFROM_NOWEIXINUSER' => 0,// 后台注册用户，非微信用户
    'USER_COMEFROM_COMMONWEIXINUSER' => 1,// 微信用户，尚未关注公众号
    'USER_COMEFROM_SUBSCRIBEDWEIXINUSER' => 2,// 微信用户，已经关注公众号

    'SYSTEM_PAY_WEIXIN_COMMISSION' => "0.6%", //需要客户承担的微信支付手续费
    'SYSTEM_PAY_ZHIFUBAO_COMMISSION' => "0.6%",//需要客户承担的支付宝支付手续费

    'USER_SCORES_MEDALS' => array(
        'L1' => array('NAME' => '士兵',
            'MIN' => 0,
            'MAX' => 50,
        ),
        'L10' => array('NAME' => '排长',
            'MIN' => 50,
            'MAX' => 100,
        ),
        'L20' => array('NAME' => '连长',
            'MIN' => 100,
            'MAX' => 150,
        ),
        'L30' => array('NAME' => '营长',
            'MIN' => 150,
            'MAX' => 200,
        ),
        'L40' => array('NAME' => '团长',
            'MIN' => 200,
            'MAX' => 300,
        ),
        'L50' => array('NAME' => '旅长',
            'MIN' => 300,
            'MAX' => 400,
        ),
        'L60' => array('NAME' => '师长',
            'MIN' => 400,
            'MAX' => 600,
        ),
        'L70' => array('NAME' => '军长',
            'MIN' => 600,
            'MAX' => 1000,
        ),
        'L80' => array('NAME' => '司令',
            'MIN' => 1000,
            'MAX' => 100000000000000,
        ),
    ),
);
