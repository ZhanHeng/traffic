<%--
  Created by IntelliJ IDEA.
  User: CHENSHUANG
  Date: 2016/11/18
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="templates/met007/images/css/metinfo.css" />
    <script src="public/js/metinfo-min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="templates/met007/images/css/focusStyle.css" />
    <style type="text/css">
        body{
            font-family:微软雅黑;
            color:black;
        }
        table td{font-family:微软雅黑;color:black;}
        table th{font-family:微软雅黑;color:black;}
        a:hover{color:red;}
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

<body onload="Banner();">

<div id="metinfo">
    <!--<div class="topbg"></div>-->
    <div id="top" style="margin-top:-10px; margin-left:0px; background:url(upload/cac-static/top-bg002.jpg) no-repeat">
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
                <li id="nav_10001">
                    <a href="http://cac.sau.edu.cn/" title="民航首页">
                        <span>民航首页</span>
                    </a>
                </li>

                <li class="line top-nav"></li>
                <li id="nav_106">
                    <a href="CacIntroduce/" 0 title="学院概况">
                        <span>学院概况</span>
                    </a>
                </li>

                <li class="line top-nav"></li>
                <li id="nav_149">
                    <a href="TeacherTeam/" 0 title="师资队伍">
                        <span>师资队伍</span>
                    </a>
                </li>
                <li class="line top-nav"></li>
                <li id="nav_150">
                    <a href="TrainingCenter/" 0 title="民航培训">
                        <span>民航培训</span>
                    </a>
                </li>

                <li class="line top-nav"></li>
                <li id="nav_191">
                    <a href="RecruitStudents/"  title="招飞招乘">
                        <span>招飞招乘</span>
                    </a>
                </li>

                <li class="line top-nav"></li>
                <li id="nav_132">
                    <a href="StuNews/" 0 title="学生工作">
                        <span>学生工作</span>
                    </a>
                </li>

                <li class="line top-nav"></li>
                <li id="nav_141">
                    <a href="PartyNews/" 0 title="党群园地">
                        <span>党群园地</span>
                    </a>
                </li>

                <li class="line top-nav"></li>
                <li id="nav_32">
                    <a href="download/"  title="下载中心">
                        <span>下载中心</span>
                    </a>
                </li>

                <li class="line top-nav"></li>
                <li id="nav_1">
                    <a href="about/" 0 title="联系我们">
                        <span>联系我们</span>
                    </a>
                </li>

            </ul>
        </div>
    </div>



    <div id="flash">
        <div class="left floatl">
            <link href='public/banner/banner6/css.css' rel='stylesheet' type='text/css' />
            <script src='public/banner/banner6/jquery.bxSlider.min.js'></script><div class='flash flash6' style='width:650px; height:300px;'>
            <ul id='slider6' class='list-none'>
                <li><a href='' target='_blank' title='奥凯航空'>
                    <img src='upload/201311/1385709726.jpg' alt='奥凯航空' width='650' height='300'></a></li>
                <li><a href='' target='_blank' title='驾驶舱'>
                    <img src='upload/201311/1384847436.jpg' alt='驾驶舱' width='650' height='300'></a></li>
                <li><a href='' target='_blank' title='广州白云机场'>
                    <img src='upload/201311/1384599028.jpg' alt='广州白云机场' width='650' height='300'></a></li>
                <li><a href='' target='_blank' title='机场调度中心'>
                <img src='upload/201311/1384600280.jpg' alt='机场调度中心' width='650' height='300'></a></li>
                <li><a href='' target='_blank' title='try'>
                    <img src='upload/201311/trytrytry.png' alt='try' width='650' height='300'></a></li>
            </ul>
        </div>
            <script type="text/javascript">$(document).ready(function(){ $('#slider6').bxSlider({ mode:'vertical',autoHover:true,auto:true,pager: true,pause: 5000,controls:false});});</script></div>

        <div class="right floatr">
            <div class="top">
                <ul class="list list-style">
                    <li class="hover">招飞招乘</li>
                    <!--<li></li>
                    <li class="line"></li>  删除首页flash右侧三个栏目中的两个 -->
                </ul>
                <div class="text clear">
                    <div class="box editor">
                        <ul class="newslist">
                            <!--删除下面methtml_getarray函数的第三个参数,以保证后台对前台新闻列表的排序有效 现在排序优先级为: 排序权值>置顶状态值>发布时间值>推荐状态值-->

                            <li><a href="RecruitStudents/shownews.php?lang=cn&id=201" target="_blank" title="关于无法下载2016版沈航大飞行学员背景调查材料的说明">关于无法下载2016版沈航大飞行学员背景调查材料的说明</a></li>

                            <li><a href="RecruitStudents/shownews.php?lang=cn&id=188" target="_blank" title="沈阳航空航天大学2016年招飞简章（高中生）、初检面试安排及报考系统说明">沈阳航空航天大学2016年招飞简章（高中生）、初检面试安排及报考系统说明</a></li>

                            <li><a href="RecruitStudents/shownews.php?lang=cn&id=154" target="_blank" title="沈阳航空航天大学2015年招飞简章（高中生）">沈阳航空航天大学2015年招飞简章（高中生）</a></li>

                            <li><a href="RecruitStudents/shownews.php?lang=cn&id=182" target="_blank" title="2015年飞行技术专业合格证发放名单">2015年飞行技术专业合格证发放名单</a></li>

                        </ul>
                    </div>
                    <div class="box editor" style="display:none;">
                        <ul class="newslist">
                            <!--删除下面methtml_getarray函数的第三个参数,以保证后台对前台新闻列表的排序有效 现在排序优先级为: 排序权值>置顶状态值>发布时间值>推荐状态值-->

                            <li><a href="PartyNews/shownews.php?lang=cn&id=45" target="_blank" title="民用航空学院2013年大学生初级党校培训计划">民用航空学院2013年大学生初级党校培训计划</a></li>

                            <li><a href="PartyNews/shownews.php?lang=cn&id=44" target="_blank" title="基层党组织委员会成员名单">基层党组织委员会成员名单</a></li>

                            <li><a href="PartyNews/shownews.php?lang=cn&id=47" target="_blank" title="民航学院党建特色活动总结">民航学院党建特色活动总结</a></li>

                            <li><a href="CacNews/shownews.php?lang=cn&id=49" target="_blank" title="“情洒校园，服务你我”—学习雷锋，民航在行动">“情洒校园，服务你我”—学习雷锋，民航在行动</a></li>

                            <li><a href="StuNews/shownews.php?lang=cn&id=105" target="_blank" title="2013年7月2日民航学院第三届学生会第一次例会总结">2013年7月2日民航学院第三届学生会第一次例会总结</a></li>

                            <li><a href="CacNews/shownews.php?lang=cn&id=52" target="_blank" title="民用航空学院迎新生工作圆满完成">民用航空学院迎新生工作圆满完成</a></li>

                            <li><a href="CacNews/shownews.php?lang=cn&id=50" target="_blank" title="“心系清原 众志成城”">“心系清原 众志成城”</a></li>

                            <li><a href="CacNews/shownews.php?lang=cn&id=51" target="_blank" title="民用航空学院2013年党总支理论中心组学习计划">民用航空学院2013年党总支理论中心组学习计划</a></li>

                        </ul>
                    </div>
                    <div class="box editor" style="display:none;">
                        <ul class="newslist">
                            <!--删除下面methtml_getarray函数的第三个参数,以保证后台对前台新闻列表的排序有效 现在排序优先级为: 排序权值>置顶状态值>发布时间值>推荐状态值-->

                            <li><a href="PartyNews/shownews.php?lang=cn&id=45" target="_blank" title="民用航空学院2013年大学生初级党校培训计划">民用航空学院2013年大学生初级党校培训计划</a></li>

                            <li><a href="PartyNews/shownews.php?lang=cn&id=44" target="_blank" title="基层党组织委员会成员名单">基层党组织委员会成员名单</a></li>

                            <li><a href="PartyNews/shownews.php?lang=cn&id=47" target="_blank" title="民航学院党建特色活动总结">民航学院党建特色活动总结</a></li>

                            <li><a href="CacNews/shownews.php?lang=cn&id=49" target="_blank" title="“情洒校园，服务你我”—学习雷锋，民航在行动">“情洒校园，服务你我”—学习雷锋，民航在行动</a></li>

                            <li><a href="StuNews/shownews.php?lang=cn&id=105" target="_blank" title="2013年7月2日民航学院第三届学生会第一次例会总结">2013年7月2日民航学院第三届学生会第一次例会总结</a></li>

                            <li><a href="CacNews/shownews.php?lang=cn&id=52" target="_blank" title="民用航空学院迎新生工作圆满完成">民用航空学院迎新生工作圆满完成</a></li>

                            <li><a href="CacNews/shownews.php?lang=cn&id=50" target="_blank" title="“心系清原 众志成城”">“心系清原 众志成城”</a></li>

                            <li><a href="CacNews/shownews.php?lang=cn&id=51" target="_blank" title="民用航空学院2013年党总支理论中心组学习计划">民用航空学院2013年党总支理论中心组学习计划</a></li>

                        </ul>
                    </div>
                </div>
            </div>

            <div id="searchbox">
                <form method="POST" name="myform1" action="http://cac.sau.edu.cn/search/search.php?lang=cn"  target="_self">
                    <input type="text" name="searchword" size="30"  class="navtext" />
                    <input type='submit' name='Submit' value='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' class="navsb" />
                </form>
            </div>

            <!--删除met007首页flash幻灯右侧栏目下方的一个小栏目 -20131117
            <div class="download">
                <a href="" target="_blank" title="沈航民用航空学院" alt="沈航民用航空学院">
                    <img src="upload/201409/1410693401.png" alt="沈航民用航空学院" title="沈航民用航空学院" />
                </a>
            </div>
            -->
        </div>
        <div class="clear"></div>
        <script type="text/javascript">
            $(document).ready(function(){
                var list = $("#flash ul.list li");
                var text = $("#flash .box");
                list.each(function(i){
                    var my = $(this);
                    my.hover(
                            function () {
                                text.each(function(d){
                                    var o = $(this);
                                    if(i==d){ o.css("display","block"); }else{ o.css('display','none'); }
                                });
                                list.each(function(t){
                                    var o = $(this);
                                    if(i==t){ o.addClass("hover"); }else{ $(this).removeClass("hover"); }
                                });
                            },
                            function () {}
                    );
                });
            });
        </script>
    </div>
    <div id="main">
        <div class="main2_nr fl">
            <div class="title fix">
                <div class="title1 xz"><a href="http://zizhan.mot.gov.cn/zfxxgk/index.html" title="通知公告" target="_blank">通知公告</a></div>
                <div class="title1"><a href="./zhengcejiedu/" title="政策解读" target="_blank">政策解读</a></div>
            </div>
            <div class="title_nr">
                <div class="title_nr1" style="display: block;">
                    <ul>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/shuilulkyssmzglgd" title="《水路旅客运输实名制管理规定》" target="_blank">《水路旅客运输实名制管理规定》</a>[10-14]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/zhongguocyfzgh" title="为海洋强国战略提供高素质人才保障 部海事局局长许如清《中国船员发展规划（2016—2020年）》" target="_blank">为海洋强国战略提供高素质人才保障 部海事局局长许如清...</a>[10-11]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/glgcsgjlgf" title="依法监理 改革提升 促进公路建设健康发展——《公路工程施工监理规范》修订" target="_blank">依法监理 改革提升 促进公路建设健康发展——《公路工程...</a>[09-26]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/2015qgsfgltjgb" title="《2015年全国收费公路统计公报》" target="_blank">《2015年全国收费公路统计公报》</a>[09-20]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/chuzuqcjsycyzgandxunyouczqcjygfglgd" title="《出租汽车驾驶员从业资格管理规定》和《巡游出租汽车经营服务管理规定》" target="_blank">《出租汽车驾驶员从业资格管理规定》和《巡游出租汽车经...</a>[09-12]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/chaoxianysclxsglglgd" title="《超限运输车辆行驶公路管理规定》" target="_blank">《超限运输车辆行驶公路管理规定》</a>[09-08]</li>
                        <li class="fix"><a href="/zhengcejiedu/chaoxianysclxsglglgd" title="更多" target="_blank">     更多>>></a></li>
                    </ul>
                </div>
                <div class="title_nr1" style="display: none;">
                    <ul>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/shuilulkyssmzglgd" title="《水路旅客运输实名制管理规定》解读" target="_blank">《水路旅客运输实名制管理规定》解读</a>[10-14]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/zhongguocyfzgh" title="为海洋强国战略提供高素质人才保障 部海事局局长许如清解读《中国船员发展规划（2016—2020年）》" target="_blank">为海洋强国战略提供高素质人才保障 部海事局局长许如清解...</a>[10-11]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/glgcsgjlgf" title="依法监理 改革提升 促进公路建设健康发展——《公路工程施工监理规范》修订解读" target="_blank">依法监理 改革提升 促进公路建设健康发展——《公路工程...</a>[09-26]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/2015qgsfgltjgb" title="《2015年全国收费公路统计公报》解读" target="_blank">《2015年全国收费公路统计公报》解读</a>[09-20]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/chuzuqcjsycyzgandxunyouczqcjygfglgd" title="《出租汽车驾驶员从业资格管理规定》和《巡游出租汽车经营服务管理规定》解读" target="_blank">《出租汽车驾驶员从业资格管理规定》和《巡游出租汽车经...</a>[09-12]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/chaoxianysclxsglglgd" title="《超限运输车辆行驶公路管理规定》解读" target="_blank">《超限运输车辆行驶公路管理规定》解读</a>[09-08]</li>

                    </ul>
                </div>
            </div>
        </div>

        <div class="main2_nrf fl">
            <div class="title fix">
                <div class="title1 xz"><a href="http://zizhan.mot.gov.cn/zfxxgk/index.html" title="通知公告" target="_blank">通知公告</a></div>
                <div class="title1"><a href="./zhengcejiedu/" title="政策解读" target="_blank">政策解读</a></div>
            </div>
            <div class="title_nr">
                <div class="title_nr1" style="display: block;">
                    <ul>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/shuilulkyssmzglgd" title="《水路旅客运输实名制管理规定》" target="_blank">《水路旅客运输实名制管理规定》</a>[10-14]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/zhongguocyfzgh" title="为海洋强国战略提供高素质人才保障 部海事局局长许如清《中国船员发展规划（2016—2020年）》" target="_blank">为海洋强国战略提供高素质人才保障 部海事局局长许如清...</a>[10-11]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/glgcsgjlgf" title="依法监理 改革提升 促进公路建设健康发展——《公路工程施工监理规范》修订" target="_blank">依法监理 改革提升 促进公路建设健康发展——《公路工程...</a>[09-26]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/2015qgsfgltjgb" title="《2015年全国收费公路统计公报》" target="_blank">《2015年全国收费公路统计公报》</a>[09-20]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/chuzuqcjsycyzgandxunyouczqcjygfglgd" title="《出租汽车驾驶员从业资格管理规定》和《巡游出租汽车经营服务管理规定》" target="_blank">《出租汽车驾驶员从业资格管理规定》和《巡游出租汽车经...</a>[09-12]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/chaoxianysclxsglglgd" title="《超限运输车辆行驶公路管理规定》" target="_blank">《超限运输车辆行驶公路管理规定》</a>[09-08]</li>
                    </ul>
                </div>
                <div class="title_nr1" style="display: none;">
                    <ul>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/shuilulkyssmzglgd" title="《水路旅客运输实名制管理规定》解读" target="_blank">《水路旅客运输实名制管理规定》解读</a>[10-14]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/zhongguocyfzgh" title="为海洋强国战略提供高素质人才保障 部海事局局长许如清解读《中国船员发展规划（2016—2020年）》" target="_blank">为海洋强国战略提供高素质人才保障 部海事局局长许如清解...</a>[10-11]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/glgcsgjlgf" title="依法监理 改革提升 促进公路建设健康发展——《公路工程施工监理规范》修订解读" target="_blank">依法监理 改革提升 促进公路建设健康发展——《公路工程...</a>[09-26]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/2015qgsfgltjgb" title="《2015年全国收费公路统计公报》解读" target="_blank">《2015年全国收费公路统计公报》解读</a>[09-20]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/chuzuqcjsycyzgandxunyouczqcjygfglgd" title="《出租汽车驾驶员从业资格管理规定》和《巡游出租汽车经营服务管理规定》解读" target="_blank">《出租汽车驾驶员从业资格管理规定》和《巡游出租汽车经...</a>[09-12]</li>
                        <!-- order="DocRelTime desc" -->
                        <li class="fix"><a href="/zhengcejiedu/chaoxianysclxsglglgd" title="《超限运输车辆行驶公路管理规定》解读" target="_blank">《超限运输车辆行驶公路管理规定》解读</a>[09-08]</li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="product floatl columnde"><!-- Met007 v2首页 产品或图片 模块展示栏目 无后台栏目标识 -->
            <h3 class="title-product">
                <div class="flip floatr">
                    <a class="next" id="next4" href="javascript:void(0);"></a>
                    <a class="prev" id="prev4" href="javascript:void(0);"></a>
                    <p id="trigger4"></p>
                </div>
                <div class="line"><span>学生风采</span></div>
            </h3>
            <div class="imglist" id="panel4" style="height:169px;">
                <ul class="list-style" style="height:169px;">
                    <!--删除下面methtml_getarray函数的第三个参数,以保证后台对前台新闻列表的排序有效 现在排序优先级为: 排序权值>置顶状态值>发布时间值>推荐状态值-->

                    <li style="width:206px; height:169px;">
                        <a href="StuStyleShow/showimg.php?lang=cn&id=51" target="_blank" title="12.9长跑" class="img">
                            <img src="upload/201412/thumb/1418297794.jpg" title="12.9长跑" alt="12.9长跑" width="200" height="138" />
                        </a>
                        <h4><a href="StuStyleShow/showimg.php?lang=cn&id=51" target="_blank" title="12.9长跑">12.9长跑</a></h4>
                    </li>

                    <li style="width:206px; height:169px;">
                        <a href="StuStyleShow/showimg.php?lang=cn&id=20" target="_blank" title="毕业学生在东航风采" class="img">
                            <img src="upload/201311/thumb/1384848783.jpg" title="毕业学生在东航风采" alt="毕业学生在东航风采" width="200" height="138" />
                        </a>
                        <h4><a href="StuStyleShow/showimg.php?lang=cn&id=20" target="_blank" title="毕业学生在东航风采">毕业学生在东航风采</a></h4>
                    </li>

                    <li style="width:206px; height:169px;">
                        <a href="StuStyleShow/showimg.php?lang=cn&id=52" target="_blank" title="12.9长跑" class="img">
                            <img src="upload/201412/thumb/1418297781.jpg" title="12.9长跑" alt="12.9长跑" width="200" height="138" />
                        </a>
                        <h4><a href="StuStyleShow/showimg.php?lang=cn&id=52" target="_blank" title="12.9长跑">12.9长跑</a></h4>
                    </li>

                    <li style="width:206px; height:169px;">
                        <a href="StuStyleShow/showimg.php?lang=cn&id=41" target="_blank" title="运动会老师合影" class="img">
                            <img src="upload/201405/thumb/1399813279.JPG" title="运动会老师合影" alt="运动会老师合影" width="200" height="138" />
                        </a>
                        <h4><a href="StuStyleShow/showimg.php?lang=cn&id=41" target="_blank" title="运动会老师合影">运动会老师合影</a></h4>
                    </li>

                    <li style="width:206px; height:169px;">
                        <a href="StuStyleShow/showimg.php?lang=cn&id=29" target="_blank" title="迎新晚会" class="img">
                            <img src="upload/201311/thumb/1384848985.JPG" title="迎新晚会" alt="迎新晚会" width="200" height="138" />
                        </a>
                        <h4><a href="StuStyleShow/showimg.php?lang=cn&id=29" target="_blank" title="迎新晚会">迎新晚会</a></h4>
                    </li>

                    <li style="width:206px; height:169px;">
                        <a href="StuStyleShow/showimg.php?lang=cn&id=27" target="_blank" title="模拟机舱" class="img">
                            <img src="upload/201311/thumb/1384849182.JPG" title="模拟机舱" alt="模拟机舱" width="200" height="138" />
                        </a>
                        <h4><a href="StuStyleShow/showimg.php?lang=cn&id=27" target="_blank" title="模拟机舱">模拟机舱</a></h4>
                    </li>

                    <li style="width:206px; height:169px;">
                        <a href="StuStyleShow/showimg.php?lang=cn&id=26" target="_blank" title="技能大赛获奖照片" class="img">
                            <img src="upload/201311/thumb/1384848725.JPG" title="技能大赛获奖照片" alt="技能大赛获奖照片" width="200" height="138" />
                        </a>
                        <h4><a href="StuStyleShow/showimg.php?lang=cn&id=26" target="_blank" title="技能大赛获奖照片">技能大赛获奖照片</a></h4>
                    </li>

                    <li style="width:206px; height:169px;">
                        <a href="StuStyleShow/showimg.php?lang=cn&id=24" target="_blank" title="团代会代表与杨校长合影" class="img">
                            <img src="upload/201311/thumb/1384848410.JPG" title="团代会代表与杨校长合影" alt="团代会代表与杨校长合影" width="200" height="138" />
                        </a>
                        <h4><a href="StuStyleShow/showimg.php?lang=cn&id=24" target="_blank" title="团代会代表与杨校长合影">团代会代表与杨校长合影</a></h4>
                    </li>

                </ul>
            </div>
        </div>
        <!--<div class="case floatr columnde"> Met007 v2首页右侧第二个栏目 后台栏目标识为8 暂时删除这个栏目 栏目改为信箱 -20131206
            <h3 class="title"><a href="download/" title="更多>>" class="more floatr">更多>></a><div class="line"><span>下载中心</span></div></h3>
               <ul class="newsx list-style">
    <!--删除下面methtml_getarray函数的第三个参数,以保证后台对前台新闻列表的排序有效 现在排序优先级为: 排序权值>置顶状态值>发布时间值>推荐状态值-->
        <!----
                    <li><a href="download/showdownload.php?lang=cn&id=32" target="_blank" title="沈阳航空航天大学飞行签派员800小时(签派“+1”班) 培训招生简章">沈阳航空航天大学飞行签派员800小时(签派“+1”班) 培训招生简章</a><img class='listtop' src='templates/met007/images/top.gif' alt='' />  </li>
        <!----
                    <li><a href="download/showdownload.php?lang=cn&id=30" target="_blank" title="2016版沈航大飞行学员背景调查材料">2016版沈航大飞行学员背景调查材料</a>  </li>
        <!----
                    <li><a href="download/showdownload.php?lang=cn&id=27" target="_blank" title="民用航空学院评优申请表">民用航空学院评优申请表</a>  </li>
        <!----
                    <li><a href="download/showdownload.php?lang=cn&id=26" target="_blank" title="毕业生实习请假单">毕业生实习请假单</a>  </li>
        <!----
                    <li><a href="download/showdownload.php?lang=cn&id=25" target="_blank" title="关于组织申报2013年度青年教师自选课题(人文)的附件">关于组织申报2013年度青年教师自选课题(人文)的附件</a>  </li>
        <!----
                    <li><a href="download/showdownload.php?lang=cn&id=23" target="_blank" title="2014年沈航民航机务执照笔试、口试考试计划">2014年沈航民航机务执照笔试、口试考试计划</a>  </li>
        <!----
                    <li><a href="download/showdownload.php?lang=cn&id=24" target="_blank" title="关于组织申报2013年度青年教师自选课题(理工科)的附件">关于组织申报2013年度青年教师自选课题(理工科)的附件</a>  </li>
        <!----
                    </ul>
            </div> -->

        <div id=mail-box>
            <img src="/upload/cac-static/mail-3.jpg" />
        </div>

        <div class="clear"></div>

        <div class="links">
            <h4 class="title">友情链接</h4>
            <div class="text">
                <div class="list">

                    <div class="img"><ul class='list-none'>
                    </ul>
                    </div>

                    <div class="clear"></div>
                    <ul class='list-none'>
                        <li><a href='http://http://www.caac.gov.cn/' target='_blank' title=''>中国民用航空局</a></li>
                        <li><a href='http://db.caac.gov.cn/' target='_blank' title='中国民用航空东北地区管理局'>中国民用航空东北地区管理局</a></li>
                        <li><a href='http://www.sau.edu.cn' target='_blank' title='沈阳航空航天大学'>沈阳航空航天大学</a></li>
                        <li><a href='http://dept.cauc.edu.cn/kgzx/' target='_blank' title=''>民用航空器维修人员执照考试管理中心</a></li>
                        <li><a href='http://www.carnoc.com/' target='_blank' title=''>民航资源网</a></li>
                    </ul>

                </div>
            </div>
            <div class="clear"></div>
        </div>

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