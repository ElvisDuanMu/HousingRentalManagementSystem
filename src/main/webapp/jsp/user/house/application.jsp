

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <title>用户中心_申请管理</title>
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
  <body>
    <div class="user-main">
        <div class="main-left fl">
            <div style="height: 80px; width: 80px; margin: 0 auto;" >
                <img src="${ctx}${sessionScope.userImg}" style="width: 80px ;height: 80px;">
            </div>
            <div class="user-name" style="padding: 15px 0 5px 0;">欢迎你，${sessionScope.Username} </div>
            <%--存登陆人--%>
            <input type="hidden" value="${sessionScope.Username}" id="username">
            <div class="user-name" style="padding: 0 0 15px 0;"><a id="logout" href="${ctx}/user/quit" >退出</a></div>
            <ul>
                <li><a href="${ctx}/user/index/${sessionScope.Username}">首页</a></li>
                <li class="hover"> <a href="${ctx}/user/application/${sessionScope.Username}">申请管理</a></li>
                <li><a href="${ctx}/user/houseInfo/${sessionScope.Username}">我的房源</a></li>
                <li><a href="${ctx}/user/contract/${sessionScope.Username}">我的合同</a></li>
                <li><a href="${ctx}/user/money/${sessionScope.Username}">我的收入</a></li>
                <li><a href="${ctx}/user/breakdown/${sessionScope.Username}">报障信息</a></li>
                <li><a href="${ctx}/user/message/${sessionScope.Username}">编辑资料</a></li>
            </ul>
        </div>
        <div class="main-right fr" style="min-height: 600px;">
            <div id="allList">
                <%--标题--%>
                <div class="title">您的申请信息</div>
                <%--内容--%>
                <div>
                    <%--选项卡--%>
                    <div class="layui-tab layui-tab-brief" lay-filter="wayInfo">
                        <ul class="layui-tab-title">
                            <li class="layui-this">我申请的</li>
                            <li>处理申请</li>
                            <li>已完成的</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <%--我发出的申请列表--%>
                                <div  style="margin-top: 20px;">
                                    <table class="layui-hide" id="applicationListInfo" lay-filter="applicationListInfo"></table>
                                </div>
                            </div>
                            <div class="layui-tab-item">
                                <%--处理别人的申请--%>
                                <div  style="margin-top: 20px;">
                                    <table class="layui-hide" id="otherApplicationListInfo" lay-filter="otherApplicationListInfo"></table>
                                </div>
                            </div>
                            <div class="layui-tab-item">
                                <%--处理已完成的申请--%>
                                <div  style="margin-top: 20px;">
                                    <table class="layui-hide" id="finishApplicationListInfo" lay-filter="finishApplicationListInfo"></table>
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

    <%--申请工具条--%>
    <script type="text/html" id="applicationBar" >
        <a class="layui-btn layui-btn layui-btn-xs " lay-event="view">查看</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="undo">撤销</a>
    </script>

    <%--其他申请工具条--%>
    <script type="text/html" id="otherApplicationBar" >
        <a class="layui-btn layui-btn layui-btn-xs " lay-event="accept">通过</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs " lay-event="reject">拒绝</a>
    </script>

    <%--已完成申请工具条--%>
    <script type="text/html" id="finishApplicationListInfoBar" >
        <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="viewContract">查看合同</a>
    </script>

  </body>

