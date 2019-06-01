<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta http-equiv="Content-language" content="zh-CN"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="applicable-device" content="pc">
    <meta http-equiv="Cache-Control" content="no-transform "/>
    <title>${cityName}租房信息_${cityName}出租房源|房屋出租价格</title>
    <link rel="stylesheet" href="${ctx}/static/css/admin.css">
    <link rel="stylesheet" href="${ctx}/static/css/login.css">
    <link rel="stylesheet" href="${ctx}/static/css/common2.css">
    <script>
        var g_conf = {};
    </script>
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
    <link href='${ctx}/static/css/lianjiaim.css' property='stylesheet' rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/css/message.css">
    <style>
        .content__article__info2  img{
            display: block;
            width: 32px;
            height: 32px;
            margin: 0 auto 14px;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        .content__aside__list .content__article__table img{
            display: block;
            width: 38px;
            height: 38px;
            margin: 0 auto 4px;
            background-position: left top;
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }
    </style>
    <script type="text/javascript" src="${ctx}/static/js/jquery-2.1.4.min.js"></script>
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <script src="${ctx}/static/js/vue.js"></script>

</head>

<body>


<input type="hidden" id="count">
<input type="hidden" id="username" value="${sessionScope.Username}">

<div class="wrapper">


    <div>
        <div class="header ">
            <ul class="header__wrapper w1150 clear typeUserInfo" id="top">
                <li class="header__item fl "><a href="${ctx}/administrator/toIndex" target="_blank">首页</a></li>
                <li class="header__item fl "><a href="${ctx}/user/210000/210200/queryHouse" target="_blank">租房</a></li>
                <li class="header__aside fr pointer typeShowUser" >
                        <c:if test="${sessionScope.Username != null}">
                            <a data-el="login_box" href="${ctx}/user/index/${sessionScope.Username}"> 欢迎你：${sessionScope.Username}</a>
                            <a data-el="logout_btn" href="${ctx}/user/logout" id="logout" >退出</a>
                        </c:if>
                        <c:if test="${sessionScope.Username == null}">
							<span data-el="login_box">
                                <a id="login" class=btn-login" style="margin-right: 5px;" >登录</a>/<a class="btn-resgiter" id="register" style="margin-left: 5px;">注册</a>
							</span>
                        </c:if>
                </li>

            </ul>

        </div>

    </div>
    <div class="content clear w1150">
        <!-- 房源标题 -->
        <p class="content__title">${houseInfo.houseName}</p>
        <!-- 房源副标题 -->
        <div class="content__subtitle">
            房源上架时间 ${houseInfo.createDateString}         <i class="house_code">发布人：${houseInfo.createName}</i>
        </div>
        <%--存一下发布人--%>
        <input type="hidden" id="createName" value="${houseInfo.createName}">
        <%--存一下编号--%>
        <input type="hidden" id="houseId" value="${houseInfo.houseId}">
        <!-- 房源左侧内容 -->
        <div class="content__article fl">

            <!-- 房源图片轮播图 -->
            <div class="content__article__slide" style="visibility: visible;">
                <div class="layui-carousel" id="imgLunBo">
                    <div carousel-item>
                        <c:forEach items="${houseImg}" var="obj">
                            <div><img src="${ctx}${obj.imgRelPath}" style="width: 100%; height: 100%;"  ></div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- 房源基本信息 -->
            <div class="content__article__info">
                <h3 id="info">房屋信息</h3>
                <ul>
                    <li class="fl oneline">基本信息</li>
                    <li class="fl oneline">小区：${houseInfo.addressCommunity}</li>
                    <li class="fl oneline">地址：${houseInfo.detailAddress}</li>
                    <li class="fl oneline">&nbsp;</li>
                    <li class="fl oneline">装修：${houseInfo.renovation.renovationName}</li>
                    <li class="fl oneline">最早入住时间：${houseInfo.houseCheckTimeString}</li>
                    <li class="fl oneline">&nbsp;</li>
                    <li class="fl oneline">车位：${houseInfo.housePark}</li>
                    <li class="fl oneline">看房：${houseInfo.inspection.inspectionName}</li>
                    <li class="fl oneline">&nbsp;</li>
                    <li class="fl oneline">楼层：第${houseInfo.floor}层 / 共${houseInfo.totalFloor}层</li>
                    <li class="fl oneline">电梯：${houseInfo.houseElevator}</li>
                    <li class="fl oneline">&nbsp;</li>
                    <li class="fl oneline">宠物：${houseInfo.pet}</li>
                    <li class="fl oneline">租客性别：${houseInfo.sex}</li>
                    <li class="fl oneline">&nbsp;</li>
                    <li class="fl oneline">租金方式：${houseInfo.rentType.rentTypeName}</li>
                    <li class="fl oneline">宜住人数：${houseInfo.housePeople}</li>
                    <li class="fl oneline">&nbsp;</li>
                </ul>
            </div>

            <!-- 房源分割标识线，js里用到，勿删 -->
            <div class="info__line line"></div>

            <!-- 配套设施列表 -->
            <ul class="content__article__info2">
                <li class="fl oneline">配套设施</li>
                <c:forEach items="${facility}" var="obj">
                    <li class="fl oneline  "><img src="${obj.facilityImgRelPath}" >${obj.facilityName}</li>
                </c:forEach>

            </ul>

            <!-- 房源描述数据 -->

            <!-- 描述展示 -->
            <div class="content__article__info3" id="desc">
                <h3>房源描述</h3>
                <ul>
                    <p data-el="houseComment"  class="" style="max-height: none; font-size: large">
                        【租金已包含内容】  ${houseInfo.rentContentString}<br>
                        【房源描述】${houseInfo.houseInfo}<br>

                    </p>

                </ul>
            </div>

        </div>

        <!-- 右侧黄金展位 -->
        <div class="content__aside fr" id="aside" style="height: 500px; margin-top: 0;">

            <!-- 租金及支付方式 -->
            <p class="content__aside--title"><span>${houseInfo.housePrice}</span>元/月（${houseInfo.rentType.rentTypeName}）</p>

            <!-- 房源标签列表 -->
            <p class="content__aside--tags">
                <i class="content__item__tag--is_subway_house" data-class="is_subway_house">${houseInfo.renovation.renovationName}</i>
                <i class="content__item__tag--decoration" data-class="decoration">${houseInfo.sex}</i>
                <i class="content__item__tag--central_heating" data-class="central_heating">${houseInfo.housePark}</i>
                <i class="content__item__tag--is_key" data-class="is_key">${houseInfo.inspection.inspectionName}</i>
            </p>

            <!-- 房源户型、朝向、面积、租赁方式 -->
            <ul class="content__aside__list">
                <p class="content__article__table">
                    <span><img src="${ctx}/static/img/house.png">${houseInfo.leasing.lesingName}</span>
                    <span><img src="${ctx}/static/img/typ.png">${houseInfo.typeRooms}室${houseInfo.typeHalls}厅${houseInfo.typeBathrooms}卫</span>
                    <span><img src="${ctx}/static/img/area.png"> ${houseInfo.houseArea}㎡</span>
                    <span><img src="${ctx}/static/img/orient.png">朝${houseInfo.orientation.orientationName}</span>
                </p>
            </ul>
            <!-- 经纪人信息，目前只展示一条信息 -->
            <ul class="content__aside__list" >
                <li>
                    <div class="content__aside__list--title oneline">
                        <span class="contact_name"  >${houseInfo.contacts}</span>
                    </div>
                    <p class="content__aside__list--subtitle oneline" style="padding-top: 10px;">
                        乐租      ${houseInfo.identity.identityName}
                    </p>
                    <div class="content__aside__list--title oneline" >
                        <span class="contact_name"  style="max-width: 288px;" >电话：${houseInfo.telephone}</span>
                    </div>
                    <button class="layui-btn layui-btn-radius " id="leasingBtn" style="margin-top: 15px; width: 288px; height: 45px; font-size: large">立即租赁</button>
               </li>
            </ul>
        </div>
    </div>

    <div class="footer">
        <div class="footer__wrapper w1150">

            <div class="footer__top">
                <ul class="footer__light">
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">隐私声明</a></li>
                </ul>
                <a class="footer__aside" href="tel:10109666">客服电话<span>123123123</span></a>
            </div>

            <div class="footer__middle">
                <ul data-el="parentList">
                    <li><a class="cur" data-index="0">租房城市</a></li>

                </ul>
                <ul data-el="childrenList" style="display:block">
                    <li><a href="${ctx}/user/110000/110100/queryHouse">北京租房</a></li>
                    <li><a href="${ctx}/user/310000/310100/queryHouse">上海租房</a></li>


                </ul>


            </div>

            <div class="footer__bottom">
                <p>租房（大连） | 网络经营许可证 00000001号-1 | &copy; Copyright&copy;2018-2019 租房版权所有</p>
                <a target="_blank" href="#"
                   style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img
                        style="margin-right: 5px;"
                        src="${ctx}/static/img/beian.png">公网安备 1000000001号</a>
            </div>

        </div>
    </div>
</div>


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








</body>






<script>
    layui.use(['form', 'laypage', 'jquery', 'slider','util','element','carousel','layer'], function () {
        var form = layui.form;
        var laypage = layui.laypage;
        var $ = layui.jquery;
        var slider = layui.slider;
        var util = layui.util;
        var element = layui.element;
        var carousel = layui.carousel;
        var layer = layui.layer;


        //图片轮播
        carousel.render({
            elem: '#imgLunBo'
            ,width: '780px'
            ,height: '500px'
            ,autoplay:false

        });


        $('#login').click(function () {
                login();
            }
        );

        function login() {
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


        var username = $('#username').val();
        var createName = $('#createName').val();
        var houseId = $('#houseId').val();
        console.log(username);
        $('#leasingBtn').click(function () {
            if (username != null && username!=''){
                if (username == createName){
                    layer.msg("您不能租赁自己发布的房屋");
                }else {
                    window.location.href = '${ctx}/user/toHouseInfo/'+ username +"/" + createName + "/" +houseId ;
                }

            }
            else {
                login();
            }
        });





    });
</script>


</html>
