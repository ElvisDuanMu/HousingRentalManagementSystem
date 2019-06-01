
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <title>用户中心_买房卖房用户</title>
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
            <li><a href="${ctx}/user/houseInfo/${sessionScope.Username}">我的房源</a></li>
            <li><a href="${ctx}/user/contract/${sessionScope.Username}">我的合同</a></li>
            <li ><a href="${ctx}/user/money/${sessionScope.Username}">我的收入</a></li>
            <li class="hover"><a href="${ctx}/user/breakdown/${sessionScope.Username}">报障信息</a></li>
            <li><a href="${ctx}/user/message/${sessionScope.Username}">编辑资料</a></li>
        </ul>
    </div>
    <div class="main-right fr" style="min-height: 600px;">
        <div id="allList">
            <div class="title">报障信息</div>
            <%--选项卡--%>
            <div class="layui-tab layui-tab-brief" lay-filter="wayInfo">
                <ul class="layui-tab-title">
                    <li class="layui-this">进行的房源</li>
                    <li>待处理的报障</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <%--进行的房源信息--%>

                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="runningHouseListInfo" lay-filter="runningHouseListInfo"></table>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <%--待处理的报障信息--%>
                        <div  style="margin-top: 20px;">
                            <table class="layui-hide" id="manageBreakdownListInfo" lay-filter="manageBreakdownListInfo"></table>
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

</body>




<%--乙方填写信息--%>
<div class="layui-form" id="addBreakdown" style="display: none; margin: 70px  50px;">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline" style="width:650px; ">
                <input  type="text"  id="title" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" >
            </div>
        </div>


    <div class="layui-form-item">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-inline" style="width: 650px; ">
            <textarea id="content"  lay-verify="required" placeholder="请输入内容" class="layui-textarea" ></textarea>
        </div>

    </div>
    <div class="layui-form-item" >
        <button class="layui-btn" lay-submit lay-filter="submit" style="margin-left: 100px; margin-top: 20px; width: 100px;">提交</button>
    </div>
</div>

<%--乙方修改信息--%>
<div class="layui-form" id="updateBreakdown" style="display: none; margin: 70px  50px;">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline" style="width:650px; ">
            <input  type="text"  id="updateTitle" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" >
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-inline" style="width: 650px; ">
            <textarea id="updateContent"  lay-verify="required" placeholder="请输入内容" class="layui-textarea" ></textarea>
        </div>

    </div>
    <div class="layui-form-item" >
        <button class="layui-btn" lay-submit lay-filter="submitUpdate" style="margin-left: 100px; margin-top: 20px; width: 100px;">提交</button>
    </div>
</div>

<div class="layui-form" id="houseBreakdown" style="display: none; margin: 70px  50px;">
    <div class="layui-form-item">
        <label class="layui-form-label">房源编号</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  style="text-align: center" type="text"  id="houseId" readonly  autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">出租人账号</label>
        <div class="layui-input-inline" style="width: 150px; ">
            <input  type="text"  id="partALoginName" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>

    <%--房源故障信息列表--%>
    <div  style="margin-top: 20px;">
        <table class="layui-hide" id="houseBreakdownInfoList" lay-filter="houseBreakdownInfoList"></table>
    </div>

</div>
<%--在租房源工具条--%>
<script type="text/html" id="runningHouseListInfoBar" >
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="view">查看</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs " lay-event="add">添加</a>
</script>

<%--故障信息列表工具条--%>
<script type="text/html" id="houseBreakdownInfoListBar" >
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs " lay-event="confirm">确认</a>
</script>

