<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房屋租赁管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all">
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
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp" />




    <div class="layui-body">

        <%--记录管理员姓名--%>
        <input id="devName" type="hidden" value="${sessionScope.AdUserName}">

        <div class="layui-form" style="padding: 20px; ">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
                <legend style="color: black; font-size: 20px;">审核报障信息</legend>
            </fieldset>
            <div class="layui-form-item">
                <label class="layui-form-label">房源编号</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-left: 5px;">
                        <input type="text" name="houseId" id="houseId"  style="width: 200px;" placeholder="请输入房源编号" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <button class="layui-btn" style="margin-left: 300px; width: 300px;" data-type="reload" id="searchBtn" >搜索</button>
        </div>

        <div  style="margin: 30px;">
            <table class="layui-hide" id="queryCheckBreakdownInfoList" lay-filter="queryCheckBreakdownInfoList"></table>
        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />
</div>

<%--查看报障信息窗口--%>
<div class="layui-form" id="viewBreakdown" style="display: none; margin: 70px  50px;">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline" style="width: 300px; ">
            <input  type="text"  id="viewTitle" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-inline" style="width: 650px; ">
            <textarea id="viewContent" readonly class="layui-textarea" ></textarea>
        </div>

    </div>

</div>

<%--工具条--%>
<script type="text/html" id="queryCheckBreakdownInfoListBar">
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="view">查看</a>
    <a class="layui-btn layui-btn layui-btn-xs" lay-event="accept">通过</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="reject">未通过</a>
</script>

<script src="${ctx}/static/plugins/layui/layui.js" charset="UTF-8"></script>

<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table','laydate'], function(){
        var element = layui.element;
        var form = layui.form;
        var table = layui.table;
        var $ = layui.$;

        //表格
        table.render({
            elem:'#queryCheckBreakdownInfoList',
            url: "${ctx}/breakdown/queryCheckBreakdown",
            cols: [[
                {field:'id',title:'报障id',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'title', title: '标题',align: 'center'}
                ,{field:'content', title: '内容',align: 'center',hide:true}
                ,{field:'status', title: '状态',align: 'center'}
                ,{field:'partALoginName',title:'甲方登录名',align: 'center'}
                ,{field:'partBLoginName',title:'乙方登录名',align: 'center'}
                ,{field:'createDateString',title:'创建时间',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#queryCheckBreakdownInfoListBar',align:'center', width:200}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //监听工具条start
        table.on('tool(queryCheckBreakdownInfoList)', function(obj){
            var data = obj.data;

            //查看事件
            if (obj.event === 'view'){
                //查看报障
                viewBreakdown(data.id, data.title, data.content);
            }
            //通过事件
            if (obj.event ==='accept'){
                acceptBreakdown(data.id);
            }
            //未通过事件
            if (obj.event === 'reject'){
                rejectBreakdown(data.id);
            }

        });
        //监听工具条end

        //查看报障
        function viewBreakdown(id, title,content) {
            layer.open({
                type: 1,
                title: '查看报障信息',
                area:['1000px','400px'],
                content:$("#viewBreakdown"),
                success:function () {
                    $('#viewTitle').val(title);
                    $('#viewContent').val(content);
                }
            })
        }

        var devName = $('#devName').val();

        //通过报障
        function acceptBreakdown(id) {
            layer.confirm('确认通过？',function (index) {
                $.ajax({
                    url:'${ctx}/breakdown/acceptBreakdown/' + id + '/' + devName
                    ,type:"post"
                    ,success:function (msg) {
                        if (msg.code == 200){
                            layer.msg('通过成功', {
                                icon: 6,
                                time: 1000
                            }, function(){
                                layer.load();
                                setTimeout(function(){
                                    layer.closeAll();
                                    table.reload('queryCheckBreakdownInfoList',{
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

        //未通过报障
        function rejectBreakdown(id) {
            layer.confirm('确认未通过？',function (index) {
                $.ajax({
                    url:'${ctx}/breakdown/rejectBreakdown/' + id + '/' + devName
                    ,type:"post"
                    ,success:function (msg) {
                        if (msg.code == 200){
                            layer.msg('操作成功', {
                                icon: 6,
                                time: 1000
                            }, function(){
                                layer.load();
                                setTimeout(function(){
                                    layer.closeAll();
                                    table.reload('queryCheckBreakdownInfoList',{
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


        //表格重载，条件查询 start
        active = {
            reload: function(){
                var houseId = $('#houseId').val().trim();


                //执行重载
                table.reload('queryCheckBreakdownInfoList', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        houseId : houseId

                    }
                });
            }
        };
        //表格重载，条件查询 end



        //条件查询提交 start
        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //条件查询提交 end


    });


</script>


</body>
</html>

