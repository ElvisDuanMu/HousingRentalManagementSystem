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

        <div class="layui-form" style="padding: 20px; margin-top: 50px;">
            <div class="layui-form-item">
                <label class="layui-form-label">省/直辖市</label>
                <div class="layui-input-inline" >
                    <select name="province" id="province" lay-filter="province" lay-search>
                        <option value="">-请选择-</option>
                        <c:forEach items="${province}" var="obj">
                            <option value="${obj.provinceCode}" >${obj.provinceName}</option>

                        </c:forEach>
                    </select>
                </div>
                <label class="layui-form-label">市</label>
                <div class="layui-input-inline">
                    <select name="city" id="city" lay-filter="city" lay-search>
                        <option value="">-请选择-</option>
                    </select>
                </div>
                <label class="layui-form-label">区</label>
                <div class="layui-input-inline">
                    <select name="district" id="district" lay-filter="district" lay-search>
                        <option value="">-请选择-</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户昵称</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" >
                        <input type="text" name="userLoginName" id="userLoginName"  style="width: 200px;" placeholder="请输入用户昵称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <label class="layui-form-label" >房源编号</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" >
                        <input type="text" name="houseId" id="houseId"  style="width: 200px;" placeholder="请输入房源编号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <label class="layui-form-label" >小区名称</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" >
                        <input type="text" name="addressCommunity" id="addressCommunity"  style="width: 200px;" placeholder="请输入小区名称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <label class="layui-form-label" >租赁状态</label>
                <div class="layui-input-inline">
                    <select name="status" id="status" lay-filter="status" lay-search>
                        <option value="">-请选择-</option>
                        <option value="正在出租">正在出租</option>
                        <option value="已退租">已退租</option>
                        <option value="已结束">已结束</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label" style="margin-top: 10px;" >审核人</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-top: 10px;">
                        <input type="text" name="checkBy" id="checkBy"  style="width: 200px;" placeholder="请输入审核人" autocomplete="off" class="layui-input">
                    </div>
                </div>


                <label class="layui-form-label">创建日期范围</label>
                <div class="layui-input-inline" style="margin-top: 10px;">
                    <input type="text" class="layui-input" id="date" placeholder=" - " readonly>
                    <input type="hidden" id="startCreateDate" value="" >
                    <input type="hidden" id="endCreateDate" value="" >
                </div>
            </div>

            <button class="layui-btn" style="margin-left: 300px; width: 300px;" data-type="reload" id="searchBtn" >搜索</button>
        </div>

        <div  style="margin: 30px;">
            <table class="layui-hide" id="queryHouseTransferList" lay-filter="queryHouseTransferList"></table>
        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />
</div>


<%--工具条--%>
<script type="text/html" id="queryHouseTransferListBar">
    <a class="layui-btn layui-btn-warm layui-btn-xs " lay-event="end">结束</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="stop">停租</a>
</script>

<script src="${ctx}/static/plugins/layui/layui.js" charset="UTF-8"></script>

<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table','laydate'], function(){
        var element = layui.element;
        var form = layui.form;
        var table = layui.table;
        var $ = layui.$;
        var laydate = layui.laydate;

        //省市联动start
        form.on('select(province)',function () {
            //获取provinceCode值
            var provinceCode = $('#province').val();
            if(provinceCode == '' ){
                //清空
                var html="<option value=\"\">-请选择-</option>";
                $('#city').html(html);
                $('#district').html(html);
                form.render();
                return ;
            }else {
                var html="<option value=\"\">-请选择-</option>";
                $('#district').html(html);
                form.render();
                $.ajax({
                    url:'${ctx}/regionSettings/queryCityByProvinceCode/' + provinceCode,
                    type:'get',
                    success:function (data) {
                        //根据data修改数据，重新渲染即可
                        var html="<option value=\"\">-请选择-</option>";
                        var len = data.length;
                        for(var i = 0; i <len;i++){
                            html += '<option value="' + data[i].cityCode +'">' + data[i].cityName +'</option>';
                        }
                        //选择level2更新
                        $('#city').html(html);
                        form.render();
                    }
                })
            }
        })
        //省市联动end

        //市区联动start
        form.on('select(city)',function () {
            //获取provinceCode值
            var cityCode = $('#city').val();
            if(cityCode == ''){
                //清空
                var html="<option value=\"\">-请选择-</option>";
                $('#district').html(html);
                form.render();
                return ;
            }else {
                $.ajax({
                    url:'${ctx}/regionSettings/queryDistrictByCity/' + cityCode,
                    type:'get',
                    success:function (data) {
                        //根据data修改数据，重新渲染即可
                        var html="<option value=\"\">-请选择-</option>";
                        var len = data.length;
                        for(var i = 0; i <len;i++){
                            html += '<option value="' + data[i].districtCode +'">' + data[i].districtName +'</option>';
                        }
                        //选择level2更新
                        $('#district').html(html);
                        form.render();
                    }
                })
            }
        })
        //市区联动end


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

        //表格
        table.render({
            elem:'#queryHouseTransferList',
            url: "${ctx}/houseTransfer/queryHouseTransfer",
            cols: [[
                {field:'id',title:'id',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'contractNumber', title: '合同编号',align: 'center'}
                ,{field:'partALoginName', title: '房主（甲方）',align: 'center'}
                ,{field:'partBLoginName', title: '申请人（乙方）',align: 'center'}
                ,{field:'partAName',title:'甲方姓名',align: 'center'}
                ,{field:'partBName',title:'乙方姓名',align: 'center'}
                ,{field:'createBy',title:'审核人',align: 'center'}
                ,{field:'createTimeString',title:'创建时间',align: 'center'}
                ,{field:'startTimeString',title:'起始时间',align: 'center'}
                ,{field:'endTimeString',title:'结束时间',align: 'center'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#queryHouseTransferListBar',align:'center', width:200}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //监听工具条start
        table.on('tool(queryHouseTransferList)', function(obj){
            var data = obj.data;

            //结束事件
            if (obj.event === 'end'){
                if (data.status == '已结束'){
                    layer.msg("已结束");
                } else if (data.status == '已退租'){
                    layer.msg("已退租")
                } else {
                    layer.confirm('确认结束？',function (index) {
                        $.ajax({
                            url:'${ctx}/houseTransfer/end/' + data.houseId
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
                                            table.reload('queryHouseTransferList',{
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
            //停租事件
            if (obj.event ==='stop'){
                if (data.status == '已结束'){
                    layer.msg("已结束");
                } else if (data.status == '已退租'){
                    layer.msg("已退租");
                }else {
                    layer.confirm('确认退租？',function (index) {
                        $.ajax({
                            url:'${ctx}/houseTransfer/stop/' + data.houseId
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
                                            table.reload('queryHouseTransferList',{
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



        var devName = $('#devName').val();

        //表格重载，条件查询 start
        active = {
            reload: function(){
                var province = $('#province').val();
                var city  = $('#city').val();
                var district = $('#district').val();
                var userLoginName = $('#userLoginName').val();
                var houseId = $('#houseId').val();
                var addressCommunity = $('#addressCommunity').val();
                var status = $('#status').val();
                var startCreateDateString = $('#startCreateDate').val();
                var endCreateDateString = $('#endCreateDate').val();
                var checkBy = $('#checkBy').val();

                //执行重载
                table.reload('queryHouseTransferList', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        province : province,
                        city: city,
                        district : district,
                        userLoginName : userLoginName,
                        houseId: houseId,
                        addressCommunity : addressCommunity,
                        status: status,
                        startCreateDateString : startCreateDateString,
                        endCreateDateString: endCreateDateString,
                        checkBy : checkBy
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

