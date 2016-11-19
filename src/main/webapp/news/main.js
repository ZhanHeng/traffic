var state = "";
$(function () {
    state = $("#stateId").val();
    if(state < 0){
        $('#repeat').removeClass('alert-success').addClass('alert-danger').css('display','block').delay(1500).hide(0);
    }else{
        $('#repeat').css('display','block').removeClass('alert-danger').addClass('alert-success').delay(1500).hide(0);
    }
    $('#openBtn').click(function () {
        $('#tagActionId')[0].reset();
        $('#killPhoneModal').modal({
            show : true ,           //显示弹出层
            backdrop : 'static' ,  //禁止位置关闭
            keyboard : false        //关闭键盘事件
        });
    });


    //等级改变，加载父级菜单
    $("#level").change(function() {
        $("#parentlevel option[value!='-1']").remove();
        if($(this).val()==1 || $(this).val()==-1 ){
            $("#pid").css('display','none'); ;
        }else{
            $("#pid").show(200);
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
        }
    });

    $('#userBtn').click(function () {
        $('#userForm')[0].reset();
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
        if($.trim($('#uname').val())==''){
            alert("请输入用户名");
            return false;
        } else if($.trim($('#psw').val())==''){
            alert("请输入密码");
            return false;
        }else if($("#psw").val()!=$("#psw2").val()){
            alert("两次输入的密码不一致");
            return false;
        }else{
            $('#adddUser').modal('hide');
            return true;
        }
    });
    $('#tagId').click(function () {
        if($.trim($('#firstname').val())==''){
            alert("请输入名称");
            return false;
        }else{
            $('#killPhoneModal').modal('hide');
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