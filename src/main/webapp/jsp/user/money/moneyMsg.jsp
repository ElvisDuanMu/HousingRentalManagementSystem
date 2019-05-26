
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
            <li><a href="${ctx}/user/houseInfo/${sessionScope.Username}">我的房源</a></li>
            <li><a href="${ctx}/user/contract/${sessionScope.Username}">我的合同</a></li>
            <li class="hover"><a href="${ctx}/user/money/${sessionScope.Username}">我的收入</a></li>
            <li><a href="${ctx}/user/breakdown/${sessionScope.Username}">报障信息</a></li>
            <li><a href="">编辑资料</a></li>
        </ul>
    </div>
    <div class="main-right fr" style="min-height: 600px;">
        <div id="allList">
            <div class="title">您的收入信息</div>
            <%--选项卡--%>
            <div class="layui-tab layui-tab-brief" lay-filter="wayInfo">
                <ul class="layui-tab-title">
                    <li class="layui-this">我的收入</li>
                    <li>我应付款</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <%--我的收入房源信息--%>
                            <div class="layui-form-item" style="margin-top: 20px;">
                                <label class="layui-form-label">日期范围</label>
                                <div class="layui-input-inline" >
                                    <input type="text" class="layui-input" id="date" placeholder=" - " readonly>
                                    <input type="hidden" id="startCreateDate" value="" >
                                    <input type="hidden" id="endCreateDate" value="" >
                                </div>
                            </div>

                            <div class="layui-form-item" style="margin-top: 20px;">
                               <label class="layui-form-label">总租金</label>
                                <div class="layui-input-inline" style="width: 150px; ">
                                    <input  type="text"  id="totalIncomeMoney" readonly  autocomplete="off" class="layui-input" style="text-align: center">
                                </div>
                                <div class="layui-form-mid layui-word-aux">元</div>
                                <label class="layui-form-label">已收取租金</label>
                                <div class="layui-input-inline" style="width: 150px; ">
                                    <input  type="text"  id="currentIncomeMoney" readonly  autocomplete="off" class="layui-input" style="text-align: center">
                                </div>
                                <div class="layui-form-mid layui-word-aux">元</div>
                            </div>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="incomeHouseListInfo" lay-filter="incomeHouseListInfo"></table>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <%--我的支出房源信息--%>
                            <div class="layui-form-item" style="margin-top: 20px;">
                                <label class="layui-form-label">日期范围</label>
                                <div class="layui-input-inline" >
                                    <input type="text" class="layui-input" id="date2" placeholder=" - " readonly>
                                    <input type="hidden" id="startCreateDate2" value="" >
                                    <input type="hidden" id="endCreateDate2" value="" >
                                </div>
                            </div>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="expenditureHouseListInfo" lay-filter="expenditureHouseListInfo"></table>
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

<div class="layui-form" id="incomeDetailList" style="display: none; margin: 70px  50px;">
    <div class="layui-form-item">
        <label class="layui-form-label">房源编号</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  style="text-align: center" type="text"  id="houseId" readonly  autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">承租人账号</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  type="text"  id="partBLoginName" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px;">
        <label class="layui-form-label">总租金</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  type="text"  id="totalMoney" readonly  autocomplete="off" class="layui-input" style="text-align: center">
        </div>
        <div class="layui-form-mid layui-word-aux">元</div>
        <label class="layui-form-label">已收取租金</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  type="text"  id="incomeMoney" readonly lay-filter="incomeMoney" autocomplete="off" class="layui-input" style="text-align: center">
        </div>
        <div class="layui-form-mid layui-word-aux">元</div>
    </div>

    <%--房源收入租金管理--%>
    <div  style="margin-top: 20px;">
        <table class="layui-hide" id="incomeListInfo" lay-filter="incomeListInfo"></table>
    </div>

</div>


<div class="layui-form" id="expenditureDetailList" style="display: none; margin: 70px  50px;">
    <div class="layui-form-item">
        <label class="layui-form-label">房源编号</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  style="text-align: center" type="text"  id="houseId2" readonly  autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">出租人账号</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  type="text"  id="partALoginName" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px;">
        <label class="layui-form-label">总租金</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  type="text"  id="totalMoney2" readonly  autocomplete="off" class="layui-input" style="text-align: center">
        </div>
        <div class="layui-form-mid layui-word-aux">元</div>
        <label class="layui-form-label">已支付租金</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  type="text"  id="expenditureMoney" readonly  autocomplete="off" class="layui-input" style="text-align: center">
        </div>
        <div class="layui-form-mid layui-word-aux">元</div>
    </div>

    <%--房源支出租金管理--%>
    <div  style="margin-top: 20px;">
        <table class="layui-hide" id="expenditureListInfo" lay-filter="expenditureListInfo"></table>
    </div>

