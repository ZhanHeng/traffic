<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.traffic.model.NewsAndNotice"%>
<%
    String path = request.getContextPath();
    String data = null;
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    NewsAndNotice temp=(NewsAndNotice)request.getAttribute("showOneInfo");
    if(temp!=null)
    { data = temp.getContentStr();}
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
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../templates/met007/images/css/metinfo.css" />
    <link rel="stylesheet" type="text/css" href="templates/met007/images/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="../templates/met007/images/css/focusStyle.css" />
    <link href="templates/met007/images/css/reset.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <script src="public/js/public.js" type="text/javascript" language="javascript"></script>
</head>



<script type="text/javascript">
    $(document).ready(function(){
        $("#nav_10001").addClass("downnav");
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
<style>
    body{
        font-family:微软雅黑;
        color:black;
        margin: 0;
        padding: 0;
    }
    .h3, h3 {
        font-family: '微软雅黑';
        font-size: 15px;
        font-weight: bold;
        height: 23px;
        line-height: 23px;
    }
    #container {
        width: 960px;
        margin: 0 auto;
        height: 100%;
        border: 2px;
    }

    .content {
        width: 758px;
        float: right;
        height: auto;
        margin-bottom: 50px;
        margin-left:  5px;
        border: 1px #cfcfcf solid;
        border-image: none;
    }

    .menu {
        width: 193px;
        height:auto;
        margin-top: 5px;
    }

    .menulist {
        border-left: 1px #cfcfcf solid;
        border-right: 1px #cfcfcf solid;
        border-bottom: 1px #cfcfcf solid;
        height: auto;
    }

    .menulist ul {
        margin: 0px;
        padding: 15px 0px 30px 0px;
    }

    .menulist li {
        width: 191px;
        height: 35px;
        line-height: 35px;
        margin-right:8px;
    }

    .menulist li a {
        text-align: left;
        color: #000;
        display: block;
        width: 180px;
        height: 30px;
        line-height: 30px;
        margin-left:10px;
        padding-left: 15px;
        font-weight:300;
        background: url("../images/d06.gif") no-repeat 3%;
    }

    .menu li a:hover {
        color: #EC6941;
        text-decoration: none;
    }
    .menu li a.hoveron {
        color: red;
        font-weight: bold;
    }

    .title {
        font-size: 16px;
        font-weight: bold;
        color: #FFF;
        background: transparent url("../images/left_bg1.jpg") repeat-x scroll 0% 0%;
        height: 36px;
        line-height: 36px;
        border-bottom: 1px solid #D4D4D4;
        text-align: center;
    }

    .bannertitle img {
        width: 1000px;
        height: 157px;
        border:0;
        margin: 0 auto;
    }

    .location {
        background: transparent url("../images/cur_bg.jpg") repeat-x scroll 0% 0%;
        height: 36px;
        padding: 0px;
        line-height: 36px;
        color: #000;
        width: 756px;
    }
    .location span{
        cursor: default;
    }
    .ltext {
        margin-left: 5px;
    }
    .ltext a{
        color: #0c5484;
        padding: 0px 5px;
    }
    .ltext a:hover{
        color: #94070a;
        text-decoration: underline;
    }
    .content h1 {
        width:700px;
        margin:0 auto;
        font-size: 20px;
        text-align: center;
        border-bottom: 1px solid #DFDFDF;
        padding: 20px 0px 10px;
        font-weight:bold;
        color: #000;
    }
    .right_title {
        font-size: 13px;
        color: #999;
        text-align: center;
        padding-top: 5px;
    }
    .detailcontent{
        margin: 45px auto;
        padding: 5px 2px;
        width: 700px;
        height: auto;
        min-height: 550px;

    }
    .detailcontent a{
        color:blue;
        text-decoration: underline;
    }
    .leftbar{
        width: 200px;
        border: 1px #cfcfcf solid;
        height: 220px;
        margin-top: 10px;
    }
    .title2 {
        width: 100%;
        margin: 10px 0 0 10px;
        background: transparent url("../images/jxjy_sidebar_icon2.png") no-repeat scroll left top;
        height: 28px;
        line-height: 28px;
    }
    .title2 span{
        margin-left: 36px;
        height: 28px;
        color: #B28850;
        font-size: 18px;
        line-height: 28px;
    }
    .listbox{
        height: 100%;
        width: 100%
    }
    .listbox ul{
        padding: 0;
        text-align: left;
        margin-left: 15px;
        width: 80%;
    }
    .listbox li{
        padding: 0;
        text-align: left;
        margin:8px 0;
    }
    .listbox li span{
        color: #434343;
        font-size: 12px;
    }
    .listbox li a {
        width: 100%;
        padding: 8px 0px 8px 25px;
        text-align: left;
        color: #434343;
        display: block;
        background: #EEE none repeat scroll 0% 0%;
    }
    .listbox li a:hover{
        background: #EC6941 none repeat scroll 0% 0%;
        color: #FFF;
    }

    .right_con2 {
        min-height: 550px;
        height: auto !important;
        border-image: none;
        padding: 20px 40px 0px;
        line-height: 200%;
        font-size: 14px;
        color: #2B2B2B;
        background: #FFF none repeat scroll 0% 0%;
    }
    .right_con2 ul {
        margin: 0px;
        padding: 0px;
        list-style: outside none none;
    }
    .right_con2 li{
        background: transparent url("../images/border_bot.jpg") repeat-x scroll center bottom;
        line-height: 35px;
        padding: 0px;

    }
    .right_con2 li span {
        float: right;
        color: #666;
        font-size: 13px;
    }
    .right_con2 li a {
        text-decoration: none;
        color: #2B2B2B;
        font-size: 14px;
        padding: 0px 0px 0px 11px;
    }
    .right_con2 li a:hover{
        color: #94070a;
        text-decoration: underline;
    }

    .pagination a {
        text-decoration: none;
        border: 1px solid #AAE;
        color: #15b;
    }

    .pagination a, .pagination span {
        display: inline-block;
        padding: 0.1em 0.4em;
        margin-right: 5px;
        margin-bottom: 5px;
    }

    .pagination .current {
        background: #26B;
        color: #fff;
        border: 1px solid #AAE;
    }

    .pagination .current.prev, .pagination .current.next{
        color:#999;
        border-color:#999;
        background:#fff;
    }

    #navlist{
        margin-left:17px;
        margin-right:auto;
        width:734px;
        height:36px;
    }
    #navlist ul {
        margin: 0px;
        padding: 0px;
        border: 0px;
        text-align: center;
        display: inline;
        background:none;
        list-style-type:none;
        height:28px;
    }

    #navlist li {
        height:28px;
        border:0;
        float: left;
        padding: 0px;
        border: 0px;
        text-align: center;
        line-height:36px;
        list-style:none;
        display:inline;
        width:100px;
    }
    #navlist li a , #navlist li a:link {
        display: block;
        padding:3px 11px ;
        border:0;
        height:36px;
        TEXT-DECORATION: none;
        font-weight:800;
        font-size:13px;
        list-style-type:none;
        display:inline;
        color: #FFf;
        background: #2a84b1;
    }
    #navlist li a p:hover {
        text-decoration: underline;
        color:red;
    }
