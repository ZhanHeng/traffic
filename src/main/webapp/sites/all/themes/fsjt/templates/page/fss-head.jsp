<%--
  Created by IntelliJ IDEA.
  User: CHENSHUANG
  Date: 2016/11/12
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xml:lang="zh-cn" xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn"><head>


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>抚顺市交通局</title>
    <!-- base -->
    <meta name="Keywords" content="辽宁省出行服务,高速公路,路段,救援,服务区,路况,出入口,普通公路,路段,普通货车通行费,优惠货车通行费,客运线路,旅游景区,订票电话,售票网点,服务热线,养路费,养路费网点,运管费网点,出行路径">
    <meta name="Description" content="辽宁省出行服务,高速公路,路段,救援,服务区,路况,出入口,普通公路,路段,普通货车通行费,优惠货车通行费,客运线路,旅游景区,订票电话,售票网点,服务热线,养路费,养路费网点,运管费网点,出行路径">
    <meta name="robots" content="index, follow">
    <meta name="googlebot" content="index, follow">
    <style type="text/css">
        body{text-align: center; font-family:"宋体", arial;margin:0; padding:0; background: #FFF; font-size:12px; color:#000;}
        #page1{
            width:1000px;margin-left:auto;margin-right:auto;
        }
        /*头图片*/
        #top{
            background-image:url('/sites/all/themes/fsjt/images/fs.jpg');
            width:1000px;
            height:102px;
            float:left;
        }
        /*菜单定义*/
        #navlist{
            float:left;
            width:1000px;
            height:36px;
            background-image:url('/sites/all/themes/fsjt/images/04.jpg');
        }
        #navlist ul {
            CLEAR: left;
            MARGIN: 0px;
            PADDING: 0px;
            BORDER: 0px;
            TEXT-ALIGN: center;
            display: inline;
            background:none;
        }

        #navlist li {
            height:36px;
            border:0;
            FLOAT: left;
            MARGIN: 0px;
            PADDING: 0px;
            TEXT-ALIGN: center;
            line-height:36px;
            list-style:none;
        }
        #navlist li a , #navlist li a:link {
            float:left;
            DISPLAY: block;
            MARGIN:0;
            PADDING:0 11px 0 11px;
            border:0;
            height:36px;
            COLOR: #920000;
            TEXT-DECORATION: none;
            font-weight:800;
            font-size:14px;
            background-image: url('/sites/all/themes/fsjt/images/04.jpg');
        }
        #navlist li a:hover {
            background-image: url('/sites/all/themes/fsjt/images/02.jpg');
        }
        #contentsearch{
            background-image: url('/sites/all/themes/fsjt/images/04.jpg');
            float:left;
            width:292px;
            height:36px;
        }
        #boxinput{
            float:left;
            position:relative;
            left:0px;
            padding-left:2px;
        }
        #boxsearch{
            float:left;
            position:relative;
            left:8px;
            top:9px;
            *top:9px;
            display:inline;
        }
        .inputstyle{
            width:120px;
        }
    </style>

    <script language="javascript" src="/sites/all/themes/fsjt/js/main.js"></script>

</head><body >
<div id="top">&nbsp;</div>
<div id="navlist">
    <ul>
        <li>
            <a href="/" target="_parent">首页</a>
        </li>
        <!--
         <li>
         <a href="/jtgk" target="_parent" title="交通概况">交通概况</a>
         </li>
         -->
        <li>
            <a href="/zzjg" target="_parent" title="组织机构">组织机构</a>
        </li>
        <li>
            <a href="/zwgk" target="_parent" title="政务公开">政务公开</a>
        </li>
        <li>
            <a href="http://www.moc.gov.cn/zhengce/" target="_parent" title="政策法规">政策法规</a>
        </li>
        <li>
            <a href="/gzdt" target="_parent" title="工作动态">工作动态</a>
        </li>
        <li>
            <a href="/hygl" target="_parent" title="行业管理">行业管理</a>
        </li>
        <li>
            <a href="/gcjs" target="_parent" title="工程建设">工程建设</a>
        </li>
        <li>
            <a href="/hywm" target="_parent" title="行业文明">行业文明</a>
        </li>
        <!--
         <li>
            <a href="/otherlist/廉政建设" target="_parent" title="廉政建设">廉政建设</a>
        </li>
         <li>
            <a href="/otherlist/交通规划" target="_parent" title="交通规划">交通规划</a>
        </li>
-->

    </ul>
</div>
<!---
		<div id="contentsearch">

		<img style="float: left; margin-left: 5px;" src="/sites/all/themes/fsjt/images/05.jpg">

	 <div id="boxinput" style="left: 0px; top: 8px; width: 128px;">

 <form method="post" action="/was40/search" onsubmit="javascript:return search(this);">

	<input name="channelid" value="54024" type="hidden">
	<input name="templet" value="fss_result.jsp" type="hidden">
	<input name="siteid" value="128" id="siteid" type="hidden">
	<input name="keyword" size="16" id="keyword" class="inputstyle" type="text">
	<input name="searchword" value="&lt;TRS:SearchReport type='searchword'&gt;&lt;/TRS:SearchReport&gt;" id="searchword" type="hidden">
    </form></div>

	  <div id="boxsearch">
	 <input name="Submit" value="检索" src="/sites/all/themes/fsjt/images/06.jpg" type="image">
	 <img style="cursor: pointer;" src="/sites/all/themes/fsjt/images/07.jpg" onclick="javascript:window.open('/was40/fss_adsearch.jsp');">

	 </div>
-->
</div>
<script type="text/javascript">
    /*
     function isIE(){
     return (document.all && window.ActiveXObject && !window.opera) ? true : false;
     }
     if(isIE()){
     document.execCommand("BackgroundImageCache", false, true);
     }
     */
</script>
</body></html>