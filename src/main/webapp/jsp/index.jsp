<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>租房网,房屋出租,公寓出租,租房--找乐租</title>
    <meta name="keywords" content="租房网,房屋出租,公寓出租,出租房源--找乐租">
    <meta name="description" content="乐租租房网拥有海量的房屋出租及公寓出租房源，房源信息真实可靠，来乐租租房网，可进行商圈找房、地铁找房、地图找房，同时，已开通APP找房，帮您快速轻松找到满意的整租或合租房屋公寓，满足您的各种租房需求，全国租房热线：400-8180-555。">
    <meta name="author" content="乐租">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--<link rel="shortcut icon" href="http://www.hizhu.com/favicon.ico" type="image/x-icon">--%>
    <link rel="stylesheet" href="../static/css/common_new.css">
    <link rel="stylesheet" href="../static/css/swiper-4.1.6.min.css">
    <link rel="stylesheet" href="../static/css/index_new.css">
    <link rel="stylesheet" href="../static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/admin.css">
    <link rel="stylesheet" href="${ctx}/static/css/login.css">
    <link rel="stylesheet" href="${ctx}/static/css/common2.css">
</head>
<body>


<header class="common_minwidth">
    <!-- 登录帮助导航栏 -->
    <section class="login_bar">
        <div class="common_width">


                <c:if test="${sessionScope.Username != null}">
                    <a data-el="login_box" href="${ctx}/user/index/${sessionScope.Username}"> 欢迎你：${sessionScope.Username}</a>
                    <a data-el="logout_btn" href="${ctx}/user/logout" id="logout" >退出</a>
                </c:if>
                <c:if test="${sessionScope.Username == null}">
							<span data-el="login_box">
                                <a id="login5" class=btn-login" style="margin-right: 5px;" href="javascript:;">登录</a>/<a class="btn-resgiter" id="register" style="margin-left: 5px;">注册</a>
							</span>
                </c:if>


            <a alt="管理员登录" title="管理员登录"  id="AdLogin" href="javascript:;" rel="nofollow">管理员登录</a>


        </div>
    </section>
    <!-- logo 跟 模块导航栏 -->
    <section class="list_bar">
        <div class="common_width cf">
            <!-- logo -->
            <a alt="乐租租房" title="乐租租房" class="logo fl" href="/" target="_self">
                <img src="${ctx}/static/img/02.png" alt="乐租租房" alt="乐租租房">
            </a>
            <!-- 城市切换 -->
            <div class="city_box fl">
                <span class="cur_city"><a href="/user/chooseCity">上海</a></span>
                <i class="triangle_b"></i>
                <ul class="city_list">
                    <li><a alt="上海租房" title="上海租房" href="${ctx}/user/310000/310100/queryHouse">上海</a></li>
                    <li><a alt="北京租房" title="北京租房" href="${ctx}/user/110000/110100/queryHouse">北京</a></li>
                    <li><a alt="杭州租房" title="杭州租房" href="${ctx}/user/210000/210200/queryHouse">大连</a></li>
                </ul>
            </div>
            <!-- 菜单导航栏 -->
            <div class="menu fl cf">
                <a alt="" title="" href="http://www.hizhu.com/shanghai/">首页</a>
                <a alt="区域找房" title="区域找房" href="#">区域找房</a>
                <a alt="地铁找房" title="地铁找房" href="#">地铁找房</a>
                <a alt="地图找房" title="地图找房" href="#">地图找房</a>
                <a alt="乐租APP下载" title="乐租APP下载" id="app" href="javascript:;" rel="nofollow">APP下载</a>
                <a alt="乐租帮" title="乐租帮" href="#" target="_blank">乐租帮</a>
            </div>
        </div>
    </section>
    <input type="hidden" id="get_city_url" value="http://www.hizhu.com/shanghai/">
