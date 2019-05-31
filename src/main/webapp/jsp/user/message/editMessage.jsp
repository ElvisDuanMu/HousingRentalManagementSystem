
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <title>链家用户中心_买房卖房用户-链家网</title>
    <meta name="description" content="链家网用户活动中心提供链家网买房卖房用户活动信息，关注房源和小区等" />
    <meta name="keywords" content="买房卖房用户活动中心，链家用户中心" />

    <link rel="stylesheet" href="${ctx}/static/css/common.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" />
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
        .layui-form-item {
            margin-bottom: 0;
            clear: both;

        }

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

    </style>
</head>
<header class="lianjia-header">
    <div class="nav-wrap">
        <div class="wrapper">
            <div class="fl"><a href="#" class="logo"></a></div>
            <div class="fr nav">
                <div class="fl">
                    <ul>
                        <li>
                            <a class="" href="#">租房</a>
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
                            <a class="" href="#" target="_blank">工具</a>
                        </li>
                        <li>
                            <a class="" href="${ctx}/user/toPublishing" target="_blank">发布房源</a>
                        </li>

                    </ul>
                </div>
                <div class="fr login">
                    <div class="login-panel typeUserInfo">

                        <div class="ti-hover">
                            <div class="user-news" id="userNews">

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="user-main">
    <div class="main-left fl" >
        <div style="height: 80px; width: 80px; margin: 0 auto;" >
            <img src="${ctx}${sessionScope.userImg}" style="width: 80px ;height: 80px;">
        </div>
        <div class="user-name" style="padding: 15px 0 5px 0;">欢迎你，${sessionScope.Username} </div>
        <%--存登陆人--%>
        <input type="hidden" value="${sessionScope.Username}" id="username">
        <div class="user-name" style="padding: 0 0 15px 0;"><a id="logout" href="${ctx}/user/quit" >退出</a></div>
        <ul>
            <li><a href="${ctx}/user/index/${sessionScope.Username}">首页</a></li>
            <li> <a href="${ctx}/user/application/${sessionScope.Username}">申请管理</a></li>
            <li><a href="${ctx}/user/houseInfo/${sessionScope.Username}">我的房源</a></li>
            <li><a href="${ctx}/user/contract/${sessionScope.Username}">我的合同</a></li>
            <li><a href="${ctx}/user/money/${sessionScope.Username}">我的收入</a></li>
            <li><a href="${ctx}/user/breakdown/${sessionScope.Username}">报障信息</a></li>
            <li class="hover"><a href="${ctx}/user/message/${sessionScope.Username}">编辑资料</a></li>
        </ul>
    </div>
    <div class="main-right fr" style="min-height: 600px;">
        <div id="allList">
            <div class="title">编辑信息</div>
            <%--选项卡--%>
            <div class="layui-tab layui-tab-brief" >
                <ul class="layui-tab-title">
                    <li class="layui-this">修改信息</li>
                    <li>修改头像</li>
                    <li>修改密码</li>
                </ul>
                <div class="layui-tab-content" >
                    <%--修改信息--%>
                    <div class="layui-tab-item layui-show">
                        <div class="layui-form">
                            <div class="layui-form-item" style="margin-top: 30px; height: 40px;">
                                <label class="layui-form-label">昵称</label>
                                <div class="layui-input-inline" style="margin-left: 20px;">
                                    <input type="text" name="userNickname" id="userNickname" required style="width: 500px;" readonly  autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
                            <label class="layui-form-label">性别</label>
                                <div class="layui-input-inline" style="margin-left: 20px;">
                                    <input type="text" name="sex" id="sex1" required style="width: 500px;" readonly  autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
                                <label class="layui-form-label">联系电话</label>
                                <div class="layui-input-inline" style="margin-left: 20px;">
                                    <input type="text" name="phone" id="phone" required style="width: 500px;"   readonly autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
                                <label class="layui-form-label">邮件</label>
                                <div class="layui-input-inline" style="margin-left: 20px;">
                                    <input type="text" name="email" id="email" required style="width: 500px;" readonly  autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
                                <label class="layui-form-label">QQ</label>
                                <div class="layui-input-inline" style="margin-left: 20px;">
                                    <input type="text" name="qq" id="qq" required style="width: 500px;" readonly    autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
                                <label class="layui-form-label">微信</label>
                                <div class="layui-input-inline" style="margin-left: 20px;">
                                    <input type="text" name="wechat" id="wechat" required style="width: 500px;" readonly  autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item" style="margin-top: 20px;">
                            <div class="layui-input-block" >
                                <button class="layui-btn" lay-submit lay-filter="msg" id="edit">编辑</button>
                            </div>
                        </div>
                    </div>

                    <%--修改头像--%>
                    <div class="layui-tab-item">
                        <div class="layui-form">
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button type="button" class="layui-btn" id="upload">
                                        <i class="layui-icon">&#xe67c;</i>上传头像
                                    </button>
                                    <br><br>
                                    头像预览：
                                    <div style="margin-top: 20px; width:200px;height:200px;border:3px solid #0099CC;border-radius: 5px;padding: 3px;">
                                        <img style="max-width: 200px;max-height:200px;" src="${ctx}${sessionScope.userImg}" id="preview">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin-top: 20px;">
                                <div class="layui-input-block">
                                    <button class="layui-btn" id="commit" onclick="return false">立即提交</button>
                                </div>
                            </div>
                        </div>
                    </div>
                        <%--修改密码--%>
                    <div class="layui-tab-item" >
                        <div class="layui-form" >
                            <div class="layui-form-item" style="margin-top: 30px; height: 40px;">
                                <label class="layui-form-label">原密码</label>
                                <div class="layui-input-inline" style="margin-left: 20px;">
                                    <input type="password" name="oldPassword" id="oldPassword" required style="width: 500px;"  placeholder="请输入原密码"  autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <span class="spa spa1" id="spa1" style="margin-left: 125px; width: 400px;"></span>
                            <div class="layui-form-item" style="margin-top: 30px; height: 40px;">
                                <label class="layui-form-label">新密码</label>
                                <div class="layui-input-inline" style="margin-left: 20px;">
                                    <input type="password" name="newPassword" id="newPassword" required style="width: 500px;"  placeholder="请输入新密码"  autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <span class="spa spa2" id="spa2" style="margin-left: 125px; width: 600px;"></span>
                            <div class="layui-form-item" style="margin-top: 30px; height: 40px;">
                                <label class="layui-form-label">再次输入密码</label>
                                <div class="layui-input-inline" style="margin-left: 20px;">
                                    <input type="password" name="rePassword" id="rePassword" required style="width: 500px;"  placeholder="请再次输入新密码"  autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <span class="spa spa3" id="spa3" style="margin-left: 15px; width: 400px;"></span>

                        </div>
                        <div class="layui-form-item" style="margin-top: 20px;">
                            <div class="layui-input-block" >
                                <button lay-submit class="layui-btn layui-btn-disabled" id="editPassword" lay-filter="editPassword" disabled="disabled">修改</button>
                            </div>
                        </div>

                    </div>
                </div>



            </div>

        </div>
    </div>
