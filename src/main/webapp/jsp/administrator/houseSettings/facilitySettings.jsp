
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房屋租赁管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp" />

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div  style="margin: 30px;">
                <table class="layui-hide" id="tableSettings" lay-filter="test" ></table>
            </div>

        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />

</div>
<%--工具条--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script type="text/html" id="show_img"> <div><img style="height: 100%"  src="{{d.facilityImgRelPath}}" /></div></script>
<style type="text/css">
    .layui-table-cell {
        height: 50px;
        line-height: 50px;
    }
</style>

<script>
    //JavaScript代码区域

    layui.use(['element','table'], function(){
        var element = layui.element;
        var table = layui.table;

        //表格
        var tableIns = table.render({
            elem:'#tableSettings',
            url: "${ctx}/facilitySettings/${sessionScope.AdUserName}/queryFacilities",
            cols: [[
                {field:'facilityId',title:'设施编号',hide:true}
                ,{field:'facilityName', title: '设施名称',align: 'center'}
                ,{field:'facilityImgRelPath', title: '设施图标',align: 'center',templet:'#show_img'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5,
            id: 'testReload',

        });

    });
</script>
</body>
</html>
