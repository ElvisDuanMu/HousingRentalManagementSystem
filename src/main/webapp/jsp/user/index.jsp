
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <title>用户中心_买房卖房用户</title>
    <meta name="description" content="用户活动中心提供买房卖房用户活动信息等" />
    <meta name="keywords" content="买房卖房用户活动中心，用户中心" />

    <link rel="stylesheet" href="${ctx}/static/css/common.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">

    <header class="lianjia-header">
        <div class="nav-wrap">
            <div class="wrapper">
                <div class="fl"><a href="#" class="logo"></a></div>
                <div class="fr nav">
                    <div class="fl">
                        <ul>
                            <li>
                                <a class="" href="${ctx}/user/toIndex">首页</a>
                            </li>
                            <li>
                                <a class="" href="${ctx}/user/210000/210200/queryHouse">租房</a>
                            </li>
                            <li>
                                <a class="" href="http://www.baidu.com">百科</a>
                            </li>
                            <li>
                                <a class="" href="${ctx}/user/toPublishing" target="_blank">发布房源</a>
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
        <div class="main-left fl">
            <div style="height: 80px; width: 80px; margin: 0 auto;" >
                <img src="${ctx}${sessionScope.userImg}" style="width: 80px ;height: 80px;">
            </div>
            <div class="user-name" style="padding: 15px 0 5px 0;">欢迎你，${sessionScope.Username} </div>
            <div class="user-name" style="padding: 0 0 15px 0;"><a id="logout" href="${ctx}/user/quit" >退出</a></div>
            <ul>
                <li class="hover"><a href="${ctx}/user/index/${sessionScope.Username}">首页</a></li>
                <li> <a href="${ctx}/user/application/${sessionScope.Username}">申请管理</a></li>
                <li><a href="${ctx}/user/houseInfo/${sessionScope.Username}">我的房源</a></li>
                <li><a href="${ctx}/user/contract/${sessionScope.Username}">我的合同</a></li>
                <li><a href="${ctx}/user/money/${sessionScope.Username}">我的收入</a></li>
                <li><a href="${ctx}/user/breakdown/${sessionScope.Username}">报障信息</a></li>
                <li><a href="${ctx}/user/message/${sessionScope.Username}">编辑资料</a></li>
            </ul>
        </div>
        <div class="main-right fr">
            <div id="allList">
                <div class="title">优秀房源推荐</div>

                <div class="save-list" node-type="list"></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <div class="lianjia-footer-simple">租房（大连） | 网络经营许可证 00000001号-1 | &copy; Copyright&copy;2018-2019 租房版权所有&nbsp;<div style="width:300px;color: #888c8e;font-size: 12px;line-height: 20px;margin: auto;"><a
            target="_blank"  style="display:inline-block;text-decoration:none;height:20px;line-height:20px;margin: 0 auto;text-align: center;"><img
            src="${ctx}/static/img/beian.png" style=" float:left;">
        <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px;color: #888c8e;">公网安备1000000001号</p>
    </a></div>
    </div>
    </body>
</head>

<script src="${ctx}/static/js/jquery-2.1.4.min.js"></script>

<script src="${ctx}/static/plugins/layui/layui.js" ></script>
<script>


    layui.use(['form', 'laypage', 'jquery', 'slider','util','element','layer'], function () {
        var form = layui.form;
        var laypage = layui.laypage;
        var $ = layui.jquery;
        var slider = layui.slider;
        var util = layui.util;
        var element = layui.element;
        var layer = layui.layer;



    });




</script>

</html>
