<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>菜单列表页</title>
    <%@include file="../common/head.jsp"%>
</head>
<body>
<div class="container col-xs-12 col-sm-12" style="padding: 5px;">
    <div id="repeat" class="alert alert-success" style="display: none">
        <a href="#" class="close" data-dismiss="alert">
            &times;
        </a>
        <strong>${loginResult.data.stateInfo}</strong>
    </div>
    <form name="tagForm" action="searchTag" method="post">
        <div class="panel panel-default" >
            <div class="panel-heading" style="padding: 5px 15px 5px 15px;">
                <h3 style="margin-top:5px">菜单管理</h3>
                <div class="form-inline" role="banner">
                    <div class="form-group">
                        <label class="sr-only " for="name">名称</label>
                        <input type="text" name="tag.tagName" class="form-control " value="${tag.tagName}" id="name" placeholder="请输入名称">
                    </div>
                    <div class="form-group">
                        <s:select id = "searchplevelid" name="tag.tagLevel" class="form-control "  list="#{1:'一级菜单',2:'二级菜单',3:'三级菜单',4:'四级菜单'}"
                                  listKey="key" listValue="value" headerKey="-1" headerValue="请选择等级"></s:select>

                    </div>
                    <div class="form-group"></div>
                    <div class="form-group">
                        <select id = "searchpid" name="tag.parentTag.tagId" class = "form-control">
                            <option value=-1>请选择父级菜单</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <s:select name="tag.passFlag" class="form-control "  list="#{1:'可用',0:'不可用'}"
                                  listKey="key" listValue="value" headerKey="-1" headerValue="请选择状态"></s:select>
                    </div>

                    <button type="submit" class="btn btn-info ">
                        <span class="glyphicon glyphicon-search"></span> 查询
                    </button>
                    <button type="button" id="delbtn" class="btn btn-warning ">
                        <span class="glyphicon glyphicon-trash"></span> 批量删除
                    </button>
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped ">
                    <thead>
                    <th><input type="checkbox" id="SelectAll"  value="全选" onclick="selectAll(this);"/></th>
                    <th>序号</th>
                    <th>名称</th>
                    <th>菜单等级</th>
                    <th>上级直属菜单</th>
                    <th>首页位置</th>
                    <th>排序权重</th>
                    <th>状态</th>
                    <th align="center">操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="tag" varStatus="status">
                        <tr>
                            <td><input type="checkbox"  name="tagList" value="${tag.tagId}" /></td>
                            <td>${status.count}</td>
                            <td>${tag.tagName}</td>
                            <td>${tag.tagLevel} 级菜单</td>
                            <td>
                                    ${tag.parentTag.tagName}
                            </td>
                            <td>
                                <c:if test="${tag.position==0}">
                                    ---
                                </c:if>
                                <c:if test="${tag.position==1}">
                                    上
                                </c:if>
                                <c:if test="${tag.position==2}">
                                    左下
                                </c:if>
                                <c:if test="${tag.position==3}">
                                    右下
                                </c:if>
                                <c:if test="${tag.position==4}">
                                    上和左下
                                </c:if>
                                <c:if test="${tag.position==5}">
                                    上和右下
                                </c:if>
                            </td>
                            <td>
                                    ${tag.weight}
                            </td>
                            <td>
                                <c:if test="${tag.passFlag==1}">
                                    <span class="label label-info">可用</span>
                                </c:if>
                                <c:if test="${tag.passFlag!=1}">
                                    <span class="label label-default">不可用</span>
                                </c:if>
                            </td>
                            <td>
                                <a  class="btn btn-xs btn-success" href="javascript:void(0)" onclick="edit('${tag.tagId}')" >修改</a>
                                <a  class="btn btn-xs btn-danger" href="javascript:void(0)" onclick="del('${tag.tagId}')">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</div>
