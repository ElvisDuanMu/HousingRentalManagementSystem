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

        <div class="layui-form" style="padding: 20px; margin-top: 50px;">
            <div class="layui-form-item">
                <label class="layui-form-label">省/直辖市</label>
                <div class="layui-input-inline" >
                    <select name="province" id="provinceS" lay-filter="province" lay-search>
                        <option value="">-请选择-</option>
                        <c:forEach items="${province}" var="obj">
                            <option value="${obj.provinceCode}" >${obj.provinceName}</option>

                        </c:forEach>
                    </select>
                </div>
                <label class="layui-form-label">市</label>
                <div class="layui-input-inline">
                    <select name="city" id="cityS" lay-filter="city" lay-search>
                        <option value="">-请选择-</option>
                    </select>
                </div>
                <label class="layui-form-label">区</label>
                <div class="layui-input-inline">
                    <select name="district" id="districtS" lay-filter="district" lay-search>
                        <option value="">-请选择-</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">小区名称</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-left: 5px;">
                        <input type="text" name="addressCommunity" id="addressCommunityS" required style="width: 200px;" placeholder="请输入小区名称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <label class="layui-form-label">详细地址</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-left: 5px;">
                        <input type="text" name="detailAddress" id="detailAddressS" required style="width: 200px;" placeholder="请输入详细地址" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <label class="layui-form-label">发布人</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-left: 5px;">
                        <input type="text" name="createName" id="createNameS" required style="width: 200px;" placeholder="请输入发布人" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <label class="layui-form-label" >房源编号</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-left: 5px;">
                        <input type="text" name="houseId" id="houseIdS" required style="width: 200px;" placeholder="请输入房源编号" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">房源状态</label>
                <div class="layui-input-inline" style=" width: 150px; margin-left: 5px;" >
                    <select name="status" id="houseStatusS"  >
                        <option value="" >请选择</option>
                        <c:forEach items="${houseStatus}" var="obj">
                            <option value="${obj.houseStatusId}">${obj.houseStatusName}</option>
                        </c:forEach>
                    </select>
                </div>

                <label class="layui-form-label">审核状态</label>
                <div class="layui-input-inline" style=" width: 150px; margin-left: 5px;" >
                    <select name="status" id="checkStatusS"  >
                        <option value="" >请选择</option>
                        <c:forEach items="${checkStatus}" var="obj">
                            <option value="${obj.checkStatusId}">${obj.checkStatusName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">发布时间</label>
                    <div class="layui-input-inline" >
                        <input type="text" class="layui-input" id="date" placeholder=" - " readonly>
                        <input type="hidden" id="startCreateDate" value="" >
                        <input type="hidden" id="endCreateDate" value="" >
                    </div>
                </div>
            </div>
            <button class="layui-btn" style="margin-left: 300px; width: 300px;" data-type="reload" id="searchBtn" >搜索</button>
        </div>

        <div  style="margin: 30px;">
            <table class="layui-hide" id="tableSettings" lay-filter="test"></table>
        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />
</div>

<%--弹出房源详细信息--%>
<div class="layui-form" id="popDetailMsg" style="display: none; margin: 70px  50px;">
    <input type="hidden" id="houseId" >
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
        <legend style="color: black">基础信息</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">出租方式</label>
        <div class="layui-input-inline" style="margin-left: 20px;">
            <input type="text" id="leasingName"  readonly  style="width: 100px;"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" >
        <label class="layui-form-label">省/直辖市</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="province" readonly  autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">市</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="city"  readonly autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">区</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="district"  readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">详细地址</label>
        <div class="layui-input-inline" style="margin-left: 20px;">
            <input type="text"  id="detailAddress" readonly style="width: 500px;" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">小区名称</label>
        <div class="layui-input-inline" style="margin-left: 20px;">
            <input type="text"  id="addressCommunity" readonly style="width: 500px;"  autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">房屋位置</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="addressBuilding"  readonly autocomplete="off" class="layui-input" align="center" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">栋</div>
        <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
            <input  type="text"  id="addressUnit"  readonly  autocomplete="off" class="layui-input" align="center" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">单元</div>
    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">房屋规格</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="typeRooms"   readonly   autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux" >室</div>
        <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
            <input  type="text"  id="typeHalls"  readonly   autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">厅</div>
        <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
            <input  type="text"  id="typeBathrooms"  readonly   autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">卫</div>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="houseArea" readonly   autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">㎡</div>
    </div>

    <div class="layui-form-item " style="margin-top: 30px;">
        <label class="layui-form-label">楼&emsp;&emsp;层</label>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">第</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="floor" readonly  autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux" >层</div>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="totalFloor" readonly autocomplete="off"  class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux" >层</div>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">门牌号</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="addressRoom" readonly  autocomplete="off" class="layui-input" style="text-align: center;">
        </div>

    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">朝向装修</label>
        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">房源朝向</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="orientation" readonly  autocomplete="off" class="layui-input" >
        </div>

        <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">装修</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="renovation" readonly autocomplete="off" class="layui-input" >
        </div>


    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">设&emsp;&emsp;施</label>

        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">电梯配备</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="houseElevator" readonly  autocomplete="off" class="layui-input" >
        </div>

        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">车位配备</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text"  id="housePark" readonly  autocomplete="off" class="layui-input">
        </div>

    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">租&emsp;&emsp;金</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="housePrice"  readonly autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">元/月</div>

        <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">租金方式</div>
        <div class="layui-input-inline" style=" width: 100px;">
            <input  type="text" id="rentType" readonly  autocomplete="off" class="layui-input">
        </div>

    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">租金已包含费用</label>
        <div class="layui-input-inline" style="width: 600px; margin-left: 20px; margin-top: 10px;">
            <input  type="text"  id="rentContent" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
        <legend style="color: black">详细信息</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">看房时间</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="inspection" readonly  autocomplete="off" class="layui-input" >
        </div>

    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">最早入住时间</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px; margin-top: 10px;">
            <input  type="text" id="houseCheckTimeString" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">宜住人数</label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="housePeople" readonly autocomplete="off" class="layui-input" style="text-align: center;">
        </div>
        <div class="layui-form-mid layui-word-aux">人</div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">标&emsp;&emsp;题
        </label>
        <div class="layui-input-inline" style="width: 600px; margin-left: 20px;">
            <input  type="text"  id="houseName" readonly  autocomplete="off" class="layui-input" >
        </div>

    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">
            宠&emsp;&emsp;物
        </label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="pet" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px;">
        <label class="layui-form-label">租客性别
        </label>
        <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
            <input  type="text"  id="sex" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px; ">
        <label class="layui-form-label" >房屋配置</label>
        <div class="layui-input-inline" style="width: 600px; margin-left: 20px; ">
            <input  type="text"  id="facility" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px; height: 180px;">
        <label class="layui-form-label" >房源描述</label>
        <div class="layui-input-inline" style="padding-left: 20px; width: 600px; height: 180px;">
            <%--/<textarea id="houseInfo" style="display: none;"></textarea>--%>
            <textarea  id="houseInfo" style="margin-top: 10px; height: 160px;" readonly  class="layui-textarea"></textarea>
        </div>
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
        <legend style="color: black">其他信息</legend>
    </fieldset>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label">&emsp;联系人</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="contacts" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">身&emsp;&emsp;份</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="identity" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="telephone" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
        <legend style="color: black">状态及审核信息</legend>
    </fieldset>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label">房源状态</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="houseStatus" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">审核信息</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="checkStatus" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
        <legend style="color: black">发布和修改信息</legend>
    </fieldset>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label">发布人</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="createName" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">发布时间</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text" id="createDateString" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label">修改人</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="updateName" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">修改时间</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="updateDateString" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
        <label class="layui-form-label">审核人</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="examName" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
        <label class="layui-form-label">审核时间</label>
        <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
            <input  type="text"  id="examDateString" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
</div>
<%--弹出房源图片信息--%>
<div class="layui-form" id="popImg" style="display: none; margin: 70px  50px;">
    <input type="hidden" id="houseId2" >
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>封面图片</legend>
    </fieldset>
    <div class="layui-upload-list"  id="faceImg" style="width:180px;height:180px;border:3px solid #0099CC;border-radius: 5px;">
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>房源图片</legend>
    </fieldset>
    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
        预览图：
        <div class="layer-photos-demo"  id="showImg"></div>
    </blockquote>
</div>
<%--工具条--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="viewMsg">信息</a>
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="viewImg">图片</a>
</script>

<script src="${ctx}/static/plugins/layui/layui.js" charset="UTF-8"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table','laydate','layer'], function(){
        var element = layui.element;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
        var $ = layui.$;
        var layer = layui.layer;

        //省市联动start
        form.on('select(province)',function () {
            //获取provinceCode值
            var provinceCode = $('#provinceS').val();
            if(provinceCode == '' ){
                //清空
                var html="<option value=\"\">-请选择-</option>";
                $('#cityS').html(html);
                $('#districtS').html(html);
                form.render();
                return ;
            }else {
                var html="<option value=\"\">-请选择-</option>";
                $('#districtS').html(html);
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
                        $('#cityS').html(html);
                        form.render();
                    }
                })
            }
        })
        //省市联动end

        //市区联动start
        form.on('select(city)',function () {
            //获取provinceCode值
            var cityCode = $('#cityS').val();
            if(cityCode == ''){
                //清空
                var html="<option value=\"\">-请选择-</option>";
                $('#districtS').html(html);
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
                        $('#districtS').html(html);
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
        var tableIns = table.render({
            elem:'#tableSettings',
            url: "${ctx}/house/${sessionScope.AdUserName}/queryHouseInfo",
            cols: [[
                {field:'houseId',title:'房源编号'},
                {field:'houseName',title:'房源名称'},
                {field:'floor',title:'楼层',hide:true},
                {field:'totalFloor',title:'楼层总数',hide:true},
                {field:'addressCommunity',title:'所属小区',hide:true},
                {field:'addressBuilding',title:'栋',hide:true},
                {field:'addressUnit',title:'单元',hide:true},
                {field:'addressRoom',title:'门牌号',hide:true},
                {field:'typeRooms',title:'室',hide:true},
                {field:'typeHalls',title:'厅',hide:true},
                {field:'typeBathrooms',title:'卫',hide:true},
                {field:'houseArea',title:'面积',hide:true},
                {field:'housePrice',title:'价格',hide:true},
                {field:'createName',title:'发布人',width:80},
                {field:'createDateString',title:'发布时间',width:160},
                {field:'updateName',title:'修改人',width:80,hide:true},
                {field:'updateDateString',title:'修改时间',width:160,hide:true},
                {field:'houseInfo',title:'房源信息',hide:true},
                {field:'houseElevator',title:'电梯配备',hide:true},
                {field:'housePark',title:'车位配备',hide:true},
                {field:'houseCheckTimeString',title:'最早入住时间',hide:true},
                {field:'housePeople',title:'宜住人数',hide:true},
                {field:'contacts',title:'联系人',hide:true},
                {field:'telephone',title:'联系电话',hide:true},
                {field:'pet',title:'宠物',hide:true},
                {field:'sex',title:'性别',hide:true},
                {field:'rentContentString',title:'租金包含信息',hide:true},
                {field:'houseFacilityString',title:'房源包含设施',hide:true},
                {field:'detailAddress',title:'详细地址',hide:true},
                {field:'examName',title:'审核人',hide:true},
                {field:'examDateString',title:'审核时间',hide:true},
                {field:'orientationName',title:'朝向',hide:true,templet:'<div>{{d.orientation.orientationName}}</div>'},
                {field:'leasingName',title:'租赁方式',hide:true,templet:'<div>{{d.leasing.leasingName}}</div>'},
                {field:'provinceName',title:'所在省',hide:true,templet:'<div>{{d.province.provinceName}}</div>'},
                {field:'cityName',title:'所在市',hide:true,templet:'<div>{{d.city.cityName}}</div>'},
                {field:'districtName',title:'所在区',hide:true,templet:'<div>{{d.district.districtName}}</div>'},
                {field:'renovationName',title:'装修方式',hide:true,templet:'<div>{{d.renovation.renovationName}}</div>'},
                {field:'inspectionName',title:'看房方式',hide:true,templet:'<div>{{d.inspection.inspectionName}}</div>'},
                {field:'houseStatusName',title:'房源状态',width:100,templet:'<div>{{d.houseStatus.houseStatusName}}</div>'},
                {field:'rentTypeName',title:'租金方式',hide:true,templet:'<div>{{d.rentType.rentTypeName}}</div>'},
                {field:'identityName',title:'身份',hide:true,templet:'<div>{{d.identity.identityName}}</div>'},
                {field:'checkStatusName',title:'审核状态',hide:true,width:100,templet:'<div>{{d.checkStatus.checkStatusName}}</div>'},
                {fixed: 'right', title:'操作', toolbar: '#barDemo', width:120}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });



        //监听工具条start
        table.on('tool(test)',function (obj) {
            var data = obj.data;
            //查看信息事件
            if (obj.event === 'viewMsg') {
                layer.open({
                    type: 1,
                    title: '查看房源具体信息',
                    area:['1000px','600px'],
                    content:$("#popDetailMsg"),
                    success: function (layero,index) {
                        $('#houseId').val(data.houseId);
                        $('#leasingName').val(data.leasing.leasingName);
                        $('#province').val(data.province.provinceName);
                        $('#city').val(data.city.cityName);
                        $('#district').val(data.district.districtName);
                        $('#detailAddress').val(data.detailAddress);
                        $('#addressCommunity').val(data.addressCommunity);
                        $('#addressBuilding').val(data.addressBuilding);
                        $('#addressUnit').val(data.addressUnit);
                        $('#typeRooms').val(data.typeRooms);
                        $('#typeHalls').val(data.typeHalls);
                        $('#typeBathrooms').val(data.typeBathrooms);
                        $('#houseArea').val(data.houseArea);
                        $('#floor').val(data.floor);
                        $('#totalFloor').val(data.totalFloor);
                        $('#addressRoom').val(data.addressRoom);
                        $('#orientation').val(data.orientation.orientationName);
                        $('#renovation').val(data.renovation.renovationName);
                        $('#houseElevator').val(data.houseElevator);
                        $('#housePark').val(data.housePark);
                        $('#housePrice').val(data.housePrice);
                        $('#rentType').val(data.rentType.rentTypeName);
                        $('#inspection').val(data.inspection.inspectionName);
                        $('#houseCheckTimeString').val(data.houseCheckTimeString);
                        $('#housePeople').val(data.housePeople);
                        $('#houseName').val(data.houseName);
                        $('#pet').val(data.pet);
                        $('#sex').val(data.sex);
                        $('#houseInfo').val(data.houseInfo);
                        $('#contacts').val(data.contacts);
                        $('#identity').val(data.identity.identityName);
                        $('#telephone').val(data.telephone);
                        $('#houseStatus').val(data.houseStatus.houseStatusName);
                        $('#checkStatus').val(data.checkStatus.checkStatusName);
                        $('#createName').val(data.createName);
                        $('#createDateString').val(data.createDateString);
                        $('#updateName').val(data.updateName);
                        $('#updateDateString').val(data.updateDateString);
                        $('#rentContent').val(data.rentContentString);
                        $('#facility').val(data.houseFacilityString);
                        $('#examName').val(data.examName);
                        $('#examDateString').val(data.examDateString);
                    }
                })
            }

            //查看图片事件
            if (obj.event === 'viewImg') {
                layer.open({
                    type: 1,
                    title: '查看房源图片信息',
                    area:['1000px','600px'],
                    content:$("#popImg"),
                    cancel:function(){
                        $('#faceImg').empty();
                        $('#showImg').empty();
                    },
                    success: function (layero,index) {

                        $('#houseId2').val(data.houseId);
                        $.ajax({
                            url:'${ctx}/house/queryFaceImg/' + data.houseId,
                            type:'get',
                            success:function (data) {
                                var result = '${ctx}'+ data[0].imgRelPath;
                                var name = data[0].imgName;
                                $('#faceImg').append('<img style="width: 180px;height:180px;" layer-src="'+result+'" src="'+ result +'"  alt="'+name +'">')
                                layer.photos({
                                    photos: '#faceImg'
                                });
                            }
                        });

                        $.ajax({
                            url:'${ctx}/house/queryShowImg/' + data.houseId,
                            type:'get',
                            success:function (data) {

                                var size = data.length;
                                for(var i = 0; i <size;i++)
                                {
                                    var result = '${ctx}'+ data[i].imgRelPath;
                                    var name = data[i].imgName;
                                    $('#showImg').append('<img style="width: 180px;height:180px; margin-left: 10px; margin-top: 8px;" layer-src="'+result+'" src="'+ result +'"  alt="'+name +'" layer-index="'+i+'">')
                                }


                                layer.photos({
                                    photos: '#showImg'
                                });

                            }
                        });

                    }
                })
            }
        });

        //表格重载，条件查询 start
        active = {
            reload: function(){
                var provinceCode = $('#provinceS').val().trim();
                var cityCode = $('#cityS').val().trim();
                var districtCode = $('#districtS').val().trim();
                var createName = $('#createNameS').val().trim();
                var houseId = $('#houseIdS').val().trim();
                var houseStatus = $('#houseStatusS').val();
                var addressCommunity = $('#addressCommunityS').val().trim();
                var checkStatus = $('#checkStatusS').val();
                var startTime = $('#startCreateDate').val();
                var endTime = $('#endCreateDate').val();
                var detailAddress = $('#detailAddressS').val().trim();

                //执行重载
                table.reload('tableSettings', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        provinceCode : provinceCode,
                        cityCode: cityCode,
                        districtCode : districtCode,
                        addressCommunity :addressCommunity ,
                        createName :createName ,
                        houseId :houseId,
                        houseStatus : houseStatus,
                        checkStatus : checkStatus,
                        startTimeString :startTime,
                        endTimeString : endTime,
                        detailAddress : detailAddress
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
