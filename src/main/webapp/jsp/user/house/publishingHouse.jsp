
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

    <header class="lianjia-header">
        <div class="nav-wrap">
            <div class="wrapper">
                <div class="fl"><a href="#" class="logo"></a></div>
                <div class="fr nav">
                    <div class="fl">
                        <ul>
                            <li>
                                <a class="" href="#">二手房</a>
                            </li>
                            <li>
                                <a class="" href="#">新房</a>
                            </li>
                            <li>
                                <a class="" href="#">租房</a>
                            </li>
                            <li>
                                <a class="" href="#">海外</a>
                            </li>
                            <li>
                                <a class="" href="#">小区</a>
                            </li>
                            <li>
                                <a class="" href="#">经纪人</a>
                            </li>
                            <li class="hover">
                                <a class="" href="#">
                                    指南
                                </a>
                                <div class="nav-list">
                                    <dd>
                                        <i></i>
                                        <dl>
                                            <a href="#">问答</a>
                                        </dl>
                                        <dl>
                                            <a href="#">百科</a>
                                        </dl>
                                    </dd>
                                </div>
                            </li>
                            <li>
                                <a class="" href="#">房价</a>
                            </li>
                            <li>
                                <a class="" href="#" target="_blank">工具</a>
                            </li>
                            <li>
                                <a class="" href="#" target="_blank">发布房源</a>
                            </li>
                            <li>
                                <a class="" href="#" target="_blank">企业汇</a>
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
            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;详细地址</label>
                <div class="layui-input-inline" style="margin-left: 20px;">
                    <input type="text" name="detailAddress" required style="width: 500px;" lay-verify="required" placeholder="请输入详细地址（街道地址）" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;小区名称</label>
                <div class="layui-input-inline" style="margin-left: 20px;">
                    <input type="text" name="addressCommunity" required style="width: 500px;" lay-verify="required" placeholder="请输入小区名称" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房屋位置</label>
                <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
                    <input  type="text" name="addressBuilding" required  lay-verify="required"  autocomplete="off" class="layui-input" align="center" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">栋</div>
                <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
                    <input  type="text" name="addressUnit" required  lay-verify="required"  autocomplete="off" class="layui-input" align="center" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">单元</div>


            </div>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房屋规格</label>
                <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
                    <input  type="text" name="typeRooms" required  lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">室</div>
                <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
                    <input  type="text" name="typeHalls" required  lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">厅</div>
                <div class="layui-input-inline" style="margin-left: 40px; width: 100px;">
                    <input  type="text" name="typeBathrooms" required  lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">卫</div>
                <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
                <div class="layui-input-inline" style=" width: 100px;">
                    <input  type="text" name="houseArea" required  lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">㎡</div>
            </div>

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;楼&emsp;&emsp;层</label>
                <div class="layui-form-mid layui-word-aux" style="margin-left: 20px;">第</div>
                <div class="layui-input-inline" style=" width: 100px;">
                    <input  type="text" name="floor" required  lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux" >层</div>
                <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">共</div>
                <div class="layui-input-inline" style=" width: 100px;">
                    <input  type="text" name="totalFloor" required  lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux" >层</div>
                <div class="layui-form-mid layui-word-aux" style="margin-left: 40px;">门牌号</div>
                <div class="layui-input-inline" style=" width: 100px;">
                    <input  type="text" name="addressRoom" required  lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
                </div>

            </div>

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
                    <input  type="text" name="housePrice" required  lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
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

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;租金已包含费用</label>
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
                    <input type="radio" name="inspectionId" value="2" title="仅周末" >
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

            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    宜住人数
                </label>
                <div class="layui-input-inline" style="width: 100px; margin-left: 20px;">
                    <input  type="text" name="housePeople" required  lay-verify="required"  autocomplete="off" class="layui-input" style="text-align: center;">
                </div>
                <div class="layui-form-mid layui-word-aux">人</div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;标&emsp;&emsp;题
                </label>
                <div class="layui-input-inline" style="width: 600px; margin-left: 20px;">
                    <input  type="text" name="houseName" required placeholder="标题字数为8-60字，不允许填写电话、QQ、微信、邮箱等联系方式或特殊符号" lay-verify="required"  autocomplete="off" class="layui-input" >
                </div>

            </div>
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
                <label class="layui-form-label" >
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房屋配置</label>
                <div class="layui-input-inline" style="margin-left: 20px;  width: 800px; height: 30px;">
                    <c:forEach items="${facility}" var="obj">
                        <input type="checkbox" name="facilityId" value="${obj.facilityId}" title="${obj.facilityName}" lay-skin="primary">
                    </c:forEach>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px; height: 180px;">
                <label class="layui-form-label" >
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;房源描述</label>
                <div class="layui-input-inline" style="padding-left: 20px; width: 600px; height: 180px;">
                    <%--/<textarea id="houseInfo" style="display: none;"></textarea>--%>
                        <textarea name="houseInfo" required style="margin-top: 10px; height: 160px;" lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
            <h2 style="margin-top: 30px;">其他信息</h2>
            <hr class="layui-bg-green" style="margin-bottom: 20px;">
            <div class="layui-form-item" style="margin-top: 30px; height: 60px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;&emsp;联系人</label>
                <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
                    <input  type="text" name="contacts" required  lay-verify="required"  autocomplete="off" class="layui-input" >
                </div>
            </div>
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
            <div class="layui-form-item" style="margin-top: 20px; height: 60px;">
                <label class="layui-form-label">
                    <span class="layui-badge-dot"></span>&nbsp;&nbsp;&nbsp;联系电话</label>
                <div class="layui-input-inline" style="width: 200px; margin-left: 20px;">
                    <input  type="text" name="telephone" required  lay-verify="required"  autocomplete="off" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">下一步</button>
                </div>
            </div>

        </form>



    </div>

    <div class="lianjia-footer-simple">乐租网（北京）科技有限公司 | 网络经营许可证 京ICP备16057509号-2<br>© Copyright©2010-2019
        乐租网Lezu.com版权所有&nbsp;<div style="width:300px;color: #888c8e;font-size: 12px;line-height: 20px;margin: auto;"><a
                target="_blank"  style="display:inline-block;text-decoration:none;height:20px;line-height:20px;margin: 0 auto;text-align: center;"><img
                src="/static/img/beian.png" style=" float:left;">
            <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px;color: #888c8e;">京公网安备 11010802024019号</p>
        </a></div>
    </div>



    </body>
</head>

<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','table','laydate','layedit'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        var table = layui.table;
        var laydate = layui.laydate;
        var layedit = layui.layedit;
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


        //
        laydate.render({
            elem: '#houseCheckTimeString'
            ,min: 0
            ,trigger:'click'
        });

        // layedit.build('houseInfo', {
        //     height: 180 //设置编辑器高度
        // });

    });
</script>
</html>
