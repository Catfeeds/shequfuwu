var productID = $("#itemsDetail #detail-id").val();

wx.config({
    appId: $("wechatjs_appId").val,
    timestamp: $("wechatjs_timestamp").val,
    nonceStr: $("wechatjs_nonceStr").val,
    signature: $("wechatjs_signature").val,
    jsApiList: [
        'checkJsApi',
        'onMenuShareTimeline',
        'onMenuShareAppMessage',
        'onMenuShareQQ',
        'onMenuShareWeibo'
    ]
})
;
wx.ready(function () {
    // 1 判断当前版本是否支持指定 JS 接口，支持批量判断
    wx.checkJsApi({
        jsApiList: [
            'getNetworkType',
            'previewImage',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo'
        ],
    });

    var pageUrl = window.location.href;
    var hash = window.location.hash;

    var shareData;
    var shopData = eval('{$config}');


    if (productID) {
        var imgurl= '';
        shareData = {
            title: $('#itemsDetail-container .single-name').html(),
            desc: $('#itemsDetail-container .detail-title').next().html(),
            //link: pageUrl,
            imgUrl: '缩略图',
        };
    } else {
        shareData = {
            title: shopData.name,
            desc: shopData.remark,
            //link: pageUrl,
            imgUrl: 'http://{$hostName}' + data.uploadsUrl + shopData.savepath + shopData.savename,
        };
    }


    wx.onMenuShareAppMessage(shareData);
    wx.onMenuShareTimeline(shareData);
    wx.onMenuShareQQ(shareData);
    wx.onMenuShareWeibo(shareData);
});

