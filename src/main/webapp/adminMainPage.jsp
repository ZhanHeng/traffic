<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="mainframe">
    <meta name="author" content="console">
    <%
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setDateHeader("Expires", 0);
    %>
    <title>管理页</title>

    <!-- Bootstrap core CSS -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
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
                background-color: #f5f5f5;
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
            padding: 20px;
        }
        @media (min-width: 768px) {
            .main {
                padding-right: 40px;
                padding-left: 40px;
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
    </style>
    <script type="text/javascript">
        var frameSrc = "/addNews.jsp";
        $('#openBtn').click(function(){
            $('#myModal').on('show', function () {
                $('iframe').attr("src",frameSrc);
            });
            $('#myModal').modal({show:true})
        });
    </script>
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
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:void(0)" style="cursor:pointer">抚顺交通局后台管理</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">修改密码</a></li>
                <li><a href="logout">注销登录</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">

            <ul class="nav nav-sidebar">
                <li class="active"><a href=""><span class="glyphicon glyphicon-user">&nbsp;用户模块</span></a></li>
                <li><a href="javascript:void(0)" id="userBtn">添加用户</a></li>
                <li><a href="">管理用户</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="active"><a href=""><span class="glyphicon glyphicon-tag">&nbsp;标签模块</span></a></li>
                <li><a href="javascript:void(0)" id="openBtn">添加标签</a></li>
                <li><a href="">管理标签</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="active"><a href=""><span class="glyphicon glyphicon-list-alt">&nbsp;新闻模块</span></a></li>
                <li><a href="javascript:void(0)" >添加新闻</a></li>
                <li><a href="#">管理新闻</a></li>
            </ul>
        </div>
        <div id="killPhoneModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title text-center">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <span class="glyphicon glyphicon-tag ">添加标签</span>
                        </h3>
                    </div>
                    <div class="modal-body">
                            <form action="addTag" class="form-horizontal" role="form" method="post">
                                <div class="form-group">
                                    <label for="firstname" class="col-sm-2 control-label">标签名称</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="tag.tagName" class="form-control" id="firstname" placeholder="请输入标签名称" required autofocus>
                                    </div>
                                </div>
                                <div class="form-group">
                                </div>
                                <div class = "form-group">
                                    <label class="col-sm-2 control-label" for = "level">选择级别</label>
                                    <div class="col-sm-8">
                                        <select id = "level" name="tag.tagLevel" class = "form-control">
                                            <option value=1>一级标签</option>
                                            <option value=2>二级标签</option>
                                            <option value=3>三级标签</option>
                                            <option value=4>四级标签</option>
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
                            <span class="glyphicon glyphicon-user ">添加用户</span>
                        </h3>
                    </div>
                    <div class="modal-body">
                        <form action="addUser" class="form-horizontal" role="form" method="post">
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
                                    <input type="password"  class="form-control" id="psw2" placeholder="请再次输入密码" required >
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
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
           <h2 class="page-header">title <span id="killPhoneMessage" class="text-center"></span></h2>
            <div class="table-responsive">
                <div id="repeat" class="alert alert-danger" style="display:none">
                    <a  href="#" class="close" data-dismiss="alert">
                        &times;
                    </a>
                    <strong>${loginResult.data.stateInfo} !</strong>
                </div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1,001</td>
                        <td>Lorem</td>
                        <td>ipsum</td>
                        <td>dolor</td>
                        <td>sit</td>
                    </tr>
                    <tr>
                        <td>1,002</td>
                        <td>amet</td>
                        <td>consectetur</td>
                        <td>adipiscing</td>
                        <td>elit</td>
                    </tr>
                    <tr>
                        <td>1,003</td>
                        <td>Integer</td>
                        <td>nec</td>
                        <td>odio</td>
                        <td>Praesent</td>
                    </tr>
                    <tr>
                        <td>1,003</td>
                        <td>libero</td>
                        <td>Sed</td>
                        <td>cursus</td>
                        <td>ante</td>
                    </tr>
                    <tr>
                        <td>1,004</td>
                        <td>dapibus</td>
                        <td>diam</td>
                        <td>Sed</td>
                        <td>nisi</td>
                    </tr>
                    <tr>
                        <td>1,005</td>
                        <td>Nulla</td>
                        <td>quis</td>
                        <td>sem</td>
                        <td>at</td>
                    </tr>
                    <tr>
                        <td>1,006</td>
                        <td>nibh</td>
                        <td>elementum</td>
                        <td>imperdiet</td>
                        <td>Duis</td>
                    </tr>
                    <tr>
                        <td>1,007</td>
                        <td>sagittis</td>
                        <td>ipsum</td>
                        <td>Praesent</td>
                        <td>mauris</td>
                    </tr>
                    <tr>
                        <td>1,008</td>
                        <td>Fusce</td>
                        <td>nec</td>
                        <td>tellus</td>
                        <td>sed</td>
                    </tr>
                    <tr>
                        <td>1,009</td>
                        <td>augue</td>
                        <td>semper</td>
                        <td>porta</td>
                        <td>Mauris</td>
                    </tr>
                    <tr>
                        <td>1,010</td>
                        <td>massa</td>
                        <td>Vestibulum</td>
                        <td>lacinia</td>
                        <td>arcu</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
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
            $('#repeat').css('display','block').delay(2000).hide(0);
        }else{
            $('#repeat').css('display','block').removeClass('alert-danger').addClass('alert-info').delay(2000).hide(0);
        }
        $('#openBtn').click(function () {
            $('#killPhoneModal').modal({
                show : true ,           //显示弹出层
                backdrop : 'static' ,  //禁止位置关闭
                keyboard : false        //关闭键盘事件
            });
        });
        $('#userBtn').click(function () {
            $('#adddUser').modal({
                show : true ,           //显示弹出层
                backdrop : 'static' ,  //禁止位置关闭
                keyboard : false        //关闭键盘事件
            });
        });
    });
</script>
<%--<script src="../../assets/js/docs.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>--%>
</body>
</html>