</header>
<!-- banner -->
<section class="index_banner common_minwidth">
    <!-- 轮播 -->
    <div class="swiper-container banner-swiper-container" id="index_banner">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="../static/img/banner.jpg" alt="乐租 让您住的更好点" title="乐租 希望通过我们的努力，让租房成为一件小事"></div>
            <!--<div class="swiper-slide"><img src="./Public/images/notice.jpg" alt="乐租 让您住的更好点" title="乐租 希望通过我们的努力，让租房成为一件小事" onclick="window.location.href='http://ml.hizhu.com/app/?device=iphone&temp=chunjie'"></div>-->
        </div>
        <!-- 分页器 -->
        <div class="swiper-pagination"></div>
    </div>
    <!-- 搜索框 -->
    <div class="input_wrapper cf">
        <!-- 选择搜索条件 -->
        <div class="search_condition fl">
            <a alt="全部房源" title="全部房源" href="javascript:;" id="js_select">全部</a>
            <i class="triangle_b"></i>
            <div class="search_c_list">
                <span data-housetype-id="0" class="cur">全部</span>
                <span data-housetype-id="9">整租</span>
                <span data-housetype-id="10">合租</span>
                <span data-housetype-id="11">公寓</span>
            </div>
        </div>
        <input type="hidden" id="js_housetype_val" value="0">
        <!-- 搜索框 -->
        <input class="input_box" id="input_box" type="text" placeholder="输入地址、写字楼、园区或地铁站">
        <!-- 马上找房按钮 -->
        <a alt="点击找房" title="点击找房" id="" class="icon" href="#">马上找房</a>
        <!-- 搜索结果 -->
        <div class="search_result">

        </div>
        <!-- 历史记录 -->
        <div class="history">
            <p class="his_title"><span>搜索历史</span><span class="clearhistory">清除记录</span></p>
            <ul class="history_main">
            </ul>
        </div>
    </div>
    <input type="hidden" id="index_city" value="001009001">
</section>
<!-- 文本介绍 -->
<section class="nav">
    <div class="common_width">
        <ul class="nav_main">
            <li>
                <img src="../static/img/wt.png" alt="租房 万套真房" title="租房 万套真房" width="83px" height="100px">
                <p>万套真房</p>
                <span>实拍照片、实地视频、真实价格</span>
            </li>
            <li>
                <img src="../static/img/zj.png" alt="租房 租金优惠" title="租房 租金优惠" width="83px" height="100px">
                <p>租金优惠</p>
                <span>合作房源、高优惠、房租立减</span>
            </li>
            <li>
                <img src="../static/img/qs.png" alt="租房 轻松约房" title="租房 轻松约房" width="83px" height="100px">
                <p>轻松约房</p>
                <span>直呼房东、客服帮约、全程免费</span>
            </li>
            <li>
                <img src="../static/img/jh.png" alt="租房 聚合房源" title="租房 聚合房源" width="83px" height="100px">
                <p>聚合房源</p>
                <span>多渠道报价、房源信息一览无余</span>
            </li>
        </ul>
    </div>
</section>


