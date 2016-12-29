
window.onload = function () {
    new uploadPreview({ UpBtn: "fileid", DivShow: "imgdiv", ImgShow: "imgShow" });
}
var value = "";
var state = ""
$(function(){
    $(window).scrollTop(0);
     value = $("#valueId").val();
    if (value) {
         state = $("#stateId").val();
        if(state < 0){
            $('#repeat').removeClass('alert-success').addClass('alert-danger').css('display','block').delay(1500).hide(0);
        }else{
            $('#repeat').css('display','block').removeClass('alert-danger').addClass('alert-success').delay(1500).hide(0);
        }
    }
    // 获取父类
    $.get("loadLevelTag",{levelId:'1'}, function (result) {
        var jsonObj =result["levelTagList"];
        for (var i = 0; i < jsonObj.length; i++) {
            var $option = $("<option></option>");
            $option.attr("value", jsonObj[i]["tagId"]);
            $option.text(jsonObj[i]["tagName"]);
            $("#level1").append($option);
        }
        $.get("loadChildTag", {parentId:$("#level1").val(),currentId:'2'}, function (result) {
            var jsonObj = result["childTagList"];
            for (var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#level2").append($option);
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
        });
    });
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
/*    if($.trim($("#content2").val())==''){
        alert( '请输入文章内容');
        return false;
    }*/
    if( $("input[type='radio']:checked").val()=="YES"){
        var file=$("#fileid");
        if($.trim(file.val())==''){
            alert('请选择需要上传的图片');
            return false;
        }
    }
}
function update(){
    if(updateCheck()){
        $("#addForm").submit();
    }
}