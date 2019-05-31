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
<div class="layui-header layui-bg-black" >
    <div class="layui-logo" style="color: #ffffff">房屋租赁</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right ">
        <li class="layui-nav-item">
            <a href="javascript:;" >
                <p style="color: #ffffff">${sessionScope.AdUserName}</p>
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="${ctx}/administrator/quit">退出</a></li>
    </ul>
</div>
<div class="layui-side layui-bg-cyan">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree "  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">房源信息</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toHouseInfo">房源列表</a></dd>
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toExaminingHouse">审核房源</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">房源设置</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toHouseSettings">查看房源设置</a></dd>
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toAddNewSetting">添加房源设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">房间设施</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toFacilitySetting">查看房间设施</a></dd>
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toAddFacility">添加房间设施</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">租赁信息</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toHouseTransferMsg">租赁列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">合同管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toContractMsg">合同列表</a></dd>
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toCheckContract">审核合同</a></dd>
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toSiteConfirmationContract">现场确认合同</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">租金管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toQueryMoney">租金收入查询</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">数据分析</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toAnalysis">房价分析</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">报障管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toQueryBreakdown">报障信息列表</a></dd>
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toCheckBreakdown">审核报障信息</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">地区管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toRegionSettings">地区查询</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/administrator/${sessionScope.AdUserName}/toUser">用户查询</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>

</body>
</html>
