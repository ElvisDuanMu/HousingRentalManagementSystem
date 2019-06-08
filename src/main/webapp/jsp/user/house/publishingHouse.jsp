
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>


    <title>链家用户中心_买房卖房用户-链家网</title>
    <meta name="description" content="链家网用户活动中心提供链家网买房卖房用户活动信息，关注房源和小区等" />
    <meta name="keywords" content="买房卖房用户活动中心，链家用户中心" />

    <link rel="stylesheet" href="/static/css/common.css">
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/plugins/layui/css/layui.css" />

    <style>
        .spa{
            height: 25px;
            line-height: 20px;
            width: 204px;
            display: inline-block;
            float: left;
            font-size: 15px;
            color: #BD362F;
            text-indent: 10px;
            margin-top: 5px;
        }
        .layui-form-item {
            margin-bottom: 0;
            clear: both;

        }
    </style>
    <header class="lianjia-header">
        <div class="nav-wrap">
            <div class="wrapper">
                <div class="fl"><a href="#" class="logo"></a></div>
                <div class="fr nav">
                    <div class="fl">
                        <ul>
                            <li>
                                <a class="" href="${ctx}/user/210000/210200/queryHouse">租房</a>
                            </li>
                            <li>
                                <a class="" href="http://www.baidu.com">百科</a>
                            </li>
                            <li>
                                <a class="" target="_blank">发布房源</a>
                            </li>
                        </ul>
                    </div>
                    <div class="fr login">
                        <div class="login-panel typeUserInfo">

                            <div class="ti-hover">
                                <div class="user-news" id="userNews">
                                </div>
                                <div class="typeShowUser"><span class="welcome">欢迎你，${sessionScope.Username}</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="user-main">
        <span class="layui-breadcrumb"  >
            <a>添加房源</a>
            <a><cite>填写信息</cite></a>
            <a>添加图片</a>
            <a>添加完成</a>
            </span>
        <form class="layui-form" action="${ctx}/house/addNewHouseInfo"  style="margin-top: 30px;">
            <h2>类别</h2>
            <hr class="layui-bg-green" style="margin-bottom: 20px;">
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;出租方式
                </label>
                <div class="layui-input-inline" style="margin-left: 20px; width: 400px;">
                    <input type="radio" name="leasingId" value="1" title="整租" checked>
                    <input type="radio" name="leasingId" value="2" title="单间出租（合租）" >
                </div>
            </div>
            <h2 style="margin-top: 30px;">基础信息</h2>
            <hr class="layui-bg-green" style="margin-bottom: 30px;">
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;省/直辖市</label>
                <div class="layui-input-inline" style="margin-left: 20px;" >
                    <select name="provinceCode" id="province" lay-filter="province" lay-search>
                        <option value="">-请选择-</option>
                        <c:forEach items="${province}" var="obj">
                            <option value="${obj.provinceCode}" >${obj.provinceName}</option>
                        </c:forEach>
                    </select>
                </div>
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;市</label>
                <div class="layui-input-inline">
                    <select name="cityCode" id="city" lay-filter="city" lay-search>
                        <option value="">-请选择-</option>
                    </select>
                </div>
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;区</label>
                <div class="layui-input-inline">
                    <select name="districtCode" id="district" lay-filter="district" lay-search>
                        <option value="">-请选择-</option>
                    </select>
                </div>
            </div>
            <span class="spa spas1" id="spas1" style="margin-left: 135px; width: 100px;">请选择</span>
            <span class="spa spas2" id="spas2" style="margin-left: 210px; width: 100px;">请选择</span>
            <span class="spa spas3" id="spas3" style="margin-left: 220px; width: 100px;">请选择</span>
            <div class="layui-form-item" style="margin-top: 30px; height: 40px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;详细地址</label>
                <div class="layui-input-inline" style="margin-left: 20px;">
                    <input type="text" name="detailAddress" id="detailAddress" required style="width: 500px;" lay-verify="required" placeholder="请输入详细地址（街道地址）" autocomplete="off" class="layui-input">
                </div>
            </div>
            <span class="spa spa1" id="spa1" style="margin-left: 125px; width: 400px;"></span>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;小区名称</label>
                <div class="layui-input-inline" style="margin-left: 20px;">
                    <input type="text" name="addressCommunity" id="addressCommunity" required style="width: 500px;" lay-verify="required" placeholder="请输入小区名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <span class="spa spa2" id="spa2" style="margin-left: 125px; width: 400px;"></span>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房屋位置</label>
                <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
                    <input  type="text" name="addressBuilding" id="addressBuilding" required  lay-verify="required"  autocomplete="off" class="layui-input" align="center" style="text-align: center;"
                            oninput="value=value.replace(/[^\d]/g,'')" >
                </div>
                <div class="layui-form-mid layui-word-aux">栋</div>
                <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
                    <input  type="text" name="addressUnit" id="addressUnit" required  lay-verify="required"  autocomplete="off" class="layui-input" align="center"
                            oninput="value=value.replace(/[^\d]/g,'')" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">单元</div>
            </div>
            <span class="spa spa3" id="spa3" style="margin-left: 125px; width: 100px;"></span>
            <span class="spa spa4" id="spa4" style="margin-left: 80px; width: 100px;"></span>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房屋规格</label>
                <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
                    <input  type="text" name="typeRooms" id="typeRooms" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">室</div>
                <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
                    <input  type="text" name="typeHalls" id="typeHalls" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">厅</div>
                <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
                    <input  type="text" name="typeBathrooms" id="typeBathrooms" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">卫</div>
                <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
                <div class="layui-input-inline" style=" width: 100px;">
                    <input  type="text" name="houseArea" id="houseArea" required  lay-verify="required" oninput="num(this)" autocomplete="off" class="layui-input" style="text-align: center;" placeholder="">
                </div>
                <div class="layui-form-mid layui-word-aux">㎡</div>
            </div>
            <span class="spa spa5" id="spa5" style="margin-left: 125px; width: 100px;"></span>
            <span class="spa spa6" id="spa6" style="margin-left: 80px; width: 100px;"></span>
            <span class="spa spa7" id="spa7" style="margin-left: 80px; width: 100px;"></span>
            <span class="spa spa8" id="spa8" style="margin-left: 90px; width: 100px;"></span>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;楼&emsp;&emsp;层</label>
                <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">第</div>
                <div class="layui-input-inline" style=" width: 100px;">
                    <input  type="text" name="floor" id="floor" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux" >层</div>
                <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
                <div class="layui-input-inline" style=" width: 100px;">
                    <input  type="text" name="totalFloor" id="totalFloor" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux" >层</div>
                <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">门牌号</div>
                <div class="layui-input-inline" style=" width: 100px;">
                    <input  type="text" name="addressRoom" id="addressRoom" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
            </div>
            <span class="spa spa9" id="spa9" style="margin-left: 145px; width: 100px;"></span>
            <span class="spa spa10" id="spa10" style="margin-left: 100px; width: 100px;"></span>
            <span class="spa spa11" id="spa11" style="margin-left: 125px; width: 100px;"></span>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;朝向装修</label>
                <div class="layui-input-inline" style=" width: 150px; margin-left: 20px;">
                    <select name="orientationId" lay-verify="required">
                        <c:forEach items="${orientation}" var="obj">
                            <option value="${obj.orientationId}" >${obj.orientationName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="layui-input-inline" style=" width: 150px; margin-left: 10px;">
                    <select name="renovationId" lay-verify="required">
                        <c:forEach items="${renovation}" var="obj">
                            <option value="${obj.renovationId}" >${obj.renovationName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>


            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;设&emsp;&emsp;施</label>
                <label class="layui-form-label" style="padding-left: 0px;">电梯配备</label>
                <div class="layui-input-inline" style=" width: 150px;">
                    <select name="houseElevator" lay-verify="required">
                        <option value="有电梯">有电梯</option>
                        <option value="无电梯">无电梯</option>
                    </select>
                </div>
                <label class="layui-form-label" >车位配备</label>
                <div class="layui-input-inline" style=" width: 150px;">
                    <select name="housePark" lay-verify="required">
                        <option value="有车位">有车位</option>
                        <option value="无车位" selected>无车位</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;租&emsp;&emsp;金</label>
                <div class="layui-input-inline" style="width: 150px; margin-left: 20px;">
                    <input  type="text" name="housePrice" id="housePrice" required oninput="num(this);" lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;" placeholder="">
                </div>
                <div class="layui-form-mid layui-word-aux">元/月</div>
                <div class="layui-input-inline" style=" width: 150px;">
                    <select name="houseRentTypeId" lay-verify="required">
                        <c:forEach items="${rentType}" var="obj">
                            <option value="${obj.rentTypeId}" >${obj.rentTypeName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <span class="spa spa12" id="spa12" style="margin-left: 125px; width: 100px;"></span>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">租金已包含费用</label>
                <div class="layui-input-inline" style="margin-left: 20px; margin-top:10px; width: 800px; height: 58px;">
                    <c:forEach items="${rentContent}" var="obj">
                        <input type="checkbox" name="contentId"  value="${obj.contentId}" title="${obj.contentName}" lay-skin="primary">
                    </c:forEach>
                </div>
            </div>
            <h2 style="margin-top: 30px;">详细信息</h2>
            <hr class="layui-bg-green" style="margin-bottom: 20px;">
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;看房时间
                </label>
                <div class="layui-input-inline" style="margin-left: 20px; width: 400px;">
                    <input type="radio" style="margin-left: 20px;" name="inspectionId" value="1" title="随时看房" checked>
                    <input type="radio" name="inspectionId" value="2" title="仅工作日" >
                    <input type="radio" name="inspectionId" value="3" title="仅周末" >
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;最早入住时间
                </label>
                <div class="layui-input-inline" style="margin-left: 20px; margin-top: 10px;">
                    <input type="text" class="layui-input" id="houseCheckTimeString" name="houseCheckTimeString" placeholder="yyyy-MM-dd" readonly>
                </div>
            </div>
            <span class="spa spat1" id="spat1" style="margin-left: 125px; width: 100px;">请选择</span>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    宜住人数
                </label>
                <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
                    <input  type="text" name="housePeople" id="housePeople" required oninput="value=value.replace(/[^\d]/g,'')" lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">人</div>
            </div>
            <span class="spa spa13" id="spa13" style="margin-left: 125px; width: 100px;"></span>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;标&emsp;&emsp;题
                </label>
                <div class="layui-input-inline" style="width: 600px; margin-left: 20px;">
                    <input  type="text" name="houseName" required id="houseName"  placeholder="请填写标题" lay-verify="required"  autocomplete="off" class="layui-input" >
                </div>
            </div>
            <span class="spa spa14" id="spa14" style="margin-left: 125px; width: 800px;"></span>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    禁养宠物
                </label>
                <div class="layui-input-inline" style="margin-left: 20px; width: 400px;">
                    <input type="radio" name="pet" value="禁止" title="禁止" >
                    <input type="radio" name="pet" value="允许" title="允许" >
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;租客性别
                </label>
                <div class="layui-input-inline" style="margin-left: 20px; width: 400px;">
                    <input type="radio" name="sex" value="男女不限" title="男女不限" checked >
                    <input type="radio" name="sex" value="仅限男生" title="仅限男生" >
                    <input type="radio" name="sex" value="仅限女生" title="仅限女生" >
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
                <label class="layui-form-label" >&nbsp;&nbsp;&nbsp;房屋配置</label>
                <div class="layui-input-inline" style="margin-left: 20px;  width: 800px; height: 30px;">
                    <c:forEach items="${facility}" var="obj">
                        <input type="checkbox" name="facilityId" lay-filter="facilityId" value="${obj.facilityId}" title="${obj.facilityName}" lay-skin="primary">
                    </c:forEach>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px; height: 180px;">
                <label class="layui-form-label" >
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房源描述</label>
                <div class="layui-input-inline" style="padding-left: 20px; width: 600px; height: 180px;">
                    <%--/<textarea id="houseInfo" style="display: none;"></textarea>--%>
                        <textarea name="houseInfo" required style="margin-top: 10px; height: 160px;" id="houseInfo" lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
            <span class="spa spa15" id="spa15" style="margin-left: 125px; width: 800px;"></span>

            <h2 style="margin-top: 30px;">其他信息</h2>
            <hr class="layui-bg-green" style="margin-bottom: 20px;">
            <div class="layui-form-item" style="margin-top: 30px; height: 38px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;&emsp;联系人</label>
                <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
                    <input  type="text" name="contacts" required id="contacts" lay-verify="required"   lay-verify="required" autocomplete="off" class="layui-input" >
                </div>
            </div>
            <span class="spa spa16" id="spa16" style="margin-left: 125px; width: 800px;"></span>
            <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;身份选择</label>
                <div class="layui-input-inline" style=" width: 150px; margin-left: 20px;">
                    <select name="identityId" lay-verify="required">
                        <c:forEach items="${identity}" var="obj">
                            <option value="${obj.identityId}" >${obj.identityName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px; height: 38px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;联系电话</label>
                <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
                    <input  type="text" name="telephone" id="telephone" required  lay-verify="required" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input" >
                </div>
            </div>
            <span class="spa spa17" id="spa17" style="margin-left: 125px; width: 800px;"></span>
            <div class="layui-form-item" style="margin-top: 50px;">
                <div class="layui-input-block" >
                    <button class="layui-btn layui-btn-disabled" disabled="disabled" lay-submit id="next" lay-filter="next">下一步</button>
                </div>
            </div>

        </form>



    </div>

    <div class="lianjia-footer-simple">租房（大连） | 网络经营许可证 00000001号-1 | &copy; Copyright&copy;2018-2019 租房版权所有&nbsp;<div style="width:300px;color: #888c8e;font-size: 12px;line-height: 20px;margin: auto;"><a
            target="_blank"  style="display:inline-block;text-decoration:none;height:20px;line-height:20px;margin: 0 auto;text-align: center;"><img
            src="${ctx}/static/img/beian.png" style=" float:left;">
        <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px;color: #888c8e;">公网安备1000000001号</p>
    </a></div>
    </div>



    </body>
</head>

<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    <%--只能输入两位小数--%>
    function num(obj){
        obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
        obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字
        obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个, 清除多余的
        obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
        obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数
    }

</script>

<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table','laydate','layedit'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        var table = layui.table;
        var laydate = layui.laydate;
        var layedit = layui.layedit;

        //验证判别
        var check1 = false;
        var check2 = false;
        var check3 = false;
        var check4 = false;
        var check5 = false;
        var check6 = false;
        var check7 = false;
        var check8 = false;
        var check9 = false;
        var check10 = false;
        var check11 = false;
        var check12 = false;
        var check13 = false;
        var check14 = false;
        var check15 = false;
        var check16 = false;
        var checkt1 = false;
        var checks1 = false;
        var checks2 = false;
        var checks3 = false;
        //省市联动start
        form.on('select(province)',function (data) {
            if(data.value == ''){
                $(".spas1").text("请选择").css("color","#BD362F");
                checks1 = false;
            } else {
                $(".spas1").text("\u2714").css("color","#00CD00");
                checks1 = true;
            }
            checkTotal();
            //获取provinceCode值
            var provinceCode = $('#province').val();
            if(provinceCode == '' ){
                //清空
                var html="<option value=\"\">-请选择-</option>";
                $('#city').html(html);
                $('#district').html(html);
                form.render();
                $(".spas2").text("请选择").css("color","#BD362F");
                checks2 = false;
                $(".spas3").text("请选择").css("color","#BD362F");
                checks3 = false;
                checkTotal();
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
        form.on('select(city)',function (data) {
            if(data.value == ''){
                $(".spas2").text("请选择").css("color","#BD362F");
                checks2 = false;
            } else {
                $(".spas2").text("\u2714").css("color","#00CD00");
                checks2 = true;
            }
            checkTotal();
            //获取provinceCode值
            var cityCode = $('#city').val();
            if(cityCode == ''){
                //清空
                var html="<option value=\"\">-请选择-</option>";
                $('#district').html(html);
                form.render();
                $(".spas3").text("请选择").css("color","#BD362F");
                checks3 = false;
                checkTotal();
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


        //入住时间
        laydate.render({
            elem: '#houseCheckTimeString'
            ,min: 0
            ,trigger:'click'
            ,done: function(value, date, endDate){
                $(".spat1").text("\u2714").css("color","#00CD00");
                checkt1 = true;
               checkTotal();
            }
        });


        //监听房间包含设施

        //失焦判断
        $("input").blur(function(){
            //地址判断
            if($(this).is("#detailAddress")){
                var address= $('#detailAddress').val().trim();
                if(address == ''){
                    $(".spa1").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check1= false;
                }else if(address.length > 25){
                    $(".spa1").text("字符数已超出限制").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check1 = false;
                }else{
                    $(".spa1").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check1 = true;
                }
            }
            //小区判断
            if($(this).is("#addressCommunity")){
                var community = $('#addressCommunity').val().trim();
                if(community == ''){
                    $(".spa2").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check2 = false;
                }else if(community.length > 15){
                    $(".spa2").text("字符数已超出限制").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check2 = false;
                }else{
                    $(".spa2").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check2 = true;
                }
            }
            //栋判断
            if($(this).is("#addressBuilding")){
                var addressBuilding = $('#addressBuilding').val().trim();
                if(addressBuilding == ''){
                    $(".spa3").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check3 = false;
                }else{
                    $(".spa3").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check3 = true;
                }
            }

            //单元判断
            if($(this).is("#addressUnit")){
                var addressUnit = $('#addressUnit').val().trim();
                if(addressUnit == ''){
                    $(".spa4").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check4 = false;
                }else{
                    $(".spa4").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check4 = true;
                }
            }

            //室判断
            if($(this).is("#typeRooms")){
                var typeRooms = $('#typeRooms').val().trim();
                if(typeRooms == ''){
                    $(".spa5").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check5 = false;
                }else{
                    $(".spa5").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check5 = true;
                }
            }

            //厅判断
            if($(this).is("#typeHalls")){
                var typeHalls = $('#typeHalls').val().trim();
                if(typeHalls == ''){
                    $(".spa6").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check6 = false;
                }else{
                    $(".spa6").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check6 = true;
                }
            }

            //卫判断
            if($(this).is("#typeBathrooms")){
                var typeBathrooms = $('#typeBathrooms').val().trim();
                if(typeBathrooms == ''){
                    $(".spa7").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check7 = false;
                }else{
                    $(".spa7").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check7 = true;
                }
            }

            //单元判断
            if($(this).is("#houseArea")){
                var houseArea = $('#houseArea').val().trim();
                if(houseArea == ''){
                    $(".spa8").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check8 = false;
                }else{
                    $(".spa8").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check8 = true;
                }
            }

            //楼层判断
            if($(this).is("#floor")){
                var floor = $('#floor').val().trim();
                if(floor == ''){
                    $(".spa9").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check9 = false;
                }else{
                    $(".spa9").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check9 = true;
                }
            }

            //总楼层判断
            if($(this).is("#totalFloor")){
                var totalFloor = $('#totalFloor').val().trim();
                if(totalFloor == ''){
                    $(".spa10").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check10 = false;
                }else{
                    $(".spa10").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check10 = true;
                }
            }

            //门牌号
            if($(this).is("#addressRoom")){
                var addressRoom = $('#addressRoom').val().trim();
                if(addressRoom == ''){
                    $(".spa11").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check11 = false;
                }else{
                    $(".spa11").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check11 = true;
                }
            }

            //租金
            if($(this).is("#housePrice")){
                var housePrice = $('#housePrice').val().trim();
                if(housePrice == ''){
                    $(".spa12").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check12 = false;
                }else{
                    $(".spa12").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check12 = true;
                }
            }

            //人数判断
            if($(this).is("#housePeople")){
                var housePeople = $('#housePeople').val().trim();
                if(housePeople == ''){
                    $(".spa13").text("");
                }else{
                    $(".spa13").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                }
            }

            //标题判断
            if($(this).is("#houseName")){
                var houseName= $('#houseName').val().trim();
                if(houseName == ''){
                    $(".spa14").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check13 = false;
                }else if(houseName.length > 30){
                    $(".spa14").text("字符数已超出限制").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check13 = false;
                }else if(houseName.length < 8){
                    $(".spa14").text("字符数不够8个").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check13 = false;
                }else{
                    $(".spa14").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check13 = true;
                }
            }

            //标题判断
            if($(this).is("#contacts")){
                var contacts= $('#contacts').val().trim();
                if(contacts == ''){
                    $(".spa16").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check14 = false;
                }else if(contacts.length > 10){
                    $(".spa16").text("字符数已超出限制").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check14 = false;
                }else if(contacts.length < 2){
                    $(".spa16").text("字符数不够2个").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check14 = false;
                }else{
                    $(".spa16").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check14 = true;
                }
            }

            //电话判断
            if($(this).is("#telephone")){
                var telephone = $('#telephone').val().trim();
                if(telephone == ''){
                    $(".spa17").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check15 = false;
                }else if(telephone.length != 11){
                    $(".spa17").text("电话号码不正确").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check15 = false;
                }else{
                    $(".spa17").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check15 = true;
                }
            }

            checkTotal();

        });
        $("textarea").blur(function () {
            //内容判断
            if($(this).is("#houseInfo")){
                var houseInfo= $('#houseInfo').val().trim();
                if(houseInfo == ''){
                    $(".spa15").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check16 = false;
                }else if(houseInfo.length > 500){
                    $(".spa15").text("字符数已超出限制").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check16 = false;
                }else{
                    $(".spa15").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check16 = true;
                }
            }
            checkTotal();
        });

        //监听区
        form.on('select(district)', function(data){
            if(data.value == ''){
                $(".spas3").text("请选择").css("color","#BD362F");
                checks3 = false;
            } else {
                $(".spas3").text("\u2714").css("color","#00CD00");
                checks3 = true;
            }
            checkTotal();
        });

        // //监听设施复选框
        // var length = 0;
        // form.on('checkbox(facilityId)', function(data){
        //     if (data.elem.checked){
        //         length ++ ;
        //     } else {
        //         length -- ;
        //     }
        //     if (length == 0){
        //
        //     }
        //
        // });


        //聚焦判断
        $("input").focus(function(){
            if($(this).is("#detailAddress")){
                $(".spa1").text("不超过25个字符").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }
            if($(this).is("#addressCommunity")){
                $(".spa2").text("不超过15个字符").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }
            if($(this).is("#houseArea")){
                $(".spa8").text("最多两位小数").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }
            if($(this).is("#housePrice")){
                $(".spa12").text("最多两位小数").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }
            if($(this).is("#houseName")){
                $(".spa14").text("标题字数为8-30字，不允许填写电话、QQ、微信、邮箱等联系方式或特殊符号").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }
            if($(this).is("#contacts")){
                $(".spa16").text("不少于2个汉字").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }
        });

        $("textarea").focus(function () {
            if($(this).is("#houseInfo")){
                $(".spa15").text("内容字数不超过500字").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }
        });

        function checkTotal() {
            if (checks1 && checks2 && checks3 && check1 && check2 && check3 && check4 && check5 && check6
                && check7 && check8 && check9 && check10 && check11 && check12 && check13 && check14
                && check15 && check16 && checkt1 ){
                $("#next").attr("class","layui-btn");
                $("#next").attr('disabled',false);
            }else
            {
                $("#next").attr("class","layui-btn layui-btn-disabled");
                $("#next").attr('disabled',true);
            }

        }


    });
</script>
</html>
