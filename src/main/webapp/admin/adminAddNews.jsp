<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://ckeditor.com" prefix="ck"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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
    <script src="../ckeditor/ckeditor.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container col-xs-12 col-sm-12" style="padding: 5px;">
    <div id="repeat" class="alert alert-success" style="display: none">
        <a href="#" class="close" data-dismiss="alert">
            &times;
        </a>
        <strong>${loginResult.data.stateInfo}</strong>
    </div>
    <div class="panel panel-default" >
        <div class="panel-heading" style="padding: 5px 15px 5px 15px;">
            <h3 style="margin-top:5px">发布新闻</h3>
        </div>
        <div class="panel-body">
            <form action="addNews" role = "form" class="form-horizontal" id="addForm" method="post" enctype="multipart/form-data">
                <div class = "form-group">
                    <label class="col-sm-1 control-label" for = "title">文章标题</label>
                    <div class="col-sm-10">
                        <input type = "text" name="newsAndNotice.title" class = "form-control" id = "title"  placeholder = "请输入文章标题" required>
                    </div>
                </div>
                <div class = "form-group">
                    <label class="col-sm-1 control-label" for = "author">作者来源</label>
                    <div class="col-sm-2">
                        <input type = "text" name="newsAndNotice.author" class = "form-control" id = "author"  placeholder = "请输入作者来源" required>
                    </div>
                    <label class="col-sm-2 control-label" for = "addTimeId">提交日期</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="newsAndNotice.time" id = "addTimeId"   placeholder = "请输入提交日期" onclick="WdatePicker({isShowClear:true,readOnly:true })" required >
                    </div>
                </div>
                <div class = "form-group">
                    <label class="col-sm-1 control-label" for = "author">所属菜单</label>
                    <div class="col-sm-2">
                        <select id = "level1" name="tagLevelList" class = "form-control">
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <select id = "level2" name="tagLevelList" class = "form-control">
                            <option value=-1>无</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <select id = "level3" name="tagLevelList" class = "form-control">
                            <option value=-1>无</option>
                        </select>
                    </div>
                </div>
                <div class = "form-group">
                    <label class="col-sm-1 control-label" >设为焦点图</label>
                    <div class="col-sm-2">
                        <div class="radio">
                            <label>
                                <input type="radio" name="newsAndNotice.focusFlag"  value="YES" >是
                            </label>
                            &nbsp;
                            <label>
                                <input type="radio" name="newsAndNotice.focusFlag"  value="NO" checked>否
                            </label>
                        </div>
                    </div>
                    <div  id="upid" style="display: none;">
                        <label class="col-sm-2 control-label" >上传焦点新闻图片</label>
                        <div class="col-sm-2">
                            <input type="file" class="form-control" name="myfile" id="fileid"   accept="image/*">
                        </div>
                        <div class="col-sm-2">
                            <div id="imgdiv" style="position: absolute;top: -105px;"><img id="imgShow"  height="200px" /></div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="valueId" value="${loginResult}">
                <input type="hidden" id="stateId" value="${loginResult.data.state}">
                <div class="form-group">
                    <div class="col-sm-1 col-sm-offset-1">
                        <button type = "button" class="btn btn-success" onclick="update();">保存提交</button>
                    </div>
                </div>
                <div class="form-group">
                    <textarea name="newsAndNotice.content" id="content2"> </textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace('content2');
                    </script>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/uploadPreview.js"></script>
<script type="text/javascript" src="../js/WdatePicker.js"></script>
<script type="text/javascript" src="../news/addNews.js"></script>
</body>
</html>
