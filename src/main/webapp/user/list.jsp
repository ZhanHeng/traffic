<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户列表页</title>
    <%@include file="../common/head.jsp"%>
</head>
<body>
<div class="container col-xs-12 col-sm-12" style="padding: 10px;">
    <form name="userForm" action="searchUser" method="post">
        <div class="panel panel-default">
            <div class="panel-heading" style="padding: 5px 15px 5px 15px;">
                <h3 style="margin-top:5px">用户管理</h3>
                <div class="form-inline" role="banner">
                    <div class="form-group">
                        <label class="sr-only " for="name">名称</label>
                        <input type="text" name="tagName" class="form-control " value="${tagName}" id="name" placeholder="请输入名称">
                    </div>
                    <button type="submit" class="btn btn-info ">
                        <span class="glyphicon glyphicon-search"></span> 查询
                    </button>
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped">
                    <thead>
                    <th>序号</th>
                    <th>名称</th>
                    <th align="center">操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="user" varStatus="status">
                        <tr>
                            <td><input type="checkbox"  name="tagList" value="${user.userId}" /></td>
                            <td>${status.count}</td>
                            <td>${user.userName}</td>
                            <td>
                                <a  class="btn btn-xs btn-danger" href="javascript:void(0)" onclick="del('${user.userId}')">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function del(id) {
            if(confirm("确认删除吗?")){
                window.location.href="delUser?id="+id;
            }
        }
    </script>
</div>
</body>

</html>