</style>

<body>


<div id="metinfo">
    <div id="top" style="margin-top:-10px; margin-left:0px;width: 960px; background:url(../upload/cac-static/top-bg002.png) no-repeat">
        <div class="clear"></div>
    </div>
    <div id="nav" class="top-nav">
        <div class="top-nav">
            <ul class="top-nav list-style">

                <li class="line top-nav"></li>
                <li class=>
                    <a href="welcome.jsp" title="首页">
                        <span><h3>首页</h3></span>
                    </a>
                </li>
                <c:forEach items="${aboveTagList}" var="util" varStatus="status">
                    <li class="line top-nav"></li>
                    <li>
                        <a href="getTagNews?tid=${util.tagId}"  title="${util.tagName}">
                            <span><h3>${util.tagName}</h3></span>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div id="container">
        <div class="content">
            <div class="location"><span class="ltext">当前位置 :<a href="home" target="_self">首页</a></span>&gt; <span class="ltext"> <a href="getTagNews?tid=${labelTag2.tagId}" title="${labelTag2.tagName}" target='_self'>${labelTag2.tagName}</a></span></div>
            <div id="navlist" style="width: 753px">
                <ul >
                    <c:forEach items="${aboveList}" var="util" varStatus="status">
                        <li > <a  href="getTagNews?tid=${util.tagId}" title="${util.tagName}" target='_self'>${util.tagName}</a> </li>
                    </c:forEach>
                </ul>
            </div>
            <c:if test="${showOneInfo ==null}"> <h1> 暂无信息！</h1></c:if>
            <c:if test="${showOneInfo!=null}">
                <h1> ${showOneInfo.title}</h1>
                <div class="right_title">来源: ${showOneInfo.author}&nbsp;&nbsp;&nbsp;&nbsp;时间 : ${showOneInfo.time} </div>
                <div class="detailcontent">
                    <%=data %>
                </div>
            </c:if>
        </div>
        <div class="menu">
            <div class="title" id="parentId">${labelTag1.tagName}</div>
            <img src="/sites/all/themes/fsjt/images/lm_hywm.jpg" width="193px" style="border-left: 1px solid #cfcfcf;border-left: 1px solid #cfcfcf">
            <div class="menulist">
                <c:if test="${!empty leftList}">
                    <ul id="menuId">
                        <c:forEach items="${leftList}" var="util" varStatus="status">
                            <li > <a href="getTagNews?tid=${util.tagId}" title="${util.tagName}" target='_self'>${util.tagName}</a> </li>
                        </c:forEach>
                    </ul>
                </c:if>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="clear"></div>
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
</body>
</html>
