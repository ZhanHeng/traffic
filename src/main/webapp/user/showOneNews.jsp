
<%--
  Created by IntelliJ IDEA.
  User: CHENSHUANG
  Date: 2016/11/21
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.traffic.model.NewsAndNotice"%>
<html>
<head>
    <title>抚顺市交通局</title>
</head>
<body>
<%--
  Created by IntelliJ IDEA.
  User: CHENSHUANG
  Date: 2016/11/18
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <meta charset='utf-8' />
    <title>抚顺市交通局</title>
    <meta name="Keywords" content="辽宁省出行服务,高速公路,路段,救援,服务区,路况,出入口,普通公路,路段,普通货车通行费,优惠货车通行费,客运线路,旅游景区,订票电话,售票网点,服务热线,养路费,养路费网点,运管费网点,出行路径">
    <meta name="Description" content="辽宁省出行服务|高速公路,|路段|救援|服务区|路况|出入口|普通公路|路段|普通货车通行费|优惠货车通行费|客运线路|旅游景区|订票电话|售票网点|服务热线|养路费|养路费网点|运管费网点|出行路径">
    <meta name="author" content="抚顺市交通局" />
    <meta name="copyright" content="Copyright 2008-2016 MetInfo" />
    <link href="favicon.ico" rel="shortcut icon" />
    <link rel="stylesheet" type="text/css" href="../templates/met007/images/css/metinfo.css" />
    <script src="../public/js/metinfo-min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../templates/met007/images/css/focusStyle.css" />
    <style type="text/css">
        body{
            font-family:微软雅黑;
            color:black;
        }
        table td{font-family:微软雅黑;color:black;}
        table th{font-family:微软雅黑;color:black;}
        a:hover{color:red;}
    </style>
    <script src="../public/js/public.js" type="text/javascript" language="javascript"></script>
</head>
<!--[if IE 6]>
<script src="../templates/met007/images/js/IE6-png.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript">
    DD_belatedPNG.fix('.bg,img');
