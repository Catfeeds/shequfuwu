/**
 * Created by xiedalie on 2016/6/20.
 */


$(document).ready(function(){
    var targetObject= $('.deleteConfirm');

    targetObject.click(function (event) {
        if(confirm('您确认要删除选定的信息吗？')){
            
        }else{
            event.preventDefault();
        }
    })
});