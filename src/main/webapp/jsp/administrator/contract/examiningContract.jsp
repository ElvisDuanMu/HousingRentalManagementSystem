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

        <div class="layui-form" style="padding: 20px; ">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; border-color: #00AE66;">
                <legend style="color: black; font-size: 20px;">审核合同</legend>
            </fieldset>
            <div class="layui-form-item">
                <label class="layui-form-label">合同编号</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-left: 5px;">
                        <input type="text" name="contractNumber" id="contractNumber" required style="width: 200px;" placeholder="请输入合同编号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <label class="layui-form-label">用户昵称</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-left: 5px;">
                        <input type="text" name="userLoginName" id="userLoginName" required style="width: 200px;" placeholder="请输入昵称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <label class="layui-form-label" >真实姓名</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline" style="margin-left: 5px;">
                        <input type="text" name="userName" id="userName" required style="width: 200px;" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <button class="layui-btn" style="margin-left: 300px; width: 300px;" data-type="reload" id="searchBtn" >搜索</button>
        </div>

        <div  style="margin: 30px;">
            <table class="layui-hide" id="queryExaminingContractInfoList" lay-filter="queryExaminingContractInfoList"></table>
        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />
</div>

<%--查看合同信息窗口--%>
<div class="layui-form" id="viewContract" style="display: none; margin: 70px  50px;">
    <div class="layui-form-item">
        <label class="layui-form-label">合同编号</label>
        <div class="layui-input-inline" style="width: 300px; ">
            <input  type="text"  id="viewContractNumber" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">甲方姓名</label>
        <div class="layui-input-inline" style="width: 130px; ">
            <input  type="text"  id="viewPartAName" name="viewPartAName" readonly autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">证件类型</label>
        <div class="layui-input-inline" style="width: 130px; ">
            <input  type="text"  id="viewPartATypeOfCertificate" name="viewPartATypeOfCertificate" readonly  autocomplete="off" class="layui-input" >
        </div>

        <label class="layui-form-label">证件号码</label>
        <div class="layui-input-inline" style="width: 215px; ">
            <input  type="text"  id="viewPartAIdNumber" name="viewPartAIdNumber" readonly autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">乙方姓名</label>
        <div class="layui-input-inline" style="width: 130px; ">
            <input  type="text"  id="viewPartBName" name="viewPartBName" readonly  autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">证件类型</label>
        <div class="layui-input-inline" style="width: 130px; ">
            <input  type="text"  id="viewPartBTypeOfCertificate" name="viewPartBTypeOfCertificate" readonly  autocomplete="off" class="layui-input" >
        </div>
        <label class="layui-form-label">证件号码</label>
        <div class="layui-input-inline" style="width: 215px; ">
            <input  type="text"  id="viewPartBIdNumber" name="viewPartBIdNumber" readonly  autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-collapse" style="margin: 35px 38px 20px;" lay-accordion>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第一条&emsp;房屋基本情况</h2>
            <div class="layui-colla-content">
                <p>
                    （一）房屋坐落于<u style="color: red">&emsp;&emsp;<span id="1"></span>&emsp;&emsp;</u>市
                    <u style="color: red">&emsp;&emsp;<span id="2"></span>&emsp;&emsp;</u>区（县）
                    ，建筑面积<u style="color: red">&emsp;&emsp;<span id="3"></span>&emsp;&emsp;</u>平方米。
                </p>
                <p>
                    （二）房屋权属状况：甲方持有<u>&emsp;&emsp;<span id="4"></span>&emsp;&emsp;</u>，<span id="5"></span>：<u>&emsp;&emsp;<span id="6"></span>&emsp;&emsp;</u>，房屋所有权人（公有住房承租人、购房人）姓名或名称：
                    <u>&emsp;&emsp;<span id="41"></span>&emsp;&emsp;</u>，房屋是否已设定了抵押:<u>&emsp;&emsp;<span id="7"></span>&emsp;&emsp;</u>。
                </p>
                <p>
                    （三）甲方保证对租赁房屋享有合法出租的权利，房屋的出租不违反国家的任何法律和政策要求，且不侵害任何第三人的利益
                </p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第二条&emsp;房屋租赁情况及登记备案</h2>
            <div class="layui-colla-content">
                <p>
                    （一）租赁用途：<u style="color: #00a25a">&emsp;&emsp;<span id="8"></span>&emsp;&emsp;</u>；如租赁用途为居住的，居住人数为：
                    <u style="color: #00a25a">&emsp;&emsp;<span id="9"></span>&emsp;&emsp;</u>。
                </p>
                <p>
                    （二）如租赁用途为居住的，甲方应自与乙方订立本合同之日起7日内，到房屋所在地的房屋行政管理部门办理房屋出租登记手续。对多人居住的，
                    乙方应将居住人员情况告知甲方，甲方应建立居住人员登记簿，并按规定报送该备案机构。本合同变更或者终止的，甲方应自合同变更或者终止之日起5日内，
                    到房屋所在地的房屋行政管理部门办理登记变更、注销手续。在本合同有效期内，居住人员发生变更的，乙方应当自变更之日起2日内告知该备案机构
                    ，办理变更登记手续。<br>
                    &emsp;&emsp;租赁用途为非居住的，甲方应自订立房屋租赁合同之日起30日内，到房屋所在地的房屋行政管理部门办理房屋租赁合同备案手续。
                </p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第三条&emsp;租赁期限</h2>
            <div class="layui-colla-content">
                <p>
                    （一）房屋租赁期自<u>&emsp;&emsp;<span id="10"></span>&emsp;&emsp;</u>至<u>&emsp;&emsp;<span id="11"></span>&emsp;&emsp;</u>，共计
                    <u style="color: red">&emsp;&emsp;<span id="12"></span>&emsp;&emsp;</u>。甲方应于<u>&emsp;&emsp;<span id="13"></span>&emsp;&emsp;</u>
                    前将房屋按约定条件交付给乙方。《房屋交割清单》经甲乙双方交验签字盖章并移交房门钥匙及<u>&emsp;&emsp;<span id="14"></span>&emsp;&emsp;</u>
                    后视为交付完成。
                </p>
                <p>
                    （二）租赁期满或合同解除后，甲方有权收回房屋，乙方应按照原状返还房屋及其附属物品、设备设施。甲乙双方应对房屋和附属物品、设备设施及水电使用等情况进行验收，
                    结清各自应当承担的费用。 乙方继续承租的，应提前<u>&emsp;&emsp;<span id="15"></span>&emsp;&emsp;</u>日向甲方提出书面续租要求,协商一致后双方重新签订房屋租赁合同。
                </p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第四条&emsp;租金及押金</h2>
            <div class="layui-colla-content">
                <p>
                    （一）租金标准及支付方式：租金每月人民币（小写）<u style="color: red">&emsp;&emsp;<span id="16"></span>&emsp;&emsp;</u>元，（大写）<u style="color: red">&emsp;&emsp;<span id="17"></span>&emsp;&emsp;</u>
                    ， 租金按照<u>&emsp;&emsp;<span id="18"></span>&emsp;&emsp;</u>支付。租金总计：人民币（小写）<u style="color: red">&emsp;&emsp;<span id="19"></span>&emsp;&emsp;</u>元，（大写）
                    <u style="color: red">&emsp;&emsp;<span id="20"></span>&emsp;&emsp;</u>。<br>
                    &emsp;&emsp;支付方式：<u style="color: #00a25a">&emsp;&emsp;<span id="21"></span>&emsp;&emsp;</u>，<u style="color: red">&emsp;&emsp;<span id="22"></span>&emsp;&emsp;</u>
                    ，各期租金支付日期<u>&emsp;&emsp;<span id="40"></span>&emsp;&emsp;</u>。
                </p>
                <p>
                    （二）押金：人民币（小写）<u style="color: red">&emsp;&emsp;<span id="23"></span>&emsp;&emsp;</u>元，（大写）<u style="color: red">&emsp;&emsp;<span id="24"></span>&emsp;&emsp;</u>。
                    乙方应于支付第一笔租金当日一并交付给甲方。租赁期满或合同解除后，房屋租赁押金除抵扣应由乙方承担的费用、租金，以及乙方应当承担的违约赔偿责任外，剩余部分应如数返还给乙方。
                </p>

            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第五条&emsp;其他相关费用的承担方式</h2>
            <div class="layui-colla-content">
                <p>
                    &emsp;&emsp;租赁期内各自承担的费用：
                </p>
                <p>
                    &emsp;&emsp;由甲方承担：<u>&emsp;&emsp;<span id="25"></span>&emsp;&emsp;</u>；
                </p>
                <p>
                    &emsp;&emsp;由乙方承担：<u style="color: #00a25a">&emsp;&emsp;<span id="26"></span>&emsp;&emsp;</u>。
                </p>
                <p>
                    &emsp;&emsp;本合同中未列明的与房屋有关的其他费用均由甲方承担。如乙方垫付了应由甲方支付的费用，甲方应根据乙方出示的相关缴费凭据向乙方返还相应费用。
                </p>

            </div>

        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第六条&emsp;居间服务</h2>
            <div class="layui-colla-content">
                <p>
                    （一）丙方应当认真负责地为甲乙双方提供订立房屋租赁合同提供的机会及中介服务，如实报告有关订立房屋租赁的合同的事项，
                    具体包括以下几项内容：（1）提供房屋租赁市场行情咨询；（2）寻找、提供发布房源、客源信息；（3）
                    引领承租人实地看房；（4）促成租赁双方签署合法有效的租赁合同；（5）协助租赁双方办理物业交割。
                </p>
                <p>
                    （二）居间服务费：<br>
                    &emsp;&emsp;1.甲方应于本合同签订当日向丙方支付居间服务费人民币（小写）<u style="color: red">&emsp;&emsp;<span id="27"></span>&emsp;&emsp;</u>元，（大写）
                    <u style="color: red">&emsp;&emsp;<span id="28"></span>&emsp;&emsp;</u>。支付方式：<u>&emsp;&emsp;<span id="29"></span>&emsp;&emsp;</u>。<br>
                    &emsp;&emsp;2.乙方应于本合同签订当日向丙方支付居间服务费人民币（小写）<u style="color: red">&emsp;&emsp;<span id="30"></span>&emsp;&emsp;</u>元，（大写）
                    <u style="color: red">&emsp;&emsp;<span id="31"></span>&emsp;&emsp;</u>。支付方式：<u style="color: #00a25a">&emsp;&emsp;<span id="32"></span>&emsp;&emsp;</u>。
                </p>

            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第七条&emsp;房屋维护及维修</h2>
            <div class="layui-colla-content">
                <p>
                    （一）甲方应保证房屋的建筑结构和设备设施符合建筑、消防、治安、卫生等方面的安全条件，不得危及人身安全；乙方保证遵守国家、房屋所在地省市的法律法规规定以及房屋所在小区的物业管理规约。
                </p>
                <p>
                    （二）租赁期内，甲乙双方应共同保障房屋及其附属物品、设备设施处于适用和安全的状态：<br>
                    &emsp;&emsp;1、对于房屋及其附属物品、设备设施因自然属性或合理使用而导致的损耗，乙方应及时通知甲方修复。甲方应在接到乙方通知后的七日内进行维修。逾期不维修的，乙方可代为维修，费用由甲方承担。
                    因维修房屋影响乙方使用的，应相应减少租金或延长租赁期限。<br>
                    &emsp;&emsp;2、因乙方保管不当或不合理使用，致使房屋及其附属物品、设备设施发生损坏或故障的，乙方应负责维修或承担赔偿责任。
                </p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第八条&emsp;转租</h2>
            <div class="layui-colla-content">
                <p>
                    （一）除甲乙双方另有约定以外，乙方需事先征得甲方书面同意，方可在租赁期内将房屋部分或全部转租给他人，并就受转租人的行为向甲方承担责任。
                </p>
                <p>
                    （二）若甲方在租赁期内出售该房屋，乙方在同等条件下享有优先购买权；若乙方不行使优先购买权，乙方应配合签署放弃优先购买权声明。
                </p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第九条&emsp;合同解除</h2>
            <div class="layui-colla-content">
                <p>
                    （一）经甲乙双方协商一致，可以解除本合同。
                </p>
                <p>
                    （二）因不可抗力导致本合同无法继续履行的，本合同自行解除。
                </p>
                <p>
                    （三）甲方有下列情形之一的，乙方有权单方解除合同：<br>
                    &emsp;&emsp;1、迟延交付房屋达十日的。<br>
                    &emsp;&emsp;2、交付的房屋严重不符合合同约定或影响乙方安全、健康的。<br>
                    &emsp;&emsp;3、不承担约定的维修义务，致使乙方无法正常使用房屋的。<br>
                    &emsp;&emsp;4、欠缴各项费用的金额相当于一个月房屋租金且影响乙方居住使用的。<br>
                    &emsp;&emsp;5、签署本合同后未到起租日，甲方拒绝出租该房屋的。<br>
                    &emsp;&emsp;6、隐瞒房屋抵押状况、产权转移情况或其他权利瑕疵，影响乙方使用的。<br>
                    &emsp;&emsp;7、其他：<u style="color: #00a25a">&emsp;&emsp;<span id="33"></span>&emsp;&emsp;</u>
                </p>
                <p>
                    （四）乙方有下列情形之一的，甲方有权单方解除合同，收回房屋：<br>
                    &emsp;&emsp;1、不按照约定支付租金达十日的。<br>
                    &emsp;&emsp;2、欠缴各项费用的金额相当于一个月房屋租金的。<br>
                    &emsp;&emsp;3、擅自改变房屋用途的。<br>
                    &emsp;&emsp;4、擅自拆改变动或损坏房屋主体结构的。<br>
                    &emsp;&emsp;5、保管不当或不合理使用导致附属物品、设备设施损坏并拒不赔偿的。<br>
                    &emsp;&emsp;6、利用房屋从事违法活动、损害公共利益或者妨碍他人正常工作、生活的。<br>
                    &emsp;&emsp;7、未经甲方书面同意将房屋转租给第三人的。<br>
                    &emsp;&emsp;8、签署本合同后未到起租日，乙方拒绝承担该房屋的。<br>
                    &emsp;&emsp;9、乙方未按约定事件返还房屋的。<br>
                    &emsp;&emsp;10、其他：<u>&emsp;&emsp;<span id="34"></span>&emsp;&emsp;</u>
                </p>
                <p>
                    （五）其他法定的合同解除情形。
                </p>

            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第十条&emsp;违约责任</h2>
            <div class="layui-colla-content">
                <p>
                    （一）甲方有第九条第三款约定的情形之一的，应按月租金的<u style="color: #00a25a">&emsp;&emsp;<span id="35"></span>&emsp;&emsp;</u>%向乙方支付违约金；
                    乙方有第九条第四款约定的情形之一的， 应按月租金的<u>&emsp;&emsp;<span id="36"></span>&emsp;&emsp;</u>%向甲方支付违约金，同时甲方可要求乙方将房屋恢复原状或赔偿相应损失。
                </p>
                <p>
                    （二）租赁期内，若双方协商一致解除合同的，提出解除合同需求的一方，应按月租金的<u>&emsp;&emsp;<span id="37"></span>&emsp;&emsp;</u>%向对方支付违约金。
                </p>
                <p>
                    （三）因甲方未按约定履行维修义务造成乙方人身、财产损失的，甲方应承担赔偿责任。
                </p>
                <p>
                    （四）丙方提供虚假信息、隐瞒重要事实或有恶意串通行为的，除退还已收取的居间服务费外，还应赔偿由此给甲方或乙方造成的损失。
                </p>
                <p>
                    （五）其他：<u style=" color: #FFB800">&emsp;&emsp;<span id="38"></span>&emsp;&emsp;</u>
                </p>

            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第十一条&emsp;争议解决及合同生效</h2>
            <div class="layui-colla-content">
                <p>
                    &emsp;&emsp;本合同项下发生的争议，由三方当事人协商解决；协商不成的，各方均可向房屋所在地人民法院诉讼解决。<br>
                    &emsp;&emsp;本合同经三方签字盖章后生效。本合同（及附件）一式三份，其中甲方执一份，乙方执一份，丙方执一份。<br>
                    &emsp;&emsp;本合同生效后，三方对合同内容的变更或补充应采取书面形式，作为本合同的附件。附件与本合同具有同等的法律效力。
                </p>
            </div>
        </div>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">第十二条&emsp;其他约定事项</h2>
            <div class="layui-colla-content">
                <p>
                    （一）甲方或\和乙方需丙方开具服务费发票，丙方待房屋交付后向支付居间服务费
                    的甲方或\和乙方开具发票。若付费方需要在房屋交付前开具发票，应当实际向丙方
                    足够支付服务费后方可要求丙方开具相应数额的发票。发票抬头为付费放本人；如
                    付费方有多个，发票抬头仅能为其中之一或全体；如果发票为多张的，多张发票抬头
                    须一致。
                </p>
                <p>
                    （二）如解约需丙方退还费用的，付费方应向丙方退还已开具的发票；如付费方不能
                    退还发票的，丙方退费时按已开具发票面额的6%进行税费扣除。
                </p>
                <p>
                    （三）其他：<u style="color: #FFB800">&emsp;&emsp;<span id="39"></span>&emsp;&emsp;</u>
                </p>

            </div>
        </div>
    </div>
