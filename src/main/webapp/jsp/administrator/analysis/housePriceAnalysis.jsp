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

        body{
            background: #DCDCDC;
        }

    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp" />




    <div class="layui-body">

        <%--记录管理员姓名--%>
        <input id="devName" type="hidden" value="${sessionScope.AdUserName}">

        <div class="layui-form" style="padding: 20px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
                <legend style="color: black; font-size: 20px;">房价分析</legend>
            </fieldset>
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
                <label class="layui-form-label">租赁方式</label>
                <div class="layui-input-inline">
                    <select name="leasingId" id="leasingId" lay-filter="city" lay-search>
                        <option value="">-请选择-</option>
                        <option value="1">整租</option>
                        <option value="2">合租</option>
                    </select>
                </div>
                <button class="layui-btn"  id="searchBtn" lay-filter="searchBtn" style="margin-left: 100px;">搜索</button>
            </div>
            <div class="layui-form-item" style="margin-left:10px; margin-top: 20px; margin-bottom: 3px;">
                <label class="layui-form-label" style="text-align: left; width: 50px;">面积</label>
                <div id="area" class="layui-input-inline" style="width: 500px;padding-top: 16px;">

                </div>
                <div>
                    <div class="layui-input-inline" style="width: 80px; margin-left: 10px;">
                        <input id="area_min" type="text" name="area_min" value="0" autocomplete="off"
                               class="layui-input" readonly style="text-align: center">
                    </div>
                    <div class="layui-form-mid layui-word-aux">㎡</div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 80px;">
                        <input id="area_max" type="text" name="area_max" value="300" autocomplete="off"
                               class="layui-input" readonly style="text-align: center">
                    </div>
                    <div class="layui-form-mid layui-word-aux">㎡</div>
                </div>
            </div>


            <div  style="margin-left: 37px; margin-top: 30px;">
                <div class="layui-card" style="width: 1600px;">
                    <div class="layui-card-header">房价分布图</div>
                    <div class="layui-card-body">
                        <div class="layui-carousel" id="housePriceLineColumnChart"  style="width: 100%; height: 500px;">

                        </div>


                    </div>
                </div>

            </div>
        </div>


    </div>
    <jsp:include page="/jsp/common/footer.jsp" />
</div>




<script src="${ctx}/static/plugins/layui/layui.js" charset="UTF-8"></script>
<script src="${ctx}/static/plugins/incubator-echarts-4.2.1/dist/echarts.js" charset="UTF-8" ></script>

<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table','slider','laydate'], function(){
        var element = layui.element;
        var form = layui.form;
        var table = layui.table;
        var $ = layui.$;
        var slider = layui.slider;

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

        slider.render({
            elem: '#area',  //绑定元素
            min: 0,
            max: 300,
            range: true,
            value: [0, 300],
            step: 5,
            tips: true,
            setTips: function (value) { //自定义提示文本
                return value + '㎡';
            },
            change: function (value) {
                $('#area_min').val(value[0]);
                $('#area_max').val(value[1]);
            }

        });

        //关联表
        var  housePriceLineColumnChart = echarts.init(document.getElementById('housePriceLineColumnChart'));
        housePriceLineColumnChart.showLoading();


        //检测搜索按钮
        $('#searchBtn').click(function () {

            //处理直辖市
            if($('#province').val() == '110000'){
                $('#city').val('110100');
            }
            if($('#province').val() == '120000'){
                $('#city').val('120100');
            }
            if($('#province').val() == '310000'){
                $('#city').val('310100');
            }
            if($('#province').val() == '500000'){
                $('#city').val('500100')
            }

            var obj = {
                provinceCode : $('#province').val(),
                cityCode : $('#city').val(),
                leasingId : $('#leasingId').val(),
                houseAreaMin: $('#area_min').val(),
                houseAreaMax: $('#area_max').val()
            };
            $.ajax({
                url: '${ctx}/analysis/housePrice',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(obj),
                success: function (data ) {
                    housePriceLineColumnChart.hideLoading();
                    var district = [];
                    var maxPrice = [];
                    var minPrice = [];
                    var averagePrice = [];

                    for (var i = 0 ;i <data.district.length ;i++){
                        district.push(data.district[i]);
                    }
                    for (var j = 0 ;j <data.maxPrice.length ;j++){
                        maxPrice.push(data.maxPrice[j]);
                    }
                    for (var k = 0 ;k <data.minPrice.length ;k++){
                        minPrice.push(data.minPrice[k]);
                    }
                    for (var l = 0 ;l <data.averagePrice.length ;l++){
                        averagePrice.push(data.averagePrice[l]);
                    }

                    var option = {
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                type: 'cross',
                                crossStyle: {
                                    color: '#999'
                                }
                            }
                        },
                        toolbox: {
                            feature: {
                                dataView: {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        legend: {
                            data:['最低值','最高值','平均值']
                        },
                        xAxis: [
                            {
                                type: 'category',
                                data: district,
                                axisPointer: {
                                    type: 'shadow'
                                }
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value',
                                name: '房价/元',
                                min: 0,
                                axisLabel: {
                                    formatter: '{value} 元'
                                }
                            }

                        ],
                        series: [
                            {
                                name: '最低值',
                                type: 'bar',
                                data: minPrice,
                                itemStyle: {
                                    normal: {
                                        color: '#FFFB13'
                                    }
                                }
                            },
                            {
                                name:'最高值',
                                type:'bar',
                                data:maxPrice,
                                itemStyle: {
                                    normal: {
                                        color: '#00FF00'
                                    }
                                }
                            },
                            {
                                name:'平均值',
                                type:'line',
                                data:averagePrice,
                                itemStyle: {
                                    normal: {
                                        color: '#ED2B2B'
                                    }
                                }
                            }
                        ]
                    };

                    housePriceLineColumnChart.setOption(option,true);
                }
            })
        });




    });


</script>


</body>
</html>

