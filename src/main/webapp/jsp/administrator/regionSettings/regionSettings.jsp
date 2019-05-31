
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
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
                <legend style="color: black; font-size: 20px;">地区查询</legend>
            </fieldset>
            <div class="layui-form" >

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
            </div>
            <button class="layui-btn" data-type="reload" id="btn" style="margin-left: 100px;">搜索</button>

        </div>
        <div  style="margin: 30px;">
            <table class="layui-hide" id="tableSettings" lay-filter="test"></table>
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
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        var table = layui.table;
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
        });
        //市区联动end


        var tableIns = table.render({
            elem:'#tableSettings',
            url: "${ctx}/regionSettings/${sessionScope.AdUserName}/queryRegion",
            cols: [[
                {field:'provinceCode', title: '省代码',align: 'center'}
                ,{field:'provinceName', title: '省',align: 'center'}
                ,{field:'cityCode', title: '市代码',align: 'center'}
                ,{field:'cityName', title: '市名称',align: 'center'}
                ,{field:'districtCode', title: '区代码',align: 'center'}
                ,{field:'districtName', title: '区名称',align: 'center'}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5,
            id: 'testReload'
        });



        //表格重载，条件查询 start
        var $ = layui.$, active = {
            reload: function(){
                var provinceCode = $('#province');
                var cityCode = $('#city');
                var districtCode = $('#district');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        provinceCode : provinceCode.val(),
                        cityCode: cityCode.val(),
                        districtCode : districtCode.val()
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
