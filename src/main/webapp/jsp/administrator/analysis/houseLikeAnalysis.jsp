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
                <legend style="color: black; font-size: 20px;">房源热度分析</legend>
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
                <label class="layui-form-label">日期选择</label>
                <div class="layui-input-inline" >
                    <input type="text" class="layui-input" id="date" placeholder=" - " readonly>
                    <input type="hidden" id="startCreateDate" value="" >
                    <input type="hidden" id="endCreateDate" value="" >
                </div>
                <button class="layui-btn"  id="searchBtn" lay-filter="searchBtn" style="margin-left: 100px;">搜索</button>
            </div>

            <div  style="margin-left: 37px; margin-top: 30px;">
                <div class="layui-card" style="width: 1600px;">
                    <div class="layui-card-header">房源热度折线图</div>
                    <div class="layui-card-body">
                        <div class="layui-carousel" id="houseLikeLineChart"  style="width: 100%; height: 400px;">

                        </div>


                    </div>
                </div>

                <div class="layui-card" style="width: 1600px;">
                <div class="layui-card-header">房源热度分布图</div>
                <div class="layui-card-body">

                <div class="layui-carousel " id="houseLikeMap" style="width: 100%; height: 800px;">

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

        //关联表
        var  houseLikeLineChart = echarts.init(document.getElementById('houseLikeLineChart'));
        houseLikeLineChart.showLoading();
        var houseLikeMap = echarts.init(document.getElementById('houseLikeMap'));
        houseLikeMap.showLoading();

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
                startCreateDateString :$('#startCreateDate').val(),
                endCreateDateString : $('#endCreateDate').val()
            };
            $.ajax({
                url: '${ctx}/analysis/houseLike',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(obj),
                success: function (data ) {
                    houseLikeLineChart.hideLoading();
                    var district = [];
                    var count = [];

                    for (var i = 0 ;i <data.district.length ;i++){
                        district.push(data.district[i]);
                    }
                    for (var j = 0 ;j <data.count.length ;j++){
                        count.push(data.count[j]);
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
                                name: '出租数量/套',
                                min: 0,
                                axisLabel: {
                                    formatter: '{value} 套 '
                                }
                            }

                        ],
                        series: [
                            {
                                name: '出租数量',
                                type: 'line',
                                data: count,
                                itemStyle: {
                                    normal: {
                                        color: '#ED2B2B'
                                    }
                                }
                            }

                        ]
                    };
                    //折线图绘制
                    houseLikeLineChart.setOption(option,true);

                    //绘制地图
                    var provinceCode = $('#province').val();
                    var cityCode = $('#city').val();
                    //城市存在，利用区
                    if(cityCode != '' && cityCode !=null){

                        $.getJSON("${ctx}/static/plugins/echarts_map/china-city/geojson/" + cityCode +".json", function(geoJson) {
                            houseLikeMap.hideLoading();
                            createMap(district,count,geoJson);

                        });
                    }else if (provinceCode != '' && provinceCode !=null){

                        $.getJSON("${ctx}/static/plugins/echarts_map/china-province/geojson/" + provinceCode +".json", function(geoJson) {
                            houseLikeMap.hideLoading();
                            createMap(district,count,geoJson);

                        });
                    }else {

                    }






                }
            })
        });


        function createMap(district,count,geoJson) {
            echarts.registerMap('mapData', geoJson);

            var houseData = [];
            for (var i = 0 ; i<district.length ; i++){
                var houseOne = {
                    name: district[i],
                    value : count[i]
                };
                houseData.push(houseOne);
            }

            houseLikeMap.setOption(option = {
                title: {
                    text: '房屋热度分布'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{b}<br/>{c} (套)'
                },
                toolbox: {
                    show: true,
                    orient: 'vertical',
                    left: 'right',
                    top: 'center',
                    feature: {
                        dataView: {readOnly: false},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                visualMap: {
                    min: 0,
                    max: 7,
                    text:['High','Low'],
                    realtime: false,
                    calculable: true,
                    inRange: {
                        color: ['#2828FF','#FFFB13', '#ED2B2B']
                    }
                },
                series: [
                    {
                        name: '房屋热度分布',
                        type: 'map',
                        mapType: 'mapData', // 自定义扩展图表类型
                        itemStyle:{
                            normal:{label:{show:true}},
                            emphasis:{label:{show:true}}
                        },
                        data:houseData


                    }
                ]
            });
        }


    });


</script>


</body>
</html>

