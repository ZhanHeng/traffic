<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>标签列表页</title>
    <%@include file="../common/head.jsp"%>
</head>
<body>
<div class="container col-xs-12 col-sm-12">
    <form name="tagForm" action="searchTag" method="post">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3>标签列表</h3>
            <div class="form-inline" role="banner">
                <div class="form-group">
                    <label class="sr-only " for="name">名称</label>
                        <input type="text" name="tag.tagName" class="form-control " value="${tag.tagName}" id="name" placeholder="请输入名称">
                </div>
                <div class="form-group">
                    <s:select name="tag.tagLevel" class="form-control "  list="#{1:'一级标签',2:'二级标签',3:'三级标签',4:'四级标签'}"
                              listKey="key" listValue="value" headerKey="-1" headerValue="请选择等级"></s:select>

                </div>
                <div class="form-group">
                    <s:select name="tag.passFlag" class="form-control "  list="#{1:'可用',0:'不可用'}"
                              listKey="key" listValue="value" headerKey="-1" headerValue="请选择状态"></s:select>
                </div>
                <button type="submit" class="btn btn-info ">
                    <span class="glyphicon glyphicon-search"></span> 查询
                </button>
                <button type="button" id="delbtn" class="btn btn-warning ">
                    <span class="glyphicon glyphicon-trash"></span> 批量删除
                </button>
            </div>
        </div>
        <div class="panel-body">
            <table class="table table-hover table-striped ">
                <thead>
                <th><input type="checkbox" id="SelectAll"  value="全选" onclick="selectAll(this);"/></th>
                <th>序号</th>
                <th>名称</th>
                <th>等级</th>
                <th>状态</th>
                <th align="center">操作</th>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="tag" varStatus="status">
                    <tr>
                        <td><input type="checkbox"  name="tagList" value="${tag.tagId}" /></td>
                        <td>${status.count}</td>
                        <td>${tag.tagName}</td>
                        <td>${tag.tagLevel}级菜单</td>
                        <td>
                            <c:if test="${tag.passFlag==1}">
                                <span class="label label-info">可用</span>
                            </c:if>
                            <c:if test="${tag.passFlag!=1}">
                                <span class="label label-default">不可用</span>
                            </c:if>
                        </td>
                        <td>
                            <a  class="btn btn-xs btn-success" href="javascript:void(0)" onclick="edit('${tag.tagId}')" >修改</a>
                            <a  class="btn btn-xs btn-danger" href="javascript:void(0)" onclick="del('${tag.tagId}')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    </form>
</div>
<form action="update" method="post">
<div id="editTag" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="glyphicon glyphicon-tag "></span> 编辑标签
                </h3>
            </div>
            <div class="modal-body">
                <div class="form-horizontal" role="form" method="post">
                    <input type="hidden" name="tag.tagId" id="tid">
                    <div class="form-group">
                        <label for="tname" class="col-sm-4 control-label offset2">名称</label>
                        <div class="col-sm-6">
                            <input type="text" name="tag.tagName" id="tname" class="form-control"  placeholder="请输入标签名称" required autofocus>
                        </div>
                    </div>
                    <div class="form-group"></div>
                    <div class = "form-group">
                        <label class="col-sm-4 control-label offset2"  for = "tlevel">级别</label>
                        <div class="col-sm-6">
                            <s:select name="tag.tagLevel" id="tlevel" class="form-control "  list="#{1:'一级标签',2:'二级标签',3:'三级标签',4:'四级标签'}"
                                      listKey="key" listValue="value"></s:select>
                        </div>
                    </div>
                    <div class="form-group"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label offset2"  for = "tflag">状态</label>
                        <div class="col-sm-6">
                            <s:select name="tag.passFlag" class="form-control " id="tflag" list="#{1:'可用',0:'不可用'}"
                                      listKey="key" listValue="value" ></s:select>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
                        <input type="submit" class="btn btn-primary" value="提交">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</form>
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function(){
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
    });
    function edit(id) {
        $('#editTag').modal({
            show : true ,           //显示弹出层
            backdrop : 'static' ,  //禁止位置关闭
            keyboard : false        //关闭键盘事件
        });
        $.get("getTag",{id:id},function(result){
            var obj = result["editTag"] ;
             $("#tname").val(obj["tagName"]);
             $("#tlevel").val(obj["tagLevel"]);
             $("#tflag").val(obj["passFlag"]);
             $("#tid").val(obj["tagId"]);
        });
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