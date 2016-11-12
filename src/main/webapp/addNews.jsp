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
<body>

<table id="tt" class="easyui-datagrid" title="添加新闻    (*为必填项，内容不能为空)" toolbar="#tb"
       singleSelect="false" fitColumns="true" 	style="width:100%;height:auto;text-align:center;">
    <div id="tb">
        <form action="newsAndNoticeActionForMgr!saveNewsAndNotice" name="newsAddAction" id="newsAddAction" method="post" enctype="multipart/form-data">
            <!--  <input type="hidden" name="newsAndNotice.time" value=""/>-->
            &nbsp;类型: <select  name="parent" id="select_parent" style="width:180px;height:25px"></select> --
            <select  name="newsAndNotice.category.categoryId" id="select_child"  style="width:180px;height:25px"></select><font color="red">*</font>
            &nbsp;标题: <input type="text"  id="addTitleId" name="newsAndNotice.title" maxlength="80" style="width:370px;height:25px;margin-top: 15px;"/><font color="red">*</font>
            &nbsp;时间: <input type="text" id="addTimeId" name="newsAndNotice.time" class="laydate-icon" style="width:180px;height:25px" readonly="readonly"/><br><br>
            &nbsp;作者: <input type="text"  id="addAthorId" name="newsAndNotice.author" maxlength="40" style="width:180px;height:25px"/><font color="red">*</font><br><br>
            &nbsp;是否设置为焦点图:<input type="radio" name="newsAndNotice.focusFlag" value="YES"/>是
            &nbsp;&nbsp;<input type="radio"  name="newsAndNotice.focusFlag"  value="NO" checked="checked"/>否
            &nbsp;&nbsp;<span style="margin-left:20px;color:#777;height:25px;padding:7px">温馨提示:焦点图最大设置数量为7个 <font color="red"></font></span>
            <div id="upid" style="display: none;">
                <br>
                <input type="file" name="myfile" id="fileid" style="height: 26px;"  accept="image/*">
                <br>
                <div id="imgdiv"><img id="imgShow" width="500px" height="200px" /></div>
            </div>

            <br><br>
            &nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="return add()">添加</a>
            &nbsp;<a href="newsAndNoticeActionForMgr!beforeAddInfo" class="easyui-linkbutton" icon="icon-cancel" >返回</a>
            <br>
            <br>
            <textarea name="newsAndNotice.content" id="content1" ></textarea>
            <ck:replace   replace = "newsAndNotice.content"   basePath = "/ckeditor/"   />
        </form>
    </div>
    <input type="hidden" id="addAlert" value="${addSuccess}"/>
    <input type="hidden" id="maxId" value="${maxNumber}"/>
</table>
<script type="text/javascript">

    function addCheck(){
        if($.trim($("#select_child").val())=='-1'){
            msgShow('系统提示', '请输入类型！', 'warning');
            return false;
        }
        if($.trim($("#addTitleId").val())==''){
            msgShow('系统提示', '请输入标题！', 'warning');
            return false;
        }
        if($.trim($("#addAthorId").val())==''){
            msgShow('系统提示', '请输入作者！', 'warning');
            return false;
        }
        if($.trim($("#addTimeId").val())==''){
            msgShow('系统提示', '请输入时间！', 'warning');
            return false;
        }
        for ( instance in CKEDITOR.instances ){ //同步编辑器与Textarea的内容，很重要必须加上

            CKEDITOR.instances[instance].updateElement();
        }
        if($.trim($("#content1").val())==''){
            msgShow('系统提示', '请输入内容！', 'warning');
            return false;
        }
        if( $("input[type='radio']:checked").val()=="YES"){
            var file=$("#fileid");
            if($.trim(file.val())==''){
                msgShow('系统提示', '请选择需要上传的图片！', 'warning');
                return false;
            }
        }
        return true
    }

    function add(){
        if(addCheck()){$("#newsAddAction").submit();}
    }
    if($("#addAlert").val()=="YES"){
        msgShow('系统提示', '添加成功！', 'info');
    }
    if($("#maxId").val()=="YES"){
        msgShow('系统提示', '添加失败，焦点图数量已达上限！', 'info');
    }

</script>
<script type="text/javascript" src="js/uploadPreview.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
<script type="text/javascript">
    window.onload = function () {
        new uploadPreview({ UpBtn: "fileid", DivShow: "imgdiv", ImgShow: "imgShow" });
    }
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#addTimeId'});//绑定元素
    }();
</script>

</body>
</html>
