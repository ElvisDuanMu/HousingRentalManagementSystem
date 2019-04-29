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
    <link rel="stylesheet" href="${ctx}/static/css/message.css">
    <link rel="stylesheet" href="${ctx}/static/css/common2.css">
    <link rel="stylesheet" href="${ctx}/static/css/login.css">
    <link rel="stylesheet" href="${ctx}/static/css/admin.css">
    <script>
        var g_conf = {};
    </script>
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
    <link href='${ctx}/static/css/lianjiaim.css' property='stylesheet' rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all">
    <style>
        [v-cloak] {
            display: none;
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
                <li class="header__aside fr pointer typeShowUser" >
                    <c:if test="${sessionScope.Username != null}">
                        <a data-el="login_box" href="${ctx}/user/index/${sessionScope.Username}"> 欢迎你：${sessionScope.Username}</a>
                        <a data-el="logout_btn" href="${ctx}/user/logout" id="logout" >退出</a>
                    </c:if>
                    <c:if test="${sessionScope.Username == null}">
							<span data-el="login_box">
                                <a id="login" class=btn-login" style="margin-right: 5px;">登录</a>/<a class="btn-resgiter" id="register" style="margin-left: 5px;">注册</a>
							</span>
                    </c:if>
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
        <div class="bread__nav w1150" style="margin-bottom: 0px;">
            <p class="bread__nav__wrapper oneline">
                <a>乐租网${provinceName}站</a>&nbsp;&gt;&nbsp;
            <h1>
                <a>${cityName}租房</a>
            </h1>
            </p>
            <input id="provinceCode" type="hidden" value="${provinceCode}">
            <input id="cityCode" type="hidden" value="${cityCode}">
        </div>
        <div style="padding-top: 15px; position: relative;">
            <div class="filter__wrapper w1150">
                <div class="layui-form " style="">
                    <div class="layui-form-item" style=" margin-bottom: 3px;">
                        <label class="layui-form-label" style="text-align: left; width: 50px;">区域</label>
                        <div class="layui-input-inline" style="  width: 1050px;">
                            <input type="radio" lay-filter="district" name="district" value="" title="不限" checked >
                            <c:forEach items="${district}" var="obj">
                                <input type="radio" lay-filter="district" name="district" value="${obj.districtCode}"
                                       title="${obj.districtName}">
                            </c:forEach>
                        </div>
                    </div>
                    <div class="layui-form-item" style=" margin-bottom: 3px;">
                        <label class="layui-form-label" style="text-align: left; width: 50px;">方式</label>
                        <div class="layui-input-inline" style="  width: 1050px;">
                            <input type="radio" lay-filter="leasing" name="leasing" value="" title="不限" checked>
                            <input type="radio" lay-filter="leasing" name="leasing" value="1" title="整租">
                            <input type="radio" lay-filter="leasing" name="leasing" value="2" title="合租">
                        </div>
                    </div>

                    <%--<div class="layui-form-item" style=" margin-bottom: 3px;">--%>
                    <%--<label class="layui-form-label" style="text-align: left; width: 50px;">租金</label>--%>
                    <%--<div class="layui-input-inline" style="  width: 1050px;">--%>
                    <%--<input type="radio" name="housePrice" value="" title="不限" >--%>
                    <%--<input type="radio" name="housePrice" value="1" title="1500以下" >--%>
                    <%--<input type="radio" name="housePrice" value="2" title="1500-2500" >--%>
                    <%--<input type="radio" name="housePrice" value="3" title="2500-3500" checked>--%>
                    <%--<input type="radio" name="housePrice" value="4" title="3500-4500" >--%>
                    <%--<input type="radio" name="housePrice" value="5" title="4500-8000" >--%>
                    <%--<input type="radio" name="housePrice" value="6" title="8000以上" >--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <div class="layui-form-item" style=" margin-bottom: 3px;">
                        <label class="layui-form-label" style="text-align: left; width: 50px;">朝向</label>
                        <div class="layui-input-inline" style="  width: 1050px;">
                            <input type="radio" lay-filter="orientation" name="orientation" value="" title="不限" checked>
                            <c:forEach items="${orientation}" var="obj">
                                <input lay-filter="orientation" type="radio" name="orientation" value="${obj.orientationId}"
                                       title="${obj.orientationName}">
                            </c:forEach>
                        </div>
                    </div>

                    <div class="layui-form-item" style=" margin-bottom: 3px;">
                        <label class="layui-form-label" style="text-align: left; width: 50px;">户型</label>
                        <div class="layui-input-inline" style="  width: 1050px;">
                            <input type="radio" lay-filter="typeRooms" name="typeRooms" value="" title="不限" checked>
                            <input type="radio" lay-filter="typeRooms" name="typeRooms" value="1" title="一室">
                            <input type="radio" lay-filter="typeRooms" name="typeRooms" value="2" title="二室">
                            <input type="radio" lay-filter="typeRooms" name="typeRooms" value="3" title="三室">
                            <input type="radio" lay-filter="typeRooms" name="typeRooms" value="4" title="四室及以上">
                        </div>
                    </div>

                    <div class="layui-form-item" style="margin-top: 8px; margin-bottom: 3px;">
                        <label class="layui-form-label" style="text-align: left; width: 50px;">面积</label>
                        <div id="area" class="layui-input-inline" style="width: 500px;padding-top: 16px;">

                        </div>
                        <div>
                            <div class="layui-input-inline" style="width: 80px; margin-left: 10px;">
                                <input id="area_min" type="text" name="area_min" value="0" autocomplete="off"
                                       class="layui-input" readonly style="text-align: center">
                            </div>
                            <div class="layui-form-mid layui-word-aux">㎡</div>
                            <div class="layui-form-mid">-</div>
                            <div class="layui-input-inline" style="width: 80px;">
                                <input id="area_max" type="text" name="area_max" value="1000" autocomplete="off"
                                       class="layui-input" readonly style="text-align: center">
                            </div>
                            <div class="layui-form-mid layui-word-aux">㎡</div>
                        </div>
                    </div>

                    <div class="layui-form-item" style=" margin-bottom: 3px;">
                        <label class="layui-form-label" style="text-align: left; width: 50px;">租金</label>
                        <div id="price" class="layui-input-inline" style="width: 500px;padding-top: 16px;">

                        </div>
                        <div>
                            <div class="layui-input-inline" style="width: 80px; margin-left: 10px;">
                                <input id="price_min" type="text" name="area_min" value="0" autocomplete="off"
                                       class="layui-input" readonly style="text-align: center">
                            </div>
                            <div class="layui-form-mid layui-word-aux">元</div>
                            <div class="layui-form-mid">-</div>
                            <div class="layui-input-inline" style="width: 80px;">
                                <input id="price_max" type="text" name="area_max" value="100000" autocomplete="off"
                                       class="layui-input" readonly style="text-align: center">
                            </div>
                            <div class="layui-form-mid layui-word-aux">元</div>
                        </div>
                    </div>


                    <div class="layui-form-item" style=" margin-bottom: 3px;">
                        <label class="layui-form-label" style="text-align: left; width: 50px;">特色</label>
                        <div class="layui-input-inline" style="  width: 1050px; height: 34px;">
                            <input type="checkbox" lay-filter="teSeId"  name="teSeId" value="1" title="精装修" lay-skin="primary">
                            <input type="checkbox" lay-filter="teSeId" name="teSeId" value="2" title="押一付一" lay-skin="primary">
                            <input type="checkbox" lay-filter="teSeId" name="teSeId" value="3" title="随时看房" lay-skin="primary">
                            <input type="checkbox" lay-filter="teSeId" name="teSeId" value="4" title="男女不限" lay-skin="primary">
                            <input type="checkbox" lay-filter="teSeId" name="teSeId" value="5" title="有电梯" lay-skin="primary">
                            <input type="checkbox" lay-filter="teSeId" name="teSeId" value="6" title="有停车位" lay-skin="primary">
                        </div>
                    </div>
                    <%--<div class="layui-form-item">--%>
                        <%--<div class="layui-input-block">--%>
                            <%--<button style="width: 200px; height: 40px;" class="layui-btn" id="submitBtn" value="0"--%>
                                    <%--lay-filter="formDemo" @click="submit">提交--%>
                            <%--</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>


                </div>
                <hr class="layui-bg-green" style="margin-bottom: 30px;">
            </div>
        </div>

        <div class="content w1150" id="content">

            <div class="content__article">
                <p class="content__title">
                    已为您找到 <span class="content__title--hl" id="totalCount"> </span> 套房源
                </p>
                <%-- 选项卡 --%>
                <div class="layui-tab layui-tab-brief" lay-filter="way">
                    <input type="hidden" id="tabIndex" value="0">
                    <input type="hidden" id="tabValue" value="0">
                    <ul class="layui-tab-title" >
                        <li class="layui-this">综合排序</li>
                        <li>最新上架</li>
                        <li id="wayPrice" value="0">价格</li>
                        <li id="wayArea" value="0">面积</li>
                    </ul>

                    <%--房源列表--%>
                    <div class="content__list" id="list"></div>

                    <%--分页器--%>
                    <div id="listPage" style="margin-top: 30px; margin-left: 200px;"> </div>

                </div>
            </div>





            <div class="content__aside">
                <div class="download">
                    <div class="title">下载链家APP</div>
                    <div class="qr-code"><img width="94" height="94" src=""
                                              alt="下载贝壳APP">
                        <div class="text">
                            <p>扫描上方二维码</p>
                            <p>随时查看新房源</p>
                            <p class="get-more">
                                <a href="#">了解更多
                                    <img width="9" height="9"
                                         src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgBAMAAACBVGfHAAAAGFBMVEUAAACcn6Gfn5+an5+bnqCbnqGfn5+cn6EV6DbuAAAAB3RSTlMA0BAw8LAgvf5k9AAAAEdJREFUKM9jIBOkBqMJhBcqoAmUC6EKmJSjKWEWR1eiiK6ECZsSA3QlzuhKSihRghDA0EJ/BWIoCgzh4YMIZALRYBrMQAkAAF5bGMBkrwzqAAAAAElFTkSuQmCC">
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
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
    layui.use(['form', 'laypage', 'jquery', 'slider','util','element','layer'], function () {
        var form = layui.form;
        var laypage = layui.laypage;
        var $ = layui.jquery;
        var slider = layui.slider;
        var util = layui.util;
        var element = layui.element;
        var layer = layui.layer;
        var limit = 10;
        var total;


        window.onload = function () {
            loadData(1);
        };

        //监听地区radio
        form.on('radio(district)', function(data){
            loadData(1);
        });

        //监听方式radio
        form.on('radio(leasing)', function(data){
            loadData(1);
        });

        //监听朝向radio
        form.on('radio(orientation)', function(data){
            loadData(1);
        });

        //监听户型radio
        form.on('radio(typeRooms)', function(data){
            loadData(1);
        });

        //监听特色checkbox
        form.on('checkbox(teSeId)', function(data){
            loadData(1);
        });

        //监听价格val
        var i = 0;
        //监听面积val
        var j = 0;
        //监听选项卡
        element.on('tab(way)', function(data){
            $('#tabIndex').val(data.index);
            //价格动态改变
            if (data.index != 2){
                $('#wayPrice').html('价格');
                $('#wayPrice').val(0);
                i = 0;
            }
            if (data.index == 2) {
                i++;
                if(i == 1){
                    $('#wayPrice').html('价格升序');
                    $('#wayPrice').val(1);
                    $('#tabValue').val(1);
                }
                if (i == 2){
                    $('#wayPrice').html('价格降序');
                    $('#wayPrice').val(2);
                    $('#tabValue').val(2);
                    i = 0;
                }
            }

            //面积动态改变
            if (data.index != 3){
                $('#wayArea').html('面积');
                $('#wayArea').val(0);
                j = 0;
            }
            if (data.index == 3) {
                j++;
                if (j == 1){
                    $('#wayArea').html('面积升序');
                    $('#wayArea').val(1);
                    $('#tabValue').val(1);
                }
                if (j == 2){
                    $('#wayArea').html('面积降序');
                    $('#wayArea').val(2);
                    $('#tabValue').val(2);
                    j = 0;
                }
            }
            loadData(1);

        });



        //查询房源数据
        var loadData = function(pageIndex){
            var teSe = [];
            $("input[name='teSeId']:checked").each(function () {
                teSe.push($(this).val());
            });
            //form.render();
            var obj = {
                provinceCode: $('#provinceCode').val(),
                cityCode: $('#cityCode').val(),
                districtCode: $("input[name='district']:checked").val(),
                leasing: $("input[name='leasing']:checked").val(),
                //housePrice : $("input[name='housePrice']:checked").val(),
                orientation: $("input[name='orientation']:checked").val(),
                typeRooms: $("input[name='typeRooms']:checked").val(),
                housePriceMin: $('#price_min').val(),
                housePriceMax: $('#price_max').val(),
                houseAreaMin: $('#area_min').val(),
                houseAreaMax: $('#area_max').val(),
                // houseArea : $("input[name='houseArea']:checked").val(),
                teSe: teSe,
                page: pageIndex,
                limit: limit,
                tabIndex: $('#tabIndex').val(),
                tabValue: $('#tabValue').val()
            };
            $.ajax({
                url: '${ctx}/house/userHouseInfo',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(obj),
                success: function (data) {
                    var html='';
                    $('#count').val(data[0]);
                    total = data[0];
                    $('#totalCount').html(data[0]);
                    if (data[0] == 0)
                    {
                        html += "<h1>暂无数据</h1>";
                        $('#list').empty().append(html);

                        $('#listPage').hide();
                    }
                    else {
                        for(var i = 0;i < data[1].length; i++){
                            html += '<div class="content__list--item">';
                            html += '   <a class="content__list--item--aside" target="_blank" href="#"><img  src="${ctx}'+data[1][i].houseImg.imgRelPath+'" class=" lazyloaded" data-expand="400"></a>';
                            html += '   <div class="content__list--item--main">';
                            html += '       <p class="content__list--item--title twoline">';
                            html += '           <a target="_blank" href="${ctx}/house/houseDetail/'+ data[1][i].houseId +'">';
                            html += '               '+data[1][i].houseName+'</a>';
                            html += '       </p>';
                            html += '       <p class="content__list--item--des">';
                            html += '           <span>'+data[1][i].district.districtName+'</span> - <span >'+data[1][i].addressCommunity+'</span >';
                            html += '           <i>/</i>'+data[1][i].houseArea+'㎡<i>/</i>'+ data[1][i].orientation.orientationName +' <i>/</i>'+ data[1][i].typeRooms+'室 '+data[1][i].typeHalls+'厅 '+data[1][i].typeBathrooms +'卫<span class="hide">';
                            html += '       </p>';
                            html += '       <p class="content__list--item--brand oneline"><img src="${ctx}/static/img/shijian.png" > '+ util.timeAgo(data[1][i].createDate, true)+'</p>';
                            html += '       <p class="content__list--item--bottom oneline">';
                            if(data[1][i].renovation.renovationName == "精装修")
                            {
                                html += '           <i class="content__item__tag">精装</i>';
                            }
                            if(data[1][i].houseElevator == "有电梯")
                            {
                                html += '           <i class="content__item__tag">有电梯</i>';
                            }
                            if(data[1][i].inspection.inspectionName == "随时看房")
                            {
                                html += '           <i class="content__item__tag">随时看房</i>';
                            }
                            if(data[1][i].rentType.rentTypeName == "押一付一")
                            {
                                html += '           <i class="content__item__tag">押一付一</i>';
                            }
                            if(data[1][i].sex == "仅限男生")
                            {
                                html += '           <i class="content__item__tag">仅限男生</i>';
                            }
                            if(data[1][i].sex == "仅限女生")
                            {
                                html += '           <i class="content__item__tag">仅限女生</i>';
                            }
                            if(data[1][i].sex == "男女不限")
                            {
                                html += '           <i class="content__item__tag">男女不限</i>';
                            }
                            html += '       </p>';
                            html += '       <span class="content__list--item-price"><em>'+ data[1][i].housePrice +'</em> 元/月</span>'
                            html += '   </div>';
                            html += '</div>';

                        }
                        $('#list').empty().append(html);
                        $('#listPage').show();
                        laypage.render({
                            elem: 'listPage',
                            layout: ['count', 'prev', 'page', 'next', 'skip'],
                            count: total,
                            limit: 10,
                            curr: pageIndex,
                            jump: function (obj,first) {
                                if(!first){
                                    loadData(obj.curr);
                                }
                            }
                        });
                    }
                }
            });

        };




        //面积滑动
        slider.render({
            elem: '#area',  //绑定元素
            min: 0,
            max: 1000,
            range: true,
            value: [0, 1000],
            step: 5,
            tips: true,
            setTips: function (value) { //自定义提示文本
                return value + '㎡';
            },
            change: function (value) {
                $('#area_min').val(value[0]);
                $('#area_max').val(value[1]);
                loadData(1);
            }

        });

        //价格滑动
        slider.render({
            elem: '#price',  //绑定元素
            min: 0,
            max: 100000,
            range: true,
            value: [0, 100000],
            step: 500,
            tips: true,
            setTips: function (value) { //自定义提示文本
                return value + '元';
            },
            change: function (value) {

                $('#price_min').val(value[0]);
                $('#price_max').val(value[1]);
                loadData(1);
            }

        });

        //立即租赁按钮事件
        $('#login').click(function () {
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

        //退出事件
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