</script>
<![endif]-->
<link href="../templates/met007/images/css/reset.css" rel="stylesheet" type="text/css" />

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
    $(function(){
        // 导航下拉
        $(".ul li").each(function(){
            if($(this).children("a").hasClass("xz"))
            {
                $(this).hover(function(){
                    $(this).children(".xl").stop(true,true).show()
                },function(){
                    $(this).children(".xl").stop(true,true).hide()
                })
            }
            else{
                $(this).hover(function(){
                    $(this).children("a").addClass("xz");
                    $(this).children(".xl").stop(true,true).show()
                },function(){
                    $(this).children("a").removeClass("xz");
                    $(this).children(".xl").stop(true,true).hide()
                })
            }
        })

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

        //TAB切换 互动-弹出层
        $('.yijian_tab_father').each(function(){
            $(this).children('.yijian_tab').eq(0).addClass('xz');
        })
        $('.hudong_right').each(function(){
            $(this).children('.yijian_con').eq(1).hide();
        })
        $('.yijian_tab').mouseover(function(){
            $(this).addClass('xz').siblings().removeClass('xz');
            $(this).parent().parent().children('.yijian_con').eq($(this).index()).show().siblings('.yijian_con').hide();
        })


        //侧边栏
        $('.cebianlan').css('right',($(window).width()-1002)/2-53);
        $(window).resize(function(){
            $('.cebianlan').css('right',($(window).width()-1002)/2-53);
        })

        //返回顶部
        $('.fhtop').click(function(){
            $('html,body').animate({'scrollTop':'0px'},500);
        })

        //下拉列表
        var a;
        $('.con1').hover(function(){clearInterval(a)},function(){

            a=setInterval(function(){
                $('.con1 .box_b').hide();
            },2000);

        })

        $('.con1 .box_a').click(function(){
            $(this).siblings('.con1 .box_b').show();


        })
        $(".con1 .box_b a").click(function(){
            $(".con1 .wbk").val($(this).text());
            $(".con1 .box_b").hide();

        })

        var b;
        $('.con2').hover(function(){clearInterval(b)},function(){

            a=setInterval(function(){
                $('.con2 .box_b').hide();
            },2000);

        })

        $('.con2 .box_a').click(function(){
            $(this).siblings('.con2 .box_b').show();


        })
        $(".con2 .box_b a").click(function(){
            $(".con2 .wbk").val($(this).text());
            $(".con2 .box_b").hide();

        })

        // 查询服务内容块高度相同
        $('.cxfw_main_nr').each(function(){
            var heh = $(this).find('.ul2').height();
            $(this).find('.ul2 li').css('height',heh);

        })


        //鼠标经过
        $('.tpgl_main ul li').hover(function(){
            $(this).find('span').stop(true,true).slideUp(500);
            $(this).find('em').stop(true,true).slideDown(500);
        },function(){
            $(this).find('span').stop(true,true).slideDown(500);
            $(this).find('em').stop(true,true).slideUp(500);
        })


        //
        function Banner(){
            $.ajax( {
                type: "get",
                url: "newsAndNoticeAction!listFocusPicture",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(news) {
                    if (news.length > 0) {
                        for(var i=0;i< news.length;i++){
                            var s="";
                            s=(news[i].path).substring(news[i].path.indexOf("\Economic")+9, news[i].path.length).replace(/\\/,"/");
                            var li="<li>"+"<a href='NewsPublishAction!showOneNewsAndNotice?searchNewsAndNoticeID="+news[i].id+"' class='focus-banner-img' target='_self'>"+"<img src='"
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
                }
            });
        }
    })
</script>
<style type="text/css">

    body{text-align: center; font-family:"宋体", arial;margin:0; padding:0; background: #ffffff; font-size:12px; color:#272727;line-height:120%;}
    div{
        background-color:#ffffff;
    }
    #top{
        width:960px;
        margin:auto;
        clear:both;
    }
    #bottom{
        clear:both;
        width:960px;
        margin:auto;
    }
    /*整体页面*/
    #page1{
        width:790px;margin-left:auto;margin-right:auto;background-color:#ffffff;
    }
    /*正文部分*/
    #content{
        float:left;
        margin-top:5px;
        text-align:left;
        width:960px;
        background-color:#ffffff;
    }
    #content0{
        float:left;
        border:0;
        margin:0;
        padding:0;
        display:inline;
        margin-top:5px;
        text-align:left;
        width:960px;
        background:url('../sites/all/themes/fsjt/images/bg.jpg') repeat-y left top;
    }
    #contentleft0{
        float:left;
        border:0;
        width:198px;
        display:inline;
        overflow:hidden;
    }
    .middle0{
        float:left;
        width:960px;
        margin-left:7px;
        border:1px #d9d9d9 solid;
        border-bottom:none;
        display:inline;
    }
    .wznr0{
        float:left;
        width:900px;
        padding:0;
        margin:25px 30px 0 30px;
        display:inline;
    }
    .dx{
        float:left;
        border:0;
        padding:0;
        margin:0;
        display:inline;
        width:960px;
        height:1px;
        overflow:hidden;
        background:url('../sites/all/themes/fsjt/images/bg.jpg') no-repeat left top;
    }

    #contentleft{
        float:left;
        border:0;
        width:198px;
        height:634px;
        overflow:hidden;
        border-bottom:1px #d9d9d9 solid;
    }
    .contentleft1{
        float:left;
        width:196px;
        border:1px #d9d9d9 solid;
        background-color:#FFE8DD;
    }
    .contentwszx{
        float:left;
        width:196px;
        border:1px #d9d9d9 solid;
        height:710px;
        border-bottom:none;
        background-color:#FFE8DD;
    }
    .contentleft1 img{
        float:left;
        border:0;
        padding:0;
        margin:0;
        display:inline;
        width:196px;
    }
    .bar{
        float:left;
        border:0;
        width:196px;
        height:28px;
        background:url('../sites/all/themes/fsjt/images/leftbar.jpg') no-repeat left top;
    }
    .bar label{
        float:left;
        font-size:14px;
        color:#920000;
        font-weight:bold;
        margin:8px 0 0 10px;
        padding-top:1px;
    }
    .contentleft1 ul{
        float:left;
        margin:0;
        padding:0;
        display:inline;
        width:163px;
        list-style: disc;
        margin:10px 0 0 16px;
    }
    .contentleft1 ul li{
        float:left;
        width:170px;
        height:27px;
        display:inline;
        margin-bottom:6px;
        background:url('../sites/all/themes/fsjt/images/leftlibg.jpg') no-repeat;
    }
    .contentleft1 ul li a{
        float:left;
        display:inline;
        width:110px;
        height:20px;
        color:#920000;
        text-align:left;
        padding:7px 0 0 60px;
        text-decoration:none;
        background-image:url('../sites/all/themes/fsjt/images/leftlijt.jpg');
        background-position:49px 0px;
        background-repeat:no-repeat;
    }
    .contentleft1 ul li a:hover{
        text-decoration:none;
    }
    .contentleft2{
        float:left;
        width:196px;
        height:106px;
        margin-top:5px;
        border:1px #d9d9d9 solid;
        background-color:#FFE8DD;
    }
    .contentleft3{
        float:left;
        width:196px;
        height:450px;
        margin-top:5px;
        border:1px #d9d9d9 solid;
        border-bottom:none;
        background-color:#FFE8DD;
    }
    .middle1{
        float:left;
        width:582px;
        height:633px;
        margin-left:8px;
        border:1px #d9d9d9 solid;
    }
    .middlebar{
        float:left;
        border:0;
        width:753px;
        height:28px;
        background:url('../sites/all/themes/fsjt/images/middlebar.jpg') repeat-x left top;
    }
    .tzxx{
        float:left;
        margin:0;
        padding:0;
        margin-left:20px;
        margin-top:40px;
        display:inline;
        width:545px;
    }
    .tzxx label{
        float:left;
        margin:0;
        padding:0;
        display:inline;
        color:#b50d00;
        font-size:13px;
        margin-bottom:4px;
        width:480px;
        margin-right:77px;
    }

    .middlebar label{
        float:left;
        border:0;
        font-size:14px;
        color:#A10000;
        font-weight:bold;
        padding:1px 0 0 20px;
        margin:8px 0 0 12px;
    }
    .middle1 ul{
        float:left;
        margin:0;
        padding:0;
        display:inline;
        margin:25px 0px 0px 20px;
        width:558px;
        height:540px;
    }
    .middle1 ul li{
        float:left;
        width:540px;
        height:16px;
        display:inline;
        margin-bottom:13px;
        background:url('../sites/all/themes/fsjt/images/jt.jpg') no-repeat left;
    }
    .middle1 ul li div{
        float:left;
        display:inline;
        background:none;
        width:475px;
        margin:0;
        padding-top:2px;
    }
    .middle1 ul li label{
        float:right;
        display:inline;
    }
    .middle1 ul li a{
        float:left;
        display:inline;
        margin-left:12px;
        color:black;
        text-decoration:none;
    }
    .middle1 ul li a:hover{
        text-decoration:underline;
        color:#b50d00;
    }
    .wznr{
        float:left;
        width:551px;
        height:550px;
        margin-top:25px;
        margin-left:30px;
        display:inline;
        overflow:auto;

    }
    /*网站地图*/
    .contentdt{
        float:left;
        width:583px;
        margin-left:7px;
        border:1px #d9d9d9 solid;
        display:inline;
        height:634px;
    }
    .contentdt table{
        float:left;
        display:inline;
        width:545px;
        padding:0;
        margin:0;
        margin:20px 0 20px 20px;
        border-collapse: collapse;
        font-size:14px;
    }
    .contentdt table tr{
        width:545px;
        height:20px;
    }
    .contentdt table td{
        vertical-align:middle;
        height:20px;
        border:1px #d9d9d9 solid;
        padding:10px 10px 10px 20px;
    }
    .contentdt table td a{
        color:black;
        text-decoration:none;
    }
    .contentdt table td a:hover{
        text-decoration:underline;
    }
    .dtsy{
        width:60px;
        text-align:center;
        font-weight:bold;
        background-color:#FFD6BE;
    }
    .dtlm{
        width:138px;
        text-align:center;
        font-weight:bold;
    }
    .dtzlm{
        width:342px;
        text-align:left;
    }
    .dtzlm a{
        line-height:20px;
        margin-right:20px;
    }
    /************图片新闻***********/
    .tpxwdiv{
        margin:0;
        padding:0;
        float:left;
        height:220px;
        width:240px;
        margin-left:32px;
        margin-top:40px;
        display:inline;
        overflow:hidden;
    }

    .tpxwpic{
        margin:0;
        padding:0;
        float:left;
        margin-bottom:1px;
        width:240px;
        height:180px;
        display:inline;
    }
    .tpxwpic img{
        float:left;
        border:0;
        height:180px;
        width:240px;
        float:left;
        display:inline;
    }
    .tpxwtitle{
        margin:0;
        padding:0;
        float:left;
        width:240px;
        white-space:normal;
        font-size:14px;
        padding-top:10px;
        display:inline;
    }
    .tpxwtitle a{
        color:#272727;
        text-decoration:none;
    }
    .tpxwtitle a:hover{
        text-decoration:underline;
    }
    /****************************/

    /********分页DIV********/
    .fenye{
        float:right;
        height:20px;
        margin-right:26px !important;
        margin-right:12px;
        font-size:12px;
        color:#B50D00;
        width:430px;
    }
    .fenye a{
        color:#B50D00;
        text-decoration:none;
    }
    .fenye a:hover{
        color:#B50D00;
        text-decoration:underline;
    }
    /*细览部分*/
    #xlcontent{
        border:1px #D9D9D9 solid;
        float:left;
        width:788px;
        padding-bottom:10px;
    }
    #contentTop{
        float:left;
        height:24px;
        background-image:url('..//sites/all/themes/fsjt/images/nrTitleBg.jpg');
        background-repeat:repeat-x;
        width:786px;
        border:1px #fff solid;
    }
    #contentTop img{
        float:left;
        margin:7px 10px 0px 25px;
    }
    #contentTop label{
        float:left;
        margin-top:6px;
        color:#A10000;
    }
    #contentTop #firstLab{
        font-weight:bold;
    }
    #contentTop #firstLab1{
        float:left;
        color:#A10000;
    }
    #contentTop a{
        margin:6px 3px 0 3px;
        color:#A10000;
        text-decoration:none;
    }
    #contentTop a:hover{
        text-decoration:underline;
    }
    #contenttopbtn{
        float:right;
        margin-right:22px;
        background:none;
    }
    #contenttopbtn a{
        float:left;
        color:#616161;
    }
    #contenttopbtn label{
        color:#616161;
    }
    #contentTopBottom{
        border-top:1px #D9D9D9 solid;
        clear:both;
    }
    #middle{
        float:left;
        width:640px;
        margin-left:70px;
        display:inline;
    }
    #middleTitle{
        text-align:center;
        float:left;
        line-height:30px;
        font-size:18px;
        font-weight:900;
        margin-top:50px;
        width:660px;
    }
    #pubTime{
        text-align:center;
        font-size:14px;
        float:left;
        margin-top:25px;
        width:650px;
        padding-top:1px;
    }
    #middleContent{
        float:left;
        width:680px;
        margin-top:50px;
        display:inline;
        text-align:left;
        font-size:14px;
        line-height:140%;
    }
    #middleBottom{
        float:left;
        margin-left:0px;
        margin-top:60px;
        margin-bottom:8px;
        display:inline;
        border:1px #D9D9D9 solid;
    }
    #middleBottom img{
        float:left;
        margin:7px 10px 0px 25px;
    }
    #middleBottom label{
        float:left;
        margin-top:7px;
        color:#A10000;
        font-weight:bold;
    }
    #middleBottom div{
        background-image:url('../sites/all/themes/fsjt/images/nrTitleBg.jpg');
        background-repeat:repeat-x;
        float:left;
        width:690px;
        height:24px;
        border:1px #fff solid;
    }
    .list{
        float:left;
        margin-left:80px;
        margin-top:5px;
        padding-top:4px;
        display:inline;
        width:610px;
        background-image:url('..//sites/all/themes/fsjt/images/listIcon.jpg');
        background-repeat:no-repeat;
        background-position:left 6px;
        color:#262626;
        clear:both;
    }
    .list a{
        float:left;
        margin-left:18px;
        color:#262626;
        text-decoration:none;
    }
    .list a:hover{
        text-decoration:underline;
        color:#A10000;
    }
    .list label{
        float:right;
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
        /* background-color: red; */
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
    .detailcontent p{
        font-family: "Microsoft YaHei";
        font-size: 14px;
        margin: 0;
    }
</style>
<style type="text/css">

    #contentleft{
        float:left;
        border:0;
        width:198px;
        height:500px!important;
        overflow:hidden;
        border-bottom:1px #d9d9d9 solid;
        margin-left:-1px;
    }
    .contentleft1{
        float:left;
        width:196px;
        border:1px #d9d9d9 solid;
        background-color:#FFE8DD;

    }
    .contentleft1 ul li a{
        float:left;
        display:inline;
        width:156px;
        height:20px;
        color:#920000;
        text-align:left;
        padding:7px 0 0 10px;
        text-decoration:none;
        background-image:url('../sites/all/themes/fsjt/images/leftlijt.jpg');
        background-position:0px 0px;
        background-repeat:no-repeat;
    }

    /*菜单定义*/
    #navlist{
        margin-left:17px;
        margin-right:auto;
        float:left;
        width:736px;
        height:36px;
        /*	background-image:url('/sites/all/themes/fsjt/images/04.jpg');*/
    }
    #navlist ul {
        CLEAR: left;
        MARGIN: 0px;
        PADDING: 0px;
        BORDER: 0px;
        TEXT-ALIGN: center;
        display: inline;
        background:none;
        list-style-type:none;
        height:28px;
    }

    #navlist li {
        height:28px;
        border:0;
        FLOAT: left;
        MARGIN: 0px;
        PADDING: 0px;
        TEXT-ALIGN: center;
        line-height:36px;
        list-style:none;
        list-style-type:none;
        display:inline;
        width:100px;
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
        /*	background-image: url('/sites/all/themes/fsjt/images/04.jpg');	*/
        list-style-type:none;
        display:inline;
    }
    #navlist li a:hover {
        /*	background-image: url('/sites/all/themes/fsjt/images/02.jpg');*/
    }

    .middle1{
        float:left;
        width:582px!important;
        width:555px;
        /*	height:458px;*/
        margin-left:8px!important;
        margin-left:-1px;
        border:1px #d9d9d9 solid;
    }
