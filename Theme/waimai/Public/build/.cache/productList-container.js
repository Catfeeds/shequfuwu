/*TMODJS:{"version":27,"md5":"875c08282be6584ab5d9eae8dd275c04"}*/
template('productList-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$each=$utils.$each,menu=$data.menu,value=$data.value,i=$data.i,$escape=$utils.$escape,$out='';$out+='<div class="header-bar"> <div id="header-searchInput"> <div class="input-group"> <div class="input-text"> <i class="iconfont">&#xe601;</i> <div class="ui-suggestion-mask"> <input class="icon-input" name="searchtxt" type="search" placeholder="输入搜索商品"> <div class="widget-common-eraser widget-common-eraser-hidden"></div> </div> </div> <input type="button" class="search-btn" onclick="openSearch()" value="搜索"> </div> </div> </div> <ul class="shop-menu"> ';
$each(menu,function(value,i){
$out+=' <li id="menu_li_';
$out+=$escape(value.id);
$out+='" onclick="switchMenu(this,\'';
$out+=$escape(value.id);
$out+='\',\'\')"> <span>';
$out+=$escape(value.name);
$out+='</span> </li> ';
});
$out+=' <div style="height: 200px;"></div> </ul> <div class="shop-product">  <ul class="mui-table-view mui-table-viewa" id="productInfoItems"> </ul> <script type="text/javascript"> // var lastSelectedMenuID= window.JSON.parse(window.localStorage.getItem(\'lastSelectedMenuID\')); // if(lastSelectedMenuID){ // alert(lastSelectedMenuID); // }else{ // alert(\'nnnnnooooooooooooooo\'); // } //lastSelectedMenuID //alert(\'sssssssssssssss\'); </script> </div> <div id="shopmenu-cart"> <div id="shopmenu-cart-bar" class="shopmenu-cart-bar"> <div class="row-num" onclick="location.href=\'#/cart\'" ng-class="shopCartAnimate"><em class="cart-count " id="shopcart-tip" style="display:none">1</em> </div> <div class="row-cart"> <div class="price-info"> <div class="cart-price">共&nbsp;¥<span id="shopcart-totalPrice">0.00</span>元</div> <div class="cart-premium" style="display: none;"></div> </div> <a class="row-status" style="display: none;">差¥8起送</a> </div> <a class="row-status" id="shopcart-sure" onclick="openCartsure()" style="display: none;">选好了</a> </div> </div>';
return new String($out);
});