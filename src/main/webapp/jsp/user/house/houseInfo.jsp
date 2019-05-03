
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <title>链家用户中心_买房卖房用户-链家网</title>
    <meta name="description" content="链家网用户活动中心提供链家网买房卖房用户活动信息，关注房源和小区等" />
    <meta name="keywords" content="买房卖房用户活动中心，链家用户中心" />

    <link rel="stylesheet" href="${ctx}/static/css/common.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" />
    <style >
        .user-main .main-right li{
            padding-top: 0;
            clear: none;
        }
        p {
            font-size: 15px;
            color: #000000;
        }
        u {
            color: #0f6fac;
        }

    </style>
</head>
<header class="lianjia-header">
    <div class="nav-wrap">
        <div class="wrapper">
            <div class="fl"><a href="#" class="logo"></a></div>
            <div class="fr nav">
                <div class="fl">
                    <ul>
                        <li>
                            <a class="" href="#">二手房</a>
                        </li>
                        <li>
                            <a class="" href="#">新房</a>
                        </li>
                        <li>
                            <a class="" href="#">租房</a>
                        </li>
                        <li>
                            <a class="" href="#">海外</a>
                        </li>
                        <li>
                            <a class="" href="#">小区</a>
                        </li>
                        <li>
                            <a class="" href="#">经纪人</a>
                        </li>
                        <li class="hover">
                            <a class="" href="#">
                                指南
                            </a>
                            <div class="nav-list">
                                <dd>
                                    <i></i>
                                    <dl>
                                        <a href="#">问答</a>
                                    </dl>
                                    <dl>
                                        <a href="#">百科</a>
                                    </dl>
                                </dd>
                            </div>
                        </li>
                        <li>
                            <a class="" href="#">房价</a>
                        </li>
                        <li>
                            <a class="" href="#" target="_blank">工具</a>
                        </li>
                        <li>
                            <a class="" href="${ctx}/user/toPublishing" target="_blank">发布房源</a>
                        </li>
                        <li>
                            <a class="" href="#" target="_blank">企业汇</a>
                        </li>
                    </ul>
                </div>
                <div class="fr login">
                    <div class="login-panel typeUserInfo">

                        <div class="ti-hover">
                            <div class="user-news" id="userNews">

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="user-main">
    <div class="main-left fl" >
        <div class="name">
        </div>
        <div class="user-name" style="padding: 15px 0 5px 0;">欢迎你，${sessionScope.Username} </div>
        <%--存登陆人--%>
        <input type="hidden" value="${sessionScope.Username}" id="username">
        <div class="user-name" style="padding: 0 0 15px 0;"><a id="logout" href="${ctx}/user/quit" >退出</a></div>
        <ul>
            <li><a href="${ctx}/user/index/${sessionScope.Username}">首页</a></li>
            <li> <a href="${ctx}/user/application/${sessionScope.Username}">申请管理</a></li>
            <li class="hover"><a href="${ctx}/user/houseInfo/${sessionScope.Username}">我的房源</a></li>
            <li><a href="${ctx}/user/contract/${sessionScope.Username}">我的合同</a></li>
            <li ><a href="${ctx}/user/money/${sessionScope.Username}">我的收入</a></li>
            <li><a href="">报障信息</a></li>
            <li><a href="">编辑资料</a></li>
        </ul>
    </div>
    <div class="main-right fr" style="min-height: 600px;">
        <div id="allList">
            <div class="title">您的房源信息</div>
            <%--选项卡--%>
            <div class="layui-tab layui-tab-brief" lay-filter="wayInfo">
                <ul class="layui-tab-title">
                    <li class="layui-this">待审核的房源</li>
                    <li>待出租的房源</li>
                    <li>已出租的房源</li>
                    <li>租到的房源</li>
                    <li>结束的房源</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <%--待审核的房源--%>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="checkHouseListInfo" lay-filter="checkHouseListInfo"></table>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <%--待出租的房源--%>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="forHireHouseListInfo" lay-filter="forHireHouseListInfo"></table>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <%--已出租的房源--%>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="rentedHouseListInfo" lay-filter="rentedHouseListInfo"></table>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <%--已租到的房源--%>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="alreadyRentedHouseListInfo" lay-filter="alreadyRentedHouseListInfo"></table>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <%--已结束的房源--%>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="endHouseListInfo" lay-filter="endHouseListInfo"></table>
                        </div>
                    </div>
                </div>



            </div>

        </div>
    </div>
</div>
<div class="clear"></div>
</div>

<div class="lianjia-footer-simple">链家网（北京）科技有限公司 | 网络经营许可证 京ICP备16057509号-2<br>© Copyright©2010-2019
    链家网Lianjia.com版权所有&nbsp;<div style="width:300px;color: #888c8e;font-size: 12px;line-height: 20px;margin: auto;"><a
            target="_blank"  style="display:inline-block;text-decoration:none;height:20px;line-height:20px;margin: 0 auto;text-align: center;"><img
            src="/static/img/beian.png" style=" float:left;">
        <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px;color: #888c8e;">京公网安备 11010802024019号</p>
    </a></div>
</div>

</body>


<%--收入工具条--%>
<script type="text/html" id="incomeListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="view">查看</a>
</script>

<%--已出租的房源工具条--%>
<script type="text/html" id="rentedHouseListInfoBar" >
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="viewHouse">查看房源</a>
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="viewPay">查看付款信息</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs " lay-event="edit">编辑付款信息</a>
</script>

<script type="text/javascript" src="${ctx}/static/js/jquery-2.1.4.min.js"></script>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'laypage', 'jquery', 'slider'
        ,'util','element','layer','table','laydate'], function () {
        var form = layui.form;
        var laypage = layui.laypage;
        var $ = layui.jquery;
        var slider = layui.slider;
        var util = layui.util;
        var element = layui.element;
        var layer = layui.layer;
        var table = layui.table;
        var laydate = layui.laydate;

        var username = $('#username').val();


        //已出租的房源
        table.render({
            elem:'#rentedHouseListInfo',
            url: "${ctx}/houseTransfer/queryRentedHouseListInfo/"+ username,
            cols: [[
                {field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partBLoginName', title: '承租人（乙方）',align: 'center'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{field:'startTimeString', title: '开始日期',align: 'center'}
                ,{field:'endTimeString', title: '结束日期',align: 'center'}
                ,{field:'createTimeString', title: '创建日期',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#rentedHouseListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });













    });
</script>



</html>
