var flag = "";
var tagpath = "";
$(function () {
    //EL表达式传值和传参
    flag = $("#focusfield").val();
    tagpath = $("#pathfield").val();
    var kk= new Array(); //定义数组
    var len ;
    if(tagpath.indexOf("/") != -1) {
        kk = tagpath.split("/");
        len = kk.length;
    }else{
        len = 1 ;
    }
    if(len==1){
        $.get("loadLevelTag",{levelId:'1'}, function (result) {
            var jsonObj = result["levelTagList"];
            for (var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#level1").append($option);
            }
            for (var i = 0; i < jsonObj.length; i++) {
                if (jsonObj[i]["tagId"] == tagpath) {
                    $("#level1").get(0).options[i].selected = true;
                    break;
                }
            }
        });
    }
    if(len==2){
        $.get("loadLevelTag",{levelId:'1'}, function (result) {
            var jsonObj =result["levelTagList"];
            for (var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#level1").append($option);
            }
            for (var i = 0; i < jsonObj.length; i++) {
                if(jsonObj[i]["tagId"]==kk[0]){
                    $("#level1").get(0).options[i].selected = true;
                    break;
                }
            }
            $.get("loadChildTag", {parentId:$("#level1").val(),currentId:'2'}, function (result) {
                var jsonObj = result["childTagList"];
                for (var i = 0; i < jsonObj.length; i++) {
                    var $option = $("<option></option>");
                    $option.attr("value", jsonObj[i]["tagId"]);
                    $option.text(jsonObj[i]["tagName"]);
                    $("#level2").append($option);
                }
                for (var i = 0; i < jsonObj.length; i++) {
                    if(jsonObj[i]["tagId"]==kk[1]){
                        $("#level2").get(0).options[i+1].selected = true;
                        break;
                    }
                }
            });
        });
    }
    if(len==3){
        $.get("loadLevelTag",{levelId:'1'}, function (result) {
            var jsonObj =result["levelTagList"];
            for (var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#level1").append($option);
            }
            for (var i = 0; i < jsonObj.length; i++) {
                if(jsonObj[i]["tagId"]==kk[0]){
                    $("#level1").get(0).options[i].selected = true;
                    break;
                }
            }
            $.get("loadChildTag", {parentId:$("#level1").val(),currentId:'2'}, function (result) {
                var jsonObj = result["childTagList"];
                for (var i = 0; i < jsonObj.length; i++) {
                    var $option = $("<option></option>");
                    $option.attr("value", jsonObj[i]["tagId"]);
                    $option.text(jsonObj[i]["tagName"]);
                    $("#level2").append($option);
                }
                for (var i = 0; i < jsonObj.length; i++) {
                    if(jsonObj[i]["tagId"]==kk[1]){
                        $("#level2").get(0).options[i+1].selected = true;
                        break;
                    }
                }
            });
            $.get("loadChildTag", {parentId:$("#level2").val(),currentId:'3'}, function (result) {
                var jsonObj = result["childTagList"];
                for (var i = 0; i < jsonObj.length; i++) {
                    var $option = $("<option></option>");
                    $option.attr("value", jsonObj[i]["tagId"]);
                    $option.text(jsonObj[i]["tagName"]);
                    $("#level3").append($option);
                }
                for (var i = 0; i < jsonObj.length; i++) {
                    if(jsonObj[i]["tagId"]==kk[2]){
                        $("#level3").get(0).options[i+1].selected = true;
                        break;
                    }
                }
            });
        });
    }
    if( flag=='YES'){
        $("#r1").attr('checked',true);
        $("#upid").show();
    }else {
        $("#r2").attr('checked',true);
    }
    $("#level1").change(function (){
        // 清空子类
        $("#level2 option[value!='-1']").remove();
        $("#level3 option[value!='-1']").remove();
        $.get("loadChildTag", {parentId:$("#level1").val(),currentId:'2'}, function (result) {
            var jsonObj = result["childTagList"];
            for (var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#level2").append($option);
            }
        });
    });
    $("#level2").change(function (){
        $("#level3 option[value!='-1']").remove();
        $.get("loadChildTag", {parentId:$("#level2").val(),currentId:'3'}, function (result) {
            var jsonObj = result["childTagList"];
            for (var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#level3").append($option);
            }
        });
    });
    $("input[type='radio']").each(function() {
        $(this).click(function(){
            var selectedvalue = $(this).val();
            if (selectedvalue == "YES") {
                $("#upid").show();
            }else {
                $("#upid").hide();
            }
        });
    });
});

function updateCheck(){
    for ( instance in CKEDITOR.instances ){
        CKEDITOR.instances[instance].updateElement();
    }
    if($.trim($("#content1").val())==''){
        alert( '请输入文章内容');
        return false;
    }
    if( $("input[type='radio']:checked").val()=="YES"){
        var file=$("#fileid");
        if($.trim(file.val())==''){
            alert('请选择需要上传的图片');
            return false;
        }
    }
    return true
}
function update(){
    if(updateCheck()){
        $("#updateForm").submit();
    }
}