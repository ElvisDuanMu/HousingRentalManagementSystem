
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房屋租赁管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp" />

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="margin-top: 50px; margin-left: 50px; margin-right: 40px" >
            <h2>添加房源设置信息</h2>
            <hr class="layui-bg-red">
            <div class="layui-tab layui-tab-brief" lay-filter="addOptions" style="margin-top: 40px">
                <ul class="layui-tab-title">
                    <li class="layui-this">添加新的类型及信息</li>
                    <li>选择已有类型</li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;">
                    <div class="layui-tab-item layui-show">
                        <form class="layui-form" action="${ctx}/houseSettings/${sessionScope.AdUserName}/addNewSetting" method="post">
                            <div class="layui-form-item">
                                <label class="layui-form-label">类型代码</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="typeCode" lay-verify="typeCode" autocomplete="off" placeholder="请输入类型代码" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" >
                                <label class="layui-form-label">类型名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="typeName" lay-verify="typeName" autocomplete="off" placeholder="请输入类型名称" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="valueName" lay-verify="valueName" autocomplete="off" placeholder="请输入名称" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit lay-filter="formDemo">添加</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="layui-tab-item">
                        <form class="layui-form" action="${ctx}/houseSettings/${sessionScope.AdUserName}/addNewSetting" method="post">
                            <div class="layui-form-item">
                                <label class="layui-form-label">类型名称</label>
                                <div class="layui-input-inline">
                                    <select class="layui-input-inline"  name="typeName" lay-verify="required">
                                        <option value=""></option>
                                        <c:forEach items="${HSTypeName}" var="obj">
                                            <option value="${obj.typeName}">${obj.typeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="valueName" lay-verify="valueName" autocomplete="off" placeholder="请输入名称" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit lay-filter="formDemo">添加</button>
                                </div>
                            </div>
                        </form>


                    </div>

                </div>
            </div>

        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />

</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form'], function(){
        var element = layui.element;
        var form = layui.form;

    });
</script>
</body>
</html>
