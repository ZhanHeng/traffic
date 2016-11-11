<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>首页</title>
    <!-- 动态包含，多个Servlet -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">抚顺市交通局</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right" role="form">
                <div class="form-group">
                    <input type="text" placeholder="Email" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" placeholder="Password" class="form-control">
                </div>
                <button type="submit" class="btn btn-success">Sign in</button>
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<div class="jumbotron">
    <div class="container">
        <h1>秒杀，好物低价狂欢秒</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a class="btn btn-primary btn-lg" href="/seckill/list" role="button">查看全部 &raquo;</a></p>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <h2>清原县运管所实施亮化工程</h2>
            <p>为推动县区环境建设，全力提升城市管理水平，打造亮丽幸福清原，清原县运管所近日按照县城规划，在县委县政府“科学规范 创新和谐”的倡导下，投放资金2万余元实施亮化工程，对办公楼整个楼体安装夜间灯带进行亮化。经过紧张周密施工后，夜间运管所灯光闪烁与周围建筑相得益彰。在创建文明县城活动中，运管所与全县各级部门共同携手，不断提升市容环境整体水平，为创建生态文明幸福清原做出了应有贡献。</p>
            <p><a class="btn btn-default" href="/seckill/1000/detail" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>清原县运管所实施亮化工程</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-default" href="/seckill/1001/detail" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
            <h2>1元秒杀150元店铺优惠券</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-default" href="/seckill/1004/detail" role="button">View details &raquo;</a></p>
        </div>
    </div>

    <hr>

    <footer>
        <p>&copy; Company 2016</p>
    </footer>
</div> <!-- /container -->

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>