<script type="text/javascript" src="${ctx}/static/js/jquery-2.1.4.min.js"></script>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'laypage', 'jquery', 'slider','util','element','layer','table'], function () {
        var form = layui.form;
        var laypage = layui.laypage;
        var $ = layui.jquery;
        var slider = layui.slider;
        var util = layui.util;
        var element = layui.element;
        var layer = layui.layer;
        var table = layui.table;


        //监听选项卡
        element.on('tab(wayInfo)', function(data){

            // ReloadData(data.index);

        });


        var username = $('#username').val();

        //我申请的表格
        table.render({
            elem:'#applicationListInfo',
            url: "${ctx}/house/houseInfo/application/"+ username,
            cols: [[
                {field:'id',title:'申请编号',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partAName', title: '房主',align: 'center'}
                ,{field:'partBName', title: '申请人',align: 'center',hide:true}
                ,{field:'status', title: '状态',align: 'center'}
                ,{field:'createDateString', title: '申请时间',align: 'center'}
                ,{field:'updateDateString', title: '处理时间',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#applicationBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });


        //处理别人的申请表格
        table.render({
            elem:'#otherApplicationListInfo',
            url: "${ctx}/house/houseInfo/otherApplication/"+ username,
            cols: [[
                {field:'id',title:'申请编号',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partAName', title: '房主',align: 'center',hide:true}
                ,{field:'partBName', title: '申请人',align: 'center'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{field:'createDateString', title: '申请时间',align: 'center'}
                ,{field:'updateDateString', title: '处理时间',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#otherApplicationBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5,
        });

        //监听别人的申请工具条
        table.on('tool(otherApplicationListInfo)',function (obj) {
            var data = obj.data;

            //通过事件
            if(obj.event === 'accept'){
                layer.confirm('确定通过？',function (index) {
                    $.ajax({
                        url:'${ctx}/house/houseInfo/acceptApplication'
                        ,type:"post"
                        ,data:{id:data.id, houseId:data.houseId, partALoginName:data.partAName, partBLoginName: data.partBName}
                        ,success:function (msg) {
                            if (msg.code == 200){
                                layer.msg('通过成功', {
                                    icon: 6,
                                    time: 1000
                                }, function(){
                                    layer.load();
                                    setTimeout(function(){
                                        layer.closeAll();
                                        table.reload('otherApplicationListInfo',{
                                            page: {
                                                curr: 1 //重新从第 1 页开始
                                            }});
                                    }, 1500);
                                    table.reload('finishApplicationListInfo',{
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }});
                                });
                            }else {
                                layer.msg("操作失败",{icon:5});
                            }
                        }
                    })
                })
            }

            //拒绝事件
            if(obj.event === 'reject'){
                layer.confirm('确定拒绝？',function (index) {
                    $.ajax({
                        url:'${ctx}/house/houseInfo/rejectApplication'
                        ,type:"post"
                        ,data:{id:data.id, houseId:data.houseId, partALoginName:data.partAName, partBLoginName: data.partBName}
                        ,success:function (msg) {
                            if (msg.code == 200){
                                layer.msg('拒绝成功', {
                                    icon: 6,
                                    time: 1000
                                }, function(){
                                    layer.load();
                                    setTimeout(function(){
                                        layer.closeAll();
                                        table.reload('otherApplicationListInfo',{
                                            page: {
                                                curr: 1 //重新从第 1 页开始
                                            }});
                                    }, 1500);
                                    table.reload('finishApplicationListInfo',{
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }});
                                });
                            }else {
                                layer.msg("操作失败",{icon:5});
                            }
                        }
                    })
                })
            }
        });


        //已完成的申请表格
        table.render({
            elem:'#finishApplicationListInfo',
            url: "${ctx}/house/houseInfo/finishApplication/"+ username,
            cols: [[
                {field:'id',title:'申请编号',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partAName', title: '房主',align: 'center'}
                ,{field:'partBName', title: '申请人',align: 'center'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{field:'createDateString', title: '申请时间',align: 'center'}
                ,{field:'updateDateString', title: '处理时间',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#finishApplicationListInfoBar',align:'center', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //监听已完成的申请工具条
        table.on('tool(finishApplicationListInfo)',function (obj) {
            var data = obj.data;

            //查看合同
            if(obj.event === 'viewContract'){
               if (data.status == '申请被拒绝') {
                   layer.msg("申请已被拒绝，没有合同。");
               }
               else
               {
                   window.location.href= '${ctx}/user/contract/' + username;
               }
            }


        });

        //监听我的申请工具条
        table.on('tool(applicationListInfo)',function (obj) {
            var data = obj.data;

            //查看合同
            if(obj.event === 'view'){
                window.location.href= '${ctx}/house/houseDetail/' + data.houseId;
            }

            //撤销活动
            if(obj.event === 'undo'){
                layer.confirm('确定撤销？',function () {

                    //添加报障信息
                    $.ajax({
                        url:'${ctx}/house/undoApplication/' + data.id
                        ,type: 'post'
                        ,success:function (msg) {
                            if (msg.code == 200){
                                layer.msg('撤销成功', {
                                    icon: 6,
                                    time: 1000
                                }, function(){
                                    layer.load();
                                    setTimeout(function(){
                                        layer.closeAll();
                                        table.reload('applicationListInfo',{
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
            }


        });


    });
</script>

</html>

