<?php
/**
 * Created by PhpStorm.
 * User: xiedalie
 * Date: 2016/7/10
 * Time: 9:44
 */

namespace Common\Model;


class WechatBiz
{
    public static function getWechat()
    {
        Vendor("Wechat.wechat#class");
        $config = D("WxConfig")->get();

        $options = array(
            'token' => $config ["token"], //填写你设定的key
            'encodingaeskey' => $config ["encodingaeskey"], //填写加密用的EncodingAESKey
            'appid' => $config ["appid"], //填写高级调用功能的app id
            'appsecret' => $config ["appsecret"] //填写高级调用功能的密钥
        );
        $wecaht = new \Wechat ($options);
        
        //S($cacheKey, $wecaht);

        return $wecaht;
    }

    public static function getQRCodeUrl($key="0"){
        $wecaht = self::getWechat();
        $ticket = $wecaht->getQRCode($key, 1);
        $qrcode = $wecaht->getQRUrl($ticket["ticket"]);
        return $qrcode;
    }


}