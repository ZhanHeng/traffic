<%--
  Created by IntelliJ IDEA.
  User: CHENSHUANG
  Date: 2016/11/18
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
        body{
            font-family:微软雅黑;
            color:black;
        }
        table td{font-family:微软雅黑;color:black;}
        table th{font-family:微软雅黑;color:black;}
        a:hover{color:red;}
        #nav h3{
            font-family: 黑体,"Arial Black";
            font-size: 16px;

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
    $(function(){


        //TAB切换
        $('.title').each(function(){
            $(this).children('.title1').eq(0).addClass('xz');
        })

        $('.title_nr').each(function(){
            $(this).children('.title_nr1').eq(0).show();
        })

        $('.title1').mouseover(function(){
            $(this).addClass('xz').siblings().removeClass('xz');
            $(this).parent().siblings('.title_nr').children('.title_nr1').eq($(this).index()).show().siblings().hide();
        })

        //TAB切换
        $('.title2').each(function(){
            $(this).children('.title2_1').eq(1).addClass('xz');
        })

        $('.title2_nr').each(function(){
            $(this).children('.title2_nr1').eq(1).show().siblings().hide();
        })

        $('.title2_1').mouseover(function(){
            $(this).addClass('xz').siblings().removeClass('xz');
            $('.title2_nr').children('.title2_nr1').eq($(this).index()).show().siblings().hide();
        })

        //TAB切换-访谈
        $('.title3').each(function(){
            $(this).children('.title3_1').eq(0).addClass('xz');
        })

        $('.title3_nr').each(function(){
            $(this).children('.title3_nr1').eq(0).show().siblings().hide();
        })

        $('.title3_1').mouseover(function(){
            $(this).addClass('xz').siblings().removeClass('xz');
            $('.title3_nr').children('.title3_nr1').eq($(this).index()).show().siblings().hide();
        })

    })
</script>

<script>
    function Banner(){
        $.ajax( {
            type: "get",
            url: "listFocusPicture",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(result) {
                var news =result["focusPictureList"];

                if (news.length > 0) {
                    for(var i=0;i< news.length;i++){
                        var s="";
                        s=news[i].path;
                       // s=(news[i].path).substring(news[i].path.indexOf("\Economic")+9, news[i].path.length).replace(/\\/,"/");
                        var li="<li>"+"<a href='showNewsDetail?shownewId="+news[i].id+"' class='focus-banner-img' target='_self'>"+"<img src='"
                                +s+"'/>"+"</a>";
                        li=li+"<div class='focus-banner-text'><p>"+news[i].title+"</p></div>";
                        li=li+"</li>";
                        $("#focus-banner-list").append(li);

                    }
                    var $focusBanner=$("#focus-banner"),
                            $bannerList=$("#focus-banner-list li"),
                            $focusHandle=$(".focus-handle"),
                            $bannerImg=$(".focus-banner-img"),
                            $nextBnt=$("#next-img"),
                            $prevBnt=$("#prev-img"),
                            $focusBubble=$("#focus-bubble"),
                            bannerLength=$bannerList.length,
                            _index=0,
                            _timer="";
                    //alert(" 长度为： "+$bannerList.length)
                    for(var i=0; i<bannerLength; i++){
                        $bannerList.eq(i).css("zIndex",bannerLength-i);
                        $focusBubble.append("<li></li>");
                    }
                    $focusBubble.find("li").eq(0).addClass("current");
                    var bubbleLength=$focusBubble.find("li").length;
                    $focusBubble.css({
                        "width":bubbleLength*22,
                        "marginLeft":-bubbleLength*11
                    });//初始化

                    $focusBubble.on("click","li",function(){
                        $(this).addClass("current").siblings().removeClass("current");
                        _index=$(this).index();
                        changeImg(_index);
                    });//点击轮换

                    $prevBnt.on("click",function(){
                        _index++
                        if(_index>bannerLength-1){
                            _index=0;
                        }
                        changeImg(_index);
                    });//下一张

                    $nextBnt.on("click",function(){
                        _index--
                        if(_index<0){
                            _index=bannerLength-1;
                        }
                        changeImg(_index);
                    });//上一张

                    function changeImg(_index){
                        $bannerList.eq(_index).fadeIn(700);//淡入
                        $bannerList.eq(_index).siblings().fadeOut(700);//淡出
                        $focusBubble.find("li").removeClass("current");
                        $focusBubble.find("li").eq(_index).addClass("current");
                        clearInterval(_timer);
                        _timer=setInterval(function(){$prevBnt.click()},5000)
                    }//切换主函数
                    _timer=setInterval(function(){$prevBnt.click()},5000)
                } else {
                    var li="<li><img src='images/banner2.jpg' /></li>";
                    $("#focus-banner-list").append(li);
                }
            },
            error: function() {
                alert("系统故障，请重试！");
                var li="<li><img src='images/banner2.jpg' /></li>";
                $("#focus-banner-list").append(li);
            }
        });
    }