<!--  TA们都在使用乐租 -->
<section class="peoples">
    <section class="common_width">
        <h2>TA们都在使用乐租</h2>
        <ul class="cf" id="js_feedback">
            <li>
                <img alt="乐租 租客留言" title="乐租 租客留言" class="tx" src="../static/img/01.png">
                <p class="name">租客海岛妹妹</p>
                <p class="age">餐厅经理&nbsp;&nbsp;22岁</p>
                <div  class="text_explain">
                    <img alt="乐租" title="乐租" src="../static/img/text_t.png">
                    <p>当时租的是房东直租的，没有中介费，而且房子和图片没差，很满意！ 最重要的是不仅找到房子，也交到朋友了 ，乐租是一个披着租房的外衣实际给我们年轻人创造互相交友的平台。</p>
                    <section class="text_b"><img alt="乐租" title="乐租" src="../static/img/text_b.png"></section>
                </div>
            </li>
            <li>
                <img alt="租房 租客留言" title="租房 租客留言" class="tx" src="../static/img/02.png">
                <p class="name">租客西瓜皮厚</p>
                <p class="age">软件工程师&nbsp;&nbsp;25岁</p>
                <div  class="text_explain">
                    <img alt="乐租" title="乐租" src="../static/img/text_t.png">
                    <p>一个人来到陌生的城市，第一个安全感就是乐租给我的，找房看房一气呵成，很便捷安全的租房方式，没有中介的絮絮叨叨，没有黑房东的坑蒙拐骗，如今已经换了三次房了，不变的是每一次都是通过乐租，也感谢乐租的工作人员小白，让我在陌生的城市不再彷徨。</p>
                    <section class="text_b"><img alt="乐租" title="乐租" src="../static/img/text_b.png"></section>
                </div>
            </li>
            <li>
                <img alt="乐租 租客留言" title="乐租 租客留言" class="tx" src="../static/img/03.png">
                <p class="name">租客Mathilda</p>
                <p class="age">销售&nbsp;&nbsp;25岁</p>
                <div  class="text_explain">
                    <img alt="乐租" title="乐租" src="../static/img/text_t.png">
                    <p>沪漂三年了，现在住的房子让我忘记自己是沪漂族。最早来上海很艰难，工作之余住宿环境很不理想，后来机缘巧合遇到乐租，找房子就省心很多，很轻松找到现在的一室户，价格也是满意。有时候就是这样，一件事顺了就处处顺了，如今每天很从容，内心很温暖。</p>
                    <section class="text_b"><img alt="乐租" title="乐租" src="../static/img/text_b.png"></section>
                </div>
            </li>
            <li>
                <img alt="乐租 租客留言" title="乐租 租客留言" class="tx" src="../static/img/09.png">
                <p class="name">租客蓝小姐</p>
                <p class="age">公司职员&nbsp;&nbsp;25岁</p>
                <div  class="text_explain">
                    <img alt="乐租" title="乐租" src="../static/img/text_t.png">
                    <p>我是个怕麻烦的人，之前通过中介找到过合适的房子。一年前换房也是找的中介，但这几次发现不同中介都有个共同点，以优质房源约见面，然后告知房子刚被租出去，再带你看其他不那么好的房源！下了很多租房App，最后在乐租上找到了现在的房子。</p>
                    <section class="text_b"><img alt="乐租" title="乐租" src="../static/img/text_b.png"></section>
                </div>
            </li>
            <li>
                <img alt="乐租 租客留言" title="乐租 租客留言" class="tx" src="../static/img/08.png">
                <p class="name">租客刘先生</p>
                <p class="age">项目经理&nbsp;&nbsp;27岁</p>
                <div  class="text_explain">
                    <img alt="乐租" title="乐租" src="../static/img/text_t.png">
                    <p>不找中介找乐租。第一次来上海的时候相信有很多朋友都有过我的类似经历：被黑中介和二房东联手坑的租房经历。所以在第二次找房的时候格外的谨慎，慎着慎着就遇到了乐租和热心的客服。</p>
                    <section class="text_b"><img alt="乐租" title="乐租" src="../static/img/text_b.png"></section>
                </div>
            </li>
            <li>
                <img alt="乐租 租客留言" title="乐租 租客留言" class="tx" src="../static/img/04.png">
                <p class="name">租客水小鸟</p>
                <p class="age">品牌主管&nbsp;&nbsp;26岁</p>
                <div  class="text_explain">
                    <img alt="乐租" title="乐租" src="../static/img/text_t.png">
                    <p>身边租房的朋友说乐租上的房子相对很多租房网站来说更真实，而且价格也不贵，打了几个电话后找到了现在的房子，给乐租一个大写的赞！</p>
                    <section class="text_b"><img alt="乐租" title="乐租" src="../static/img/text_b.png"></section>
                </div>
            </li>
            <li>
                <img alt="乐租 租客留言" title="乐租 租客留言" class="tx" src="../static/img/05.png">
                <p class="name">租客朱小姐</p>
                <p class="age">活动策划&nbsp;&nbsp;22岁</p>
                <div  class="text_explain">
                    <img alt="乐租" title="乐租" src="../static/img/text_t.png">
                    <p>今年刚在上面租到房子，想要稍微好点价格又实惠的房子非常难找，挑了几个乐租上有视频的房子看了后，3天就拎包入住了，节省了很多时间，谢谢乐租！</p>
                    <section class="text_b"><img alt="乐租" title="乐租" src="../static/img/text_b.png"></section>
                </div>
            </li>
            <li>
                <img alt="乐租 租客留言" title="乐租 租客留言" class="tx" src="../static/img/06.png">
                <p class="name">租客梁先生</p>
                <p class="age">商务经理&nbsp;&nbsp;28岁</p>
                <div  class="text_explain">
                    <img alt="乐租" title="乐租" src="../static/img/text_t.png">
                    <p>给公司谈生意是个麻烦事，要在各个城市到处出差，又不喜欢住酒店，乐租的短租解决了我短期问题，没有中介费，而且干净又省钱。</p>
                    <section class="text_b"><img alt="乐租" title="乐租" src="../static/img/text_b.png"></section>
                </div>
            </li>
            <li>
                <img alt="乐租 租客留言" title="乐租 租客留言" class="tx" src="../static/img/07.png">
                <p class="name">房东陈先生</p>
                <p class="age">个体经营户&nbsp;&nbsp;32岁</p>
                <div  class="text_explain">
                    <img alt="乐租" title="乐租" src="../static/img/text_t.png">
                    <p>家里闲置的房子发布到乐租上，很快就有人打电话要过来看房，一周就搞定了出租，简单方便实用。</p>
                    <section class="text_b"><img alt="乐租" title="乐租" src="../static/img/text_b.png"></section>
                </div>
            </li>

        </ul>
    </section>
