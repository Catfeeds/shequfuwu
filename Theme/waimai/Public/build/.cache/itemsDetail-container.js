/*TMODJS:{"version":11,"md5":"8044f7ff3e4fc628d4ae1863f5d4e52b"}*/
template('itemsDetail-container','<div class="detail" id="itemsDetail"> <div class="container-gird"> <div class="swiper-container" style="height: 200px"> <div class="swiper-wrapper">  </div>  <div class="swiper-scrollbar"></div> </div> <img class="detail-image" src=""> <div class="detail-msg"> <span class="single-name"></span>  </div> <div class="detail-msg"> <span class="detail-price"> <span class="new-price">￥<span></span></span> </span> <span class="detail-label"></span> </div> <div class="detail-msg none" style="padding-bottom: 12px;" id="product-attr"> <span class="detail-attr"> <span>商品属性</span><br/> <span id="detail-attr-btn"></span> </span> </div> <div class="select-area" id="addCartBtn" style="display: none"> <button class="addItem btn-shopping" onclick=""><i class="ico ico-shop"></i>添加到购物车</button> </div> <div class="select-area" id="soldOut" style="display: none"> <span style="float: right;color: #646464;">已售罄</span> </div> </div> <div class="detail-content"> <div class="container-gird"> <p class="detail-score">赠送积分：<span style="font-weight: normal;"></span></p> </div> <div class="container-gird"> <p class="detail-title">商品详情</p> <div></div> </div> <div class="container-gird"> <p class="detail-commit">商品评论</p> <div style="text-align: center"> <ul id="commentList"> </ul>  </div> </div> </div> <div class="backToTop"> <div class="backToTop-inner" onclick="backToTop()"> <i class="ico ico-top"></i><span>回到顶部</span> </div> </div> </div>');