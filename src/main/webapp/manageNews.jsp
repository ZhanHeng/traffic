<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>新闻管理页</title>
    <%@include file="common/head.jsp"%>
</head>
<body>
<div class="container col-xs-12 col-sm-12" style="padding: 5px;">
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
                        <input type="text" name="searchNewsNotice.time" class="form-control " value="${searchNewsNotice.time}" id="time" placeholder="提交日期">
                    </div>
                    <div class = "form-group">&nbsp;&nbsp;</div>
                    <div class = "form-group" style="margin-left: 30px">
                        <label class="sr-only" for = "author">所属标签</label>
                            <select id = "level1" name="tagLevelList" class = "form-control">
                            </select>
                    </div>
                    <div class="form-group">
                            <select id = "level2" name="tagLevelList" class = "form-control">
                                <option value=-1>无</option>
                            </select>
                    </div>
                    <div class="form-group">
                            <select id = "level3" name="tagLevelList" class = "form-control">
                                <option value=-1>无</option>
                            </select>
                    </div>
                    <div class="form-group" style="margin-left: 30px">
                        <s:select id = "searchplevelid" name="searchNewsNotice.focusFlag" class="form-control "  list="#{'YES':'是','NO':'否'}"
                                  listKey="key" listValue="value" headerKey="none" headerValue="是否焦点图"></s:select>
                    </div>

                </div>
                <div class="form-inline " style="margin-top: 15px;margin-bottom: 8px">
                    <div class="form-group">
                    <button type="submit" class="btn btn-info ">
                        <span class="glyphicon glyphicon-search"></span> 查询
                    </button>
                    </div>
                    <div class="form-group">
                    <button type="button" id="delbtn" class="btn btn-warning">
                        <span class="glyphicon glyphicon-trash"></span> 批量删除
                    </button>
                    </div>
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
                    <th>所属标签</th>
                    <th>焦点图状态</th>
                    <th align="center">操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="news" varStatus="status">
                        <tr>
                            <td><input type="checkbox"  name="tagList" value="${news.id}" /></td>
                            <td>${status.count}</td>
                            <td>${news.title}</td>
                            <td>${news.author}</td>
                            <td>${news.time}</td>
                            <td>
                                ${news.tagPath}
                            </td>
                            <td>
                                <c:if test="${news.focusFlag=='YES'}">
                                    <span class="label label-info">焦点图</span>
                                </c:if>
                                <c:if test="${news.focusFlag=='NO'}">
                                    <span class="label label-info">N</span>
                                </c:if>
                            </td>
                            <td>
                                <a  class="btn btn-xs btn-success" href="javascript:void(0)" onclick="edit('${news.id}')" target="main">修改</a>
                                <a  class="btn btn-xs btn-danger" href="javascript:void(0)" onclick="del('${news.id}')" target="main">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
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
</div>
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function forward(curpage) {
        $("#curpage").val(curpage);
        newsForm.submit();
    }
        $(function(){
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
        $("#delbtn").click(function () {
            if($("input[name ='tagList' ]:checked").length<=0){
                alert("请选择条目");
                return false;
            }else{
                if(confirm("确认删除吗?")){
                    tagForm.action="batchDel";
                    tagForm.submit();
                }
            }
        });
        //等级改变，加载父级标签
        $("#tlevel").change(function() {
            $("#parentlevel option[value!='-1']").remove();
            $.get("loadParentTag", {
                levelId : $("#tlevel").val()
            }, function(result) {
                var jsonObj = result["belongTagList"];
                for ( var i = 0; i < jsonObj.length; i++) {
                    var $option = $("<option></option>");
                    $option.attr("value", jsonObj[i]["tagId"]);
                    $option.text(jsonObj[i]["tagName"]);
                    $("#parentlevel").append($option);
                }
            });
        });
        $("#searchplevelid").change(function() {
            $("#searchpid option[value!='-1']").remove();
            $.get("loadParentTag", {
                levelId : $("#searchplevelid").val()
            }, function(result) {
                var jsonObj = result["belongTagList"];
                for ( var i = 0; i < jsonObj.length; i++) {
                    var $option = $("<option></option>");
                    $option.attr("value", jsonObj[i]["tagId"]);
                    $option.text(jsonObj[i]["tagName"]);
                    $("#searchpid").append($option);
                }
            });
        });
        $.get("loadParentTag", {
            levelId : $("#searchplevelid").val()
        }, function(data) {
            var jsonObj = data["belongTagList"];
            for ( var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#searchpid").append($option);
            }
            for (var i = 0; i < jsonObj.length; i++) {
                if(jsonObj[i]["tagId"]=='${tag.parentTag.tagId}'){
                    $("#searchpid").get(0).options[i+1].selected = true;
                    break;
                }
            }
        });
    });
    function edit(id) {
            window.location.href="beforeUpdate?newId="+id;
  /*      $.get("getTag",{id:id},function(result){
            var obj = result["editTag"] ;
            $("#tname").val(obj["tagName"]);
            $("#tlevel").val(obj["tagLevel"]+"级标题");
            $("#reallevel").val(obj["tagLevel"]);
            $("#tflag").val(obj["passFlag"]);
            $("#tid").val(obj["tagId"]);
            var p = obj["parentTag"];
            $("#parentlevel").val(p["tagName"]);
            $("#parentTagId").val(p["tagId"]);


        });
        $.get("loadParentTag", {
            levelId : $("#tlevel").val()
        }, function(data) {
            var jsonObj = data["belongTagList"];
            for ( var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#parentlevel").append($option);
            }
            for (var i = 0; i < jsonObj.length; i++) {
                if(jsonObj[i]["tagId"]==id){
                    $("#parentlevel").get(0).options[i+1].selected = true;
                    break;
                }
            }
        });*/
    }
    function del(id) {
        if(confirm("确认删除吗?")){
            window.location.href="del?id="+id;
        }
    }
    function selectAll(checkbox) {
        $('input[type=checkbox]').prop('checked', $(checkbox).prop('checked'));
    }
</script>
</body>
</html>