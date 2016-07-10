var productID = $("#itemsDetail #detail-id").html();
var pageUrl = window.location.href;
var hash = window.location.hash;

var shareData;

var wechatjs_shopData_name = $("#wechatjs_shopData_name").val();
var wechatjs_shopData_remark = $("#wechatjs_shopData_remark").val();
var wechatjs_shopData_image = $("#wechatjs_shopData_image").val();
var wechatjs_hostName = $("#wechatjs_hostName").val();

alert(productID);
//alert('http://'+ wechatjs_hostName + data.uploadsUrl + wechatjs_shopData_image);

wx.config({
    appId: $("#wechatjs_appId").val(),
    timestamp: $("#wechatjs_timestamp").val(),
    nonceStr: $("#wechatjs_nonceStr").val(),
    signature: $("#wechatjs_signature").val(),
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
            title: wechatjs_shopData_name,
            desc: wechatjs_shopData_remark,
            //link: pageUrl,
            imgUrl: 'http://'+ wechatjs_hostName + data.uploadsUrl + wechatjs_shopData_image,
        };
    }


    wx.onMenuShareAppMessage(shareData);
    wx.onMenuShareTimeline(shareData);
    wx.onMenuShareQQ(shareData);
    wx.onMenuShareWeibo(shareData);
});