<%--确认房源故障信息列表工具条--%>
<script type="text/html" id="manageBreakdownListInfoBar" >
    <a class="layui-btn layui-btn-danger layui-btn-xs " lay-event="confirm">确认</a>
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




        //在租房源信息查看
        table.render({
            elem:'#runningHouseListInfo',
            url: "${ctx}/houseTransfer/queryRunningHouse",
            where: {partBLoginName : username},
            cellMinWidth:200,
            cols: [[
                {field:'transferId',title:'租赁id',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partALoginName', title: '出租人（甲方）',align: 'center'}
                ,{field:'partBLoginName', title: '承租人（乙方）',align: 'center',hide:true}
                ,{field:'startTimeString', title: '开始时间',align: 'center'}
                ,{field:'endTimeString', title: '结束时间',align: 'center'}
                ,{field:'createTimeString', title: '创建时间',align: 'center'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#runningHouseListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //确认房源故障信息
        table.render({
            elem:'#manageBreakdownListInfo',
            url: "${ctx}/breakdown/queryManageBreakdown/" + username,
            cols: [[
                {field:'id',title:'故障id',align: 'center',hide:true}
                ,{field:'partALoginName', title: '出租人（甲方）',align: 'center',hide:true}
                ,{field:'partBLoginName', title: '承租人（乙方）',align: 'center',hide:true}
                ,{field:'title', title: '标题',align: 'center'}
                ,{field:'content', title: '内容',align: 'center'}
                ,{field:'createDateString', title: '创建时间',align: 'center'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{field:'solveDateString', title: '解决时间',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#manageBreakdownListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5,
        });

        //监听在租房源信息工具条
        table.on('tool(runningHouseListInfo)',function (obj) {
            var data = obj.data;

            //查看事件
            if (obj.event === 'view'){
                viewBreakDownInfo(data.houseId);
            }

            //添加事件
            if(obj.event === 'add'){
                addNewBreakDownInfo(data.houseId , data.partALoginName , data.partBLoginName);
            }

        });

        function viewBreakDownInfo(houseId) {
            layer.open({
                type: 1,
                title: '查看房源报障信息',
                area:['1000px','800px'],
                content:$("#houseBreakdown"),
                success:function () {
                    $('#houseId').val(houseId);
                    table.render({
                        elem:'#houseBreakdownInfoList',
                        url: "${ctx}/breakdown/queryBreakdown/" + houseId,
                        cols: [[
                            {field:'id',title:'故障id',align: 'center',hide:true}
                            ,{field:'partALoginName', title: '出租人（甲方）',align: 'center',hide:true}
                            ,{field:'partBLoginName', title: '承租人（乙方）',align: 'center',hide:true}
                            ,{field:'title', title: '标题',align: 'center'}
                            ,{field:'content', title: '内容',align: 'center'}
                            ,{field:'createDateString', title: '创建时间',align: 'center'}
                            ,{field:'status', title: '状态',align: 'center'}
                            ,{field:'solveDateString', title: '解决时间',align: 'center'}
                            ,{fixed: 'right', title:'操作', toolbar: '#houseBreakdownInfoListBar',align:'center', width:150}
                        ]],
                        page:true,
                        limits:[5,10,15],
                        limit:5,
                        done: function(res, curr, count) {
                            $('#partALoginName').val(res.data[0].partALoginName);
                            form.render();
                        }
                    });

                }
            })
        }


        function addNewBreakDownInfo(houseId , partALoginName, partBLoginName) {
            layer.open({
                type: 1,
                title: '添加报障信息',
                area:['1000px','400px'],
                content:$("#addBreakdown"),
                success:function () {
                    form.on('submit(submit)',function () {
                        layer.confirm('确定？',function () {
                            var obj = {
                                houseId: houseId,
                                title : $('#title').val().trim(),
                                content  :  $('#content').val().trim(),
                                partALoginName: partALoginName,
                                partBLoginName : partBLoginName
                            };

                            //添加报障信息
                            $.ajax({
                                url:'${ctx}/breakdown/addBreakdown'
                                ,type: 'post'
                                ,contentType: 'application/json'
                                ,data: JSON.stringify(obj)
                                ,success:function (msg) {
                                    if (msg.code == 200){
                                        layer.msg('添加成功', {
                                            icon: 6,
                                            time: 1000
                                        }, function(){
                                            layer.load();
                                            setTimeout(function(){
                                                layer.closeAll();
                                                table.reload('runningHouseListInfo',{
                                                    page: {
                                                        curr: 1 //重新从第 1 页开始
                                                    }});
                                            }, 1500);
                                        });
                                    }else {
                                        layer.msg("操作失败",{icon:5});
                                    }

                                }
                            })

                        })
                    });

                }
            })
        }


        //监听故障信息列表工具条
        table.on('tool(houseBreakdownInfoList)',function (obj) {
            var data = obj.data;
            //编辑事件
            if (obj.event === 'edit'){
                if (data.status == '审核未通过'){
                    updateMsg(data.id,data.title,data.content);
                } else {
                    layer.msg("没有修改权限")
                }
            }

            //查看事件
            if (obj.event === 'confirm'){
                if (data.status == '等待甲方确认'){
                    layer.msg("请等待甲方确认后再确认");
                } else if(data.status == '已完成'){
                    layer.msg("已完成");
                }else if(data.status == '等待审核'){
                    layer.msg("正在审核中")
                }
                else if(data.status == '审核未通过'){
                    layer.msg("审核未通过，请修改")
                }
                else {
                    partBConfirm(data.id);
                }
            }
            

        });

        //乙方修改信息
        function updateMsg(id,title,content) {
            layer.open({
                type: 1,
                title: '添加报障信息',
                area:['1000px','400px'],
                content:$("#updateBreakdown"),
                success:function () {
                    $('#updateTitle').val(title);
                    $('#updateContent').val(content);
                    form.on('submit(submitUpdate)',function () {
                        layer.confirm('确定？',function () {
                            var obj = {
                                id: id,
                                title : $('#updateTitle').val().trim(),
                                content  :  $('#updateContent').val().trim(),
                            };

                            //添加报障信息
                            $.ajax({
                                url:'${ctx}/breakdown/updateBreakdown'
                                ,type: 'post'
                                ,contentType: 'application/json'
                                ,data: JSON.stringify(obj)
                                ,success:function (msg) {
                                    if (msg.code == 200){
                                        layer.msg('修改成功', {
                                            icon: 6,
                                            time: 1000
                                        }, function(){
                                            layer.load();
                                            setTimeout(function(){
                                                layer.closeAll();
                                                table.reload('runningHouseListInfo',{
                                                    page: {
                                                        curr: 1 //重新从第 1 页开始
                                                    }});
                                            }, 1500);
                                        });
                                    }else {
                                        layer.msg("操作失败",{icon:5});
                                    }

                                }
                            })

                        })
                    });

                }
            })
        }

        //乙方确认
        function partBConfirm(id) {
             layer.confirm('确定？',function (index) {
                $.ajax({
                    url:'${ctx}/breakdown/partBConfirm/' + id
                    ,type: 'post'
                    ,beforeSend: function (request) {
                             index = layer.load();
                        }
                    ,success:function (msg) {
                        if (msg.code == 200){
                            layer.msg('确认成功', {
                                icon: 6,
                                time: 1000
                            }, function(){
                                layer.close(index);
                                setTimeout(function(){
                                    table.reload('houseBreakdownInfoList',{
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }});
                                }, 1500);
                            });
                        }else {
                            layer.msg("确认失败",{icon:5});
                        }

                    }
                })

            })
        }


        //监听确认房源故障信息列表工具条
        table.on('tool(manageBreakdownListInfo)',function (obj) {
            var data = obj.data;

            //查看事件
            if (obj.event === 'confirm'){
                if (data.status == '已完成'){
                    layer.msg("已完成");
                } else if(data.status == '处理中'){
                    layer.msg("您已确认过");
                }else {
                    partAConfirm(data.id);
                }
            }


        });


        //甲方确认
        function partAConfirm(id) {
            layer.confirm('确定？',function () {
                $.ajax({
                    url:'${ctx}/breakdown/partAConfirm/' + id
                    ,type: 'post'
                    ,success:function (msg) {
                        if (msg.code == 200){
                            layer.msg('确认成功', {
                                icon: 6,
                                time: 1000
                            }, function(){
                                layer.load();
                                setTimeout(function(){
                                    layer.closeAll();
                                    table.reload('manageBreakdownListInfo',{
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }});
                                }, 1500);
                            });
                        }else {
                            layer.msg("确认失败",{icon:5});
                        }

                    }
                })

            })

        }














    });
</script>



</html>