</script>
<body onload="Banner();">

<div id="metinfo">
    <!--<div class="topbg"></div>-->
    <div id="top" style="margin-top:-10px; margin-left:0px; background:url(upload/cac-static/top-bg002.jpg) no-repeat">
        <div class="sidebar floatr">
            <ul class="list-style">

                <li><a href=""  title=""></a></li>

                <li><a href=""  title=""></a></li>

                <li><a href=""  title=""></a></li>

                <li><a href=""  title=""></a></li>


                <li></li>
                <li></li>


                <li class="lang"></li>
            </ul>
            <div class="seo"></div>
        </div>
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
                <li class="line top-nav"></li>

            </ul>
        </div>
    </div>



    <div id="flash">

        <div style="clear:both;height:0"></div>
        <div id="focus-banner">
            <ul id="focus-banner-list">
            </ul>
            <a href="javascript:;" id="next-img" class="focus-handle"></a>
            <a href="javascript:;" id="prev-img" class="focus-handle"></a>
            <ul id="focus-bubble"></ul>
        </div>



        <div class="right floatr" style="font-size: 14px;">
            <div class="top">
                <ul class="list list-style">
                    <li class="hover" style="font-size: 16px;font-family: "宋体", arial;">通知公告</li>

                </ul>
                <div class="text clear">
                    <div class="box editor">
                        <ul class="newslist">
                            <c:forEach items="${noticeList}" var="util" varStatus="status">
                                <li><a href="showNewsDetail?shownewId=${util.id}" target="_blank" title="${util.title}">
                                    <c:if test="${util.title.length()>20}">
                                   ${util.title.substring(0,20)}...
                                    </c:if>
                                    <c:if test="${util.title.length()<=20}">
                                        ${util.title}
                                    </c:if>

                                </a>
                                </li>
                            </c:forEach>
                            <c:if test="${noticeList.size()==8}">

                                <li><a href="getTagNews?tid=39" target="_blank" title="更多通知>>>">更多通知>>>
                                </a>
                                </li>
                            </c:if>



                        </ul>
                    </div>


                </div>
            </div>

            <div id="searchbox">
                <form method="POST" name="myform1" action="frontSearchNews"  target="_self">
                    <input type="text" name="searchword" size="30"  class="navtext" />
                    <input type='submit' name='Submit' value='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' class="navsb" />
                </form>
            </div>


        </div>
        <div class="clear"></div>

    </div>
    <div id="main">
        <div class="main2_nr fl" style="">
            <div class="title fix">
                <c:forEach items="${leftTagList}" var="util" varStatus="status">
                    <c:if test="${status.first}">

                            <div class="title1 xz"><a href="getTagNews?tid=${util.tagId}" title="${util.tagName}" target="_blank">${util.tagName}</a></div>

                    </c:if>
                    <c:if test="${!status.first}">

                            <div class="title1"><a href="getTagNews?tid=${util.tagId}" title="${util.tagName}" target="_blank">${util.tagName}</a></div>

                    </c:if>

                </c:forEach>

            </div>
            <div class="title_nr">

                <c:forEach items="${leftNewsList}" var="util" varStatus="status">
                    <c:if test="${status.first}">

                        <div class="title_nr1" style="display: block;">
                            <ul>
                                <c:forEach items="${util}" var="x" varStatus="substatus">
                                    <li class="fix"><a href="showNewsDetail?shownewId=${x.id}" title="${x.title}" target="_blank">
                                    <c:if test="${x.title.length()>27}">
                                        ${x.title.substring(0,27)}...
                                    </c:if>
                                    <c:if test="${x.title.length()<=27}">
                                        ${x.title}
                                    </c:if>
                                  </a>[${x.time}]</li>

                                </c:forEach>
                                <c:if test="${util.size()==7}">

                                    <li><a href="getTagNews?tid=${leftTagList.get(status.index).getTagId()}" target="_blank" title="更多新闻>>>">更多新闻>>>
                                    </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>

                    </c:if>
                    <c:if test="${!status.first}">

                        <div class="title_nr1" style="display: none;">
                            <ul>

                                <c:forEach items="${util}" var="x" varStatus="substatus">
                                    <li class="fix"><a href="showNewsDetail?shownewId=${x.id}" title="${x.title}" target="_blank">
                                        <c:if test="${x.title.length()>31}">
                                            ${x.title.substring(0,29)}...
                                        </c:if>
                                        <c:if test="${x.title.length()<=31}">
                                            ${x.title}
                                        </c:if>
                                    </a>[${x.time}]</li>

                                </c:forEach>

                            </ul>
                        </div>

                    </c:if>

                </c:forEach>



            </div>
        </div>

        <div class="main2_nrf fl">
            <div class="title fix">
                    <c:forEach items="${rightTagList}" var="util" varStatus="status">
                        <c:if test="${status.first}">

                            <div class="title1 xz"><a href="getTagNews?tid=${util.tagId}" title="${util.tagName}" target="_blank">${util.tagName}</a></div>

                        </c:if>
                        <c:if test="${!status.first}">

                            <div class="title1"><a href="getTagNews?tid=${util.tagId}" title="${util.tagName}" target="_blank">${util.tagName}</a></div>

                        </c:if>

                    </c:forEach>

            </div>
            <div class="title_nr">

                <c:forEach items="${rightNewsList}" var="util" varStatus="status">
                    <c:if test="${status.first}">

                        <div class="title_nr1" style="display: block;">
                            <ul>
                                <c:forEach items="${util}" var="x" varStatus="substatus">
                                    <li class="fix"><a href="showNewsDetail?shownewId=${x.id}" title="${x.title}" target="_blank">
                                        <c:if test="${x.title.length()>31}">
                                            ${x.title.substring(0,29)}...
                                        </c:if>
                                        <c:if test="${x.title.length()<=31}">
                                            ${x.title}
                                        </c:if>
                                    </a>[${x.time}]</li>

                                </c:forEach>

                            </ul>
                        </div>

                    </c:if>
                    <c:if test="${!status.first}">

                        <div class="title_nr1" style="display: none;">
                            <ul>
                                <c:forEach items="${util}" var="x" varStatus="substatus">
                                    <li class="fix"><a href="showNewsDetail?shownewId=${x.id}" title="${x.title}" target="_blank">
                                        <c:if test="${x.title.length()>31}">
                                            ${x.title.substring(0,29)}...
                                        </c:if>
                                        <c:if test="${x.title.length()<=31}">
                                            ${x.title}
                                        </c:if>
                                    </a>[${x.time}]</li>

                                </c:forEach>
                            </ul>
                        </div>

                    </c:if>

                </c:forEach>


            </div>
        </div>
        <div class="clear"></div>
        <div class="main2_nr fl" style="height: 204px;">
            <div class="title fix">


                        <div class="title1 xz"><a href="javascript:void(0);" title="政府信息公开" target="_blank">政府信息公开</a></div>
                        <div class="title1 "><a href="javascript:void(0);" title="领导分工" target="_blank">领导分工</a></div>
                        <div class="title1 "><a href="http://www.mxwz.com/comp/jb.aspx?fs=%E5%92%A8%E8%AF%A2" title="政策咨询" target="_blank">政策咨询</a></div>
               　　　　 <div class="title1 "><a href="http://www.lncom.gov.cn/bs/" title="在线办理" target="_blank">在线办理</a></div>



            </div>
            <div class="title_nr" style="height: 170px;">





                <div class="title_nr1" style="display: block;">
                    <ul>

                        <li class="fix"><a href="http://www.fszwgk.gov.cn/szfxxgk/dw.asp?s=25" title="信息公开目录" target="_blank">信息公开目录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </li>

                        <li class="fix"><a href="http://www.fszwgk.gov.cn/szfxxgk/zn.asp?s=25" title="信息公开指南" target="_blank">信息公开指南</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </li>

                        <li class="fix"><a href="javascript:void(0);" title="办事指南" target="_blank">办事指南</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      </li>

                        <li class="fix"><a href="http://www.fszwgk.gov.cn/gk_list_Department.asp?d=25" title="行政权力公开" target="_blank">行政权力公开</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

                        <li class="fix"><a href="javascript:void(0);" title="依申请公开" target="_blank">依申请公开</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>


                    </ul>
                </div>
                <div class="title_nr1" style="display: none;">
                    <ul>

                        <li class="fix"><a href="javascript:void(0);" title="进入领导分工" target="_blank">进入领导分工</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>

                <div class="title_nr1" style="display: none;">
                    <ul>

                        <li class="fix"><a href="http://www.mxwz.com/comp/jb.aspx?fs=%E5%92%A8%E8%AF%A2" title="进入政策咨询" target="_blank">进入政策咨询</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>

                <div class="title_nr1" style="display: none;">
                    <ul>

                        <li class="fix"><a href="http://www.lncom.gov.cn/bs/" title="进入在线办理" target="_blank">进入在线办理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>




            </div>
        </div>

        <div class="main2_nrf fl"  style="height: 204px;">
            <div class="title fix">


                        <div class="title1 xz"><a href="javascript:void(0);" title="局长信箱" target="_blank">局长信箱</a></div>



                        <div class="title1"><a href="http://www.fszwgk.gov.cn/surveyol.asp" title="意见征集" target="_blank">意见征集</a></div>

               　　　　 <div class="title1"><a href="javascript:void(0);" title="双创政策" target="_blank">双创政策</a></div>



            </div>
            <div class="title_nr"  style="height: 170px;">




                 <div class="title_nr1" style="display: block;">
                      <ul>

                          <li class="fix"><a href="javascript:void(0);" title="进入局长信箱" target="_blank">进入局长信箱</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

                          <li class="fix"><a href="javascript:void(0);" title="查看办理情况" target="_blank">查看办理情况</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>


                      </ul>
                  </div>
                  <div class="title_nr1" style="display: none;">
                      <ul>

                          <li class="fix"><a href="http://www.fszwgk.gov.cn/surveyol.asp" title="进入意见征集" target="_blank">进入意见征集</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                      </ul>
                  </div>

                <div class="title_nr1" style="display: none;">
                    <ul>

                        <li class="fix"><a href="javascript:void(0);" title="进入双创政策" target="_blank">进入双创政策</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>

            </div>
        </div>

        <div class="clear"></div>
