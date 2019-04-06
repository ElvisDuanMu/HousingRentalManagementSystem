<%--
  Created by IntelliJ IDEA.
  User: mrli
  Date: 2019/3/4
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登陆</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        form{
            width: 300px;
            margin: auto;
            margin-top: 10%;
        }
    </style>
</head>
<body>
<div class="layui-container">
    <form action="${ctx}/user/login" method="post" class="layui-form">
        <input type="hidden" id="msg" value="${msg}">
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="text" name="userLoginName" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="password" name="userPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <button id="login" class="layui-btn" lay-submit lay-filter="formDemo" >登陆</button>
                <button type="reset" class="layui-btn layui-btn-primary">重填</button>
            </div>
        </div>

    </form>

</div>

</body>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','layer','jquery'], function(){
        var element = layui.element;
        var layer = layui.layer;
        var $ = layui.jquery;
        var msg = $('#msg').val();
        if (msg == 1){
            layer.msg("账号或密码错误");
        }
        if (msg == 2)  {
            layer.msg("账号不存在");
        }




    });
</script>
</html>