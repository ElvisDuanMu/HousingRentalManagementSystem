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

<div class="wrapper">


    <div>
        <div class="header ">
            <ul class="header__wrapper w1150 clear typeUserInfo" id="top">
                <li class="header__item fl "><a href="//bj.lianjia.com" target="_blank">首页</a></li>
                <li class="header__item fl "><a href="//bj.lianjia.com/ershoufang/" target="_blank">二手房</a></li>
                <li class="header__item fl "><a href="//bj.fang.lianjia.com/loupan/" target="_blank">新房</a></li>
                <li class="header__item fl cur"><a href="/zufang/" target="_blank">租房</a></li>
                <li class="header__item fl "><a href="//us.lianjia.com" target="_blank">海外</a></li>
                <li class="header__item fl "><a href="//bj.lianjia.com/xiaoqu/" target="_blank">小区</a></li>
                <li class="header__item fl "><a href="//bj.lianjia.com/jingjiren/" target="_blank">经纪人</a></li>
                <li class="header__item fl "><a href="//bj.lianjia.com/wenda/" target="_blank">指南</a></li>
                <li class="header__item fl "><a href="//bj.lianjia.com/fangjia/" target="_blank">房价</a></li>
                <li class="header__item fl "><a href="//bj.lianjia.com/tool.html" target="_blank">工具</a></li>
                <li class="header__item fl "><a href="//news.lianjia.com/bj/jingyan/" target="_blank">经验</a></li>
                <li class="header__item fl "><a href="#" target="_blank">发布房源</a></li>
                <li class="header__item fl "><a href="#" target="_blank">企业汇</a></li>
                <li class="header__aside fr pointer typeShowUser" data-el="login" data-event_id="10794"
                    data-event_action="target=login">
							<span data-el="login_box">
								<span data-el="btn_login" data-id="dialog_tel" class="btn-login">登录</span>/<span
                                    class="btn-resgiter" data-el="register"
                                    data-id="dialog_reg">注册</span>
							</span>
                </li>
                <li class="top__aside fr hide" data-el="user_box">
                    <a href="" data-el="userName"></a>
                    <a data-el="logout_btn">退出</a>
                </li>

            </ul>

        </div>
        <div class="search__area">
            <div class="beike__nav">
                <a class="beike__nav--tab" href="#"></a>


                <ul class="beike__nav--tab">
                    <li>
                        <a class="cur" href="">首页</a>
                    </li>

                    <li>
                        <a class="" href="#">整租</a>
                    </li>

                    <li><a class="" href="#">合租</a></li>
                    <li class="beike__nav--code">
                        下载APP
                        <div class="nav-list beike__nav--qrcode">
                            <img src="https://ajax.api.lianjia.com/qr/getDownloadQr?location=nav&amp;ljweb_channel_key=zufang_search"
                                 alt="下载贝壳APP"
                                 class="QRcode-img">
                        </div>
                    </li>

                </ul>
            </div>

        </div>
    </div>
    <div class="content clear w1150">
        <!-- 房源标题 -->
        <p class="content__title">${houseInfo.houseName}</p>
        <!-- 房源副标题 -->
        <div class="content__subtitle">
            房源上架时间 ${houseInfo.createDateString}         <i class="house_code">房源编号：${houseInfo.houseId}</i>
        </div>
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
                    <button class="layui-btn layui-btn-radius " style="margin-top: 15px; width: 288px; height: 45px; font-size: large">立即租赁</button>
               </li>
            </ul>
        </div>
    </div>

    <div class="footer">
        <div class="footer__wrapper w1150">

            <div class="footer__top">
                <ul class="footer__light">
                    <li><a href="">网站地图</a></li>
                </ul>
                <a class="footer__aside" href="tel:10109666">客服电话<span>10109666</span></a>
            </div>

            <div class="footer__middle">
                <ul data-el="parentList">
                    <li><a class="cur" data-index="0">租房城市</a></li>

                </ul>
                <ul data-el="childrenList" style="display:block">
                    <li><a href="https://qd.lianjia.com/zufang/">青岛租房</a></li>
                    <li><a href="https://nn.lianjia.com/zufang/">南宁租房</a></li>
                    <li><a href="https://gz.lianjia.com/zufang/">广州租房</a></li>
                    <li><a href="https://kf.lianjia.com/zufang/">开封租房</a></li>
                    <li><a href="https://taizhou.lianjia.com/zufang/">台州租房</a></li>
                    <li><a href="https://tj.lianjia.com/zufang/">天津租房</a></li>
                    <li><a href="https://zs.lianjia.com/zufang/">中山租房</a></li>
                    <li><a href="https://wuhu.lianjia.com/zufang/">芜湖租房</a></li>
                    <li><a href="https://aq.lianjia.com/zufang/">安庆租房</a></li>
                    <li><a href="https://yy.lianjia.com/zufang/">岳阳租房</a></li>
                    <li><a href="https://cd.lianjia.com/zufang/">成都租房</a></li>

                </ul>


            </div>

            <div class="footer__bottom">
                <p>链家网（北京）科技有限公司 | 网络经营许可证 京ICP备16057509号-2 | &copy; Copyright&copy;2010-2018 链家网Lianjia.com版权所有</p>
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010802024019"
                   style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img
                        style="margin-right: 5px;"
                        src="https://s1.ljcdn.com/matrix_lianjia_pc/dist/pc/src/resource/img/beian.png?_v=20190411190841403">京公网安备
                    11010802024019号</a>
            </div>

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






    });
</script>


</html>