<!--
        <div class="links">
            <h4 class="title">友情链接</h4>
            <div class="text">
                <div class="list">

                    <div class="img"><ul class='list-none'>
                    </ul>
                    </div>

                    <div class="clear"></div>
                    <ul class='list-none'>
                        <li style="display:inline;"><a href='http://www.moc.gov.cn/' target='_blank' title='交通部'><h3>交通部</h3></a></li>
                        <li style="display:inline;"><a href='http://www.lncom.gov.cn/' target='_blank' title='辽宁省交通厅'><h3>辽宁省交通厅</h3></a></li>
                        <li style="display:inline;"><a href='http://www.fushun.gov.cn/' target='_blank' title='抚顺政府门户网'><h3>抚顺政府门户网</h3></a></li>
                        <li style="display:inline;"><a href='http://www.fszwgk.gov.cn/' target='_blank' title='抚顺政务公开网'><h3>抚顺政务公开网</h3></a></li>
                        <li style="display:inline;"><a href='http://www.mxwz.com/' target='_blank' title='民心网'><h3>民心网</h3></a></li>
                        <li style="display:inline;"><a href='http://www.lncredit.gov.cn/' target='_blank' title='信用辽宁'><h3>信用辽宁</h3></a></li>
                        <li style="display:inline;"><a href='http://www.fscredit.gov.cn/' target='_blank' title='信用抚顺'><h3>信用抚顺</h3></a></li>
                    </ul>

                </div>
            </div>
            <div class="clear"></div>
        </div>
