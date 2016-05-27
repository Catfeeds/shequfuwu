/*TMODJS:{"version":10,"md5":"1d2eee4d758f2dd310cda6d95f4cb2da"}*/
template('Index_shop',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$each=$utils.$each,ads=$data.ads,value=$data.value,i=$data.i,$escape=$utils.$escape,imageUrl=$data.imageUrl,uploadsUrl=$data.uploadsUrl,shop=$data.shop,$out='';$out+=' <html> <head> <meta http-equiv="Content-type" content="text/html; charset=utf-8"> <meta name="viewport" content="width=100%, initial-scale=1, minimum-scale=1, maximum-scale=1"> <meta name="apple-mobile-web-app-capable" content="yes"> <title id="oti"></title> <link rel="stylesheet" href="__CSS__/style.css?v=17"> <link rel="stylesheet" href="__CSS__/icon/iconfont.css"> <link rel="stylesheet" href="__CSS__/iphone.css"> <link rel="stylesheet" href="__CSS__/swiper.min.css"> </head> <body> <div id="main"> <div class="header-bar"> <div class="header-title" style="display:inline-block;width:100%;">选择店铺</div> <span style="line-height:45px;position:absolute;right:5;" onclick="history.go(-1)">返回</span> </div> <!-- <div class="swiper-container"> <div class="swiper-wrapper" style="height:180px;"> ';
$each(ads,function(value,i){
$out+=' ';
if(value.adsname == 1){
$out+=' <div class="swiper-slide"> <img class="lazy" src="';
$out+=$escape(imageUrl);
$out+='/blank.gif" data-echo="';
$out+=$escape(uploadsUrl+value.savepath+value.savename);
$out+='" style="display: inline; width: 100%;"> </div> ';
}
$out+=' ';
});
$out+=' </div> <div class="swiper-pagination"></div> </div> --> <div class="mod-desc" style="background-color: ;margin-top:1px;"> ';
$each(shop,function(value,i){
$out+=' ';
if(value.status == 2){
$out+=' <div class="mod-cnt mod-cnt-5"> <a href="#/shop/';
$out+=$escape(value.id);
$out+='"> <div class="mod-icon"> <img class="lazy" src="';
$out+=$escape(imageUrl);
$out+='/blank.gif" data-echo="';
$out+=$escape(uploadsUrl+value.savepath+value.savename);
$out+='" style="display: inline;"> </div> <div class="mod-txt">';
$out+=$escape(value.name);
$out+='</div> </a> </div> ';
}
$out+=' ';
});
$out+=' </div> </div> <script> var cartData = []; var totalNum = 0; var totalPrice = 0; var area = \'\'; var payment = -1; var data = { \'config\': {$config? $config : \'[]\'}, \'user\': {$user? $user : \'[]\'}, \'ads\': {$ads? $ads : \'[]\'}, \'menu\': {$menu? $menu : \'[]\'}, \'product\': {$product? $product : \'[]\'}, \'baseUrl\': \'__APP__\', \'uploadsUrl\': \'__PUBLIC__/Uploads/\', \'imageUrl\': \'__IMG__\', \'shopID\':\'\', } // console.log(data.baseUrl); //pidong 打开当前店铺 function openTHisShop(id){ window.location.href=data.baseUrl + "/App/Index/index"; // $(".navigation-wrap").hide(); // $.ajax({ // type: "get", // url: data.baseUrl + "/App/Index/index", // data: { // id:id // }, // success: function (res) { // console.log(res); // }, // beforeSend: function () { // $(\'#page_tag_load\').show(); // }, // complete: function () { // $(\'#page_tag_load\').hide(); // } // }); } $(function(){ selectShop(); }) //pidong 打开多店铺 function selectShop(){ $.ajax({ type: "get", url: data.baseUrl + "/App/User/getShop", data: { status:2 }, success: function (res) { console.log(res); var html = \'\'; $.each(res, function (index, value) { html += \'<div class="mod-cnt mod-cnt-5"><a href="#/shop/\'+value.id+\'"><div class="mod-icon"><img class="lazy" src="\'+data.uploadsUrl+value.savepath+value.savename+\'" style="display: inline;"></div><div class="mod-txt">\'+value.name+\'</div></a></div>\'; }); $(\'.mod-desc\').html(html); }, beforeSend: function () { $(\'#page_tag_load\').show(); }, complete: function () { $(\'#page_tag_load\').hide(); } }); } </script> <script src="__JS__/jquery.min.js"></script> <script src="__JS__/path.min.js"></script> <script src="__JS__/jquery.cookie.js"></script> <script src="__JS__/swiper.min.js"></script> <script src="__JS__/jweixin-1.0.0.js"></script> <script src="__TPL_PUBLIC__/build/template.js"></script> <script src="__JS__/echo.min.js"></script> <script src="__JS__/layer.m.js"></script>  <script> $(\'#oti\').html(data.config.name); </script> </body> </html>';
return new String($out);
});