</section>

<!-- 底部站点导航 -->
<footer class="common_footer">
    <section class="common_width">
        <h3>站点导航</h3>
        <div class="nav_list">
            <!-- 按区域 -->
            <dl class="cf">
                <dt>按区域：</dt>
                <dd><a alt="浦东租房" title="浦东租房" href="#" target="_blank">浦东</a></dd><dd><a alt="闵行租房" title="闵行租房" href="#" target="_blank">闵行</a></dd>
            </dl>
            <!-- 按地铁 -->
            <dl class="cf">
                <dt>按地铁：</dt>
                <dd><a alt="1号线租房" title="1号线租房" href="#" target="_blank">1号线</a></dd><dd><a alt="2号线租房" title="2号线租房" href="#" target="_blank">2号线</a></dd>
            </dl>
            <!-- 按类型 -->
            <dl class="cf">
                <dt>按类型：</dt>
                <dd><a alt="上海整租" title="上海整租" href="#" target="_blank">上海整租</a></dd>
                <dd><a alt="上海合租" title="上海合租" href="#" target="_blank">上海合租</a></dd>
                <dd><a alt="上海公寓" title="上海公寓" href="#" target="_blank">上海公寓</a></dd>
            </dl>
            <!-- 按城市 -->
            <dl class="cf">
                <dt>按城市：</dt>
                <dd><a alt="上海租房" title="上海租房" href="#" target="_blank">上海租房</a></dd>
                <dd><a alt="北京租房" title="北京租房" href="#" target="_blank">北京租房</a></dd>
                <dd><a alt="南京租房" title="大连租房" href="#" target="_blank">大连租房</a></dd>
            </dl>
            <!-- 合作伙伴 -->
            <dl class="cf">
                <dt>友情链接：</dt>
                <dd><a alt="装修百科" title="装修百科" el="nofollow" href="#" target="_blank">装修百科</a></dd>
                <dd><a alt="丹东买房" title="丹东买房" el="nofollow" href="#" target="_blank">丹东买房</a></dd>
                <dd><a alt="苏州房产网" title="苏州房产网" el="nofollow" href="#" target="_blank">苏州房产网</a></dd>
                <dd><a alt="宜春房产" title="宜春房产" el="nofollow" href="#" target="_blank">宜春房产</a></dd>
            </dl>
        </div>
        <!-- 底部导航 -->
        <div class="footer_bottom">
            <div class="footer_bottom_list cf">
                <a alt="关于我们" title="关于我们" href="#" target="_blank" rel="nofollow">关于我们</a>
                <a alt="联系我们" title="联系我们" href="#" target="_blank" rel="nofollow">联系我们</a>
                <a alt="加入我们" title="加入我们" href="#" target="_blank" rel="nofollow">加入我们</a>
                <a alt="常见问题" title="常见问题" href="#" target="_blank" rel="nofollow">常见问题</a>
                <a alt="意见反馈" title="意见反馈" href="#" target="_blank" rel="nofollow">意见反馈</a>
                <a alt="网站地图" title="网站地图" href="#" target="_blank" >网站地图</a>
                <a alt="友情链接" title="友情链接" el="nofollow" href="javascript:;">友情链接</a>
                <a alt="新浪微博" title="新浪微博" el="nofollow" class="weibo" href="#" target="_blank" rel="nofollow">新浪微博</a>
            </div>
            <p class="hotline">客服热线（周一至周日09：00-18：00，节假日除外）</p>
            <p class="tel">400-8180-555</p>
            <p class="copyright">
                ©2018-2019 Shanghai Gaodu Technology Co.,Ltd All Rights Reserved. <br>
                上海高度信息科技有限公司 备案号：沪ICP备15016401号  &nbsp;&nbsp;<a alt="备案信息" title="备案信息" target="_blank" class="copyright" href="#" >沪公网安备 31010602002785号&nbsp;&nbsp;<img alt="备案信息" title="备案信息" src='../static/img/beian.png'/></a>
            </p>
            <section class="ewm">
                <ul class="cf">
                    <li>
                        <img alt="乐租租房小程序" title="乐租租房小程序" src="../static/img/bx.png">
                        <span>微信租房小程序</span>
                    </li>
                    <li>
                        <img alt="乐租公众号" title="乐租公众号" src="../static/img/bx.png">
                        <span>关注乐租公众号</span>
                    </li>
                </ul>
            </section>
        </div>
    </section>