<form action="update" method="post">
    <div id="editTag" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <span class="glyphicon glyphicon-tag "></span> 编辑菜单
                    </h3>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal" role="form" method="post">
                        <input type="hidden" name="editTag.tagId" id="tid">
                        <div class="form-group">
                            <label for="tname" class="col-sm-4 control-label offset2">名称</label>
                            <div class="col-sm-6">
                                <input type="text" name="editTag.tagName" id="tname" class="form-control"  placeholder="请输入菜单名称" required autofocus>
                            </div>
                        </div>
                        <div class = "form-group">
                            <label class="col-sm-4 control-label offset2"  for = "tlevel">级别</label>
                            <div class="col-sm-6">
                                <input type="text"  id="tlevel" class="form-control"  readonly>
                                <input type="hidden" id="reallevel" name="editTag.tagLevel">

                            </div>
                        </div>
                        <div class = "form-group">
                            <label class="col-sm-4 control-label offset2" for = "parentlevel">父级菜单</label>
                            <div class="col-sm-6">
                                <input type="text"  id="parentlevel" class="form-control"  readonly>
                                <input type="hidden" id="parentTagId" name="editTag.parentTag.tagId">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label offset2" for = "tposition"  >位置</label>
                            <div class="col-sm-6">
                                <s:select name="editTag.position" class="form-control " list="#{0:'无',1:'上',2:'左下',3:'右下',4:'上和左下',5:'上和右下'}"
                                          id="tposition" listKey="key" listValue="value" headerKey="0" headerValue="请选择位置"></s:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label offset "for = "tweight">权重</label>
                            <div class="col-sm-6">
                                <input type="text" name="editTag.weight" class="form-control "  id="tweight" placeholder="请输入权重">
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-4 control-label offset2"  for = "tflag">状态</label>
                            <div class="col-sm-6">
                                <s:select name="editTag.passFlag" class="form-control " id="tflag" list="#{1:'可用',0:'不可用'}"
                                          listKey="key" listValue="value" ></s:select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
                            <input type="submit" class="btn btn-primary" value="提交">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function(){
        var value = '${loginResult}';//取过来的值可以是空，null，undefined
        if (value) {
            var state = '${loginResult.data.state}';
            if(state < 0){
                $('#repeat').removeClass('alert-success').addClass('alert-danger').css('display','block').delay(1500).hide(0);
            }else{
                $('#repeat').css('display','block').removeClass('alert-danger').addClass('alert-success').delay(1500).hide(0);
            }
        }
        $("#delbtn").click(function () {
            if($("input[name ='tagList' ]:checked").length<=0){
                alert("请选择条目");
                return false;
            }else{
                if(confirm("确认删除吗?")){
                    tagForm.action="batchDel";
                    tagForm.submit();
                }
            }
        });
        //等级改变，加载父级菜单
        $("#tlevel").change(function() {
            $("#parentlevel option[value!='-1']").remove();
            $.get("loadParentTag", {
                levelId : $("#tlevel").val()
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
        $("#searchplevelid").change(function() {
            $("#searchpid option[value!='-1']").remove();
            $.get("loadParentTag", {
                levelId : $("#searchplevelid").val()
            }, function(result) {
                var jsonObj = result["belongTagList"];
                for ( var i = 0; i < jsonObj.length; i++) {
                    var $option = $("<option></option>");
                    $option.attr("value", jsonObj[i]["tagId"]);
                    $option.text(jsonObj[i]["tagName"]);
                    $("#searchpid").append($option);
                }
            });
        });
        $.get("loadParentTag", {
            levelId : $("#searchplevelid").val()
        }, function(data) {
            var jsonObj = data["belongTagList"];
            for ( var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#searchpid").append($option);
            }
            for (var i = 0; i < jsonObj.length; i++) {
                if(jsonObj[i]["tagId"]=='${tag.parentTag.tagId}'){
                    $("#searchpid").get(0).options[i+1].selected = true;
                    break;
                }
            }
        });
    });
    function edit(id) {
        $('#editTag').modal({
            show : true ,           //显示弹出层
            backdrop : 'static' ,  //禁止位置关闭
            keyboard : false        //关闭键盘事件
        });
        $.get("getTag",{id:id},function(result){
            var obj = result["editTag"] ;
             $("#tname").val(obj["tagName"]);
             $("#tlevel").val(obj["tagLevel"]+"级标题");
             $("#reallevel").val(obj["tagLevel"]);
             $("#tflag").val(obj["passFlag"]);
             $("#tid").val(obj["tagId"]);
             var p = obj["parentTag"];
             $("#parentlevel").val(p["tagName"]);
             $("#parentTagId").val(p["tagId"]);


        });
        $.get("loadParentTag", {
            levelId : $("#tlevel").val()
        }, function(data) {
            var jsonObj = data["belongTagList"];
            for ( var i = 0; i < jsonObj.length; i++) {
                var $option = $("<option></option>");
                $option.attr("value", jsonObj[i]["tagId"]);
                $option.text(jsonObj[i]["tagName"]);
                $("#parentlevel").append($option);
            }
            for (var i = 0; i < jsonObj.length; i++) {
                if(jsonObj[i]["tagId"]==id){
                    $("#parentlevel").get(0).options[i+1].selected = true;
                    break;
                }
            }
        });
    }
    function del(id) {
        if(confirm("确认删除吗?")){
           window.location.href="del?id="+id;
        }
    }
    function selectAll(checkbox) {
        $('input[type=checkbox]').prop('checked', $(checkbox).prop('checked'));
    }
</script>
</body>
</html>