/*TMODJS:{"version":134,"md5":"0d9db103dc564aa7ba3f00d4b470dfee"}*/
template('Index_index','<html> <head> <meta http-equiv="Content-type" content="text/html; charset=utf-8"> <meta name="viewport" content="width=100%, initial-scale=1, minimum-scale=1, maximum-scale=1"> <meta name="apple-mobile-web-app-capable" content="yes"> <title id="oti"></title> <link rel="stylesheet" href="__CSS__/style.css?v=19"> <link rel="stylesheet" href="__CSS__/shop.css?v=2"> <link rel="stylesheet" href="__CSS__/icon/iconfont.css"> <link rel="stylesheet" href="__CSS__/iphone.css"> <link rel="stylesheet" href="__CSS__/swiper.min.css"> </head> <body> <div id="main"></div> <div id="page_tag_load"><img src="__IMG__/ajax-loader.gif" alt="loader"></div> <div class="navigation-wrap"> <a class="navigation-item selected" id="nav-ads" href="#/index" onclick="openAds(this)"> <div class="icon-home selected"></div> <div>首页</div> </a> <a class="navigation-item" id="nav-product" href="#/product" onclick="openProduct(this)"> <div class="icon-product"></div> <div>全部商品</div> </a> <a class="navigation-item" id="nav-cart" href="#/cart" onclick="openCart(this)"> <div class="icon-cart"> <div class="icon-hit" id="shopcart-tip" style="display:none"></div> </div> <div>购物车</div> </a> <a class="navigation-item" id="nav-user" href="#/user" onclick="openUser(this)"> <div class="icon-user"></div> <div>我的</div> </a> </div> <script> var cartData = []; var totalNum = 0; var totalPrice = 0; var area = \'\'; var payment = -1; var data = { \'wxConfig\': {$wxConfig? $wxConfig : \'[]\'}, \'config\': {$config? $config : \'[]\'}, \'user\': {$user? $user : \'[]\'}, \'ads\': {$ads? $ads : \'[]\'}, \'menu\': {$menu? $menu : \'[]\'}, \'product\': {$product? $product : \'[]\'}, \'baseUrl\': \'__APP__\', \'uploadsUrl\': \'__PUBLIC__/Uploads/\', \'imageUrl\': \'__IMG__\', \'shopId\': \'\', } console.log(data); </script> <script src="__JS__/jquery.min.js"></script> <script src="__JS__/path.min.js"></script> <script src="__JS__/jquery.cookie.js"></script> <script src="__JS__/swiper.min.js"></script> <script src="__JS__/jweixin-1.0.0.js"></script> <script src="__TPL_PUBLIC__/build/template.js?v=<?php echo mt_rand() ?>"></script> <script src="__JS__/echo.min.js"></script> <script src="__JS__/layer.m.js"></script> <script src="__JS__/wemall.js?v=<?php echo mt_rand() ?>"></script> <script> $(\'#oti\').html(\'欢迎来到\' +data.config.name); initShop({$shopId}); </script> </body> </html>');