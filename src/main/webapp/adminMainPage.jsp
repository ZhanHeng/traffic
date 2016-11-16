<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="mainframe">
    <meta name="author" content="console">
    <link rel="shortcut icon" href="icon/favicon.ico" />
    <%
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setDateHeader("Expires", 0);
    %>
    <title>后台管理</title>

    <!-- Bootstrap core CSS -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
        html, body{ margin:0; height:100%; }
        body {
            padding-top: 50px;
        }
        .sub-header {
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .navbar-fixed-top {
            border: 0;
        }
        .sidebar {
            display: none;
        }
        @media (min-width: 768px) {
            .sidebar {
                position: fixed;
                top: 51px;
                bottom: 0;
                left: 0;
                z-index: 1000;
                display: block;
                padding: 18px;
                overflow-x: hidden;
                overflow-y: auto;
                background-color: #E7F1FA;
                border-right: 1px solid #eee;
            }
        }
        .nav-sidebar {
            margin-right: -21px;
            margin-bottom: 20px;
            margin-left: -20px;
        }
        .nav-sidebar > li > a {
            padding-right: 20px;
            padding-left: 20px;
        }
        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
            color: #fff;
            background-color: #428bca;
        }
        .main {
            padding: 5px;
        }
        @media (min-width: 768px) {
            .main {
                padding-right: 5px;
                padding-left: 5px;
            }
        }
        .main .page-header {
            margin-top: 0;
        }
        .placeholders {
            margin-bottom: 30px;
            text-align: center;
        }
        .placeholders h4 {
            margin-bottom: 0;
        }
        .placeholder {
            margin-bottom: 20px;
        }
        .placeholder img {
            display: inline-block;
            border-radius: 50%;
        }
        .nav-sidebar {
            margin-right: 0px;
            margin-bottom: 20px;
            margin-left: 0px;
        }
        a.list-group-item, button.list-group-item {
            color: #333;
        }
    </style>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="active navbar-brand" href="javascript:void(0)" style="color: #FFFFFF;font-size: 20px" >抚顺交通局后台管理</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right col-sm-offset-1">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> ${sessionUser.userName} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header">账户设置</li>
                        <%--<li><a href="#"><span class="glyphicon glyphicon-user"></span> 账户信息</a></li>--%>
                        <li><a href="javascript:void (0)" id="alterId"><span class="glyphicon glyphicon-edit"></span> 修改密码</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">系统设置</li>
                        <li><a href="javascript:void (0)" id="logoutId"><span class="glyphicon glyphicon-off"></span> 注销登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
        <div class="col-sm-2 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <a href="#" class="list-group-item active">
                    <span class="glyphicon glyphicon-user"></span>&nbsp;用户模块
                </a>
                <a href="javascript:void(0)" id="userBtn" class="list-group-item">添加用户</a>
                <a href="userList" class="list-group-item" target="main">用户管理</a>
