<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://ckeditor.com" prefix="ck"%>
<%@ page import="com.traffic.model.NewsAndNotice" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    NewsAndNotice temp=(NewsAndNotice)ActionContext.getContext().get("editNewsNotice");
    String data = "";
    if(temp!=null){
        if(temp.getContent()!=null){
            data=temp.getContentStr();
        }
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>编辑新闻</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="ckeditor/ckeditor.js"></script>
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
    <div class="panel panel-default" >
        <div class="panel-heading" style="padding: 5px 15px 5px 15px;">
            <h3 style="margin-top:5px">编辑新闻</h3>
        </div>
        <div class="panel-body">
            <form action="updateNews" role = "form" id="updateForm" class="form-horizontal" method="post" enctype="multipart/form-data">
                <div class = "form-group">
                    <input type="hidden" name="editNewsNotice.id" value="${editNewsNotice.id}">
                    <label class="col-sm-1 control-label" for = "title">文章标题</label>
                    <div class="col-sm-10">
                        <input type = "text" name="editNewsNotice.title" class = "form-control" id = "title" value="${editNewsNotice.title}"  required>
                    </div>
                </div>
                <div class = "form-group">
                    <label class="col-sm-1 control-label" for = "author">作者来源</label>
                    <div class="col-sm-2">
                        <input type = "text" name="editNewsNotice.author" class = "form-control" id = "author" value="${editNewsNotice.author}"  required>
                    </div>
                    <label class="col-sm-2 control-label" for = "addTimeId">提交日期</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="editNewsNotice.time" id = "addTimeId"   value="${editNewsNotice.time}" onclick="WdatePicker({isShowClear:true,readOnly:true })" required >
                    </div>
                </div>
                <div class = "form-group">
                    <label class="col-sm-1 control-label" for = "author">所属标签</label>
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
                    <label class="col-sm-1 control-label" >焦点图</label>
                    <div class="col-sm-2">
                        <div class="radio">
                            <label>
                                <input type="radio" id="r1" name="editNewsNotice.focusFlag"  value="YES" >是
                            </label>
                            &nbsp;
                            <label>
                                <input type="radio" id="r2" name="editNewsNotice.focusFlag"  value="NO" >否
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
                <div class="form-group">
                    <div class="col-sm-1 col-sm-offset-1">
                        <button type = "button" class="btn btn-success" onclick="update();">保存提交</button>
                    </div>
                    <div class="col-sm-1">
                        <button type = "button" class="btn" onclick="location.href='searchNews';">取 消</button>
                    </div>
                </div>
                <div class="form-group">
                    <textarea name="editNewsNotice.content" id="content1" ><%=data %></textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace('content1');
                    </script>
                </div>
                <input id="pathfield" type="hidden" value="${editNewsNotice.tagPath}"/>
                <input id="focusfield" type="hidden" value="${editNewsNotice.focusFlag}"/>
            </form>
        </div>
    </div>
</div>
<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/uploadPreview.js"></script>
<script type="text/javascript" src="js/WdatePicker.js"></script>
<script type="text/javascript" src="news/news.js"></script>
</body>
</html>
