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
    <h2>类别</h2>
    <hr class="layui-bg-green" style="margin-bottom: 20px;">
    <div class="layui-form-item">
        <label class="layui-form-label">出租方式</label>
        <div class="layui-input-inline" style="margin-left: 20px;">
            <input type="text" id="leasingName"  readonly  style="width: 100px;"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <h2 style="margin-top: 30px;">基础信息</h2>
    <hr class="layui-bg-green" style="margin-bottom: 30px;">
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
    <h2 style="margin-top: 30px;">详细信息</h2>
    <hr class="layui-bg-green" style="margin-bottom: 20px;">
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
    <h2 style="margin-top: 30px;">其他信息</h2>
    <hr class="layui-bg-green" style="margin-bottom: 20px;">
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

    <h2>状态及审核信息</h2>
    <hr class="layui-bg-green" style="margin-bottom: 20px;">
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

    <h2>发布和修改信息</h2>
    <hr class="layui-bg-green" style="margin-bottom: 20px;">
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
        var $ = layui.jquery;
        var layer = layui.layer;

        //表格
        var tableIns = table.render({
            elem:'#tableSettings',
            url: "${ctx}/house/${sessionScope.AdUserName}/queryHouseInfo",
            cols: [[
                {field:'houseId',title:'房源编号',hide:true},
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
            limit:5,
            id: 'testReload'
        });



        //监听工具条start
        table.on('tool(test)',function (obj) {
            var data = obj.data;
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
                    }
                })
            }

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




    });


</script>


</body>
</html>