<%--                <a href="#" class="list-group-item">图像的数量</a>
                <a href="#" class="list-group-item">每年更新成本</a>--%>
            </ul>
            <ul class="nav nav-sidebar">
                <a href="#" class="list-group-item active">
                    <span class="glyphicon glyphicon-tag"></span>&nbsp;标签模块
                </a>
                <a href="javascript:void(0)" id="openBtn" class="list-group-item">添加标签</a>
                <a href="tagList" class="list-group-item" target="main">标签管理</a>
            </ul>
            <ul class="nav nav-sidebar">
                <a href="#" class="list-group-item active">
                    <span class="glyphicon glyphicon-list-alt"></span>&nbsp;新闻模块
                </a>
                <%--<a href="javascript:void(0)" id="newsBtn" class="list-group-item">发布新闻</a>--%>
                <a href="addNews.jsp" id="newsBtn" class="list-group-item" target="main">发布新闻</a>
                <a href="searchNews" class="list-group-item" target="main">新闻管理</a>
            </ul>


        </div>
        <div id="killPhoneModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title text-center">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <span class="glyphicon glyphicon-tag "></span> 添加标签
                        </h3>
                    </div>
                    <div class="modal-body">
                            <form action="addTag" class="form-horizontal" role="form" method="post">
                                <div class="form-group">
                                    <label for="firstname" class="col-sm-2 control-label offset2">标签名称</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="tag.tagName" class="form-control" id="firstname" placeholder="请输入标签名称" required autofocus>
                                    </div>
                                </div>
                                <div class="form-group"></div>
                                <div class = "form-group">
                                    <label class="col-sm-2 control-label offset2" for = "level">标签级别</label>
                                    <div class="col-sm-8">
                                        <select id = "level" name="tag.tagLevel" class = "form-control">
                                            <option value=1>一级标签</option>
                                            <option value=2>二级标签</option>
                                            <option value=3>三级标签</option>
                                            <option value=4>四级标签</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group"></div>
                                <div class = "form-group">
                                    <label class="col-sm-2 control-label offset2" for = "parentlevel">父级标签</label>
                                    <div class="col-sm-8">
                                        <select id = "parentlevel" name="tag.parentTag.tagId" class = "form-control">
                                            <option value=-1>无</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
                                    <input type="submit" class="btn btn-primary" value="提交">
                                </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="adddUser" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title text-center">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <span class="glyphicon glyphicon-user "></span> 添加用户
                        </h3>
                    </div>
                    <div class="modal-body">
                        <form action="addUser" id="userForm" class="form-horizontal" role="form" method="post">
                            <div class="form-group">
                                <label for="uname" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-8">
                                    <input type="text" name="userInfo.userName" class="form-control" id="uname" placeholder="请输入用户名" required autofocus>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="psw" class="col-sm-2 control-label">密 码</label>
                                <div class="col-sm-8">
                                    <input type="password" name="userInfo.passWord" class="form-control" id="psw" placeholder="请输入密码" required >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="psw2" class="col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-8">
                                    <input type="password"  class="form-control" id="psw2" placeholder="再次确认密码" required >
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
                                <input type="submit" id="addUserbtn" class="btn btn-primary" value="提交">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="alterpsw" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title text-center">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <span class="glyphicon glyphicon-user "></span> 添加用户
                        </h3>
                    </div>
                    <div class="modal-body">
                        <form action="alter" id="alterForm" class="form-horizontal" role="form" method="post">
                            <div class="form-group">
                                <input type="hidden" name="id" value="${sessionUser.userId}">
                                <label for="uname" class="col-sm-2 control-label">原始密码</label>
                                <div class="col-sm-8">
                                    <input type="text"  class="form-control" value="${userInfo.passWord}" disabled required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="psw" class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-8">
                                    <input type="password" name="psw" class="form-control" id="confirmpsw" placeholder="请输入密码" required >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="psw2" class="col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-8">
                                    <input type="password"  class="form-control" id="confirm2" placeholder="再次确认密码" required >
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
                                <input type="submit" id="alterbtn" class="btn btn-primary" value="提交">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 main">

            <div id="repeat" class="alert alert-success">
                <a href="#" class="close" data-dismiss="alert">
                    &times;
                </a>
                <strong>${loginResult.data.stateInfo}!</strong>
            </div>
            <iframe name="main" id="mainFrame" width="100%" height="950px"  frameborder="0" scrolling="auto" src="addNews.jsp"   onload="">

            </iframe>
        </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        var state = '${loginResult.data.state}';
        if(state < 0){
            $('#repeat').removeClass('alert-success').addClass('alert-danger').css('display','block').delay(1500).hide(0);
        }else{
            $('#repeat').css('display','block').removeClass('alert-danger').addClass('alert-success').delay(1500).hide(0);
        }
        $('#openBtn').click(function () {
            $('#killPhoneModal').modal({
                show : true ,           //显示弹出层
                backdrop : 'static' ,  //禁止位置关闭
                keyboard : false        //关闭键盘事件
            });
        });
        //等级改变，加载父级标签
        $("#level").change(function() {
            $("#parentlevel option[value!='-1']").remove();
            $.get("loadParentTag", {
                levelId : $("#level").val()
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

        $('#userBtn').click(function () {
            $('#adddUser').modal({
                show : true ,
                backdrop : 'static' ,
                keyboard : false
            });
        });
        $('#alterId').click(function () {
            $('#alterpsw').modal({
                show : true ,
                backdrop : 'static' ,
                keyboard : false
            });
        });

        $('#addUserbtn').click(function () {
            if($("#psw").val()!=$("#psw2").val()){
                alert("两次输入的密码不一致");
                return false;
            }else{
                return true;
            }
        });
        $('#alterbtn').click(function () {
            if($("#confirmpsw").val()!=$("#confirm2").val()){
                alert("两次输入的密码不一致");
                return false;
            }else{
                return true;
            }
        });
        $('#logoutId').click(function () {
           if(confirm("确认注销当前登录用户吗?")){
               window.location.href="logout";
           }
        });
        $("#mainFrame").load(function () {
            var mainheight = $(this).contents().find("body").height() + 30;
            $(this).height(mainheight);
        });
    });
</script>
<%--<script src="../../assets/js/docs.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>--%>
</body>
</html>