</style>

<body>
<style type="text/css">

    body{text-align: center; font-family:"宋体", arial;margin:0; padding:0; background: #ffffff; font-size:12px; color:#272727;line-height:120%;}
    div{
        background-color:#ffffff;
    }
    #top{
        width:960px;
        margin:auto;
        clear:both;
    }
    #bottom{
        clear:both;
        width:960px;
        margin:auto;
    }
    /*整体页面*/
    #page1{
        width:790px;margin-left:auto;margin-right:auto;background-color:#ffffff;
    }
    /*正文部分*/
    #content{
        float:left;
        margin-top:5px;
        text-align:left;
        width:960px;
        background-color:#ffffff;
    }
    #content0{
        float:left;
        border:0;
        margin:0;
        padding:0;
        display:inline;
        margin-top:5px;
        text-align:left;
        width:960px;
        background:url('/sites/all/themes/fsjt/images/bg.jpg') repeat-y left top;
    }
    #contentleft0{
        float:left;
        border:0;
        width:198px;
        display:inline;
        overflow:hidden;
    }
    .middle0{
        float:left;
        width:960px;
        margin-left:7px;
        border:1px #d9d9d9 solid;
        border-bottom:none;
        display:inline;
    }
    .wznr0{
        float:left;
        width:900px;
        padding:0;
        margin:25px 30px 0 30px;
        display:inline;
    }
    .dx{
        float:left;
        border:0;
        padding:0;
        margin:0;
        display:inline;
        width:960px;
        height:1px;
        overflow:hidden;
        background:url('/sites/all/themes/fsjt/images/bg.jpg') no-repeat left top;
    }

    #contentleft{
        float:left;
        border:0;
        width:198px;
        height:634px;
        overflow:hidden;
        border-bottom:1px #d9d9d9 solid;
    }
    .contentleft1{
        float:left;
        width:196px;
        border:1px #d9d9d9 solid;
        background-color:#FFE8DD;
    }
    .contentwszx{
        float:left;
        width:196px;
        border:1px #d9d9d9 solid;
        height:710px;
        border-bottom:none;
        background-color:#FFE8DD;
    }
    .contentleft1 img{
        float:left;
        border:0;
        padding:0;
        margin:0;
        display:inline;
        width:196px;
    }
    .bar{
        float:left;
        border:0;
        width:196px;
        height:28px;
        background:url('/sites/all/themes/fsjt/images/leftbar.jpg') no-repeat left top;
    }
    .bar label{
        float:left;
        font-size:14px;
        color:#920000;
        font-weight:bold;
        margin:8px 0 0 10px;
        padding-top:1px;
    }
    .contentleft1 ul{
        float:left;
        margin:0;
        padding:0;
        display:inline;
        width:163px;
        list-style: disc;
        margin:10px 0 0 16px;
    }
    .contentleft1 ul li{
        float:left;
        width:170px;
        height:27px;
        display:inline;
        margin-bottom:6px;
        background:url('/sites/all/themes/fsjt/images/leftlibg.jpg') no-repeat;
    }
    .contentleft1 ul li a{
        float:left;
        display:inline;
        width:110px;
        height:20px;
        color:#920000;
        text-align:left;
        padding:7px 0 0 60px;
        text-decoration:none;
        background-image:url('/sites/all/themes/fsjt/images/leftlijt.jpg');
        background-position:49px 0px;
        background-repeat:no-repeat;
    }
    .contentleft1 ul li a:hover{
        text-decoration:none;
    }
    .contentleft2{
        float:left;
        width:196px;
        height:106px;
        margin-top:5px;
        border:1px #d9d9d9 solid;
        background-color:#FFE8DD;
    }
    .contentleft3{
        float:left;
        width:196px;
        height:450px;
        margin-top:5px;
        border:1px #d9d9d9 solid;
        border-bottom:none;
        background-color:#FFE8DD;
    }
    .middle1{
        float:left;
        width:582px;
        height:633px;
        margin-left:8px;
        border:1px #d9d9d9 solid;
    }
    .middlebar{
        float:left;
        border:0;
        width:753px;
        height:28px;
        background:url('/sites/all/themes/fsjt/images/middlebar.jpg') repeat-x left top;
    }
    .tzxx{
        float:left;
        margin:0;
        padding:0;
        margin-left:20px;
        margin-top:40px;
        display:inline;
        width:545px;
    }
    .tzxx label{
        float:left;
        margin:0;
        padding:0;
        display:inline;
        color:#b50d00;
        font-size:13px;
        margin-bottom:4px;
        width:480px;
        margin-right:77px;
    }

    .middlebar label{
        float:left;
        border:0;
        font-size:14px;
        color:#A10000;
        font-weight:bold;
        padding:1px 0 0 20px;
        margin:8px 0 0 12px;
    }
    .middle1 ul{
        float:left;
        margin:0;
        padding:0;
        display:inline;
        margin:25px 0px 0px 20px;
        width:558px;
        height:540px;
    }
    .middle1 ul li{
        float:left;
        width:540px;
        height:16px;
        display:inline;
        margin-bottom:13px;
        background:url('/sites/all/themes/fsjt/images/jt.jpg') no-repeat left;
    }
    .middle1 ul li div{
        float:left;
        display:inline;
        background:none;
        width:475px;
        margin:0;
        padding-top:2px;
    }
    .middle1 ul li label{
        float:right;
        display:inline;
    }
    .middle1 ul li a{
        float:left;
        display:inline;
        margin-left:12px;
        color:black;
        text-decoration:none;
    }
    .middle1 ul li a:hover{
        text-decoration:underline;
        color:#b50d00;
    }
    .wznr{
        float:left;
        width:551px;
        height:550px;
        margin-top:25px;
        margin-left:30px;
        display:inline;
        overflow:auto;

    }
    /*网站地图*/
    .contentdt{
        float:left;
        width:583px;
        margin-left:7px;
        border:1px #d9d9d9 solid;
        display:inline;
        height:634px;
    }
    .contentdt table{
        float:left;
        display:inline;
        width:545px;
        padding:0;
        margin:0;
        margin:20px 0 20px 20px;
        border-collapse: collapse;
        font-size:14px;
    }
    .contentdt table tr{
        width:545px;
        height:20px;
    }
    .contentdt table td{
        vertical-align:middle;
        height:20px;
        border:1px #d9d9d9 solid;
        padding:10px 10px 10px 20px;
    }
    .contentdt table td a{
        color:black;
        text-decoration:none;
    }
    .contentdt table td a:hover{
        text-decoration:underline;
    }
    .dtsy{
        width:60px;
        text-align:center;
        font-weight:bold;
        background-color:#FFD6BE;
    }
    .dtlm{
        width:138px;
        text-align:center;
        font-weight:bold;
    }
    .dtzlm{
        width:342px;
        text-align:left;
    }
    .dtzlm a{
        line-height:20px;
        margin-right:20px;
    }
    /************图片新闻***********/
    .tpxwdiv{
        margin:0;
        padding:0;
        float:left;
        height:220px;
        width:240px;
        margin-left:32px;
        margin-top:40px;
        display:inline;
        overflow:hidden;
    }

    .tpxwpic{
        margin:0;
        padding:0;
        float:left;
        margin-bottom:1px;
        width:240px;
        height:180px;
        display:inline;
    }
    .tpxwpic img{
        float:left;
        border:0;
        height:180px;
        width:240px;
        float:left;
        display:inline;
    }
    .tpxwtitle{
        margin:0;
        padding:0;
        float:left;
        width:240px;
        white-space:normal;
        font-size:14px;
        padding-top:10px;
        display:inline;
    }
    .tpxwtitle a{
        color:#272727;
        text-decoration:none;
    }
    .tpxwtitle a:hover{
        text-decoration:underline;
    }
    /****************************/

    /********分页DIV********/
    .fenye{
        float:right;
        height:20px;
        margin-right:26px !important;
        margin-right:12px;
        font-size:12px;
        color:#B50D00;
        width:430px;
    }
    .fenye a{
        color:#B50D00;
        text-decoration:none;
    }
    .fenye a:hover{
        color:#B50D00;
        text-decoration:underline;
    }
    /*细览部分*/
    #xlcontent{
        border:1px #D9D9D9 solid;
        float:left;
        width:788px;
        padding-bottom:10px;
    }
    #contentTop{
        float:left;
        height:24px;
        background-image:url('/sites/all/themes/fsjt/images/nrTitleBg.jpg');
        background-repeat:repeat-x;
        width:786px;
        border:1px #fff solid;
    }
    #contentTop img{
        float:left;
        margin:7px 10px 0px 25px;
    }
    #contentTop label{
        float:left;
        margin-top:6px;
        color:#A10000;
    }
    #contentTop #firstLab{
        font-weight:bold;
    }
    #contentTop #firstLab1{
        float:left;
        color:#A10000;
    }
    #contentTop a{
        margin:6px 3px 0 3px;
        color:#A10000;
        text-decoration:none;
    }
    #contentTop a:hover{
        text-decoration:underline;
    }
    #contenttopbtn{
        float:right;
        margin-right:22px;
        background:none;
    }
    #contenttopbtn a{
        float:left;
        color:#616161;
    }
    #contenttopbtn label{
        color:#616161;
    }
    #contentTopBottom{
        border-top:1px #D9D9D9 solid;
        clear:both;
    }
    #middle{
        float:left;
        width:640px;
        margin-left:70px;
        display:inline;
    }
    #middleTitle{
        text-align:center;
        float:left;
        line-height:30px;
        font-size:18px;
        font-weight:900;
        margin-top:50px;
        width:660px;
    }
    #pubTime{
        text-align:center;
        font-size:14px;
        float:left;
        margin-top:25px;
        width:650px;
        padding-top:1px;
    }
    #middleContent{
        float:left;
        width:680px;
        margin-top:50px;
        display:inline;
        text-align:left;
        font-size:14px;
        line-height:140%;
    }
    #middleBottom{
        float:left;
        margin-left:0px;
        margin-top:60px;
        margin-bottom:8px;
        display:inline;
        border:1px #D9D9D9 solid;
    }
    #middleBottom img{
        float:left;
        margin:7px 10px 0px 25px;
    }
    #middleBottom label{
        float:left;
        margin-top:7px;
        color:#A10000;
        font-weight:bold;
    }
    #middleBottom div{
        background-image:url('/sites/all/themes/fsjt/images/nrTitleBg.jpg');
        background-repeat:repeat-x;
        float:left;
        width:690px;
        height:24px;
        border:1px #fff solid;
    }
    .list{
        float:left;
        margin-left:80px;
        margin-top:5px;
        padding-top:4px;
        display:inline;
        width:610px;
        background-image:url('/sites/all/themes/fsjt/images/listIcon.jpg');
        background-repeat:no-repeat;
        background-position:left 6px;
        color:#262626;
        clear:both;
    }
    .list a{
        float:left;
        margin-left:18px;
        color:#262626;
        text-decoration:none;
    }
    .list a:hover{
        text-decoration:underline;
        color:#A10000;
    }
    .list label{
        float:right;
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
        /* background-color: red; */
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
    .detailcontent p{
        font-family: "Microsoft YaHei";
        font-size: 14px;
        margin: 0;
    }
</style>
<style type="text/css">

    #contentleft{
        float:left;
        border:0;
        width:198px;
        height:500px!important;
        overflow:hidden;
        border-bottom:1px #d9d9d9 solid;
        margin-left:-1px;
    }
    .contentleft1{
        float:left;
        width:196px;
        border:1px #d9d9d9 solid;
        background-color:#FFE8DD;

    }
    .contentleft1 ul li a{
        float:left;
        display:inline;
        width:156px;
        height:20px;
        color:#920000;
        text-align:left;
        padding:7px 0 0 10px;
        text-decoration:none;
        background-image:url('/sites/all/themes/fsjt/images/leftlijt.jpg');
        background-position:0px 0px;
        background-repeat:no-repeat;
    }

    /*菜单定义*/
    #navlist{
        margin-left:17px;
        margin-right:auto;
        float:left;
        width:736px;
        height:36px;
        /*	background-image:url('/sites/all/themes/fsjt/images/04.jpg');*/
    }
    #navlist ul {
        CLEAR: left;
        MARGIN: 0px;
        PADDING: 0px;
        BORDER: 0px;
        TEXT-ALIGN: center;
        display: inline;
        background:none;
        list-style-type:none;
        height:28px;
    }

    #navlist li {
        height:28px;
        border:0;
        FLOAT: left;
        MARGIN: 0px;
        PADDING: 0px;
        TEXT-ALIGN: center;
        line-height:36px;
        list-style:none;
        list-style-type:none;
        display:inline;
        width:100px;
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
        /*	background-image: url('/sites/all/themes/fsjt/images/04.jpg');	*/
        list-style-type:none;
        display:inline;
    }
    #navlist li a:hover {
        /*	background-image: url('/sites/all/themes/fsjt/images/02.jpg');*/
    }

    .middle1{
        float:left;
        width:582px!important;
        width:555px;
        /*	height:458px;*/
        margin-left:8px!important;
        margin-left:-1px;
        border:1px #d9d9d9 solid;
    }