-->


<!--
    <div id="bottom">
        <div class="nav">
            </span><a href='adminLogin.jsp' target='_blank' title='网站管理'>网站管理</a>
        </div>
        <div class="text">
            <ul>
                <li>版权所有：抚顺市交通局  &nbsp;&nbsp;地址：顺城区临江东路1号&nbsp;&nbsp; 电话：024-57505000 </li>
                <li>维护单位：抚顺市交通局信息中心 &nbsp;&nbsp; fscic@163.com &nbsp;&nbsp; <span style="text-decoration: underline;">辽ICP06018765</span></li>
                <li><span style="color:#696969;"><strong>为获得最佳浏览体验并使用完整的功能，推荐使用谷歌(Chrome)或其他使用WebKit内核(如猎豹)的浏览器，IE用户请使用8.0以上的版本&nbsp;<br />
推荐使用不小于1024*768且不大于1920*1080(比例为16:9或16:10)的屏幕分辨率，最佳屏幕分辨率为1366*768且比例为16:9</strong></span></li>
            </ul>

            <div class="powered_by_metinfo">
                Powered&nbsp;by&nbsp;
                <a href="http://www.MetInfo.cn" target="_blank" title="企业网站管理系统">
                    <b>MetInfo</b>
                </a>
                &nbsp;5.2.10&nbsp;&copy;2008-2016&nbsp;
                <a href="http://www.MetInfo.cn" target="_blank" title="企业网站建设">
                    www.MetInfo.cn
                </a>
                &nbsp;&nbsp;Designed by ZH&LC,NEU
            </div>
        </div>
    </div>
