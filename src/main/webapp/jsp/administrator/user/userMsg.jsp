
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="layui-form" >

                <div class="layui-form-item">
                    <div class="layui-form" style="padding: 20px; ">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
                            <legend style="color: black; font-size: 20px;">用户管理</legend>
                        </fieldset>
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户登录名</label>
                            <div class="layui-input-inline">
                                <div class="layui-input-inline" style="margin-left: 5px;">
                                    <input type="text" name="userLoginName" id="userLoginName" required style="width: 200px;" placeholder="用户登录名" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item" >
                            <label class="layui-form-label">用户状态</label>
                            <div class="layui-input-inline" style=" width: 300px;  margin-left: 5px;" >
                                <select name="status" id="status"  >
                                    <option value="" >请选择</option>
                                    <option value="激活">激活</option>
                                    <option value="封停" >封停</option>
                                </select>
                            </div>
                        </div>
                        <button class="layui-btn" style="margin-left: 300px; width: 300px;" data-type="reload" id="searchBtn" >搜索</button>
                    </div>
                </div>

            </div>

        </div>
        <div  style="margin: 30px;">
            <table class="layui-hide" id="queryUserInfoList" lay-filter="queryUserInfoList"></table>
        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />

</div>

<%--工具条--%>
<script type="text/html" id="queryUserInfoListBar">
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="ban">封停</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="cancel">解封</a>
</script>

<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        var table = layui.table;


        table.render({
            elem:'#queryUserInfoList',
            url: "${ctx}/administrator/queryUser",
            cols: [[
                {field:'userId',title:'会员ID',align: 'center',hide:true}
                ,{field:'userLoginName',title:'会员登录名',align: 'center'}
                ,{field:'userNickname', title: '会员昵称',align: 'center'}
                ,{field:'userStatus', title: '会员状态',align: 'center'}
                ,{field:'userSex',title:'会员性别',align: 'center'}
                ,{field:'userEmail',title:'会员邮箱',align: 'center'}
                ,{field:'userPhone', title: '会员电话',align: 'center'}
                ,{field:'userQq',title:'会员QQ',align: 'center'}
                ,{field:'userWechat',title:'会员微信',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#queryUserInfoListBar',align:'center', width:200}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });




        //表格重载，条件查询 start
        active = {
            reload: function(){
                var userLoginName = $('#userLoginName').val().trim();
                var status = $('#status').val().trim();


                //执行重载
                table.reload('queryUserInfoList', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        userLoginName : userLoginName,
                        status : status
                    }
                });
            }
        };
        //表格重载，条件查询 end

        //监听工具条start
        table.on('tool(queryUserInfoList)', function(obj){
            var data = obj.data;

            //封停事件
            if (obj.event === 'ban'){
                if(data.userStatus == "封停"){
                    layer.msg("账号已封停");
                }else {
                    //封停账号
                    layer.confirm('确认封停？',function (index) {
                        $.ajax({
                            url:'${ctx}/administrator/ban/' + data.userId
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
                                            table.reload('queryUserInfoList',{
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

            }
            //解封事件
            if (obj.event ==='cancel'){
                if(data.userStatus == '激活'){
                    layer.msg('账号已激活');
                }else {
                    //解封账号
                    layer.confirm('确认解封？',function (index) {
                        $.ajax({
                            url:'${ctx}/administrator/cancel/' + data.userId
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
                                            table.reload('queryUserInfoList',{
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
            }


        });
        //监听工具条end

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
