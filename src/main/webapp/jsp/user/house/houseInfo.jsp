
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
            <li><a href="${ctx}/user/breakdown/${sessionScope.Username}">报障信息</a></li>
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
                    <li>待修改的房源</li>
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

<div class="lianjia-footer-simple">链家网（北京）科技有限公司 | 网络经营许可证 京ICP备16057509号-2<br>© Copyright©2010-2019
    链家网Lianjia.com版权所有&nbsp;<div style="width:300px;color: #888c8e;font-size: 12px;line-height: 20px;margin: auto;"><a
            target="_blank"  style="display:inline-block;text-decoration:none;height:20px;line-height:20px;margin: 0 auto;text-align: center;"><img
            src="/static/img/beian.png" style=" float:left;">
        <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px;color: #888c8e;">京公网安备 11010802024019号</p>
    </a></div>
</div>


<%--弹出房源详细信息--%>
<div class="layui-form" id="popDetailMsg" style="display: none; margin: 70px  50px;">
    <input type="hidden" id="houseId" >
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>类别</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">出租方式</label>
        <div class="layui-input-inline" style="margin-left: 20px;">
            <input type="text" id="leasingName"  readonly  style="width: 100px;"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>基础信息</legend>
    </fieldset>
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
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">详细地址</label>
        <div class="layui-input-inline" style="margin-left: 20px;">
            <input type="text"  id="detailAddress" readonly style="width: 500px;" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">小区名称</label>
        <div class="layui-input-inline" style="margin-left: 20px;">
            <input type="text"  id="addressCommunity" readonly style="width: 500px;"  autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">房屋位置</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="addressBuilding"  readonly autocomplete="off" class="layui-input" align="center" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">栋</div>
        <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
            <input  type="text"  id="addressUnit"  readonly  autocomplete="off" class="layui-input" align="center" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">单元</div>
    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">房屋规格</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="typeRooms"   readonly   autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux" >室</div>
        <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
            <input  type="text"  id="typeHalls"  readonly   autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">厅</div>
        <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
            <input  type="text"  id="typeBathrooms"  readonly   autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">卫</div>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="houseArea" readonly   autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">㎡</div>
    </div>

    <div class="layui-form-item " style="margin-top: 30px;">
        <label class="layui-form-label">楼&emsp;&emsp;层</label>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">第</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="floor" readonly  autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux" >层</div>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="totalFloor" readonly autocomplete="off"  class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux" >层</div>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">门牌号</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="addressRoom" readonly  autocomplete="off" class="layui-input" style="text-align: center;">
        </div>

    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">朝向装修</label>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">房源朝向</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="orientation" readonly  autocomplete="off" class="layui-input" >
        </div>

        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">装修</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="renovation" readonly autocomplete="off" class="layui-input" >
        </div>


    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">设&emsp;&emsp;施</label>

        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">电梯配备</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="houseElevator" readonly  autocomplete="off" class="layui-input" >
        </div>

        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">车位配备</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="housePark" readonly  autocomplete="off" class="layui-input">
        </div>

    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">租&emsp;&emsp;金</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="housePrice"  readonly autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">元/月</div>

        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">租金方式</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text" id="rentType" readonly  autocomplete="off" class="layui-input">
        </div>

    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">租金已包含费用</label>
        <div class="layui-input-inline" style="width: 600px; margin-left: 20px; margin-top: 10px;">
            <input  type="text"  id="rentContent" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>详细信息</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">看房时间</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="inspection" readonly  autocomplete="off" class="layui-input" >
        </div>

    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">最早入住时间</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px; margin-top: 10px;">
            <input  type="text" id="houseCheckTimeString" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">宜住人数</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="housePeople" readonly autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">人</div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">标&emsp;&emsp;题
        </label>
        <div class="layui-input-inline" style="width: 600px; margin-left: 20px;">
            <input  type="text"  id="houseName" readonly  autocomplete="off" class="layui-input" >
        </div>

    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            宠&emsp;&emsp;物
        </label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="pet" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">租客性别
        </label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="sex" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px; ">
        <label class="layui-form-label" >房屋配置</label>
        <div class="layui-input-inline" style="width: 600px; margin-left: 20px; ">
            <input  type="text"  id="facility" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px; height: 180px;">
        <label class="layui-form-label" >房源描述</label>
        <div class="layui-input-inline" style="padding-left: 20px; width: 600px; height: 180px;">
            <%--/<textarea id="houseInfo" style="display: none;"></textarea>--%>
            <textarea  id="houseInfo" style="margin-top: 10px; height: 160px;" readonly  class="layui-textarea"></textarea>
        </div>
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>其他信息</legend>
    </fieldset>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label">&emsp;联系人</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="contacts" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">身&emsp;&emsp;份</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="identity" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="telephone" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>状态及审核信息</legend>
    </fieldset>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label">房源状态</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="houseStatus" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">审核信息</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="checkStatus" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>发布和修改信息</legend>
    </fieldset>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label">发布人</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="createName" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">发布时间</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text" id="createDateString" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="updateName" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">修改时间</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="updateDateString" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>

</div>
<%--弹出房源图片信息--%>
<div class="layui-form" id="popImg" style="display: none; margin: 70px  50px;">
    <input type="hidden" id="houseId2" >
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>封面图片</legend>
    </fieldset>
    <div class="layui-upload-list"  id="faceImg" style="width:180px;height:180px;border:3px solid #0099CC;border-radius: 5px;">
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>房源图片</legend>
    </fieldset>
    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
        预览图：
        <div class="layer-photos-demo"  id="showImg"></div>
    </blockquote>
</div>


</body>


<%--待审核的房源工具条--%>
<script type="text/html" id="checkHouseListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="view">查看房源</a>
</script>

<%--待修改的房源工具条--%>
<script type="text/html" id="queryUpdateHouseListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="updateMsg">修改房源信息</a>
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="updateMsg">修改图片信息</a>
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


        //待修改的房源
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
                ,{fixed: 'right', title:'操作', toolbar: '#endHouseListInfoBar',align:'center', width:150}
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
            if(obj.event === 'view'){

            }
        });











    });
</script>



</html>
