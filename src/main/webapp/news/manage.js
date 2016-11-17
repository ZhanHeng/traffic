function forward(curpage) {
    $("#curpage").val(curpage);
    newsForm.submit();
}
function del(id) {
    if(confirm("确认删除吗?")){
        window.location.href="deleteNews?newId="+id;
    }
}
var tagpath = "";
var value = "";
var state = "";
$(function(){
    value = $("#valueId").val();
    if (value) {
        state = $("#stateId").val();
        if(state < 0) {
            $('#repeat').removeClass('alert-success').addClass('alert-danger').css('display', 'block').delay(1500).hide(0);
        }else {
            $('#repeat').css('display', 'block').removeClass('alert-danger').addClass('alert-success').delay(1500).hide(0);
        }
    }
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
                    $("#level1").get(0).options[i+1].selected = true;
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
                    $("#level1").get(0).options[i+1].selected = true;
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
                    $("#level1").get(0).options[i+1].selected = true;
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
    $("#bacthDelete").click(function () {
        if($("input[name ='newsList' ]:checked").length<=0){
            alert("请选择条目");
            return false;
        }else{
            if(confirm("确认删除吗?")){
                newsForm.action="bacthDelete";
                newsForm.submit();
            }
        }
    });
});


function edit(id) {
    window.location.href="beforeUpdate?newId="+id;
}
function del(id) {
    if(confirm("确认删除吗?")){
        window.location.href="deleteNews?newId="+id;
    }
}
function selectAll(checkbox) {
    $('input[type=checkbox]').prop('checked', $(checkbox).prop('checked'));
}