</div>
<div class="clear"></div>
</div>

<div class="lianjia-footer-simple">链家网（北京）科技有限公司 | 网络经营许可证 京ICP备16057509号-2<br>© Copyright©2010-2019
    链家网Lianjia.com版权所有&nbsp;<div style="width:300px;color: #888c8e;font-size: 12px;line-height: 20px;margin: auto;"><a
            target="_blank"  style="display:inline-block;text-decoration:none;height:20px;line-height:20px;margin: 0 auto;text-align: center;"><img
            src="/static/img/beian.png" style=" float:left;">
        <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px;color: #888c8e;">京公网安备 11010802024019号</p>
    </a></div>
</div>

</body>


<%--弹出用户详细信息--%>
<div class="layui-form" id="popUserMsg" style="display: none; margin: 70px  50px;">
    <div class="layui-form">
        <div class="layui-form-item" style="margin-top: 30px; height: 40px;">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-inline" style="margin-left: 20px;">
                <input type="text" name="userNickname" id="userNickname1"  style="width: 500px;"  lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline" style="margin-left: 20px; width: 400px;" >
                <input type="radio" name="sex" value="男" title="男" >
                <input type="radio" name="sex" value="女" title="女" >
                <input type="radio" name="sex" value="保密" title="保密" >
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline" style="margin-left: 20px;">
                <input type="text" name="phone" id="phone1" style="width: 500px;" lay-verify="phone" placeholder="请输入联系电话" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
            <label class="layui-form-label">邮件</label>
            <div class="layui-input-inline" style="margin-left: 20px;">
                <input type="text" name="email" id="email1" style="width: 500px;" lay-verify="required|email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
            <label class="layui-form-label">QQ</label>
            <div class="layui-input-inline" style="margin-left: 20px;">
                <input type="text" name="qq" id="qq1" style="width: 500px;"   placeholder="请输入QQ" lay-verify="number" oninput="value=value.replace(/[^\d]/g,'')" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px; height: 40px;">
            <label class="layui-form-label">微信</label>
            <div class="layui-input-inline" style="margin-left: 20px;">
                <input type="text" name="wechat" id="wechat1"  style="width: 500px;"  placeholder="请输入微信" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 20px;">
            <div class="layui-input-block" >
                <button class="layui-btn" lay-submit lay-filter="save" >保存</button>
            </div>
        </div>
    </div>

