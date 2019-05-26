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
                <div class="layui-inline">
                    <label class="layui-form-label">时间查询</label>
                    <div class="layui-input-inline" >
                        <input type="text" class="layui-input" id="date" placeholder=" - " readonly>
                        <input type="hidden" id="startCreateDate" value="" >
                        <input type="hidden" id="endCreateDate" value="" >
                    </div>
                </div>
                <label class="layui-form-label">负责人</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-left: 5px;">
                        <input type="text" name="checkBy" id="checkBy" required style="width: 180px;" placeholder="负责人" autocomplete="off" class="layui-input">
                    </div>
                </div>

            </div>
            <button class="layui-btn" style="margin-left: 300px; width: 300px;" data-type="reload" id="searchBtn" >搜索</button>
        </div>

        <div  style="margin: 30px;">
            <table class="layui-hide" id="queryMoneyInfoList" lay-filter="queryMoneyInfoList"></table>
        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />
</div>


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
<script type="text/html" id="queryMoneyInfoListBar">
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="view">查看</a>
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
        });
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
        });
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
            elem:'#queryMoneyInfoList',
            url: "${ctx}/money/queryAdMoney",
            cols: [[
                {field:'transferId',title:'租赁id',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'partALoginName', title: '出租人',align: 'center'}
                ,{field:'partAIntermediaryCosts', title: '出租人服务费(元)',align: 'center',templet:'<div>{{d.contract.partAIntermediaryCosts}}</div>'}
                ,{field:'partBLoginName', title: '承租人',align: 'center'}
                ,{field:'partBIntermediaryCosts', title: '承租人服务费(元)',align: 'center',templet:'<div>{{d.contract.partBIntermediaryCosts}}</div>'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{field:'createTimeString',title:'创建时间',align: 'center'}
                ,{field:'createBy',title:'负责人',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#queryBreakdownInfoListBar',align:'center', width:200}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });









        //表格重载，条件查询 start
        active = {
            reload: function(){
                var provinceCode = $('#province').val();
                var cityCode = $('#city').val();
                var districtCode = $('#district').val();
                var checkBy = $('#checkBy').val().trim();
                var startCreateDate = $('#startCreateDate').val();
                var endCreateDate = $('#endCreateDate').val();


                //执行重载
                table.reload('queryMoneyInfoList', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        provinceCode : provinceCode ,
                        cityCode : cityCode,
                        districtCode : districtCode,
                        checkBy : checkBy,
                        startCreateDateString : startCreateDate,
                        endCreateDateString :endCreateDate
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

