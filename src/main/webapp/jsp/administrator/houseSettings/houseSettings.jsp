<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房屋租赁管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp" />




    <div class="layui-body">

            <div class="layui-form" style="padding: 20px;">
                <div class="layui-form-item">
                    <label class="layui-form-label">类型名称</label>
                    <div class="layui-input-inline">
                        <select class="layui-input-inline" id="typeName" name="typeName" lay-verify="required">
                            <option value=""></option>
                            <c:forEach items="${HSTypeName}" var="obj">
                                <option value="${obj.typeName}">${obj.typeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="layui-form-label">创建人</label>
                    <div class="layui-input-inline">
                        <select class="layui-input-inline" id="createBy" name="createBy" lay-verify="required">
                            <option value=""></option>
                            <c:forEach items="${AdName}" var="obj">
                                <option value="${obj.administratorName}">${obj.administratorName}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <label class="layui-form-label">修改人</label>
                    <div class="layui-input-inline">
                        <select class="layui-input-inline" id="updateBy" name="updateBy" lay-verify="required">
                            <option value=""></option>
                            <c:forEach items="${AdName}" var="obj">
                                <option value="${obj.administratorName}">${obj.administratorName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">创建日期范围</label>
                        <div class="layui-input-inline" style="margin-top: 10px;">
                            <input type="text" class="layui-input" id="date" placeholder=" - " readonly>
                            <input type="hidden" id="startCreateDate" value="" >
                            <input type="hidden" id="endCreateDate" value="" >
                        </div>
                    </div>
                </div>
                <button class="layui-btn" data-type="reload" id="btn">搜索</button>
            </div>

        <div  style="margin: 30px;">
            <table class="layui-hide" id="tableSettings" lay-filter="test"></table>
        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />
</div>

<%--弹出表单信息--%>
<div class="layui-form" id="popUpdateForm" style="display: none">
    <input type="hidden" id="houseId" name="houseId">
    <div class="layui-form-item" style="margin-top: 50px;">
        <label class="layui-form-label">类型名称</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="typeName2" readonly autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" >
        <label class="layui-form-label">具体名称</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="valueName2"  autocomplete="off" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item" >
        <button class="layui-btn" lay-submit lay-filter="updateBtn" style="margin-left: 100px; width: 100px;">修改</button>
    </div>
</div>

<%--工具条--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="${ctx}/static/plugins/layui/layui.js" charset="UTF-8"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table','laydate'], function(){
        var element = layui.element;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;

        //表格
        var tableIns = table.render({
            elem:'#tableSettings',
            url: "${ctx}/houseSettings/${sessionScope.AdUserName}/querySettings",
            cols: [[
                {field:'settingsId',title:'设置编号',hide:true}
                ,{field:'typeCode', title: '类型代码',align: 'center',width:250}
                ,{field:'typeName', title: '类型名称',align: 'center'}
                ,{field:'valueId', title: '编号',align: 'center'}
                ,{field:'valueName', title: '名称',align: 'center'}
                ,{field:'createBy', title: '创建人',align: 'center'}
                ,{field:'createDateString', title: '创建时间',align: 'center',width:200}
                ,{field:'updateBy', title: '修改人', align: 'center'}
                ,{field:'updateDateString', title: '修改时间',align: 'center',width:200}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5,
            id: 'testReload'
        });

        //监听工具条start
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的要删除么', function(index){
                    $.ajax({
                        url:'${ctx}/houseSettings/${sessionScope.AdUserName}/deleteSetting'
                        ,type:"post"
                        ,data:{settingsId:data.settingsId}
                        ,success:function (msg) {
                            if (msg.code == 200){
                                layer.msg('删除成功', {
                                    icon: 6,
                                    time: 1000
                                }, function(){
                                    layer.load();
                                    setTimeout(function(){
                                        layer.closeAll();
                                        table.reload('testReload',{
                                            page: {
                                                curr: 1 //重新从第 1 页开始
                                            }});
                                    }, 1500);
                                });
                            }else {
                                layer.msg("删除失败",{icon:5});
                            }
                        }
                    })
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type:1,
                    title:'修改房间设置信息',
                    area:['420px','330px'],
                    content:$("#popUpdateForm"),
                    success: function (layero,index) {
                        $('#typeName2').val(data.typeName);
                        $('#valueName2').val(data.valueName);
                        form.render();
                        setFormValue(obj,data);
                    }
                });

            }
        });
        //监听工具条end

        //修改数据 start
        function setFormValue(obj,data){
            form.on('submit(updateBtn)',function (message) {
                $.ajax({
                    url:"${ctx}/houseSettings/${sessionScope.AdUserName}/updateSetting"
                    ,type:'post'
                    ,data:{settingsId:data.settingsId,typeName: $('#typeName2').val(),
                            valueName: $('#valueName2').val()}
                    ,success:function (msg) {
                        if(msg.code == 200){
                            layer.msg('修改成功', {
                                icon: 6,
                                time: 1000
                            }, function(){
                                layer.load();
                                setTimeout(function(){
                                    layer.closeAll();
                                    table.reload('testReload',{
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }});
                                }, 1500);
                            });
                        }
                        else {
                            layer.msg("修改失败", {icon: 5});
                        }
                    }


                })

            })
        }
        //修改数据 end


        //日期范围 start
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
            }
        });
        //日期范围 end


        //表格重载，条件查询 start
        var $ = layui.$, active = {
            reload: function(){
                var typeName = $('#typeName');
                var createBy = $('#createBy');
                var updateBy = $('#updateBy');
                var startCreateDate = $('#startCreateDate');
                var endCreateDate = $('#endCreateDate');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        typeName: typeName.val(),
                        createBy: createBy.val(),
                        updateBy: updateBy.val(),
                        startCreateDate : startCreateDate.val(),
                        endCreateDate : endCreateDate.val()

                    }
                });
            }
        };
        //表格重载，条件查询 end



        //条件查询提交 start
        $('#btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //条件查询提交 end


    });


</script>


</body>
</html>
