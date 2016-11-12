<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://ckeditor.com" prefix="ck"%>
<%@page import="com.ckeditor.CKEditorConfig"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(
            "yyyy-MM-dd HH:mm:ss");
    java.util.Date currentTime = new java.util.Date();
    String time = simpleDateFormat.format(currentTime).toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>添加新闻</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css"  href="css/default.css"/>
    <link rel="stylesheet" type="text/css"	href="themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css"  href="themes/icon.css" />
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <script src="//cdn.ckeditor.com/4.5.11/full/ckeditor.js"></script>
    <script>
        $(function(){
            /* 获取父类 */
            $.post("loadParentCategory", function (data) {
                var $option = $("<option></option>");
                $option.attr("value", "-1");
                $option.text("请选择");
                $("#select_parent,#select_child").append($option);
                var jsonObj =data;
                for (var i = 0; i < jsonObj.length; i++) {
                    var $option = $("<option></option>");
                    $option.attr("value", jsonObj[i].parentCategoryId);
                    $option.text(jsonObj[i].parentCategoryName);
                    $("#select_parent").append($option);
                }
            });
            /* 根据父类获取子类 */
            $("#select_parent").change(function (){
                /* 清空子类 */
                $("#select_child").empty();
                $.post("loadCategory", {parentId:$("#select_parent").val()}, function (data) {
                    var $option = $("<option></option>");
                    $option.attr("value", "-1");
                    $option.text("请选择");
                    $("#select_child").append($option);
                    var jsonObj = data;
                    for (var i = 0; i < jsonObj.length; i++) {
                        var $option = $("<option></option>");
                        $option.attr("value", jsonObj[i].categoryId);
                        $option.text(jsonObj[i].categoryName);
                        $("#select_child").append($option);
                    }
                });
            });

            //var a= $("input[type='radio']:checked").val();
            //alert(a);
            $("input[type='radio']").each(function() {
                $(this).click(function(){
                    var selectedvalue = $(this).val();
                    if (selectedvalue == "YES") {
                        $("#upid").slideDown(300);
                    }
                    else {
                        $("#upid").slideUp(300);
                    }


                });

            });

        });
    </script>
    <script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>


</head>

<body style="padding: 20px;">
<form role = "form" class="form-horizontal">
    <div class = "form-group">
        <label class="col-sm-2 control-label" for = "name">姓名</label>
        <div class="col-sm-2">
            <input type = "text" class = "form-control" id = "name"  placeholder = "请输入姓名" required autofocus >
        </div>
    </div>
    <div class = "form-group">
        <label class="col-sm-2 control-label" for = "tel">电话号码</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" id = "tel"
                   placeholder = "请输入您的电话号码">
        </div>
    </div>
    <div class = "form-group">
        <label class="col-sm-2 control-label" for = "idCard">请上传身份证</label>
        <div class="col-sm-2">
            <input type = "file" id = "idCard" style="display:inline-block;">
        </div>
    </div>
    <div class = "form-group">
        <label class="col-sm-2 control-label" for = "profession">选择职业</label>
        <div class="col-sm-2">
            <select id = "profession" class = "form-control">
                <option>软件工程师</option>
                <option>测试工程师</option>
                <option>硬件工程师</option>
                <option>质量分析师</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-2 col-sm-offset-2">
            <button type = "submit" class="btn-info btn-lg">提交</button>
        </div>
    </div>
</form>
</body>
</body>
</html>
