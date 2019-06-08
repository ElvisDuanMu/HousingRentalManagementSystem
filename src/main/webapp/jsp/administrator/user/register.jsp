

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房屋租赁管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>

        .spa{
            height: 25px;
            line-height: 20px;
            width: 204px;
            display: inline-block;
            float: left;
            font-size: 15px;
            color: #BD362F;
            text-indent: 10px;
            margin-top: 5px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp" />
    <%--存登陆人--%>
    <input type="hidden" value="${sessionScope.AdUserName}" id="AdUserName">

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-form" >

                <div class="layui-form-item">
                    <div class="layui-form" style="padding: 20px; ">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
                            <legend style="color: black; font-size: 20px;">管理员注册</legend>
                        </fieldset>
                        <div class="layui-form-item" style="margin-bottom: 0;">
                            <label class="layui-form-label">登录名</label>
                            <div class="layui-input-inline">
                                <div class="layui-input-inline" style="margin-left: 5px;">
                                    <input type="text" name="loginName" id="loginName"  required style="width: 200px;" placeholder="请输入登录名" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <span class="spa spa1" id="spa1" style="margin-left: 125px; width: 400px;"></span>
                        <div class="layui-form-item" style="margin-bottom: 0;">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-inline">
                                <div class="layui-input-inline" style="margin-left: 5px;">
                                    <input type="password" name="password" id="password" required style="width: 200px;" placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <span class="spa spa2" id="spa2" style="margin-left: 125px; width: 800px;"></span>
                        <div class="layui-form-item" style="margin-bottom: 0;">
                            <label class="layui-form-label">真实姓名</label>
                            <div class="layui-input-inline">
                                <div class="layui-input-inline" style="margin-left: 5px;">
                                    <input type="text" name="name" id="name"  required style="width: 200px;" placeholder="真实姓名" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <span class="spa spa3" id="spa3" style="margin-left: 125px; width: 400px;"></span>
                        <div class="layui-form-item" style="margin-bottom: 0;">
                            <label class="layui-form-label">身份证号</label>
                            <div class="layui-input-inline">
                                <div class="layui-input-inline" style="margin-left: 5px;">
                                    <input type="text" name="certification" id="certification"  oninput="value=value.replace(/[^\d]/g,'')" required style="width: 200px;" placeholder="证件号码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <span class="spa spa4" id="spa4" style="margin-left: 125px; width: 400px;"></span>
                        <div class="layui-form-item" style="margin-top: 20px; margin-bottom: 0" >
                            <div class="layui-input-block" >
                                <button lay-submit class="layui-btn layui-btn-disabled" id="add" lay-filter="add" disabled="disabled">添加</button>
                            </div>
                        </div>
                        <span class="spa spa5" id="spa5" style="margin-left: 125px; width: 400px;"></span>
                   </div>
                </div>

            </div>

        </div>

    </div>
    <jsp:include page="/jsp/common/footer.jsp" />

</div>

<%--工具条--%>
<script type="text/html" id="queryUserInfoListBar">
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="ban">封停</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="cancel">解封</a>
</script>

<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        var table = layui.table;

        var adUserName = $('#AdUserName').val();

        var check1 = false;
        var check2 = false;
        var check3 = false;
        var check4 = false;
        var check5 = false;

        var shujukuname;
        var shujukupassword;
        //检查密码格式
        function checkPwd(str){
            var pattern1 = /([0-9]+)/;
            var pattern2 = /([a-z]+)/;
            var pattern3 = /([A-Z]+)/;
            //限制密码的位数在8-20位之间
            if(str.length<8 ||str.length>20){
                return 1;
            }
            //没有数字、大写字母、小写字母时返回false，验证输入的密码不符合规则。
            if(!pattern1.exec(str) || !pattern2.exec(str) || !pattern3.exec(str)){
                return 2;
            }

            //不能有空格、换行、tab缩进等所有的空白
            var pattern4 = /\s+/g;
            if(pattern4.exec(str)){
                return 3;
            }

        }

        if(adUserName != 'M001'){
            $(".spa5").text("您没有注册权限").css("color","#BD362F");
        }else {
            check5 = true;


            $("input").blur(function(){
                //用户名判断
                if($(this).is("#loginName")){
                    var loginName = $('#loginName').val().trim();

                    if(loginName == ''){
                        $(".spa1").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check1 = false;
                    }else {
                        //检测登录名是否在数据库中已存在
                        $.ajax({
                            url:'${ctx}/administrator/checkLoginName/' + loginName
                            ,type: 'post'
                            ,success:function (msg) {
                                if (msg.code == 404){
                                    shujukuname = false;
                                }else {
                                    shujukuname = true;
                                }
                                if(shujukuname == false){
                                    $(".spa1").text("该用户名已被注册").css("color","#BD362F");
                                    $(this).css("border","1px solid #BD362F");
                                    check1 = false;
                                }
                                else{
                                    $(".spa1").text("\u2714").css("color","#00CD00");
                                    $(this).css("border","1px solid #aaa");
                                    check1 = true;
                                }
                                check();
                            }

                        });
                    }


                }
                //密码判断
                if($(this).is("#password")){
                    var password= $('#password').val().trim();
                    var result = checkPwd(password);
                    if(password == ''){
                        $(".spa2").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check2 = false;
                    }else if(result == 1){
                        $(".spa2").text("密码应为8-16位").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check2 = false;
                    }else if(result == 2){
                        $(".spa2").text("密码应同时包含大写字母、小写字母和数字").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check2 = false;
                    }else if(result == 3){
                        $(".spa2").text("密码不能有空格、tab、换行等空白").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check2 = false;
                    } else {
                        $(".spa2").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check2 = true;
                    }

                }
                //真实姓名判断
                if($(this).is("#name")){
                    var name = $('#name').val().trim();
                    if(name == ''){
                        $(".spa3").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check3 = false;
                    } else{
                        $(".spa3").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check3 = true;
                    }
                }
                //身份证号判断
                if($(this).is("#certification")){
                    var certification = $('#certification').val().trim();
                    if(certification == ''){
                        $(".spa4").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check4 = false;
                    }else {
                        //检测身份证号是否在数据库中已存在
                        $.ajax({
                            url:'${ctx}/administrator/checkCertification/' + certification
                            ,type: 'post'
                            ,success:function (msg) {
                                if (msg.code == 404){
                                    shujukupassword = false;
                                }else {
                                    shujukupassword = true;
                                }
                                if (shujukupassword == false) {
                                    $(".spa4").text("该身份证号已被使用").css("color","#BD362F");
                                    $(this).css("border","1px solid #BD362F");
                                    check4 = false;
                                }
                                else{
                                    $(".spa4").text("\u2714").css("color","#00CD00");
                                    $(this).css("border","1px solid #aaa");
                                    check4 = true;

                                }
                                check();
                            }
                        });
                    }


                }


                check();



            });


            //聚焦判断
            $("input").focus(function(){
                if($(this).is("#password")){
                    $(".spa2").text("密码为8-16位，必须全部包含大写、小写字母和数字，不能有空白").css("color","#0000FF");
                    $(this).css("border","1px solid #aaa")
                }


            });


        }

        function check(){
            if (check1 && check2 && check3 && check4 && check5){
                $("#add").attr("class","layui-btn");
                $("#add").attr('disabled',false);
            }else
            {
                $("#add").attr("class","layui-btn layui-btn-disabled");
                $("#add").attr('disabled',true);
            }
        }

        $('#add').click(function () {
            var loginName = $('#loginName').val().trim();
            var password = $('#password').val().trim();
            var name = $('#name').val().trim();
            var certification = $('#certification').val().trim();

            var msg = {
                administratorName : loginName,
                administratorPassword : password,
                name : name,
                certification : certification
            };

            $.ajax({
                url: '${ctx}/administrator/add',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(msg),
                success: function (data) {
                    if (data.code == 200)
                    {
                        layer.msg('添加成功',{
                            icon: 6,
                            time: '1000'
                        },function () {
                            window.location.reload();
                        });

                    }

                }
            });



        });





    });
</script>
</body>
</html>
