<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>新闻管理页</title>
    <%@include file="../common/head.jsp"%>
</head>
<body>
<div class="container col-xs-12 col-sm-12" style="padding: 5px;">
    <div id="repeat" class="alert alert-success" style="display: none">
        <a href="#" class="close" data-dismiss="alert">
            &times;
        </a>
        <strong>${loginResult.data.stateInfo}</strong>
    </div>
    <form name="newsForm" action="searchNews" method="post">
        <div class="panel panel-default" >
            <div class="panel-heading" style="padding: 5px 15px 5px 15px;">
                <h3 style="margin-top:5px">新闻管理</h3>
                <div class="form-inline" role="banner">
                    <div class="form-group">
                        <label class="sr-only " for="title">标题</label>
                        <input type="text" name="searchNewsNotice.title" class="form-control " value="${searchNewsNotice.title}" id="title" placeholder="标题">
                    </div>
                    <div class="form-group">
                        <label class="sr-only " for="author">作者来源</label>
                        <input type="text" name="searchNewsNotice.author" class="form-control " value="${searchNewsNotice.author}" id="author" placeholder="作者来源">
                    </div>
                    <div class="form-group">
                        <label class="sr-only " for="time">提交日期</label>
                        <input type="text" name="searchNewsNotice.time" class="form-control " value="${searchNewsNotice.time}" onclick="WdatePicker({isShowClear:true})" id="time" placeholder="提交日期">
                    </div>
                    <div class = "form-group">&nbsp;&nbsp;</div>
                    <div class = "form-group" style="margin-left: 30px">
                        <label class="sr-only" for = "author">所属菜单</label>
                            <select id = "level1" name="tagLevelList" class = "form-control">
                                <option value=-1>一级菜单</option>
                            </select>
                    </div>
                    <div class="form-group">
                            <select id = "level2" name="tagLevelList" class = "form-control">
                                <option value=-1>二级菜单</option>
                            </select>
                    </div>
                    <div class="form-group">
                            <select id = "level3" name="tagLevelList" class = "form-control">
                                <option value=-1>三级菜单</option>
                            </select>
                    </div>
                    <div class="form-group" style="margin-left: 30px">
                        <s:select id = "searchplevelid" name="searchNewsNotice.focusFlag" class="form-control "  list="#{'YES':'是','NO':'否'}"
                                  listKey="key" listValue="value" headerKey="none" headerValue="是否焦点图"></s:select>
                    </div>

                </div>
                <div class="form-group text-left" style="margin-top: 15px;margin-bottom: 8px">
                    <button type="button" id="bacthDelete" class="btn btn-warning">
                        <span class="glyphicon glyphicon-trash"></span> 批量删除
                    </button>
                     <button type="submit" class="btn btn-info text-center" style="position: absolute;left: 600px">
                            <span class="glyphicon glyphicon-search" id="searchBtn"></span> 查询
                     </button>
                </div>
            </div>
            <input type="hidden" id="curpage" name="page.curPage" value="">
            <div class="panel-body">
                <table class="table table-hover table-striped ">
                    <thead>
                    <th><input type="checkbox" id="SelectAll"  value="全选" onclick="selectAll(this);"/></th>
                    <th>序号</th>
                    <th>文章标题</th>
                    <th>作者来源</th>
                    <th>发布时间</th>
                    <th>所属菜单</th>
                    <th>焦点图状态</th>
                    <th align="center">操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="util" varStatus="status">
                        <tr>
                            <td><input type="checkbox" class="newsList"  name="newsList" value="${util.news.id}" /></td>
                            <td>${status.count}</td>
                            <td>${util.news.title}</td>
                            <td>${util.news.author}</td>
                            <td>${util.news.time}</td>
                            <td>
                                    <c:forEach items="${util.tagList}" varStatus="status" var="it">
                                       <span style="font-size: 12px">${it.tagName}</span>  <br>
                                    </c:forEach>
                            </td>
                            <td>
                                <c:if test="${util.news.focusFlag=='YES'}">
                                    <span class="label label-info">焦点图</span>
                                </c:if>
                                <c:if test="${util.news.focusFlag=='NO'}">
                                    &nbsp;
                                </c:if>
                            </td>
                            <td>
                                <a  class="btn btn-xs btn-success" href="javascript:void(0)" onclick="edit('${util.news.id}')" target="main">修改</a>
                                <a  class="btn btn-xs btn-danger" href="javascript:void(0)" onclick="del('${util.news.id}')" target="main">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <input id="pathfield" type="hidden" value="${tagPath}"/>
        <input type="hidden" id="valueId" value="${loginResult}">
        <input type="hidden" id="stateId" value="${loginResult.data.state}">
    </form>
    <c:if test="${page.recordCount>0}">
        <ul class="pager">
            <li>总记录${page.recordCount}条</li>
            <li style="margin-right: 20px">&nbsp;</li>
            <li>
                <a href="javascript:void(0)" onclick="forward(1);">首页</a>
            </li>
            <li>
                <a href="javascript:void(0)" onclick="forward(${page.beforePage});">上一页</a>
            </li>
            <li>
                <a href="javascript:void(0)" onclick="forward(${page.nextPage});">下一页</a>
            </li>
            <li>
                <a href="javascript:void(0)" onclick="forward(${page.pageCount});">尾页&nbsp;</a>
            </li>
            <li>当前页${page.curPage}/${ page.pageCount}</li>
            <li>&nbsp;</li>
            <li style="margin-left: 20px">
                <select id="xzPage" class="" name="xzPage" onchange="forward(this.value);">
                    <c:forEach var="i" begin="1" end="${page.pageCount}">
                        <c:if test="${i==page.curPage}">
                            <option selected>${i}</option>
                        </c:if>
                        <c:if test="${i !=page.curPage}">
                            <option>${i}</option></c:if>
                    </c:forEach>
                </select>
            </li>
                <%-- <li><a href="#" onclick="forward(document.getElementById('xzPage').value);">go</a></li>--%>
        </ul>
    </c:if>

</div>
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/WdatePicker.js"></script>
<script type="text/javascript" src="../news/manage.js"></script>
</body>
</html>