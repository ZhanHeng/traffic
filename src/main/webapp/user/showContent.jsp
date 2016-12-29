<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.traffic.model.NewsAndNotice"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    NewsAndNotice temp=(NewsAndNotice)request.getAttribute("showDetailInfo");
    String data = temp.getContentStr();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name='renderer' content='webkit'>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=11,chrome=1"/>
    <meta charset='utf-8' />
    <title>抚顺市交通局</title>
    <meta name="Keywords" content="辽宁省出行服务,高速公路,路段,救援,服务区,路况,出入口,普通公路,路段,普通货车通行费,优惠货车通行费,客运线路,旅游景区,订票电话,售票网点,服务热线,养路费,养路费网点,运管费网点,出行路径">
    <meta name="Description" content="辽宁省出行服务|高速公路,|路段|救援|服务区|路况|出入口|普通公路|路段|普通货车通行费|优惠货车通行费|客运线路|旅游景区|订票电话|售票网点|服务热线|养路费|养路费网点|运管费网点|出行路径">
    <meta name="author" content="抚顺市交通局" />
    <meta name="copyright" content="Copyright 2008-2016 MetInfo" />
    <link href="favicon.ico" rel="shortcut icon" />
    <link rel="stylesheet" type="text/css" href="templates/met007/images/css/metinfo.css" />
    <link rel="stylesheet" type="text/css" href="templates/met007/images/css/footer.css" />
    <script src="public/js/metinfo-min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <link rel="stylesheet" type="text/css" href="templates/met007/images/css/focusStyle.css" />
    <style type="text/css">
        a:hover{color:red;}

        .gd a{
            height: 20px;
            line-height: 20px;
            padding: 0 10px;
            background-color: #0054ba;
            color: #fff;
            font-size: 14px;
        }
    </style>
    <script src="public/js/public.js" type="text/javascript" language="javascript"></script>
</head>
<!--[if IE 6]>
<script src="templates/met007/images/js/IE6-png.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript">
    DD_belatedPNG.fix('.bg,img');
</script>
<![endif]-->
<link href="templates/met007/images/css/reset.css" rel="stylesheet" type="text/css" />

    <style>

        .zcjdxl_main {
            width: 950px;
            padding: 25px 5px;
            border: 1px solid #cccbca;
            min-height: 550px;
            margin-bottom: 30px;
        }

        .zcjdxl_main h3 {
            font-size: 30px;
            color: #000;
            width: 940px;
            text-align: center;
            padding: 25px 10px 15px 10px;
        }
        .zcjdxl_main_top {
            width: 900px;
            padding: 0 30px;
            line-height: 25px;
            color: #222;
            font-size: 14px;
        }
    </style>
</head>


<body>


<div id="metinfo">
    <div id="top" style="margin-top:-10px; margin-left:0px; background:url(../upload/cac-static/top-bg002.png) no-repeat">
        <div class="clear"></div>
    </div>
    <div id="nav" class="top-nav">
        <div class="top-nav">
            <ul class="top-nav list-style">

                <li class="line top-nav"></li>
                <li class=>
                    <a href="welcome.jsp" title="首页">
                        <span>首页</span>
                    </a>
                </li>
                <c:forEach items="${aboveTagList}" var="util" varStatus="status">
                    <li class="line top-nav"></li>
                    <li>
                        <a href="getTagNews?tid=${util.tagId}"  title="${util.tagName}">
                            <span>${util.tagName}</span>
                        </a>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>

    <div class="zcjdxl_main fix">
        <h3> ${showDetailInfo.title}</h3>
        <h4 style="text-align: center;margin: 6px auto;color:#666;font-size:13px">来源：${showDetailInfo.author}&nbsp;&nbsp;&nbsp;&nbsp;时间:${showDetailInfo.time}</h4>
        <h5 style="text-align: center;margin: 6px auto;color:#333;font-size:13px">【字号 <a href="#" onclick="Zoom.style.fontSize='16px';" target="_self" title="大"><font color="000">大</font></a> <a href="#" onclick="Zoom.style.fontSize='14px';" target="_self" title="中"><font color="000">中</font></a> <a href="#" onclick="Zoom.style.fontSize='12px';" target="_self" title="小"><font color="000">小</font></a>】&nbsp;&nbsp;&nbsp;&nbsp;【<a href="javascript:window.print();" target="_self" title="我要打印"><font color="000">我要打印</font></a>】</h5>
        <div class="zcjdxl_main_top" id="Zoom">
            <%=data %>
        </div>
    </div>
</div>

<div id="footer" >
    <div class="footcontent">
        <div class="linksection">
            <h3>联系我们</h3>
            <ul class="footer_menu_list">
                <li>电话：024-57505000</li>

                <li>地址：顺城区临江东路1号 </li>
                <li> 维护单位：抚顺市交通局信息中心 </li>

            </ul>
        </div>
        <div class="linksection">
            <h3>友情链接</h3>
            <ul class="footer_menu_list">
                <li><a href="http://www.moc.gov.cn/" target="_blank">交通部</a></li>
                <li><a href="http://www.lncom.gov.cn/" target="_blank">辽宁省交通厅</a></li>

                <li><a href="http://www.fushun.gov.cn/" target="_blank">抚顺政府门户网</a></li>
                <li><a href="http://www.fszwgk.gov.cn/" target="_blank">抚顺政务公开网</a></li>
            </ul>
        </div>
        <div class="linksection">
            <h3>相关链接</h3>
            <ul class="footer_menu_list" >
                <li><a href="http://www.mxwz.com/" target="_blank">民心网</a></li>
                <li><a href="http://www.lncredit.gov.cn/" target="_blank">信用辽宁</a></li>
                <li><a href="http://www.fscredit.gov.cn/" target="_blank">信用抚顺</a></li>
            </ul>
        </div>
        <div>
            <a href="//bszs.conac.cn/sitename?method=show&amp;id=0973505E8D356365E053022819AC8FD2" target="_blank"><img  style="position: relative ;width: 80px;height: 80px; top:-10px;left:-670px" id="imgConac" vspace="0" hspace="0" border="0" src="//dcs.conac.cn/image/red_error.png" data-bd-imgshare-binded="1"></a>
            <a  href="http://webscan.360.cn/index/checkwebsite/url/www.fsjt.gov.cn"><img border="0" style="position: relative ;width: 100px;height: 35px; position:relative;left:-660px;top:10px" src="http://img.webscan.360.cn/status/pai/hash/749e8c93d6b78a0d46b3878af69258ab"/></a> <br/>
        </div>
    </div>
    <div style="clear:both"></div>
    <div id="copyright" style="position: relative">
        Copyright @ 2016 <a href="#" target="_blank" style="color: white">抚顺市交通局</a> | fscic@163.com    辽ICP06018765 &nbsp;
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#nav li").hover(
                function () {
                    $(this).addClass("hover");
                },
                function () {
                    $(this).removeClass("hover");
                }
        );
    });
</script>
</body>
</html>