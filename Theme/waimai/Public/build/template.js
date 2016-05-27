/*TMODJS:{"version":"1.0.0"}*/
!function(){function a(a,b){return(/string|function/.test(typeof b)?h:g)(a,b)}function b(a,c){return"string"!=typeof a&&(c=typeof a,"number"===c?a+="":a="function"===c?b(a.call(a)):""),a}function c(a){return l[a]}function d(a){return b(a).replace(/&(?![\w#]+;)|[<>"']/g,c)}function e(a,b){if(m(a))for(var c=0,d=a.length;d>c;c++)b.call(a,a[c],c,a);else for(c in a)b.call(a,a[c],c)}function f(a,b){var c=/(\/)[^\/]+\1\.\.\1/,d=("./"+a).replace(/[^\/]+$/,""),e=d+b;for(e=e.replace(/\/\.\//g,"/");e.match(c);)e=e.replace(c,"/");return e}function g(b,c){var d=a.get(b)||i({filename:b,name:"Render Error",message:"Template not found"});return c?d(c):d}function h(a,b){if("string"==typeof b){var c=b;b=function(){return new k(c)}}var d=j[a]=function(c){try{return new b(c,a)+""}catch(d){return i(d)()}};return d.prototype=b.prototype=n,d.toString=function(){return b+""},d}function i(a){var b="{Template Error}",c=a.stack||"";if(c)c=c.split("\n").slice(0,2).join("\n");else for(var d in a)c+="<"+d+">\n"+a[d]+"\n\n";return function(){return"object"==typeof console&&console.error(b+"\n\n"+c),b}}var j=a.cache={},k=this.String,l={"<":"&#60;",">":"&#62;",'"':"&#34;","'":"&#39;","&":"&#38;"},m=Array.isArray||function(a){return"[object Array]"==={}.toString.call(a)},n=a.utils={$helpers:{},$include:function(a,b,c){return a=f(c,a),g(a,b)},$string:b,$escape:d,$each:e},o=a.helpers=n.$helpers;a.get=function(a){return j[a.replace(/^\.\//,"")]},a.helper=function(a,b){o[a]=b},"function"==typeof define?define(function(){return a}):"undefined"!=typeof exports?module.exports=a:this.template=a,/*v:171*/
a("ads-container",function(a){"use strict";var b=this,c=(b.$helpers,b.$escape),d=a.imageUrl,e=b.$each,f=a.ads,g=(a.value,a.i,a.uploadsUrl),h=a.product,i="";return i+='<div class="header-bar select-shopbar"> <div class="header-title" style="display:inline-block;">{$name}</div> <span style="line-height:45px;position:absolute;"> <a href="#/selectShop" id="selectShop"> <img class="dianpu-img" src="',i+=c(d),i+='/dianpu.png"> </a> </span> </div> <div class="swiper-container"> <div class="swiper-wrapper" style="height:180px;"> ',e(f,function(a){i+=" ",1==a.adsname&&(i+=' <div class="swiper-slide"> <img class="lazy" src="',i+=c(d),i+='/blank.gif" data-echo="',i+=c(g+a.savepath+a.savename),i+='" style="display: inline; width: 100%;"> </div> '),i+=" "}),i+=' </div> <div class="swiper-pagination"></div> </div> <div class="mod-desc"> ',e(f,function(a){i+=" ",2==a.adsname&&(i+=' <div class="mod-cnt mod-cnt-5"> <a href="',i+=c(a.url),i+='"> <div class="mod-icon"> <img class="lazy" src="',i+=c(d),i+='/blank.gif" data-echo="',i+=c(g+a.savepath+a.savename),i+='" style="display: inline;"> </div> <div class="mod-txt">',i+=c(a.name),i+="</div> </a> </div> "),i+=" "}),i+=' </div> <section class="m-component-promotion" id="list-section"> <div class="mod-title" style="padding-top: 5px;">\u70ed\u95e8\u6d3b\u52a8</div> <ul class="list-unstyled" id="list-sale"> ',e(f,function(a){i+=" ",3==a.adsname&&(i+=" <li> <a onclick=\"clickItemDetail('",i+=c(a.remark),i+='\')"><img class="lazy" src="',i+=c(d),i+='/blank.gif" data-echo="',i+=c(g+a.savepath+a.savename),i+='" style="display: inline; height: 137px;"></a> </li> '),i+=" "}),i+=' </ul> </section> <div id="product-hot"> <div class="mod-title">\u63a8\u8350</div> <ul> ',e(h,function(a){i+=" ","\u63a8\u8350"==a.label&&(i+=' <li class="item ',1==a.recommend&&(i+="large"),i+='" label-cate="',i+=c(a.menu_id),i+='" label-id="',i+=c(a.id),i+='"> <a href="#/product/',i+=c(a.id),i+='" title=""> <div class="item-image"><img src="',i+=c(d),i+='/blank.gif" data-echo="',i+=c(g+a.savepath+a.savename),i+='" class="lazy" style="width: 100%; margin-top: 0px; display: inline;background: #FFF url(',i+=c(d),i+='/loading.gif) no-repeat center center;background-size: 30px;"> <div class="select-shadow"> <div class="select-inner"><img src="',i+=c(d),i+='/ico_select.png" alt="selected"><span>\u5df2\u9009</span></div> </div> </div> </a> <div class="single-item-info"> <div class="item-title">',i+=c(a.name),i+='</div> <div class="item-price-show"> <div class="item-price"><span class="hotspot">\uffe5',i+=c(a.price),i+="</span></div> </div> ",1==a.status?(i+=' <div class="message-icon"style="right:0px;"> ',a.sku.length?(i+=' <input class="numbers-add" type="button" onclick="clickItemDetail(\'',i+=c(a.id),i+="')\"> "):(i+=' <input class="numbers-minus" type="button" onclick="reducehotproductNum(this,\'',i+=c(a.id),i+='\' , false)" style="display: none;"> <input class="numbers" type="text" value="0" style="display: none;"> <input class="numbers-add" type="button" onclick="doCart(this ,\'',i+=c(a.id),i+="','",i+=c(a.name),i+="','",i+=c(a.price),i+="','')\"> "),i+=" </div> "):0==a.status&&(i+=' <div class="item-amount"><span>\u5df2\u552e\u7f44</span></div> '),i+=" </div> </li> "),i+=" "}),i+=' </ul> <div class="copyright" style="text-align: center;margin: 20px 0px 70px 0px;color: #ccc;font-size: 12px;float: left;width: 100%">&nbsp;</div> </div> ',new k(i)}),/*v:5*/
a("cart-container",function(a){"use strict";var b=this,c=(b.$helpers,b.$escape),d=a.config,e="";return e+='<div class="container-gird"> <div class="confirmation-form"> <div class="confirmation-header"> <span>\u8ba2\u5355\u786e\u8ba4</span> </div> <div class="confirmation-list" id="item-list"> <div class="dotted-divider" style="width: 105.263157894737%; margin-left: -2.9%"></div> <ul>  </ul> <div class="total-info"> <span class="items-total-amount">\u8fd0\u8d39\uff1a<span id="items-total-amount">',e+=c(d.freight),e+='</span>\u5143</span> <span class="items-total-amount">\u6ee1\uff1a<span>',e+=c(d.full),e+='</span>\u5143</span> <span class="items-total-amount">\u51cf\uff1a<span>',e+=c(d.discount),e+='</span>\u5143</span> <span class="items-total-price">\u603b\u8ba1\uff1a<span id="items-total-price">0</span>\u5143</span> </div> </div> </div> </div> <a class="next mybtn" href="javascript:cartNext();" > <span class="pi_next" style="display: block; height: 39px; font-size: 1.2em;margin: 10px;background: #FF4146;color: #ffffff;border-radius: 6px;border: 0.5px solid #c3c4c8;">\u4e0b\u4e00\u6b65</span> </a> <div style="padding-top:190px;"></div>',new k(e)}),/*v:4*/
a("delivery-container",function(a){"use strict";var b=this,c=(b.$helpers,a.config),d="";return d+='<div class="confirmation-form"> <div class="confirmation-header-nb"> <span>\u6536\u8d27\u4eba\u4fe1\u606f</span> <div class="dotted-divider"></div> </div> <div class="container-gird"> <form class="delivery-info"> <ul class="form_table"> <li> <span class="td_left">\u59d3\u540d</span> <span class="td_right"> <input type="text" name="username" id="username" placeholder="\u52a1\u5fc5\u4f7f\u7528\u771f\u5b9e\u59d3\u540d" value="" required=""> <input type="hidden" name="id" id="id" value="0"> </span> </li> <li> <span class="td_left">\u624b\u673a</span> <span class="td_right"><input type="text" name="tel" id="tel" placeholder="" value="" required=""></span> </li> <li> <span class="td_left">\u5730\u5740</span> <span class="td_right"> <select id="hat_city" name="hat_city" class="hat_select" onchange="changeCity(this)"> </select> <select id="hat_area" name="hat_area" class="hat_select"> </select> </span> </li> <li> <span class="td_left"></span> <span class="td_right"> <input type="text" name="address" id="address" placeholder="\u8be6\u7ec6\u5730\u5740" value="" required=""> </span> </li> <li> <span class="td_left">\u5907\u6ce8</span> <span class="td_right"><input type="text" name="note" id="note" placeholder="\u9009\u586b"></span> </li> <li> <span class="td_left">\u914d\u9001\u65f6\u95f4</span> <span class="td_right"> <select id="deliveryTime" name="deliveryTime" class="hat_select"> </select> </span> </li> <li></li> </ul> </form> </div> </div> <div class="payment"> <p class="heading">\u652f\u4ed8\u65b9\u5f0f</p> <div class="container-gird"> <div class="payment-content"> ',"1"==c.balance_payment&&(d+=' <span class="line" id="balance-payment"> <span class="radio"></span> <span class="label">\u8d26\u6237\u652f\u4ed8</span> </span> '),d+=" ","1"==c.wechat_payment&&(d+=' <span class="line" id="wechat-payment"> <span class="radio"></span> <span class="label">\u5fae\u4fe1\u652f\u4ed8</span> </span> '),d+=" ","1"==c.alipay_payment&&(d+=' <span class="line" id="alipay-payment"> <span class="radio"></span> <span class="label">\u652f\u4ed8\u5b9d\u652f\u4ed8</span> </span> '),d+=" ","1"==c.cool_payment&&(d+=' <span class="line" id="cool-payment"> <span class="radio"></span> <span class="label">\u8d27\u5230\u4ed8\u6b3e</span> </span> '),d+=' </div> </div> </div> <a class="next mybtn" href="javascript:submitOrder();" > <span class="pi_next1" style="display: block; height: 39px; font-size: 1.2em;margin: 10px;background: #FF4146;color: #ffffff;border-radius: 6px;border: 0.5px solid #c3c4c8;">\u63d0\u4ea4\u8ba2\u5355</span> </a> <div style="padding-top:80px;"> <a href="javascript:void(0);" style="text-align: center;color: #949494;font-size: 12px;display: block;"></a> </div>',new k(d)}),/*v:1*/
a("forgetPassword-container",'<div class="container-gird"> <div class="login-form"> <table style="width:100%;"> <tbody> <tr> <td style="text-align:left;width:30%;"><label>\u7528\u6237\u540d\uff1a</label></td> <td colspan="2" style="text-align:left;width:60%;"><input style="width:86%;" type="text" name="forgetUsername" id="forgetUsername"></td> <td style="width:10%"><span class="clear-input" onclick="empty(\'forgetUsername\');"></span></td> </tr> <tr> <td style="text-align:left;width:30%;"><label>\u624b\u673a\u53f7\uff1a</label></td> <td colspan="2" style="text-align:left;width:60%;"><input style="width:86%;" type="tel" name="forgetPhone" id="forgetPhone"></td> <td style="width:10%"><span class="clear-input" onclick="empty(\'forgetPhone\');"></span></td> </tr> <tr> <td style="text-align:left;width:30%;"><label>\u65b0\u5bc6\u7801\uff1a</label></td> <td colspan="2" style="text-align:left;width:60%;"><input style="width:86%;" type="tel" name="forgetPassword" id="forgetPassword"></td> <td style="width:10%"><span class="clear-input" onclick="empty(\'forgetPassword\');"></span></td> </tr> </tbody> </table> <table style="width:100%;padding: 5% 0;"> <tbody> <tr> <td> <button id="forgetSubmit" onclick="resetPassword()" class="mybtn" style="width:100%;">\u63d0\u4ea4</button> </td> </tr> </tbody> </table> </div> </div>'),/*v:122*/
a("Index_index",'<html> <head> <meta http-equiv="Content-type" content="text/html; charset=utf-8"> <meta name="viewport" content="width=100%, initial-scale=1, minimum-scale=1, maximum-scale=1"> <meta name="apple-mobile-web-app-capable" content="yes"> <title id="oti"></title> <link rel="stylesheet" href="__CSS__/style.css?v=7"> <link rel="stylesheet" href="__CSS__/shop.css?v=2"> <link rel="stylesheet" href="__CSS__/icon/iconfont.css"> <link rel="stylesheet" href="__CSS__/iphone.css"> <link rel="stylesheet" href="__CSS__/swiper.min.css"> </head> <body> <div id="main"></div> <div id="page_tag_load"><img src="__IMG__/ajax-loader.gif" alt="loader"></div> <div class="navigation-wrap"> <a class="navigation-item selected" id="nav-ads" href="#/index" onclick="openAds(this)"> <div class="icon-home selected"></div> <div>\u9996\u9875</div> </a> <a class="navigation-item" id="nav-product" href="#/product" onclick="openProduct(this)"> <div class="icon-product"></div> <div>\u5168\u90e8\u5546\u54c1</div> </a> <a class="navigation-item" id="nav-cart" href="#/cart" onclick="openCart(this)"> <div class="icon-cart"> <div class="icon-hit" id="shopcart-tip" style="display:none"></div> </div> <div>\u8d2d\u7269\u8f66</div> </a> <a class="navigation-item" id="nav-user" href="#/user" onclick="openUser(this)"> <div class="icon-user"></div> <div>\u6211\u7684</div> </a> </div> <script> var cartData = []; var totalNum = 0; var totalPrice = 0; var area = \'\'; var payment = -1; var data = { \'wxConfig\': {$wxConfig? $wxConfig : \'[]\'}, \'config\': {$config? $config : \'[]\'}, \'user\': {$user? $user : \'[]\'}, \'ads\': {$ads? $ads : \'[]\'}, \'menu\': {$menu? $menu : \'[]\'}, \'product\': {$product? $product : \'[]\'}, \'baseUrl\': \'__APP__\', \'uploadsUrl\': \'__PUBLIC__/Uploads/\', \'imageUrl\': \'__IMG__\', \'shopId\':\'\', } console.log(data); </script> <script src="__JS__/jquery.min.js"></script> <script src="__JS__/path.min.js"></script> <script src="__JS__/jquery.cookie.js"></script> <script src="__JS__/swiper.min.js"></script> <script src="__JS__/jweixin-1.0.0.js"></script> <script src="__TPL_PUBLIC__/build/template.js"></script> <script src="__JS__/echo.min.js"></script> <script src="__JS__/layer.m.js"></script> <script src="__JS__/wemall.js?v=7"></script> <script> $(\'#oti\').html(data.config.name); </script> </body> </html>'),/*v:11*/
a("itemsDetail-container",'<div class="detail" id="itemsDetail"> <div class="container-gird"> <div class="swiper-container" style="height: 200px"> <div class="swiper-wrapper">  </div>  <div class="swiper-scrollbar"></div> </div> <img class="detail-image" src=""> <div class="detail-msg"> <span class="single-name"></span>  </div> <div class="detail-msg"> <span class="detail-price"> <span class="new-price">\uffe5<span></span></span> </span> <span class="detail-label"></span> </div> <div class="detail-msg none" style="padding-bottom: 12px;" id="product-attr"> <span class="detail-attr"> <span>\u5546\u54c1\u5c5e\u6027</span><br/> <span id="detail-attr-btn"></span> </span> </div> <div class="select-area" id="addCartBtn" style="display: none"> <button class="addItem btn-shopping" onclick=""><i class="ico ico-shop"></i>\u6dfb\u52a0\u5230\u8d2d\u7269\u8f66</button> </div> <div class="select-area" id="soldOut" style="display: none"> <span style="float: right;color: #646464;">\u5df2\u552e\u7f44</span> </div> </div> <div class="detail-content"> <div class="container-gird"> <p class="detail-score">\u8d60\u9001\u79ef\u5206\uff1a<span style="font-weight: normal;"></span></p> </div> <div class="container-gird"> <p class="detail-title">\u5546\u54c1\u8be6\u60c5</p> <div></div> </div> <div class="container-gird"> <p class="detail-commit">\u5546\u54c1\u8bc4\u8bba</p> <div style="text-align: center"> <ul id="commentList"> </ul>  </div> </div> </div> <div class="backToTop"> <div class="backToTop-inner" onclick="backToTop()"> <i class="ico ico-top"></i><span>\u56de\u5230\u9876\u90e8</span> </div> </div> </div>'),/*v:1*/
a("login-container",function(a){"use strict";var b=this,c=(b.$helpers,b.$escape),d=a.title,e="";return e+='<div class="container-gird"> <div class="login-header"> <center><h3>',e+=c(d),e+='</h3></center> <span class="login-tips">\u6e29\u99a8\u63d0\u793a\uff1a\u8d26\u53f7\u6ce8\u518c\u652f\u6301App\u7aef\u767b\u5f55</span> </div> <div class="login-form"> <table style="width:100%;"> <tbody> <tr> <td style="text-align:left;width:30%;"><label>\u624b\u673a\u53f7\uff1a</label></td> <td colspan="2" style="text-align:left;width:60%;"><input style="width:86%;" type="text" name="loginPhone" id="loginPhone"></td> <td style="width:10%"><span class="clear-input" onclick="empty(\'loginPhone\');"></span></td> </tr> <tr> <td style="text-align:left;width:30%;"><label>\u5bc6&nbsp;&nbsp;&nbsp;&nbsp;\u7801\uff1a</label></td> <td colspan="2" style="text-align:left;width:60%;"><input style="width:86%;" type="password" name="loginPassword" id="loginPassword"></td> <td style="width:10%"><span class="clear-input" onclick="empty(\'loginPassword\');"></span></td> </tr> </tbody> </table> <table style="width:100%;padding: 5% 0;"> <tbody> <tr> <td> <button id="login" class="mybtn" onclick="login()" style="width:100%;">\u767b \u5f55</button> </td> </tr> <tr> <td style="text-align:left"> <button class="back" style="width:15%;" onclick="openRegister()">\u6ce8 \u518c</button> <button class="forgetPassword" style="float:right" onclick="openForgetPassword()">\u627e\u56de\u5bc6\u7801?</button> </td> </tr> </tbody> </table> </div> </div>',new k(e)}),/*v:1*/
a("orderResult-container",function(a){"use strict";var b=this,c=(b.$helpers,b.$escape),d=a.config,e="";return e+='<div class="container-gird" id="orderResult"> <div class="orderResult-header"> <span> <i class="ico ico-succ"></i>&nbsp;&nbsp;\u4e0b\u5355\u6210\u529f-<span id="status"></span> </span> </div> <div class="orderResultList-container"> <div> <div class="orderResult-form"> <div class="orderResult-list" id="items-order-result"> <div class="order-info"> <span> \u8ba2\u5355\u53f7\uff1a<span id="result-order-no"></span> </span> <span class="date" style="float: right"></span> </div> <div class="order-list" id="item-order-list"> <ul> </ul> </div> <div class="divider"></div> <div class="total-info"> <span class="deliver">\u8fd0\u8d39\uff1a<span class="freight">0</span>\u5143 </span> <span class="deliver" style="margin-left: 6px;">\u4f18\u60e0\uff1a<span class="discount">0</span>\u5143 </span> <span class="total">\u5171<span>0</span>\u5143 </span>  </div> </div> </div> <div class="tips" id="items-tips"> <span>\u6e29\u99a8\u63d0\u793a\uff1a<span id="timeBox">',e+=c(d.reminder),e+='</span></span> </div> </div> </div> </div> <div style="padding-top:80px;"> <a href="javascript:void(0);" style="text-align: center;color: #949494;font-size: 12px;display: block;"></a> </div>',new k(e)}),/*v:1*/
a("popup",function(a){"use strict";var b=this,c=(b.$helpers,b.$escape),d=a.header,e=a.tips,f="";return f+='<div id="popup" class="popup"> <div class="popup-header">',f+=c(d),f+='</div> <div class="popup-tips"> ',e?(f+=" ",f+=c(e),f+=" "):f+=' <input style="width: 86%;margin: 0px 10px 10px 10px;height: 20%;" type="number" id="popup-number"> ',f+=' </div> <div class="btn-group"> <button class="btn" id="yes" onclick="confirmPopup()">\u786e\u5b9a</button> <button class="btn" id="cancel" onclick="closePopup()">\u53d6\u6d88</button> </div> </div>',new k(f)}),/*v:1*/
a("product-container",function(a,b){"use strict";var c=this,d=(c.$helpers,function(d,f){f=f||a;var g=c.$include(d,f,b);return e+=g}),e="";return e+='<div id="mainList" class="main"> <div id="items" class="items"> ',d("./productList-container"),e+=" </div> </div> ",new k(e)}),/*v:18*/
a("productList-container",function(a){"use strict";var b=this,c=(b.$helpers,b.$each),d=a.menu,e=(a.value,a.i,b.$escape),f=a.product,g=a.imageUrl,h=a.uploadsUrl,i="";return i+='<div class="header-bar"> <div id="header-searchInput"> <div class="input-group"> <div class="input-text"> <i class="iconfont">&#xe601;</i> <div class="ui-suggestion-mask"> <input class="icon-input" name="searchtxt" type="search" placeholder="\u8f93\u5165\u641c\u7d22\u5546\u54c1"> <div class="widget-common-eraser widget-common-eraser-hidden"></div> </div> </div> <input type="button"class="search-btn" onclick="openSearch()" value="\u641c\u7d22"> </div> </div> </div> <ul class="shop-menu"> ',c(d,function(a){i+=" <li onclick=\"switchMenu(this,'",i+=e(a.id),i+="','')\"> <span>",i+=e(a.name),i+="</span> </li> "}),i+=' <div style="height: 200px;"></div> </ul> <div class="shop-product">  <ul class="mui-table-view mui-table-viewa" id="items"> ',c(f,function(a){i+=' <li class="mui-table-view-cell mui-media" label-cate="',i+=e(a.menu_id),i+='" label-id="',i+=e(a.id),i+='" style="display: none"> <img onclick="prevView(this)" class="mui-media-object mui-pull-left mui-pull-lefts" src="',i+=e(g),i+='/blank.gif" style="background: #FFF url(',i+=e(g),i+='/loading.gif) no-repeat center center;background-size: 20px;" data-echo="',i+=e(h+a.savepath+a.savename),i+='"> <div class="mui-media-body"> <a href="#/product/',i+=e(a.id),i+='" title=""> <span class="product-name">',i+=e(a.name),i+='</span> </a> <span class="monthlySales"><span>',i+=e(a.subname),i+='</span></span> <span class="mui-ellipsis mui-ellipsisa">\uffe5',i+=e(a.price),i+='</span> <div class="message-icon"> <input class="numbers-minus" type="button" onclick="reducehotproductNum(this,\'',i+=e(a.id),i+='\' , false)" style="display: none;"> <input class="numbers" type="text" value="0" style="display: none;"> <input class="numbers-add" type="button" onclick="doCart(this ,\'',i+=e(a.id),i+="','",i+=e(a.name),i+="','",i+=e(a.price),i+="','')\"> </div> </div> </li> "}),i+=' </ul> </div> <div id="shopmenu-cart"> <div id="shopmenu-cart-bar" class="shopmenu-cart-bar"> <div class="row-num" onclick="location.href=\'#/cart\'" ng-class="shopCartAnimate"><em class="cart-count " id="shopcart-tip" style="display:none">1</em> </div> <div class="row-cart"> <div class="price-info"> <div class="cart-price" >\u5171&nbsp;\xa5<span id="shopcart-totalPrice">0.00</span>\u5143</div> <div class="cart-premium" style="display: none;"></div> </div> <a class="row-status" style="display: none;">\u5dee\xa58\u8d77\u9001</a> </div> <a class="row-status" id="shopcart-sure" onclick="openCartsure()" style="display: none;">\u9009\u597d\u4e86</a> </div> </div> ',new k(i)}),/*v:2*/
a("Public/css/icon/demo",' <!DOCTYPE html> <html> <head> <meta charset="utf-8"/> <title>IconFont</title> <link rel="stylesheet" href="demo.css"> <link rel="stylesheet" href="iconfont.css"> </head> <body> <div class="main"> <h1>IconFont \u56fe\u6807</h1> <ul class="icon_lists clear"> <li> <i class="icon iconfont">&#xe600;</i> <div class="name">\u5b9a\u4f4d</div> <div class="code">&amp;#xe600;</div> <div class="fontclass">.dingwei</div> </li> <li> <i class="icon iconfont">&#xe601;</i> <div class="name">sousuo</div> <div class="code">&amp;#xe601;</div> <div class="fontclass">.sousuo</div> </li> </ul> <div class="helps"> \u7b2c\u4e00\u6b65\uff1a\u4f7f\u7528font-face\u58f0\u660e\u5b57\u4f53 <pre> @font-face {font-family: \'iconfont\'; src: url(\'iconfont.eot\'); /* IE9*/ src: url(\'iconfont.eot?#iefix\') format(\'embedded-opentype\'), /* IE6-IE8 */ url(\'iconfont.woff\') format(\'woff\'), /* chrome\u3001firefox */ url(\'iconfont.ttf\') format(\'truetype\'), /* chrome\u3001firefox\u3001opera\u3001Safari, Android, iOS 4.2+*/ url(\'iconfont.svg#iconfont\') format(\'svg\'); /* iOS 4.1- */ } </pre> \u7b2c\u4e8c\u6b65\uff1a\u5b9a\u4e49\u4f7f\u7528iconfont\u7684\u6837\u5f0f <pre> .iconfont{ font-family:"iconfont" !important; font-size:16px;font-style:normal; -webkit-font-smoothing: antialiased; -webkit-text-stroke-width: 0.2px; -moz-osx-font-smoothing: grayscale;} </pre> \u7b2c\u4e09\u6b65\uff1a\u6311\u9009\u76f8\u5e94\u56fe\u6807\u5e76\u83b7\u53d6\u5b57\u4f53\u7f16\u7801\uff0c\u5e94\u7528\u4e8e\u9875\u9762 <pre> &lt;i class="iconfont"&gt;&amp;#x33;&lt;/i&gt; </pre> </div> </div> </body> </html> '),/*v:1*/
a("qrcodePay-container",function(a){"use strict";var b=this,c=(b.$helpers,b.$escape),d=a.qrcode,e="";return e+='<div class="orderResult-header"> <span> <i class=""></i>\u5fae\u4fe1\u626b\u7801\u652f\u4ed8</span> </div> <div class="orderResultList-container"> <div> <div class="orderResult-form"> <div class="orderResult-list"> <div class="order-info" style="text-align:center;"><img id="qrcodePay" style="width: 200px; height: 200px;" src="',e+=c(d),e+='"> </div> <div class="divider"></div> </div> </div> <div class="tips" style="text-align:center;"> <span>\u6e29\u99a8\u63d0\u793a\uff1a\u7531\u4e8e\u5fae\u4fe1\u8ba2\u9605\u53f7\u4e0d\u652f\u6301\u5fae\u4fe1\u652f\u4ed8\uff0c\u8bf7\u957f\u6309\u56fe\u7247\u3010\u8bc6\u522b\u4e8c\u7ef4\u7801\u3011\u4ed8\u6b3e</span> </div> </div> </div>',new k(e)}),/*v:1*/
a("register-container",function(a){"use strict";var b=this,c=(b.$helpers,b.$escape),d=a.title,e="";return e+='<div class="container-gird"> <div class="login-header"> <center><h3>',e+=c(d),e+='</h3></center> <span class="login-tips">\u6e29\u99a8\u63d0\u793a\uff1a\u8d26\u53f7\u6ce8\u518c\u652f\u6301App\u7aef\u767b\u5f55</span> </div> <div class="login-form"> <table style="width:100%;"> <tr> <td style="text-align:left;width:30%;"><label>\u7528\u6237\u540d\uff1a</label></td> <td colspan="2" style="text-align:left;width:60%;"><input style="width:86%;" type="text" name="registerUsername" id="registerUsername"></td> <td style="width:10%"><span class="clear-input" onclick="empty(\'registerUsername\');"></span></td> </tr> <tr> <td style="text-align:left;width:30%;"><label>\u624b\u673a\u53f7\uff1a</label></td> <td colspan="2" style="text-align:left;width:60%;"><input style="width:86%;" type="tel" name="registerPhone" id="registerPhone"></td> <td style="width:10%"><span class="clear-input" onclick="empty(\'registerPhone\');"></span></td> </tr> <tr> <td style="text-align:left;width:30%;"><label>\u5bc6&nbsp;&nbsp;&nbsp;&nbsp;\u7801\uff1a</label></td> <td colspan="2" style="text-align:left;width:60%;"><input style="width:86%;" type="password" name="registerPassword" id="registerPassword"></td> <td style="width:10%"><span class="clear-input" onclick="empty(\'registerPassword\');"></span></td> </tr> <tr> <td style="text-align:left;width:30%;"><label>\u5bc6&nbsp;&nbsp;&nbsp;&nbsp;\u7801\uff1a</label></td> <td colspan="2" style="text-align:left;width:60%;"><input style="width:86%;" type="password" name="registerPassword2" id="registerPassword2"></td> <td style="width:10%"><span class="clear-input" onclick="empty(\'registerPassword2\');"></span></td> </tr> </tbody></table><table style="width:100%;padding: 5% 0;"> <tbody><tr> <td><button id="register" onclick="register()" class="mybtn" style="width:100%;">\u6ce8 \u518c</button></td> </tr> </tbody></table> </div> </div>',new k(e)}),/*v:164*/
a("select-shop",'<div class="header-bar select-shopbar" style="position:fixed;"> <div class="header-title" style="display:inline-block;width:100%;">\u9009\u62e9\u5e97\u94fa</div> <span id="pi_back" style="" onclick="history.go(-1)"></span> </div> <div class="pi_sousuo1" style=""> <input class="pi_input" placeholder="\u8bf7\u8f93\u5165\u5e97\u94fa\u540d\u79f0" style=""> <span class="pi_sousuo" style=""></span> <span class="pi_sousuo2" style="" onclick="searchShop();">\u641c\u7d22</span> </div> <div style="padding:5px 14px;background-color: #f5f5f5;"> <i class="iconfont" style="color:A9A9A9;">&#xe600;</i> <span id="pi_address" style=""></span> </div> <div class="shop-list" id="mod-desc"> </div> '),/*v:3*/
a("user-container",function(a){"use strict";var b=this,c=(b.$helpers,b.$escape),d=a.user,e=a.imageUrl,f="";return f+='<div class="container-gird"> <div class="confirmation-form"> <div class="confirmation-list"> <img data-echo="',f+=c(d.avater),f+='" src="',f+=c(e),f+='/blank.gif" class="avater lazy"> <div style="text-align: center;padding: 10px 0px;" id="identity">\u666e\u901a\u7528\u6237</div> <div class="divider"></div> <div class="dotted-divider" style="width: 105.263157894737%; margin-left: -2.9%"></div> <ul> <li> <div class="confirmation-item"> <div class="item-info"> <span class="item-name">\u6211\u7684\u8d26\u53f7:<br></span> </div> <div class="select-box" id="nickname">',f+=c(d.username),f+='</div> </div> <div class="divider"></div> </li> <li> <div class="confirmation-item"> <div class="item-info"> <span class="item-name">\u6211\u7684\u8d26\u6237:<br></span> </div> <div class="select-box" id="balance"></div> </div> <div class="divider"></div> </li> <li> <div class="confirmation-item"> <div class="item-info"> <span class="item-name">\u6211\u7684\u79ef\u5206:<br></span> </div> <div class="select-box" id="score"></div> </div> </li> </ul> </div> </div> </div> <div class="my-order-header"> <span>\u6211\u7684\u8ba2\u5355</span> <div class="dotted-divider"></div> </div> <div class="myOrderList none"> <div> <div class="container-gird">  <div> <div class="orderResult-list" id="items-order-result-list"> <ul> </ul> </div> </div> </div> </div> </div> <div class="history-loader"> <i class="ico ico-history"></i> <span>\u70b9\u51fb\u67e5\u770b\u5386\u53f2\u8ba2\u5355</span> </div> <div style="padding-top:80px;"> <a href="javascript:void(0);" style="text-align: center;color: #949494;font-size: 12px;display: block;"></a> </div> <div id="orderCancel-popup" class="popup none"> <div class="popup-header">\u786e\u5b9a\u53d6\u6d88\u8ba2\u5355\u5417\uff1f</div> <div class="popup-tips"></div> <div class="btn-group"> <button class="btn" id="yesOrder">\u786e\u5b9a</button> <button class="btn" id="noOrder">\u53d6\u6d88</button> </div> </div> <div id="orderComment-popup" class="popup none"> <div class="popup-header"> \u8bc4\u8bba\u8ba2\u5355 </div> <div class="popup-tips"> <input style="width: 86%;margin: 0px 10px 10px 10px;height: 20%;" type="text" id="comment-text"> </div> <div class="btn-group"> <button class="btn" id="yesCommit">\u63d0\u4ea4</button> <button class="btn" id="noCommit">\u53d6\u6d88</button> </div> </div> <div id="pay-popup" class="popup none"> <div class="popup-header"> \u8d26\u6237\u5145\u503c </div> <div class="popup-tips"> <input style="width: 86%;margin: 0px 10px 10px 10px;height: 20%;" type="number" id="pay-text"> </div> <div class="btn-group"> <button class="btn" id="yesPay">\u63d0\u4ea4</button> <button class="btn" id="noPay">\u53d6\u6d88</button> </div> </div>',new k(f)})}();