-->

</div>
</div>
<script></script>

<script src="templates/met007/images/js/switchable.js" language="javascript" type="text/javascript"></script>



<!--<script src="include/stat/stat.php?type=para&u=&d=10001--cn" type="text/javascript"></script> -->
<
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
    </div>
    <div style="clear:both"></div>
    <div id="copyright">
        <a href="//bszs.conac.cn/sitename?method=show&amp;id=0973505E8D356365E053022819AC8FD2" target="_blank"><img  style="width: 40px;height: 40px; position:relative;bottom:12px" id="imgConac" vspace="0" hspace="0" border="0" src="//dcs.conac.cn/image/red_error.png" data-bd-imgshare-binded="1"></a>

        Copyright @ 2016 <a href="#" target="_blank" style="color: white">抚顺市交通局</a> |

        fscic@163.com    辽ICP06018765 &nbsp; <a  href="http://webscan.360.cn/index/checkwebsite/url/www.fsjt.gov.cn"><img border="0" style="width: 100px;height: 35px; position:relative;bottom:12px" src="http://img.webscan.360.cn/status/pai/hash/749e8c93d6b78a0d46b3878af69258ab"/></a> <br/>
        <!--
        <script type="text/javascript">document.write(unescape("%3Cspan id='_ideConac' %3E%3C/span%3E%3Cscript src='http://dcs.conac.cn/js/08/140/0000/40539783/CA081400000405397830002.js' type='text/javascript'%3E%3C/script%3E"));</script>
        <a  href="http://webscan.360.cn/index/checkwebsite/url/www.fsjt.gov.cn"><img border="0" src="http://img.webscan.360.cn/status/pai/hash/749e8c93d6b78a0d46b3878af69258ab"/></a>
        -->
    </div>
</div>

</body>
</html>

