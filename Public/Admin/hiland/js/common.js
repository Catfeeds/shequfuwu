/**
 * Created by xiedalie on 2016/6/20.
 */


$(document).ready(function(){
    var targetObject= $('.deleteConfirm');
    // targetObject.attr('onclickmsg',targetObject.attr('onclick'));
    // var onclickContent= targetObject.attr('onclick');
    // targetObject.attr('onclick','');
    // var hrefContent= targetObject.attr('href');
    alter(onclickContent);

    targetObject.click(function (event) {
        if(confirm('您确认要删除选定的信息吗？')){
            //$this.attr();
            if(isNull(onclickContent)|| onclickContent==''){
                onclickContent;
            }
        }else{
            event.preventDefault();
        }
    })
});