</footer>


<%--用户登陆弹窗--%>
<div class="layadmin-user-login-main" id="loginContent" style="display: none;">
    <div class="layadmin-user-login-box layadmin-user-login-header" style="margin-top: 40px;">
        <h2>用户登录</h2>
    </div>
    <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
        <div class="layui-form-item">
            <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
            <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
        </div>
        <div class="layui-form-item">
            <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
            <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
        </div>
        <%--<div class="layui-form-item">--%>
        <%--<div class="layui-row">--%>
        <%--<div class="layui-col-xs7">--%>
        <%--<label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>--%>
        <%--<input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">--%>
        <%--</div>--%>
        <%--<div class="layui-col-xs5">--%>
        <%--<div style="margin-left: 10px;">--%>
        <%--<img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <div class="layui-form-item" style="margin-bottom: 20px; height: 28px;">
            <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
            <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-fluid" id="submit" lay-filter="LAY-user-login-submit">登 入</button>
        </div>
        <div class="layui-trans layui-form-item layadmin-user-login-other">
            <label>社交账号登入</label>
            <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
            <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
            <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

        </div>
    </div>
</div>

<%--管理员登陆弹窗--%>
<div class="layadmin-user-login-main" id="AdLoginContent" style="display: none;">
    <div class="layadmin-user-login-box layadmin-user-login-header" style="margin-top: 40px;">
        <h2>管理员登录</h2>
    </div>
    <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
        <div class="layui-form-item">
            <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
            <input type="text" name="username" id="LAY-ad-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
        </div>
        <div class="layui-form-item">
            <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
            <input type="password" name="password" id="LAY-ad-login-password" lay-verify="required" placeholder="密码" class="layui-input">
        </div>
        <%--<div class="layui-form-item">--%>
        <%--<div class="layui-row">--%>
        <%--<div class="layui-col-xs7">--%>
        <%--<label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>--%>
        <%--<input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">--%>
        <%--</div>--%>
        <%--<div class="layui-col-xs5">--%>
        <%--<div style="margin-left: 10px;">--%>
        <%--<img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <div class="layui-form-item" style="margin-bottom: 20px; height: 28px;">
            <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
            <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-fluid" id="submitAd" lay-filter="LAY-user-login-submit">登 入</button>
        </div>

    </div>
</div>



<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-109992033-1');
</script>
</body>
<script src="../static/js/jquery-2.1.4.min.js"></script>