</style>

<div id="metinfo">
    <!--<div class="topbg"></div>-->
    <div id="top" style="margin-top:-10px; margin-left:0px; background:url(../upload/cac-static/top-bg002.jpg) no-repeat">
        <!--<div class="floatl" >删除原有的logo样式 -20131117
        <a href="http://cac.sau.edu.cn/" title="沈航民用航空学院">
            <img
                src="upload/cac-static/top-bg002.jpg"
                alt="沈航民用航空学院"
                title="沈航民用航空学院"
                style="margin-top:-10px;
                margin-left:0px;"
            />
        </a>
        </div>-->


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




    <div id="xlcontent">


        <link href="/sites/all/themes/fsjt/css/viewslist.css" type="text/css" rel="stylesheet">

        <style type="text/css">

            #contentleft{
                float:left;
                border:0;
                width:198px;
                height:500px!important;
                overflow:hidden;
                border-bottom:1px #d9d9d9 solid;
                margin-left:-1px;
            }
            .contentleft1{
                float:left;
                width:196px;
                border:1px #d9d9d9 solid;
                background-color:#FFE8DD;

            }
            .contentleft1 ul li a{
                float:left;
                display:inline;
                width:156px;
                height:20px;
                color:#920000;
                text-align:left;
                padding:7px 0 0 10px;
                text-decoration:none;
                background-image:url('/sites/all/themes/fsjt/images/leftlijt.jpg');
                background-position:0px 0px;
                background-repeat:no-repeat;
            }

            /*菜单定义*/
            #navlist{
                margin-left:17px;
                margin-right:auto;
                float:left;
                width:500px;
                height:36px;
                /*	background-image:url('/sites/all/themes/fsjt/images/04.jpg');*/
            }
            #navlist ul {
                CLEAR: left;
                MARGIN: 0px;
                PADDING: 0px;
                BORDER: 0px;
                TEXT-ALIGN: center;
                display: inline;
                background:none;
                list-style-type:none;
                height:28px;
            }

            #navlist li {
                height:28px;
                border:0;
                FLOAT: left;
                MARGIN: 0px;
                PADDING: 0px;
                TEXT-ALIGN: center;
                line-height:36px;
                list-style:none;
                list-style-type:none;
                display:inline;
                width:100px;
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
                /*	background-image: url('/sites/all/themes/fsjt/images/04.jpg');	*/
                list-style-type:none;
                display:inline;
            }
            #navlist li a:hover {
                /*	background-image: url('/sites/all/themes/fsjt/images/02.jpg');*/
            }

            .middle1{
                float:left;
                width:582px!important;
                width:555px;
                /*	height:458px;*/
                margin-left:8px!important;
                margin-left:-1px;
                border:1px #d9d9d9 solid;
            }
        </style>


        <DIV id=content>
            <DIV id=contentleft>
                <DIV class=contentleft1>
                    <DIV class=bar><LABEL>组织机构</LABEL> </DIV><IMG src="/sites/all/themes/fsjt/images/lm_hywm.jpg">
                    <ul id="ss">
                        <c:forEach items="${leftList}" var="util" varStatus="status">
                            <li > <a href="getTagNews?tid=${util.tagId}" title="${util.tagName}" target='_self'>${util.tagName}</a> </li>
                        </c:forEach>
                    </ul>

                </DIV>
                <!--
                <DIV class=contentleft2>
                <DIV class=bar><LABEL>站内搜索</LABEL> </DIV>
                <DIV style="DISPLAY: inline; FLOAT: left; MARGIN: 10px 0px 0px 10px"><IFRAME
                src="/sites/all/themes/fsjt/templates/page/fss-search.php" frameBorder=0 width=170 scrolling=no height=60
                target="_blank"></IFRAME></DIV></DIV>

                <DIV class=contentleft3></DIV>
                -->
            </DIV>

            <DIV class=middle0 style="width: 753px">
                <DIV class=middlebar><LABEL>抚顺市交通局</LABEL> </DIV>

                <div id="navlist" style="width: 753px">
                    <ul >
                        <c:forEach items="${aboveList}" var="util" varStatus="status">
                            <li > <a href="getTagNews?tid=${util.tagId}" title="${util.tagName}" target='_self'>${util.tagName}</a> </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="content" style="width: 753px">
                    <c:if test="${showOneInfo ==null}"> <h1> 暂无信息！</h1 ></c:if>
                    <c:if test="${showOneInfo !=null}">
                    <h1> ${showOneInfo.title}</h1 >
                    <div class="right_title">时间 : ${showOneInfo.time} &nbsp;来源: ${showOneInfo.author}</div>
                    <div class="detailcontent" cssStyle="font-family: Microsoft YaHei; font-size: 20px;">
                        <%=data %>
                    </div>
                    </c:if>
                </div>
                <DIV class=fenye>
                    <ul>
                    </ul>
                </DIV>
                <DIV class=fenye>
                    <ul>
                    </ul>
                </DIV>
            </DIV></DIV>






    </div>



    <div id="bottom">
        <div class="nav">
            <a href='http://oa.sau.edu.cn' target='_blank' title='在线办公'>在线办公</a><span>|</span><a href='http://mail.sau.edu.cn' target='_blank' title='沈航邮件'>沈航邮件</a><span>|</span><a href='sitemap/'  title='网站地图'>网站地图</a><span>|</span><a href='http://cac.sau.edu.cn/admin/' target='_blank' title='网站管理'>网站管理</a>
        </div>
        <div class="text">
            <ul>
                <li>沈航民用航空学院 版权所有 &copy2004-2015 未经许可 严禁转载本站内容 辽ICP备案05001370号 </li>
                <li>计算机学院技术与美工支持 沈阳市道义南大街37号 电话：024-89728966  网站部分内容来源网络</li>
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
            </div>
        </div>
    </div>
</div>
<div id="footer">
    <div class="left"></div>
    <div class="right"></div>
</div>

<script src="templates/met007/images/js/switchable.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript">
    function equalHeight(group) {
        tallest = 0;
        group.each(function() {
            thisHeight = $(this).height();
            if(thisHeight > tallest) {
                tallest = thisHeight;
            }
        });
        group.height(tallest);
    }
    $(function() {
        equalHeight($(".column"));
        equalHeight($(".columnde"));

        $("#trigger4").switchable("#panel4 > ul > li", {
            triggerType: "click",
            effect: "scroll",
            steps: 1,
            visible: 4
        }).autoplay().carousel().mousewheel();

        var api4 = $("#trigger4").switchable();
        $("#next4").click(function(){
            api4.next();
        });
        $("#prev4").click(function(){
            api4.prev();
        });
    });
</script>

<script src="include/stat/stat.php?type=para&u=&d=10001--cn" type="text/javascript"></script>

</body>
</html>
</body>
</html>
