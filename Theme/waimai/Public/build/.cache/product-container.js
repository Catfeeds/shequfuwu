/*TMODJS:{"version":2,"md5":"308937b218d09b8abe5808875d33fcfb"}*/
template('product-container',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,include=function(filename,data){data=data||$data;var text=$utils.$include(filename,data,$filename);$out+=text;return $out;},$out='';$out+='<div id="mainList" class="main"> <div id="items" class="items"> ';
include("./productList-container");
$out+=' </div> </div> ';
return new String($out);
});