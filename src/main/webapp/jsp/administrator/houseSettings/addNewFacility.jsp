
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房屋租赁管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="/jsp/common/header.jsp" />

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="margin-top: 50px; margin-left: 50px; margin-right: 40px" >
            <h2>添加房间设施信息</h2>
            <hr class="layui-bg-red">

            <div class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">设施名称</label>
                    <div class="layui-input-inline">
                        <input type="text" id="facilityName" name="facilityName" required lay-verify="required" placeholder="请输入设施名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" id="upload">
                            <i class="layui-icon">&#xe67c;</i>上传图标
                        </button>
                        <br><br>
                        <div style="width:200px;height:200px;border:3px solid #0099CC;border-radius: 5px;padding: 3px;">
                            <img style="max-width: 200px;max-height:200px;" id="preview">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" id="commit" onclick="return false">立即提交</button>
                    </div>
                </div>
            </>


        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp" />

</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','upload','jquery'], function(){
        var element = layui.element;
        var form = layui.form;
        var upload = layui.upload;
        var $=layui.jquery;
        upload.render({
            elem: '#upload',
            url: '${ctx}/facilitySettings/uploadImg',
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
                    facilityName: $('input[name="facilityName"]').val()
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
                    parent.window.location.reload();
                })
            },
            //上传错误回调
            error: function (index, upload) {
                layer.alert('上传失败！' + index);
            }
        });

    });
</script>
</body>
</html>
