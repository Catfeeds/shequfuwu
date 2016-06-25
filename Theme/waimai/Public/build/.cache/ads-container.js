/*TMODJS:{"version":198,"md5":"1702f4ff13a7d8beecf42ed7f5e65b31"}*/
template('ads-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$escape=$utils.$escape,imageUrl=$data.imageUrl,$each=$utils.$each,ads=$data.ads,value=$data.value,i=$data.i,uploadsUrl=$data.uploadsUrl,$out='';$out+='<div class="header-bar select-shopbar"> <span style="line-height:45px;position:relative;float:right;Z-index:1056"> <a href="#/showShopInfo" id="showShopInfo"> <img class="dianpu-img" src="';
$out+=$escape(imageUrl);
$out+='/dianpu.png"> </a> </span> <div class="header-title" style="display:inline-block;">=={$name}==</div> <span style="line-height:45px;position:absolute;"> <a href="#/selectShop" id="selectShop"> <img class="dianpu-img" src="';
$out+=$escape(imageUrl);
$out+='/zhoubian.png"> </a> </span> </div>  <div class="swiper-container"> <div class="swiper-wrapper" style="height:180px;"> ';
$each(ads,function(value,i){
$out+=' ';
if(value.adsname == 1){
$out+=' <div class="swiper-slide"> <a href="';
$out+=$escape(value.url);
$out+='"> <img class="lazy" src="';
$out+=$escape(imageUrl);
$out+='/blank.gif" data-echo="';
$out+=$escape(uploadsUrl+value.savepath+value.savename);
$out+='" style="display: inline; width: 100%;"> </a> </div> ';
}
$out+=' ';
});
$out+=' </div> <div class="swiper-pagination"></div> </div> <div class="mod-desc"> <ul> ';
$each(ads,function(value,i){
$out+=' ';
if(value.adsname == 2){
$out+=' <li class="item item_third"> <a href="';
$out+=$escape(value.url);
$out+='" title="';
$out+=$escape(value.name);
$out+='"> <div class="item-image item-image_third"><img src="';
$out+=$escape(imageUrl);
$out+='/blank.gif" data-echo="';
$out+=$escape(uploadsUrl+value.savepath+value.savename);
$out+='" class="lazy" style="width: 100%; margin-top: 0px; display: inline;background: #FFF url(';
$out+=$escape(imageUrl);
$out+='/loading.gif) no-repeat center center;background-size: 30px;"> <div class="select-shadow"> <div class="select-inner"><img src="';
$out+=$escape(imageUrl);
$out+='/ico_select.png" alt="selected"><span>已选</span> </div> </div> </div> </a> <div class="single-item-info"> <div class="item-title contentCenter">';
$out+=$escape(value.name);
$out+='</div> </div> </li> ';
}
$out+=' ';
});
$out+=' </ul> </div> <div class="m-component-promotion" id="list-section"> <ul class="list-unstyled" id="list-sale"> ';
$each(ads,function(value,i){
$out+=' ';
if(value.adsname == 3){
$out+=' <li> <a href="';
$out+=$escape(value.url);
$out+='"> <img class="lazy" src="';
$out+=$escape(imageUrl);
$out+='/blank.gif" data-echo="';
$out+=$escape(uploadsUrl+value.savepath+value.savename);
$out+='" style="display: inline; height: 137px;"> </a> </li> ';
}
$out+=' ';
});
$out+=' </ul> </div>';
return new String($out);
});