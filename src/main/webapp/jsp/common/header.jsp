<%--
  Created by IntelliJ IDEA.
  User: mrli
  Date: 2019/3/4
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房屋租赁管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-header">
    <div class="layui-logo">房屋租赁</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                ${sessionScope.AdUserName}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
</div>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">房源信息</a>
                <dl class="layui-nav-child">
                    <dd><a href="">房源列表</a></dd>
                    <dd><a href="">添加房源</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">房源设置</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toHouseSettings">查看房源设置</a></dd>
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toAddNewSetting">添加房源设置</a></dd>
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toFacilitySetting">查看房间设施</a></dd>
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toAddFacility">添加房间设施</a></dd>

                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">租赁信息</a>
                <dl class="layui-nav-child">
                    <dd><a href="">在租列表</a></dd>
                    <dd><a href="">退租列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">地区设置</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toRegionSettings">地区查询</a></dd>
                    <dd><a href="">添加新的地区</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>

</body>
</html>