</div>



<script type="text/javascript" src="${ctx}/static/js/jquery-2.1.4.min.js"></script>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'laypage', 'jquery', 'slider','util','element','layer','table','laydate','upload'], function () {
        var form = layui.form;
        var laypage = layui.laypage;
        var $ = layui.jquery;
        var slider = layui.slider;
        var util = layui.util;
        var element = layui.element;
        var layer = layui.layer;
        var table = layui.table;
        var laydate = layui.laydate;
        var upload = layui.upload;

        var username = $('#username').val();

        //展示个人信息
        $.ajax({
            url:'${ctx}/user/viewMessage/' + username
            ,type: 'post'
            ,success:function (msg) {
                $('#userNickname').val(msg.userNickname);
                $('#phone').val(msg.userPhone);
                $('#email').val(msg.userEmail);
                $('#qq').val(msg.userQq);
                $('#wechat').val(msg.userWechat);
                $('#sex1').val(msg.userSex);
                form.render();
            }
        });

        //
        $('#edit').click(function () {
                layer.open({
                    type: 1 ,
                    title: '用户修改信息',
                    shade : 0.3,
                    content: $('#popUserMsg'),
                    area : ['800px','550px'],
                    offset: '150px',
                    success:function (layero, index) {
                        //展示个人信息
                        $.ajax({
                            url:'${ctx}/user/viewMessage/' + username
                            ,type: 'post'
                            ,success:function (msg) {
                                $('#userNickname1').val(msg.userNickname);
                                $('#phone1').val(msg.userPhone);
                                $('#email1').val(msg.userEmail);
                                $('#qq1').val(msg.userQq);
                                $('#wechat1').val(msg.userWechat);
                                var val = msg.userSex;
                                $("input[name='sex']").each(function(index, element) {
                                    //判断当前按钮的值与input的值是否一致，一致则赋值
                                    if($(this).val()==val){
                                        $(this).prop("checked",true);
                                    }
                                });
                                form.render();
                            }
                        })

                        //修改个人信息
                        form.on('submit(save)', function(data){
                            if ($('#userNickname1').val().trim().length <2 ||$('#userNickname1').val().trim().length>10  ) {
                                return layer.msg('昵称应为2-10个字符');
                            }


                            var msg = {
                                userLoginName : username,
                                userNickname : $('#userNickname1').val().trim(),
                                userSex : $("input[name='sex']:checked").val(),
                                userPhone : $('#phone1').val().trim(),
                                userEmail: $('#email1').val().trim(),
                                userQq : $('#qq1').val().trim(),
                                userWechat: $('#wechat1').val().trim()
                            };

                            $.ajax({
                                url: '${ctx}/user/checkMsg',
                                type: 'post',
                                contentType: 'application/json',
                                data: JSON.stringify(msg),
                                success: function (data) {
                                    if (data.code == 101){
                                        layer.msg("该邮箱已被使用",{icon:5});
                                    }
                                    else if (data.code == 102){
                                        layer.msg("该QQ已被使用",{icon:5});
                                    }
                                    else if (data.code == 103){
                                        layer.msg("该微信已被使用",{icon:5});
                                    }
                                    else if (data.code == 104){
                                        layer.msg("该电话已被使用",{icon:5});
                                    }
                                    else {
                                        layer.msg('修改成功',{
                                            icon: 6,
                                            time: '1000'
                                        },function () {
                                            window.location.reload();
                                        });

                                    }

                                }
                            });

                        });


                    }
                });
            }
        );


        //检查密码格式
        function checkPwd(str){
            var pattern1 = /([0-9]+)/;
            var pattern2 = /([a-z]+)/;
            var pattern3 = /([A-Z]+)/;
            //限制密码的位数在8-20位之间
            if(str.length<8 ||str.length>20){
                return 1;
            }
            //没有数字、大写字母、小写字母时返回false，验证输入的密码不符合规则。
            if(!pattern1.exec(str) || !pattern2.exec(str) || !pattern3.exec(str)){
                return 2;
            }

            //不能有空格、换行、tab缩进等所有的空白
            var pattern4 = /\s+/g;
            if(pattern4.exec(str)){
                return 3;
            }

        }

        //失焦判断
        var check1 = false;
        var check2 = false;
        var check3 = false;
        var shujuku;
        //从数据库中获取原密码
        $.ajax({
            url:'${ctx}/user/queryPassword/' + username
            ,type: 'post'
            ,success:function (msg) {
                shujuku = msg.password;
            }
        });
        $("input").blur(function(){
            //旧密码判断
            if($(this).is("#oldPassword")){
                var oldPassword = $('#oldPassword').val().trim();

                if(oldPassword == ''){
                    $(".spa1").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check1 = false;
                }else if(oldPassword != shujuku){
                    $(".spa1").text("原密码输入不正确").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check1 = false;
                }
                else{
                    $(".spa1").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check1 = true;
                }
            }
            //新密码判断
            if($(this).is("#newPassword")){
                var newPassword= $('#newPassword').val().trim();
                var result = checkPwd(newPassword);
                if(newPassword == ''){
                    $(".spa2").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check2 = false;
                }else if(result == 1){
                    $(".spa2").text("密码应为8-16位").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check2 = false;
                }else if(result == 2){
                    $(".spa2").text("密码应同时包含大写字母、小写字母和数字").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check2 = false;
                }else if(result == 3){
                    $(".spa2").text("密码不能有空格、tab、换行等空白").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check2 = false;
                } else {
                    $(".spa2").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check2 = true;
                }

            }
            //再次输入密码判断
            if($(this).is("#rePassword")){
                var rePassword = $('#rePassword').val().trim();
                var newPassword= $('#newPassword').val().trim();
                if(rePassword == ''){
                    $(".spa3").text("不能为空").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check3 = false;
                }else if(rePassword != newPassword){
                    $(".spa3").text("两次密码输入不一致").css("color","#BD362F");
                    $(this).css("border","1px solid #BD362F");
                    check3 = false;
                }
                else{
                    $(".spa3").text("\u2714").css("color","#00CD00");
                    $(this).css("border","1px solid #aaa");
                    check3 = true;
                }
            }

            if (check1 && check2 && check3){
                $("#editPassword").attr("class","layui-btn");
                $("#editPassword").attr('disabled',false);
            }else
            {
                $("#editPassword").attr("class","layui-btn layui-btn-disabled");
                $("#editPassword").attr('disabled',true);
            }

        });


        //聚焦判断
        $("input").focus(function(){
            if($(this).is("#oldPassword")){
                $(".spa1").text("请输入旧密码").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }
            if($(this).is("#newPassword")){
                $(".spa2").text("密码为8-16位，必须全部包含大写、小写字母和数字，不能有空白").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }

            if($(this).is("#rePassword")){
                $(".spa3").text("请重复输入密码").css("color","#0000FF");
                $(this).css("border","1px solid #aaa")
            }

        });

        form.on('submit(editPassword)', function(data){
            var password =  $('#newPassword').val().trim();
            //添加报障信息
            $.ajax({
                url:'${ctx}/user/updatePassword/' + username + "/" + password
                ,type: 'post'
                ,success:function (msg) {
                    if (msg.code == 200){
                        layer.msg('修改成功', {
                            icon: 6,
                            time: 1000
                        }, function(){
                            layer.load();
                            //退出重登
                            window.location.href="${ctx}/user/quit";
                        });
                    }else {
                        layer.msg("原密码输入错误",{icon:5});
                    }

                }
            })
        });

        upload.render({
            elem: '#upload',
            url: '${ctx}/user/updateUserImg',
            auto: false,//选择文件后不自动上传
            // data:{
            //     facilityName: function () {
            //         return $('#facilityName').val();
            //     }
            // },
            bindAction: '#commit',
            //上传前的回调
            before: function () {
                this.data = {
                    username: username
                }
            },
            //选择文件后的回调
            choose: function (obj) {
                obj.preview(function (index, file, result) {
                    $('#preview').attr('src', result);
                })
            },
            //操作成功的回调
            done: function (res, index, upload) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                layer.alert("上传成功", {icon: 1}, function () {
                    window.location.reload();
                })
            },
            //上传错误回调
            error: function (index, upload) {
                layer.alert('上传失败！' + index);
            }
        });

    });
</script>



</html>
