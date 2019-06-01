
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>


    <title>用户中心_房源管理</title>
    <meta name="description" content="用户活动中心提供买房卖房用户活动信息等" />
    <meta name="keywords" content="买房卖房用户活动中心，用户中心" />

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
        .spa{
            height: 25px;
            line-height: 20px;
            width: 204px;
            display: inline-block;
            float: left;
            font-size: 15px;
            color: #BD362F;
            text-indent: 10px;
            margin-top: 5px;
            color: #00CD00;
        }
        .layui-form-item {
            margin-bottom: 0;
            clear: both;

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
    <div class="main-left fl" >
        <div style="height: 80px; width: 80px; margin: 0 auto;" >
            <img src="${ctx}${sessionScope.userImg}" style="width: 80px ;height: 80px;">
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
            <li><a href="${ctx}/user/breakdown/${sessionScope.Username}">报障信息</a></li>
            <li><a href="${ctx}/user/message/${sessionScope.Username}">编辑资料</a></li>
        </ul>
    </div>
    <div class="main-right fr" style="min-height: 600px;">
        <div id="allList">
            <div class="title">您的房源信息</div>
            <%--选项卡--%>
            <div class="layui-tab layui-tab-brief" lay-filter="wayInfo">
                <ul class="layui-tab-title">
                    <li class="layui-this">待审核的房源</li>
                    <li>未通过的房源</li>
                    <li>待出租的房源</li>
                    <li>已出租的房源</li>
                    <li>租到的房源</li>
                    <li>结束的房源</li>
                    <li>退租的房源</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <%--待审核的房源--%>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="checkHouseListInfo" lay-filter="checkHouseListInfo"></table>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <%--待修改的房源--%>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="updateHouseListInfo" lay-filter="updateHouseListInfo"></table>
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
                    <div class="layui-tab-item">
                        <%--已退租的房源--%>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="breakdownHouseListInfo" lay-filter="breakdownHouseListInfo"></table>
                        </div>
                    </div>
                </div>



            </div>

        </div>
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


<%--弹出房源详细信息--%>
<div class="layui-form" id="popDetailMsg" style="display: none; margin: 70px  50px;">
    <form action="${ctx}/house/updateHouseInfo">
    <input type="hidden" id="houseId" name="houseId">
    <h2>类别</h2>
    <hr class="layui-bg-green" style="margin-bottom: 20px;">
    <div class="layui-form-item">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;出租方式
        </label>
        <div class="layui-input-inline" style="margin-left: 20px; width: 400px;">
            <input type="radio" name="leasingId" value="1" title="整租" >
            <input type="radio" name="leasingId" value="2" title="单间出租（合租）" >
        </div>
    </div>
    <h2 style="margin-top: 30px;">基础信息</h2>
    <hr class="layui-bg-green" style="margin-bottom: 30px;">
    <div class="layui-form-item" >
        <label class="layui-form-label">省/直辖市</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="province" readonly  autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">市</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="city"  readonly autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">区</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="district"  readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <span class="spa spas1" id="spas1" style="margin-left: 135px; width: 100px;"></span>
    <span class="spa spas2" id="spas2" style="margin-left: 210px; width: 100px;"></span>
    <span class="spa spas3" id="spas3" style="margin-left: 220px; width: 100px;"></span>
    <div class="layui-form-item" style="margin-top: 30px; height: 40px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;详细地址</label>
        <div class="layui-input-inline" style="margin-left: 20px;">
            <input type="text" name="detailAddress" id="detailAddress" required style="width: 500px;" lay-verify="required" placeholder="请输入详细地址（街道地址）" autocomplete="off" class="layui-input">
        </div>
    </div>
    <span class="spa spa1" id="spa1" style="margin-left: 125px; width: 400px;" >&#10004;</span>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;小区名称</label>
        <div class="layui-input-inline" style="margin-left: 20px;">
            <input type="text" name="addressCommunity" id="addressCommunity" required style="width: 500px;" lay-verify="required" placeholder="请输入小区名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <span class="spa spa2" id="spa2" style="margin-left: 125px; width: 400px;">&#10004;</span>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房屋位置</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text" name="addressBuilding" id="addressBuilding" required  lay-verify="required"  autocomplete="off" class="layui-input" align="center" style="text-align: center;"
                    oninput="value=value.replace(/[^\d]/g,'')" >
        </div>
        <div class="layui-form-mid layui-word-aux">栋</div>
        <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
            <input  type="text" name="addressUnit" id="addressUnit" required  lay-verify="required"  autocomplete="off" class="layui-input" align="center"
                    oninput="value=value.replace(/[^\d]/g,'')" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">单元</div>
    </div>
    <span class="spa spa3" id="spa3" style="margin-left: 125px; width: 100px;">&#10004;</span>
    <span class="spa spa4" id="spa4" style="margin-left: 80px; width: 100px;">&#10004;</span>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房屋规格</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text" name="typeRooms" id="typeRooms" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">室</div>
        <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
            <input  type="text" name="typeHalls" id="typeHalls" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">厅</div>
        <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
            <input  type="text" name="typeBathrooms" id="typeBathrooms" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">卫</div>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text" name="houseArea" id="houseArea" required  lay-verify="required" oninput="num(this)" autocomplete="off" class="layui-input" style="text-align: center;" placeholder="">
        </div>
        <div class="layui-form-mid layui-word-aux">㎡</div>
    </div>
    <span class="spa spa5" id="spa5" style="margin-left: 125px; width: 100px;">&#10004;</span>
    <span class="spa spa6" id="spa6" style="margin-left: 80px; width: 100px;">&#10004;</span>
    <span class="spa spa7" id="spa7" style="margin-left: 80px; width: 100px;">&#10004;</span>
    <span class="spa spa8" id="spa8" style="margin-left: 90px; width: 100px;">&#10004;</span>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;楼&emsp;&emsp;层</label>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">第</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text" name="floor" id="floor" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux" >层</div>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text" name="totalFloor" id="totalFloor" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux" >层</div>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">门牌号</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text" name="addressRoom" id="addressRoom" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
    </div>
    <span class="spa spa9" id="spa9" style="margin-left: 145px; width: 100px;">&#10004;</span>
    <span class="spa spa10" id="spa10" style="margin-left: 100px; width: 100px;">&#10004;</span>
    <span class="spa spa11" id="spa11" style="margin-left: 125px; width: 100px;">&#10004;</span>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;朝向装修</label>
        <div class="layui-input-inline" style=" width: 150px; margin-left: 20px;">
            <select name="orientationId" id="orientation" lay-verify="required">
                <c:forEach items="${orientation}" var="obj">
                    <option value="${obj.orientationId}" >${obj.orientationName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="layui-input-inline" style=" width: 150px; margin-left: 10px;">
            <select name="renovationId" id="renovation" lay-verify="required">
                <c:forEach items="${renovation}" var="obj">
                    <option value="${obj.renovationId}" >${obj.renovationName}</option>
                </c:forEach>
            </select>
        </div>
    </div>


    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;设&emsp;&emsp;施</label>
        <label class="layui-form-label" style="padding-left: 0px;">电梯配备</label>
        <div class="layui-input-inline" style=" width: 150px;">
            <select name="houseElevator" lay-verify="required">
                <option value="有电梯">有电梯</option>
                <option value="无电梯">无电梯</option>
            </select>
        </div>
        <label class="layui-form-label" >车位配备</label>
        <div class="layui-input-inline" style=" width: 150px;">
            <select name="housePark" lay-verify="required">
                <option value="有车位">有车位</option>
                <option value="无车位" selected>无车位</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;租&emsp;&emsp;金</label>
        <div class="layui-input-inline" style="width: 150px; margin-left: 20px;">
            <input  type="text" name="housePrice" id="housePrice" required oninput="num(this);" lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;" placeholder="">
        </div>
        <div class="layui-form-mid layui-word-aux">元/月</div>
        <div class="layui-input-inline" style=" width: 150px;">
            <select name="houseRentTypeId" id="houseRentType" lay-verify="required">
                <c:forEach items="${rentType}" var="obj">
                    <option value="${obj.rentTypeId}" >${obj.rentTypeName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <span class="spa spa12" id="spa12" style="margin-left: 125px; width: 100px;">&#10004;</span>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">租金已包含费用</label>
        <div class="layui-input-inline" style="margin-left: 20px; margin-top:10px; width: 800px; height: 58px;">
            <c:forEach items="${rentContent}" var="obj">
                <input type="checkbox" name="contentId"  value="${obj.contentId}" title="${obj.contentName}" lay-skin="primary">
            </c:forEach>
        </div>
    </div>
    <h2 style="margin-top: 30px;">详细信息</h2>
    <hr class="layui-bg-green" style="margin-bottom: 20px;">
    <div class="layui-form-item">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;看房时间
        </label>
        <div class="layui-input-inline" style="margin-left: 20px; width: 400px;">
            <input type="radio" style="margin-left: 20px;" name="inspectionId" value="1" title="随时看房" checked>
            <input type="radio" name="inspectionId" value="2" title="仅工作日" >
            <input type="radio" name="inspectionId" value="3" title="仅周末" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;最早入住时间
        </label>
        <div class="layui-input-inline" style="margin-left: 20px; margin-top: 10px;">
            <input type="text" class="layui-input" id="houseCheckTimeString" name="houseCheckTimeString" placeholder="yyyy-MM-dd" readonly>
        </div>
    </div>
    <span class="spa spat1" id="spat1" style="margin-left: 125px; width: 100px;">&#10004;</span>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            宜住人数
        </label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text" name="housePeople" id="housePeople" required oninput="value=value.replace(/[^\d]/g,'')" lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">人</div>
    </div>
    <span class="spa spa13" id="spa13" style="margin-left: 125px; width: 100px;">&#10004;</span>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;标&emsp;&emsp;题
        </label>
        <div class="layui-input-inline" style="width: 600px; margin-left: 20px;">
            <input  type="text" name="houseName" required id="houseName"  placeholder="请填写标题" lay-verify="required"  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <span class="spa spa14" id="spa14" style="margin-left: 125px; width: 800px;">&#10004;</span>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            禁养宠物
        </label>
        <div class="layui-input-inline" style="margin-left: 20px; width: 400px;">
            <input type="radio" name="pet" value="禁止" title="禁止" >
            <input type="radio" name="pet" value="允许" title="允许" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;租客性别
        </label>
        <div class="layui-input-inline" style="margin-left: 20px; width: 400px;">
            <input type="radio" name="sex" value="男女不限" title="男女不限" >
            <input type="radio" name="sex" value="仅限男生" title="仅限男生" >
            <input type="radio" name="sex" value="仅限女生" title="仅限女生" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label" >&nbsp;&nbsp;&nbsp;房屋配置</label>
        <div class="layui-input-inline" style="margin-left: 20px;  width: 800px; height: 30px;">
            <c:forEach items="${facility}" var="obj">
                <input type="checkbox" name="facilityId" lay-filter="facilityId" value="${obj.facilityId}" title="${obj.facilityName}" lay-skin="primary">
            </c:forEach>
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px; height: 180px;">
        <label class="layui-form-label" >
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房源描述</label>
        <div class="layui-input-inline" style="padding-left: 20px; width: 600px; height: 180px;">
            <%--/<textarea id="houseInfo" style="display: none;"></textarea>--%>
            <textarea name="houseInfo" required style="margin-top: 10px; height: 160px;" id="houseInfo" lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
        </div>
    </div>
    <span class="spa spa15" id="spa15" style="margin-left: 125px; width: 800px;">&#10004;</span>

    <h2 style="margin-top: 30px;">其他信息</h2>
    <hr class="layui-bg-green" style="margin-bottom: 20px;">
    <div class="layui-form-item" style="margin-top: 30px; height: 38px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;&emsp;联系人</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text" name="contacts" required id="contacts" lay-verify="required"   lay-verify="required" autocomplete="off" class="layui-input" >
        </div>
    </div>
    <span class="spa spa16" id="spa16" style="margin-left: 125px; width: 800px;">&#10004;</span>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;身份选择</label>
        <div class="layui-input-inline" style=" width: 150px; margin-left: 20px;">
            <select name="identityId" lay-verify="required">
                <c:forEach items="${identity}" var="obj">
                    <option value="${obj.identityId}" >${obj.identityName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 38px;">
        <label class="layui-form-label">
            <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;联系电话</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text" name="telephone" id="telephone" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" >
        </div>
    </div>
    <span class="spa spa17" id="spa17" style="margin-left: 125px; width: 800px;">&#10004;</span>
    <div class="layui-form-item" style="margin-top: 50px;">
        <div class="layui-input-block" >
            <button class="layui-btn "  lay-submit id="next" lay-filter="next">提交</button>
        </div>
    </div>

    </form>
</div>


<%--弹出房源图片信息--%>
<div class="layui-form" id="popImg" style="display: none; margin: 70px  50px;">
    <input type="hidden" id="houseId1" >
    <button class="layui-btn"  id="addImg">增加新图片</button>
    <div  style="margin-top: 20px;">
        <table class="layui-hide" id="houseImgInfo" lay-filter="houseImgInfo"></table>
    </div>
</div>

</body>


<%--待审核的房源工具条--%>
<script type="text/html" id="checkHouseListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="updateMsg">修改信息</a>
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="updateImg">修改图片</a>
</script>

<%--待修改的房源工具条--%>
<script type="text/html" id="queryUpdateHouseListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="updateMsg">修改信息</a>
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="updateImg">修改图片</a>
</script>
<%--待出租的房源工具条--%>
<script type="text/html" id="forHireHouseListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="view">查看房源</a>
</script>

<%--已出租的房源工具条--%>
<script type="text/html" id="rentedHouseListInfoBar" >
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="view">查看房源</a>
</script>

<%--租到的房源工具条--%>
<script type="text/html" id="alreadyRentedHouseListInfoBar" >
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="view">查看房源</a>
</script>

<%--已结束的房源工具条--%>
<script type="text/html" id="endHouseListInfoBar" >
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="view">查看房源</a>
</script>

<%--待出租的房源工具条--%>
<script type="text/html" id="houseImgInfoBar" >
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="view">查看房源</a>
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



        //待审核的房源
        table.render({
            elem:'#checkHouseListInfo',
            url: "${ctx}/house/queryCheckHouseListInfo/"+ username,
            cols: [[
                {field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'provinceName', title: '省',align: 'center',templet:'<div>{{d.province.provinceName}}</div>'}
                ,{field:'cityName', title: '市',align: 'center',templet:'<div>{{d.city.cityName}}</div>'}
                ,{field:'districtName', title: '区',align: 'center',templet:'<div>{{d.district.districtName}}</div>'}
                ,{field:'houseName', title: '房源标题',align: 'center'}
                ,{field:'createDateString', title: '创建时间',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#checkHouseListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });


        //未审核成功的房源
        table.render({
            elem:'#updateHouseListInfo',
            url: "${ctx}/house/queryUpdateHouseListInfo/"+ username,
            cols: [[
                {field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'provinceName', title: '省',align: 'center',templet:'<div>{{d.province.provinceName}}</div>'}
                ,{field:'cityName', title: '市',align: 'center',templet:'<div>{{d.city.cityName}}</div>'}
                ,{field:'districtName', title: '区',align: 'center',templet:'<div>{{d.district.districtName}}</div>'}
                ,{field:'houseName', title: '房源标题',align: 'center'}
                ,{field:'examInfo', title: '原因',align: 'center'}
                ,{field:'createDateString', title: '创建时间',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#queryUpdateHouseListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //待出租的房源
        table.render({
            elem:'#forHireHouseListInfo',
            url: "${ctx}/house/queryForHireHouseListInfo/"+ username,
            cols: [[
                {field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'provinceName', title: '省',align: 'center',templet:'<div>{{d.province.provinceName}}</div>'}
                ,{field:'cityName', title: '市',align: 'center',templet:'<div>{{d.city.cityName}}</div>'}
                ,{field:'districtName', title: '区',align: 'center',templet:'<div>{{d.district.districtName}}</div>'}
                ,{field:'houseName', title: '房源标题',align: 'center'}
                ,{field:'createDateString', title: '创建时间',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#forHireHouseListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //已出租的房源
        table.render({
            elem:'#rentedHouseListInfo',
            url: "${ctx}/houseTransfer/queryRentedHouseListInfo/"+ username,
            cols: [[
                {field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partBLoginName', title: '承租人（乙方）',align: 'center'}
                ,{field:'startTimeString', title: '开始日期',align: 'center'}
                ,{field:'endTimeString', title: '结束日期',align: 'center'}
                ,{field:'createTimeString', title: '创建日期',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#rentedHouseListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //租到的房源
        table.render({
            elem:'#alreadyRentedHouseListInfo',
            url: "${ctx}/houseTransfer/queryAlreadyRentedHouseListInfo/"+ username,
            cols: [[
                {field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partALoginName', title: '出租人（甲方）',align: 'center'}
                ,{field:'startTimeString', title: '开始日期',align: 'center'}
                ,{field:'endTimeString', title: '结束日期',align: 'center'}
                ,{field:'createTimeString', title: '创建日期',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#rentedHouseListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //已结束的房源
        table.render({
            elem:'#endHouseListInfo',
            url: "${ctx}/houseTransfer/queryEndHouseListInfo/"+ username,
            cols: [[
                {field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partALoginName', title: '出租人（甲方）',align: 'center'}
                ,{field:'partBLoginName', title: '承租人（乙方）',align: 'center'}
                ,{field:'startTimeString', title: '开始日期',align: 'center'}
                ,{field:'endTimeString', title: '结束日期',align: 'center'}
                ,{field:'createTimeString', title: '创建日期',align: 'center'}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //已终止的房源
        table.render({
            elem:'#breakdownHouseListInfo',
            url: "${ctx}/houseTransfer/queryBreakdownHouseListInfo/"+ username,
            cols: [[
                {field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partALoginName', title: '出租人（甲方）',align: 'center'}
                ,{field:'partALoginName', title: '承租人（乙方）',align: 'center'}
                ,{field:'startTimeString', title: '开始日期',align: 'center'}
                ,{field:'endTimeString', title: '结束日期',align: 'center'}
                ,{field:'createTimeString', title: '创建日期',align: 'center'}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });


        //监听待审核的房源工具条
        table.on('tool(checkHouseListInfo)',function (obj) {
            var data = obj.data;

            //查看房源信息
            if(obj.event === 'updateMsg'){
                layer.open({
                    type: 1,
                    title: '查看并修改房源具体信息',
                    area:['1200px','600px'],
                    content:$("#popDetailMsg"),
                    success: function (layero,index) {


                        $('#houseId').val(data.houseId);
                        $('#province').val(data.province.provinceName);
                        $('#city').val(data.city.cityName);
                        $('#district').val(data.district.districtName);
                        $('#detailAddress').val(data.detailAddress);
                        $('#addressCommunity').val(data.addressCommunity);
                        $('#addressBuilding').val(data.addressBuilding);
                        $('#addressUnit').val(data.addressUnit);
                        $('#typeRooms').val(data.typeRooms);
                        $('#typeHalls').val(data.typeHalls);
                        $('#typeBathrooms').val(data.typeBathrooms);
                        $('#houseArea').val(data.houseArea);
                        $('#floor').val(data.floor);
                        $('#totalFloor').val(data.totalFloor);
                        $('#addressRoom').val(data.addressRoom);
                        $('#orientation').val(data.orientation.orientationId);
                        $('#renovation').val(data.renovation.renovationId);
                        $('#houseElevator').val(data.houseElevator);
                        $('#housePark').val(data.housePark);
                        $('#housePrice').val(data.housePrice);
                        $('#rentType').val(data.rentType.rentTypeId);
                        $('#inspection').val(data.inspection.inspectionId);
                        $('#houseCheckTimeString').val(data.houseCheckTimeString);
                        $('#housePeople').val(data.housePeople);
                        $('#houseName').val(data.houseName);
                        $('#houseInfo').val(data.houseInfo);
                        $('#contacts').val(data.contacts);
                        $('#identity').val(data.identity.identityId);
                        $('#telephone').val(data.telephone);
                        $("input[name=pet][value='"+data.pet+"']").attr('checked','true');
                        $("input[name=leasingId][value='"+data.leasing.leasingId+"']").attr('checked','true');
                        $("input[name=sex][value='"+data.sex+"']").attr('checked','true');

                        var rentContent = data.rentContentString.trim().split(" ");
                        var facility = data.houseFacilityString.trim().split(" ");


                        for( var i = 0 ; i<rentContent.length ; i++){
                            var  j;
                            switch (rentContent[i]) {
                                case "水费": j = 1; break;
                                case "电费": j = 2; break;
                                case "燃气费": j = 3; break;
                                case "宽带费": j = 4; break;
                                case "物业费": j = 5; break;
                                case "取暖费": j = 6; break;
                                case "有线电视费": j = 7; break;
                                case "停车费": j = 8; break;

                            }

                            $("input[name=contentId][value='"+j+"']").attr('checked','true');
                        }

                        for(var  i = 0 ; i<facility.length; i++){
                            var j;
                            switch (facility[i]) {
                                case "冰箱": j = 2; break;
                                case "床": j = 3; break;
                                case "电视": j = 4; break;
                                case "空调": j = 5; break;
                                case "洗衣机": j = 6; break;
                                case "热水器": j = 7; break;
                                case "暖气": j = 8; break;
                                case "宽带": j = 10; break;
                                case "阳台": j = 13; break;
                                case "衣柜": j = 15; break;
                                case "沙发": j = 16; break;
                                case "桌椅": j = 17; break;
                            }
                            $("input[name=facilityId][value='"+j+"']").attr('checked','true');
                        }

                        //入住时间
                        laydate.render({
                            elem: '#houseCheckTimeString'
                            ,min: 0
                            ,value: data.houseCheckTimeString
                            ,trigger:'click'
                            ,done: function(value, date, endDate){
                                if(value == ""){
                                    $(".spat1").text("不能为空").css("color","#BD362F");
                                    checkt1 = false;
                                }else {
                                    $(".spat1").text("\u2714").css("color","#00CD00");
                                    checkt1 = true;
                                }
                                checkTotal();

                            }
                        });
                        form.render();
                    }
                })
            }


            //查看房源图片信息
            if(obj.event === 'updateImg') {
                layer.open({
                    type: 1,
                    title: '查看并修改房源图片信息',
                    area:['800px','600px'],
                    content:$("#popImg"),
                    success: function (layero,index) {
                        //房源图片列表
                        table.render({
                            elem:'#houseImgInfo',
                            url: "${ctx}/house/queryHouseImg/"+ data.houseId,
                            cols: [[
                                {field:'id',title:'编号',hide:true,width:30}
                                ,{field:'houseId', title: '房源编号',align: 'center',width:100}
                                ,{field:'imgRelPath', title: '房源图片',align: 'center',templet:'<div><img style="height: 100%; width: 100%;"  src="{{d.imgRelPath}}" /></div>'}
                                ,{field:'imgType', title: '图片类型',align: 'center'}
                                ,{fixed: 'right', title:'操作', toolbar: '#houseImgInfoBar', width:150}
                            ]],
                            page:true,
                            limits:[5,10,15],
                            limit:5
                        });

                        table.on('tool(houseImgInfo)',function (obj) {
                            var data = obj.data;
                            if(obj.event === 'delete') {
                                layer.confirm('确认删除？',function (index) {
                                    $.ajax({
                                        url:'${ctx}/house/deleteImg/' + data.id
                                        ,type:"post"
                                        ,success:function (msg) {
                                            if (msg.code == 200){
                                                layer.msg('操作成功', {
                                                    icon: 6,
                                                    time: 1000
                                                }, function(){
                                                    setTimeout(function(){
                                                        table.reload('houseImgInfo',{
                                                            page: {
                                                                curr: 1 //重新从第 1 页开始
                                                            }});
                                                    }, 500);
                                                });
                                            }else {
                                                layer.msg("操作失败",{icon:5});
                                            }
                                        }
                                    })
                                })
                            }

                        });

                        $('#addImg').click(function () {
                            window.location.href = '${ctx}/user/toAddHouseImg/' + data.houseId
                        })

                    }
                })

            }

        });

        //监听审核不通过的房源工具条
        table.on('tool(updateHouseListInfo)',function (obj) {
            var data = obj.data;

            //查看房源信息
            if(obj.event === 'updateMsg'){
                layer.open({
                    type: 1,
                    title: '查看并修改房源具体信息',
                    area:['1200px','600px'],
                    content:$("#popDetailMsg"),
                    success: function (layero,index) {


                        $('#houseId').val(data.houseId);
                        $('#province').val(data.province.provinceName);
                        $('#city').val(data.city.cityName);
                        $('#district').val(data.district.districtName);
                        $('#detailAddress').val(data.detailAddress);
                        $('#addressCommunity').val(data.addressCommunity);
                        $('#addressBuilding').val(data.addressBuilding);
                        $('#addressUnit').val(data.addressUnit);
                        $('#typeRooms').val(data.typeRooms);
                        $('#typeHalls').val(data.typeHalls);
                        $('#typeBathrooms').val(data.typeBathrooms);
                        $('#houseArea').val(data.houseArea);
                        $('#floor').val(data.floor);
                        $('#totalFloor').val(data.totalFloor);
                        $('#addressRoom').val(data.addressRoom);
                        $('#orientation').val(data.orientation.orientationId);
                        $('#renovation').val(data.renovation.renovationId);
                        $('#houseElevator').val(data.houseElevator);
                        $('#housePark').val(data.housePark);
                        $('#housePrice').val(data.housePrice);
                        $('#rentType').val(data.rentType.rentTypeId);
                        $('#inspection').val(data.inspection.inspectionId);
                        $('#houseCheckTimeString').val(data.houseCheckTimeString);
                        $('#housePeople').val(data.housePeople);
                        $('#houseName').val(data.houseName);
                        $('#houseInfo').val(data.houseInfo);
                        $('#contacts').val(data.contacts);
                        $('#identity').val(data.identity.identityId);
                        $('#telephone').val(data.telephone);
                        $("input[name=pet][value='"+data.pet+"']").attr('checked','true');
                        $("input[name=leasingId][value='"+data.leasing.leasingId+"']").attr('checked','true');
                        $("input[name=sex][value='"+data.sex+"']").attr('checked','true');

                        var rentContent = data.rentContentString.trim().split(" ");
                        var facility = data.houseFacilityString.trim().split(" ");


                        for( var i = 0 ; i<rentContent.length ; i++){
                            var  j;
                            switch (rentContent[i]) {
                                case "水费": j = 1; break;
                                case "电费": j = 2; break;
                                case "燃气费": j = 3; break;
                                case "宽带费": j = 4; break;
                                case "物业费": j = 5; break;
                                case "取暖费": j = 6; break;
                                case "有线电视费": j = 7; break;
                                case "停车费": j = 8; break;

                            }

                            $("input[name=contentId][value='"+j+"']").attr('checked','true');
                        }

                        for(var  i = 0 ; i<facility.length; i++){
                            var j;
                            switch (facility[i]) {
                                case "冰箱": j = 2; break;
                                case "床": j = 3; break;
                                case "电视": j = 4; break;
                                case "空调": j = 5; break;
                                case "洗衣机": j = 6; break;
                                case "热水器": j = 7; break;
                                case "暖气": j = 8; break;
                                case "宽带": j = 10; break;
                                case "阳台": j = 13; break;
                                case "衣柜": j = 15; break;
                                case "沙发": j = 16; break;
                                case "桌椅": j = 17; break;
                            }
                            $("input[name=facilityId][value='"+j+"']").attr('checked','true');
                        }

                        //入住时间
                        laydate.render({
                            elem: '#houseCheckTimeString'
                            ,min: 0
                            ,value: data.houseCheckTimeString
                            ,trigger:'click'
                            ,done: function(value, date, endDate){
                                if(value == ""){
                                    $(".spat1").text("不能为空").css("color","#BD362F");
                                    checkt1 = false;
                                }else {
                                    $(".spat1").text("\u2714").css("color","#00CD00");
                                    checkt1 = true;
                                }
                                checkTotal();

                            }
                        });
                        form.render();
                    }
                })
            }



            //查看房源图片信息
            if(obj.event === 'updateImg') {
                layer.open({
                    type: 1,
                    title: '查看并修改房源图片信息',
                    area:['800px','600px'],
                    content:$("#popImg"),
                    success: function (layero,index) {
                        //房源图片列表
                        table.render({
                            elem:'#houseImgInfo',
                            url: "${ctx}/house/queryHouseImg/"+ data.houseId,
                            cols: [[
                                {field:'id',title:'编号',hide:true,width:30}
                                ,{field:'houseId', title: '房源编号',align: 'center',width:100}
                                ,{field:'imgRelPath', title: '房源图片',align: 'center',templet:'<div><img style="height: 100%; width: 100%;"  src="{{d.imgRelPath}}" /></div>'}
                                ,{field:'imgType', title: '图片类型',align: 'center'}
                                ,{fixed: 'right', title:'操作', toolbar: '#houseImgInfoBar', width:150}
                            ]],
                            page:true,
                            limits:[5,10,15],
                            limit:5
                        });

                        table.on('tool(houseImgInfo)',function (obj) {
                            var data = obj.data;
                            if(obj.event === 'delete') {
                                layer.confirm('确认删除？',function (index) {
                                    $.ajax({
                                        url:'${ctx}/house/deleteImg/' + data.id
                                        ,type:"post"
                                        ,success:function (msg) {
                                            if (msg.code == 200){
                                                layer.msg('操作成功', {
                                                    icon: 6,
                                                    time: 1000
                                                }, function(){
                                                    setTimeout(function(){
                                                        table.reload('houseImgInfo',{
                                                            page: {
                                                                curr: 1 //重新从第 1 页开始
                                                            }});
                                                    }, 500);
                                                });
                                            }else {
                                                layer.msg("操作失败",{icon:5});
                                            }
                                        }
                                    })
                                })
                            }

                        });

                        $('#addImg').click(function () {
                            window.location.href = '${ctx}/user/toAddHouseImg/' + data.houseId
                        })

                    }
                })

            }

        });


        //监听待出租的房源工具条
        table.on('tool(forHireHouseListInfo)',function (obj) {
            var data = obj.data;

            //查看房源信息
            if(obj.event === 'view'){
                window.location.href = '${ctx}/house/houseDetail/' + data.houseId
            }
        });

        //监听已出租的房源工具条
        table.on('tool(rentedHouseListInfo)',function (obj) {
            var data = obj.data;

            //查看房源信息
            if(obj.event === 'view'){
                window.location.href = '${ctx}/house/houseDetail/' + data.houseId
            }
        });

        //监听租到的的房源工具条
        table.on('tool(alreadyRentedHouseListInfo)',function (obj) {
            var data = obj.data;

            //查看房源信息
            if(obj.event === 'view'){
                window.location.href = '${ctx}/house/houseDetail/' + data.houseId
            }
        });



        //验证判别
        var check1 = true;
        var check2 = true;
        var check3 = true;
        var check4 = true;
        var check5 = true;
        var check6 = true;
        var check7 = true;
        var check8 = true;
        var check9 = true;
        var check10 = true;
        var check11 = true;
        var check12 = true;
        var check13 = true;
        var check14 = true;
        var check15 = true;
        var check16 = true;
        var checkt1 = true;

        function check(){

            //监听房间包含设施

            //失焦判断
            $("input").blur(function(){
                //地址判断
                if($(this).is("#detailAddress")){
                    var address= $('#detailAddress').val().trim();
                    if(address == ''){
                        $(".spa1").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check1= false;
                    }else if(address.length > 25){
                        $(".spa1").text("字符数已超出限制").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check1 = false;
                    }else{
                        $(".spa1").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check1 = true;
                    }
                }
                //小区判断
                if($(this).is("#addressCommunity")){
                    var community = $('#addressCommunity').val().trim();
                    if(community == ''){
                        $(".spa2").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check2 = false;
                    }else if(community.length > 15){
                        $(".spa2").text("字符数已超出限制").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check2 = false;
                    }else{
                        $(".spa2").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check2 = true;
                    }
                }
                //栋判断
                if($(this).is("#addressBuilding")){
                    var addressBuilding = $('#addressBuilding').val().trim();
                    if(addressBuilding == ''){
                        $(".spa3").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check3 = false;
                    }else{
                        $(".spa3").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check3 = true;
                    }
                }

                //单元判断
                if($(this).is("#addressUnit")){
                    var addressUnit = $('#addressUnit').val().trim();
                    if(addressUnit == ''){
                        $(".spa4").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check4 = false;
                    }else{
                        $(".spa4").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check4 = true;
                    }
                }

                //室判断
                if($(this).is("#typeRooms")){
                    var typeRooms = $('#typeRooms').val().trim();
                    if(typeRooms == ''){
                        $(".spa5").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check5 = false;
                    }else{
                        $(".spa5").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check5 = true;
                    }
                }

                //厅判断
                if($(this).is("#typeHalls")){
                    var typeHalls = $('#typeHalls').val().trim();
                    if(typeHalls == ''){
                        $(".spa6").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check6 = false;
                    }else{
                        $(".spa6").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check6 = true;
                    }
                }

                //卫判断
                if($(this).is("#typeBathrooms")){
                    var typeBathrooms = $('#typeBathrooms').val().trim();
                    if(typeBathrooms == ''){
                        $(".spa7").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check7 = false;
                    }else{
                        $(".spa7").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check7 = true;
                    }
                }

                //单元判断
                if($(this).is("#houseArea")){
                    var houseArea = $('#houseArea').val().trim();
                    if(houseArea == ''){
                        $(".spa8").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check8 = false;
                    }else{
                        $(".spa8").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check8 = true;
                    }
                }

                //楼层判断
                if($(this).is("#floor")){
                    var floor = $('#floor').val().trim();
                    if(floor == ''){
                        $(".spa9").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check9 = false;
                    }else{
                        $(".spa9").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check9 = true;
                    }
                }

                //总楼层判断
                if($(this).is("#totalFloor")){
                    var totalFloor = $('#totalFloor').val().trim();
                    if(totalFloor == ''){
                        $(".spa10").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check10 = false;
                    }else{
                        $(".spa10").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check10 = true;
                    }
                }

                //门牌号
                if($(this).is("#addressRoom")){
                    var addressRoom = $('#addressRoom').val().trim();
                    if(addressRoom == ''){
                        $(".spa11").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check11 = false;
                    }else{
                        $(".spa11").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check11 = true;
                    }
                }

                //租金
                if($(this).is("#housePrice")){
                    var housePrice = $('#housePrice').val().trim();
                    if(housePrice == ''){
                        $(".spa12").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check12 = false;
                    }else{
                        $(".spa12").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check12 = true;
                    }
                }

                //人数判断
                if($(this).is("#housePeople")){
                    var housePeople = $('#housePeople').val().trim();
                    if(housePeople == ''){
                        $(".spa13").text("");
                    }else{
                        $(".spa13").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                    }
                }

                //标题判断
                if($(this).is("#houseName")){
                    var houseName= $('#houseName').val().trim();
                    if(houseName == ''){
                        $(".spa14").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check13 = false;
                    }else if(houseName.length > 30){
                        $(".spa14").text("字符数已超出限制").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check13 = false;
                    }else if(houseName.length < 8){
                        $(".spa14").text("字符数不够8个").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check13 = false;
                    }else{
                        $(".spa14").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check13 = true;
                    }
                }

                //标题判断
                if($(this).is("#contacts")){
                    var contacts= $('#contacts').val().trim();
                    if(contacts == ''){
                        $(".spa16").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check14 = false;
                    }else if(contacts.length > 10){
                        $(".spa16").text("字符数已超出限制").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check14 = false;
                    }else if(contacts.length < 2){
                        $(".spa16").text("字符数不够2个").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check14 = false;
                    }else{
                        $(".spa16").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check14 = true;
                    }
                }

                //电话判断
                if($(this).is("#telephone")){
                    var telephone = $('#telephone').val().trim();
                    if(telephone == ''){
                        $(".spa17").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check15 = false;
                    }else if(telephone.length != 11){
                        $(".spa17").text("电话号码不正确").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check15 = false;
                    }else{
                        $(".spa17").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check15 = true;
                    }
                }

                checkTotal();

            });
            $("textarea").blur(function () {
                //内容判断
                if($(this).is("#houseInfo")){
                    var houseInfo= $('#houseInfo').val().trim();
                    if(houseInfo == ''){
                        $(".spa15").text("不能为空").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check16 = false;
                    }else if(houseInfo.length > 500){
                        $(".spa15").text("字符数已超出限制").css("color","#BD362F");
                        $(this).css("border","1px solid #BD362F");
                        check16 = false;
                    }else{
                        $(".spa15").text("\u2714").css("color","#00CD00");
                        $(this).css("border","1px solid #aaa");
                        check16 = true;
                    }
                }
                checkTotal();
            });




            //聚焦判断
            $("input").focus(function(){
                if($(this).is("#detailAddress")){
                    $(".spa1").text("不超过25个字符").css("color","#0000FF");
                    $(this).css("border","1px solid #aaa")
                }
                if($(this).is("#addressCommunity")){
                    $(".spa2").text("不超过15个字符").css("color","#0000FF");
                    $(this).css("border","1px solid #aaa")
                }
                if($(this).is("#houseArea")){
                    $(".spa8").text("最多两位小数").css("color","#0000FF");
                    $(this).css("border","1px solid #aaa")
                }
                if($(this).is("#housePrice")){
                    $(".spa12").text("最多两位小数").css("color","#0000FF");
                    $(this).css("border","1px solid #aaa")
                }
                if($(this).is("#houseName")){
                    $(".spa14").text("标题字数为8-30字，不允许填写电话、QQ、微信、邮箱等联系方式或特殊符号").css("color","#0000FF");
                    $(this).css("border","1px solid #aaa")
                }
                if($(this).is("#contacts")){
                    $(".spa16").text("不少于2个汉字").css("color","#0000FF");
                    $(this).css("border","1px solid #aaa")
                }
            });

            $("textarea").focus(function () {
                if($(this).is("#houseInfo")){
                    $(".spa15").text("内容字数不超过500字").css("color","#0000FF");
                    $(this).css("border","1px solid #aaa")
                }
            });
        }

        function checkTotal() {
            if ( check1 && check2 && check3 && check4 && check5 && check6
                && check7 && check8 && check9 && check10 && check11 && check12 && check13 && check14
                && check15 && check16 && checkt1 ){
                $("#next").attr("class","layui-btn");
                $("#next").attr('disabled',false);
            }else
            {
                $("#next").attr("class","layui-btn layui-btn-disabled");
                $("#next").attr('disabled',true);
            }

        }







    });
</script>



</html>