</div>

<%--工具条--%>
<script type="text/html" id="queryExaminingContractInfoListBar">
    <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="view">查看</a>
    <a class="layui-btn layui-btn layui-btn-xs" lay-event="accept">通过</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="reject">未通过</a>
</script>

<script src="${ctx}/static/plugins/layui/layui.js" charset="UTF-8"></script>

<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table','laydate'], function(){
        var element = layui.element;
        var form = layui.form;
        var table = layui.table;
        var $ = layui.$;

        //表格
         table.render({
            elem:'#queryExaminingContractInfoList',
            url: "${ctx}/contract/queryExaminingContractInfo",
            cols: [[
                {field:'id',title:'合同id',align: 'center',hide:true}
                ,{field:'houseId',title:'房源编号',align: 'center'}
                ,{field:'contractNumber', title: '合同编号',align: 'center'}
                ,{field:'partALoginName', title: '房主（甲方）',align: 'center'}
                ,{field:'partBLoginName', title: '申请人（乙方）',align: 'center'}
                ,{field:'status', title: '状态',align: 'center'}
                ,{field:'partAName',title:'甲方姓名',align: 'center'}
                ,{field:'partBName',title:'乙方姓名',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#queryExaminingContractInfoListBar',align:'center', width:200}
            ]],
            page:true,
            limits:[5,10,15],
            limit:5
        });

        //监听工具条start
        table.on('tool(queryExaminingContractInfoList)', function(obj){
            var data = obj.data;

            //查看事件
            if (obj.event === 'view'){
                //查看合同
                viewContract(data.id, data.contractNumber, data.houseId);
            }
            //通过事件
            if (obj.event ==='accept'){
                acceptContract(data.id);
            }
            //未通过事件
            if (obj.event === 'reject'){
                rejectContract(data.id);
            }

        });
        //监听工具条end

        //查看合同
        function viewContract(id, contractNumber,houseId) {
            layer.open({
                type: 1,
                title: '查看合同',
                area:['1000px','600px'],
                content:$("#viewContract"),
                success:function () {
                    $('#viewContractNumber').val(contractNumber);
                    showHouseMsg(houseId);
                    showContractMsg(id);
                }
            })
        }
        //查询并显示房屋信息
        function showHouseMsg(houseId) {
            $.ajax({
                url: '${ctx}/house/viewHouseMsg/' + houseId
                ,type:'post'
                , success:function (data) {
                    $('#1').html(data[0].city.cityName);
                    $('#2').html(data[0].district.districtName);
                    $('#3').html(data[0].houseArea);
                    $('#22').html(data[0].rentType.rentTypeName);
                }
            })
        }

        //查询并显示合同信息
        function showContractMsg(id) {
            $.ajax({
                url:'${ctx}/contract/viewContractMsg/'+ id
                ,type:'post'
                ,success:function (data) {
                    $('#viewPartAName').val(data[0].partAName);
                    $('#viewPartATypeOfCertificate').val(data[0].partATypeOfCertificate);
                    $('#viewPartAIdNumber').val(data[0].partAIdNumber);
                    $('#viewPartBName').val(data[0].partBName);
                    $('#viewPartBTypeOfCertificate').val(data[0]. partBTypeOfCertificate);
                    $('#viewPartBIdNumber').val(data[0].partBIdNumber);
                    $('#4').html(data[0].houseOwnership);
                    $('#5').html(data[0].houseOwnershipCertificate);
                    $('#6').html(data[0].houseSourceCertificateContent);
                    $('#41').html(data[0].houseOwnerName);
                    $('#7').html(data[0].mortgage);
                    $('#8').html(data[0].rentalPurposes);
                    $('#9').html(data[0].people);
                    $('#10').html(data[0].startDateString);
                    $('#11').html(data[0].endDateString);
                    $('#12').html(data[0].duration);
                    $('#13').html(data[0].partADeliveryTimeString);
                    $('#14').html(data[0].partADeliveryCondition);
                    $('#15').html(data[0].renewal);
                    $('#16').html(data[0].monthlyRent);
                    $('#17').html(data[0].monthlyRentUppercase);
                    $('#18').html(data[0].rentPaymentTimeMethod);
                    $('#19').html(data[0].totalPrice);
                    $('#20').html(data[0].totalPriceUppercase);
                    $('#21').html(data[0].rentPaymentMethod);
                    $('#40').html(data[0].paymentDateString);
                    $('#23').html(data[0].deposit);
                    $('#24').html(data[0].depositUppercase);
                    $('#25').html(data[0].partACost);
                    $('#26').html(data[0].partBCost);
                    $('#27').html(data[0].partAIntermediaryCosts);
                    $('#28').html(data[0].partAIntermediaryCostsUppercase);
                    $('#29').html(data[0].partAPayment);
                    $('#30').html(data[0].partBIntermediaryCosts);
                    $('#31').html(data[0].partBIntermediaryCostsUppercase);
                    $('#32').html(data[0].partBPayment);
                    $('#33').html(data[0].partBAdditionalClauses);
                    $('#34').html(data[0].partAAdditionalClauses);
                    $('#35').html(data[0].partAPenalty);
                    $('#36').html(data[0].partBPenalty);
                    $('#37').html(data[0].penalty);
                    $('#38').html(data[0].penaltyAdditionalClauses);
                    $('#39').html(data[0].other);

                }
            })
        }

        var devName = $('#devName').val();

        //通过合同
        function acceptContract(id) {
            layer.confirm('确认通过？',function (index) {
                $.ajax({
                    url:'${ctx}/contract/acceptConfirm/' + id + '/' + devName
                    ,type:"post"
                    ,success:function (msg) {
                        if (msg.code == 200){
                            layer.msg('通过成功', {
                                icon: 6,
                                time: 1000
                            }, function(){
                                layer.load();
                                setTimeout(function(){
                                    layer.closeAll();
                                    table.reload('queryExaminingContractInfoList',{
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

        //未通过合同
        function rejectContract(id) {
            layer.confirm('确认未通过？',function (index) {
                $.ajax({
                    url:'${ctx}/contract/rejectConfirm/' + id + '/' + devName
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
                                    table.reload('queryExaminingContractInfoList',{
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


        //表格重载，条件查询 start
        active = {
            reload: function(){
                var contractNumber = $('#contractNumber').val();
                var loginName = $('#userLoginName').val();
                var userName = $('#userName').val();

                //执行重载
                table.reload('queryExaminingContractInfoList', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        contractNumber : contractNumber,
                        loginName: loginName,
                        userName : userName

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

