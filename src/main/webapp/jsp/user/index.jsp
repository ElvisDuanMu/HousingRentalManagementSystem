
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <title>链家用户中心_买房卖房用户-链家网</title>
    <meta name="description" content="链家网用户活动中心提供链家网买房卖房用户活动信息，关注房源和小区等" />
    <meta name="keywords" content="买房卖房用户活动中心，链家用户中心" />

    <link rel="stylesheet" href="/static/css/common.css">
    <link rel="stylesheet" href="/static/css/main.css">

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
        <div class="main-left fl">
            <div class="name">
            </div>
            <div class="user-name" style="padding: 15px 0 5px 0;">欢迎你，${sessionScope.Username} </div>
            <div class="user-name" style="padding: 0 0 15px 0;"><a id="logout" href="${ctx}/user/quit" >退出</a></div>
            <ul>
                <li class="hover"><a href="${ctx}/user/index/${sessionScope.Username}">首页</a></li>
                <li> <a href="${ctx}/user/application/${sessionScope.Username}">申请管理</a></li>
                <li><a href="${ctx}/user/houseInfo/${sessionScope.Username}">我的房源</a></li>
                <li><a href="${ctx}/user/contract/${sessionScope.Username}">我的合同</a></li>
                <li><a href="${ctx}/user/money/${sessionScope.Username}">我的收入</a></li>
                <li><a href="">报障信息</a></li>
                <li><a href="">编辑资料</a></li>
            </ul>
        </div>
        <div class="main-right fr">
            <div id="allList">
                <div class="title">您关注的房源/小区最新动态</div>

                <div class="save-list" node-type="list"></div>
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
</head>
</html>