</div>

<div class="layui-form" id="promptMsg" style="display: none; margin: 30px  50px;">
    <div class="layui-form-item">
        <div class="layui-input-inline" style="width: 500px; ">
            <textarea id="prompt" required lay-verify="required" placeholder="请输入提示信息" class="layui-textarea"></textarea>
        </div>

    </div>
    <div class="layui-form-item" >
        <button class="layui-btn" lay-submit lay-filter="submitPrompt" style="margin-left: 100px; margin-top: 20px; width: 100px;">提交</button>
    </div>
</div>



<%--房源收入工具条--%>
<script type="text/html" id="incomeHouseListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="view">查看</a>
</script>

<%--收入工具条--%>
<script type="text/html" id="incomeListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="confirm">确认</a>
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="prompt">提示</a>
</script>

<%--支出工具条--%>
<script type="text/html" id="expenditureListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="confirm">确认</a>
</script>


<%--房源支出工具条--%>
<script type="text/html" id="expenditureHouseListInfoBar" >
    <a class="layui-btn layui-btn layui-btn-xs " lay-event="view">查看</a>
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




        //收入房源信息查看
        table.render({
            elem:'#incomeHouseListInfo',
            url: "${ctx}/houseTransfer/queryPartAInfo",
            where: {partALoginName : username},
            cols: [[
                {field:'transferId',title:'租赁id',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partBLoginName', title: '承租人（乙方）',align: 'center'}
                ,{field:'startTimeString', title: '开始时间',align: 'center',hide:true}
                ,{field:'endTimeString', title: '结束时间',align: 'center',hide:true}
                ,{field:'createTimeString', title: '创建时间',align: 'center'}
                ,{field:'totalPrice', title: '总租金(元)',align: 'center',templet:'<div>{{d.contract.totalPrice}}</div>'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#incomeHouseListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5,
            done: function(res, curr, count) {
                partATotalMoney();
                partACurrentMoney();

            }
        });

        //支出房源信息查看
        table.render({
            elem:'#expenditureHouseListInfo',
            url: "${ctx}/houseTransfer/queryPartBInfo",
            where: {partBLoginName : username},
            cols: [[
                {field:'transferId',title:'租赁id',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partALoginName', title: '出租人（甲方）',align: 'center'}
                ,{field:'startTimeString', title: '开始时间',align: 'center',hide:true}
                ,{field:'endTimeString', title: '结束时间',align: 'center',hide:true}
                ,{field:'createTimeString', title: '创建时间',align: 'center'}
                ,{field:'totalPrice', title: '总租金(元)',align: 'center',templet:'<div>{{d.contract.totalPrice}}</div>'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#expenditureHouseListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });


        //甲方日期范围
        laydate.render({
            elem: '#date'
            ,range: true
            ,max:0
            ,trigger:'click',
            done: function(value, date, endDate) {
                var startCreateDateCode = value.substring(0,10);
                $('#startCreateDate').val(startCreateDateCode);
                var endCreateDateCode = value.substring(13,23);
                $('#endCreateDate').val(endCreateDateCode);
                var partALoginName = $('#username').val().trim();


                //甲方执行重载
                table.reload('incomeHouseListInfo', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        startCreateDateString : startCreateDateCode,
                        endCreateDateString: endCreateDateCode,
                        partALoginName: partALoginName
                    }
                });


            }

        });


        //乙方日期范围
        laydate.render({
            elem: '#date2'
            ,range: true
            ,max:0
            ,trigger:'click',
            done: function(value, date, endDate) {
                var startCreateDateCode = value.substring(0,10);
                $('#startCreateDate2').val(startCreateDateCode);
                var endCreateDateCode = value.substring(13,23);
                $('#endCreateDate2').val(endCreateDateCode);
                var partBLoginName = $('#username').val().trim();
                //乙方执行重载
                 table.reload('expenditureHouseListInfo', {
                 page: {
                        curr: 1 //重新从第 1 页开始
                 }
                ,where: {
                startCreateDateString : startCreateDateCode,
                endCreateDateString: endCreateDateCode,
                partBLoginName: partBLoginName
                    }
                });

            }

        });







        //监听收入房源信息工具条
        table.on('tool(incomeHouseListInfo)',function (obj) {
            var data = obj.data;

            //查看事件
            if (obj.event === 'view'){
                //查看具体收入
                viewDetailIncome( data.houseId ,data.contract.totalPrice ,data.partBLoginName);
            }

        });

        //监听支出房源信息工具条
        table.on('tool(expenditureHouseListInfo)',function (obj) {
            var data = obj.data;

            //查看事件
            if (obj.event === 'view'){
                //查看具体支出
                viewDetailExpenditure( data.houseId ,data.contract.totalPrice ,data.partALoginName);
            }

        });


        function viewDetailIncome( houseId ,totalPrice ,partBLoginName){
            layer.open({
                type: 1,
                title: '查看房源具体交款信息',
                area:['1000px','600px'],
                content:$("#incomeDetailList"),
                success:function () {
                    $('#houseId').val(houseId);
                    $('#totalMoney').val(totalPrice);
                    $('#partBLoginName').val(partBLoginName);
                    partAHouseDetail(houseId);
                    //查询已收款信息
                    $.ajax({
                        url:'${ctx}/money/queryHousePay/' + houseId
                        ,type:"post"
                        ,success:function (data) {
                           $('#incomeMoney').val(data.money);
                        }
                    })



                }
            })
        }

        function viewDetailExpenditure( houseId ,totalPrice ,partALoginName){
            layer.open({
                type: 1,
                title: '查看房源具体支付信息',
                area:['1000px','600px'],
                content:$("#expenditureDetailList"),

                success:function () {
                    $('#houseId2').val(houseId);
                    $('#totalMoney2').val(totalPrice);
                    $('#partALoginName').val(partALoginName);
                    partBHouseDetail(houseId);
                    //查询已支付信息
                    $.ajax({
                        url:'${ctx}/money/queryHouseHasPay/' + houseId
                        ,type:"post"
                        ,success:function (data) {
                            $('#expenditureMoney').val(data.money);
                        }
                    })

                }
            })
        }


        function partAHouseDetail(houseId){
            //收入信息查看
            table.render({
                elem:'#incomeListInfo',
                url: "${ctx}/money/queryHouseMoneyDetail/"+ houseId,
                cellMinWidth:200,
                cols: [[
                    {field:'id',title:'租金id',align: 'center',hide:true}
                    ,{field:'payDate', title: '支付日期',align: 'center'}
                    ,{field:'payMoney', title: '支付金额(元)',align: 'center'}
                    ,{field:'status', title: '状态',align: 'center'}
                    ,{field:'partAConfirm', title: '甲方确认',align: 'center'}
                    ,{field:'partBConfirm', title: '乙方确认',align: 'center'}
                    ,{field:'partAConfirmDateString', title: '甲方确认时间',align: 'center'}
                    ,{field:'partBConfirmDateString', title: '乙方确认时间',align: 'center'}
                    ,{field:'prompt', title: '提示信息',align: 'center'}
                    ,{fixed: 'right', title:'操作', toolbar: '#incomeListInfoBar',align:'center', width:150}
                ]],
                page:true,
                limits:[5,10,15],
                limit:5
            });
        }

        function partBHouseDetail(houseId){
            //支出信息查看
            table.render({
                elem:'#expenditureListInfo',
                url: "${ctx}/money/queryHouseMoneyDetail/"+ houseId,
                cellMinWidth:200,
                cols: [[
                    {field:'id',title:'租金id',align: 'center',hide:true}
                    ,{field:'payDate', title: '支付日期',align: 'center'}
                    ,{field:'payMoney', title: '支付金额(元)',align: 'center'}
                    ,{field:'status', title: '状态',align: 'center'}
                    ,{field:'partAConfirm', title: '甲方确认',align: 'center'}
                    ,{field:'partBConfirm', title: '乙方确认',align: 'center'}
                    ,{field:'partAConfirmDateString', title: '甲方确认时间',align: 'center'}
                    ,{field:'partBConfirmDateString', title: '乙方确认时间',align: 'center'}
                    ,{field:'prompt', title: '提示信息',align: 'center'}
                    ,{fixed: 'right', title:'操作', toolbar: '#expenditureListInfoBar',align:'center', width:150}
                ]],
                page:true,
                limits:[5,10,15],
                limit:5
            });
        }

        //监听收入信息工具条
        table.on('tool(incomeListInfo)',function (obj) {
            var data = obj.data;

            //确认事件
            if (obj.event === 'confirm'){
                if (data.partBConfirm == '等待确认'){
                    layer.msg("请等待乙方确认之后再确认收款");
                }else if( data.partAConfirm == '已确认' ){
                    layer.msg("您已确认过")
                }else {
                    //甲方确认事件
                    partAConfirm(data.id ,data.houseId);

                }
            }

            //提示事件
            if(obj.event === 'prompt'){
                if (data.partAConfirm == '已确认'){
                    layer.msg("已完成，无需填写提示信息");
                }else {
                    //添加提示信息
                    promptPartA(data.id);
                }
            }

        });

        //添加提示信息
        function promptPartA(id){
            var index = layer.open({
                type: 1,
                title: '编辑提示信息',
                area:['600px','300px'],
                content:$("#promptMsg"),
                success:function () {

                    form.on('submit(submitPrompt)',function () {
                        layer.confirm('确定？',function () {

                            var promptMsg = $('#prompt').val();
                            var obj = {
                                id: id,
                                prompt : promptMsg
                            };

                            $.ajax({
                                url: '${ctx}/money/prompt',
                                type: 'post',
                                contentType: 'application/json',
                                data: JSON.stringify(obj),
                                success: function (data ) {
                                    if(data.code == 200){
                                        layer.msg('填写成功', {
                                            icon: 6,
                                            time: 1000
                                        }, function(){
                                            layer.load();
                                            setTimeout(function(){
                                                layer.closeAll('loading');
                                                layer.close(index);
                                                table.reload('incomeListInfo',{
                                                    page: {
                                                        curr: 1 //重新从第 1 页开始
                                                    }});
                                            }, 1500);
                                        });
                                    }
                                    else {
                                        layer.msg("填写失败", {icon: 5});
                                    }

                                }
                            })
                        })
                    })

                }
            })


        }



        //监听支出信息工具条
        table.on('tool(expenditureListInfo)',function (obj) {
            var data = obj.data;

            //确认事件
            if (obj.event === 'confirm'){
                if (data.partBConfirm == '已确认'){
                    layer.msg("您已确认过");
                }else {
                    //乙方确认事件
                    partBConfirm(data.id ,data.houseId)
                }
            }

        });

        //甲方确认
        function partAConfirm(id , houseId) {
            layer.confirm('确定？',function (index) {

                $.ajax({
                    url: '${ctx}/money/partAConfirm/' + id,
                    type: 'post',
                    beforeSend: function (request) {
                        index = layer.load();
                    },
                    success: function (data ) {
                        if(data.code == 200){
                            layer.msg('提交成功', {
                                icon: 6,
                                time: 1000
                            }, function(){
                                setTimeout(function(){
                                    layer.close(index);
                                    //查询已收款信息
                                    $.ajax({
                                        url:'${ctx}/money/queryHousePay/' + houseId
                                        ,type:"post"
                                        ,success:function (data) {
                                            $('#incomeMoney').val(data.money);
                                            form.render();
                                        }
                                    });

                                    table.reload('incomeListInfo',{
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }});
                                }, 1500);
                                table.reload('incomeHouseListInfo',{
                                    page: {
                                        curr: 1 //重新从第 1 页开始
                                    }});

                            });
                        }
                        else {
                            layer.msg("提交失败", {icon: 5});
                        }

                    }
                })
            });
        }

        //乙方确认
        function partBConfirm(id ,houseId) {
            layer.confirm('确定？',function (index) {

                $.ajax({
                    url: '${ctx}/money/partBConfirm/' + id,
                    type: 'post',
                    beforeSend: function (request) {
                        index = layer.load();
                    },
                    success: function (data ) {
                        if(data.code == 200){
                            layer.msg('提交成功', {
                                icon: 6,
                                time: 1000
                            }, function(){
                                setTimeout(function(){
                                    layer.close(index);
                                    //查询已支付信息
                                    $.ajax({
                                        url:'${ctx}/money/queryHouseHasPay/' + houseId
                                        ,type:"post"
                                        ,success:function (data) {
                                            $('#expenditureMoney').val(data.money);
                                        }
                                    });
                                    form.render();
                                    table.reload('expenditureListInfo',{
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }});
                                }, 1500);


                                table.reload('expenditureHouseListInfo',{
                                    page: {
                                        curr: 1 //重新从第 1 页开始
                                    }});
                            });
                        }
                        else {
                            layer.msg("提交失败", {icon: 5});
                        }

                    }
                })
            });
        }

        //甲方查询总收入租金
        function partATotalMoney(){
            var obj ={
                startCreateDate : $('#startCreateDate').val(),
                endCreateDate: $('#endCreateDate').val(),
                partALoginName: username
            };
            $.ajax({
                url: '${ctx}/money/partATotalMoney',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(obj),
                success: function (data ) {
                    $('#totalIncomeMoney').val(data.totalMoney);
                    form.render();

                }
            })
        }

        //甲方查询已收入租金
        function partACurrentMoney(){
            var obj ={
                startCreateDate : $('#startCreateDate').val(),
                endCreateDate: $('#endCreateDate').val(),
                partALoginName: username
            };
            $.ajax({
                url: '${ctx}/money/partAHasMoney',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(obj),
                success: function (data ) {
                    $('#currentIncomeMoney').val(data.currentMoney);
                    form.render();

                }
            })
        }





    });
</script>



</html>