<script src="../static/js/common.js"></script>
<script src="../static/js/swiper-4.1.6.min.js"></script>
<script src="../static/js/index_new.js"></script>
<script src="../static/plugins/layui/layui.js" ></script>
<script>



    //随机显示
    function createRandom(){
        var len = $("#js_feedback li").length;
        var a = [];
        for(var i=0;i<len;i++){
            a.push(i);
        }
        var newArr = [];
        for(var i = 0; i< 4; i++){
            var num = Math.floor(Math.random()*a.length);
            newArr.push(a[num]);
            a.splice(num,1);
        }
        return newArr;
    }
    var rand_arr=createRandom();
    for(var i=0; i<4; i++){
        $("#js_feedback").find("li").eq(rand_arr[i]).show();
    }



    layui.use(['form', 'laypage', 'jquery', 'slider','util','element','layer'], function () {
        var form = layui.form;
        var laypage = layui.laypage;
        var $ = layui.jquery;
        var slider = layui.slider;
        var util = layui.util;
        var element = layui.element;
        var layer = layui.layer;

        //用户登录
        $('#login5').click(function () {
                layer.open({
                    type: 1 ,
                    title: false,
                    shade : 0.3,
                    shadeClose : true,
                    content: $('#loginContent'),
                    area : ['600px','500px'],
                    offset: '150px',
                    closeBtn: 0 ,
                    success:function (layero, index) {

                        $('#submit').click(function () {
                            var userInfo = {
                                userLoginName : $('#LAY-user-login-username').val(),
                                userPassword : $('#LAY-user-login-password').val()
                            };
                            $.ajax({
                                url: '${ctx}/user/loginChecking',
                                type: 'post',
                                contentType: 'application/json',
                                data: JSON.stringify(userInfo),
                                success: function (data) {
                                    if (data.code == 404){
                                        layer.msg("账号不存在",{icon:5});
                                        $('#LAY-user-login-username').val("");
                                        $('#LAY-user-login-password').val("");
                                    }
                                    else if (data.code == 400){
                                        layer.msg("账号或密码错误",{icon:5});
                                        $('#LAY-user-login-username').val("");
                                        $('#LAY-user-login-password').val("");
                                    }
                                    else {
                                        layer.msg('登陆成功',{
                                            icon: 6,
                                            time: '1000'
                                        },function () {
                                            layer.close(index);
                                            window.location.reload();
                                        });

                                    }

                                }
                            });
                        });

                    }
                });
            }
        );


        //管理员登录
        $('#AdLogin').click(function () {
                layer.open({
                    type: 1 ,
                    title: false,
                    shade : 0.3,
                    shadeClose : true,
                    content: $('#AdLoginContent'),
                    area : ['600px','500px'],
                    offset: '150px',
                    closeBtn: 0 ,
                    success:function (layero, index) {
                        $('#submitAd').click(function () {
                            var adLoginName = $('#LAY-ad-login-username').val().trim();
                            var adPassword = $('#LAY-ad-login-password').val().trim();
                            var userInfo = {
                                administratorName : adLoginName,
                                administratorPassword :  adPassword
                            };
                            $.ajax({
                                url: '${ctx}/administrator/loginChecking',
                                type: 'post',
                                contentType: 'application/json',
                                data: JSON.stringify(userInfo),
                                success: function (data) {
                                    if (data.code == 404){
                                        layer.msg("账号不存在",{icon:5});
                                        $('#LAY-ad-login-username').val("");
                                        $('#LAY-ad-login-password').val("");
                                    }
                                    else if (data.code == 400){
                                        layer.msg("账号或密码错误",{icon:5});
                                        $('#LAY-ad-login-username').val("");
                                        $('#LAY-ad-login-password').val("");
                                    }
                                    else {
                                        layer.msg('登陆成功',{
                                            icon: 6,
                                            time: '1000'
                                        },function () {
                                            layer.close(index);
                                            window.location.href= '${ctx}/administrator/index/'+ adLoginName;
                                        });

                                    }

                                }
                            });
                        });

                    }
                });
            }
        );

        $('#logout').click(function () {
            $.ajax({
                url:'${ctx}/user/logout',
                type:'post',
                success: function (data) {
                    if (data.code == 200){
                        window.location.reload();
                    }
                }
            })
        });

    });




</script>

</html>