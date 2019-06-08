

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>


    <title>乐租用户中心_买房卖房用户-乐租网</title>
    <meta name="description" content="链家网用户活动中心提供链家网买房卖房用户活动信息，关注房源和小区等" />
    <meta name="keywords" content="买房卖房用户活动中心，链家用户中心" />

    <link rel="stylesheet" href="${ctx}/static/css/common.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">
    <link rel="stylesheet" href="${ctx}/static/cropper/cropper.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css" media="all" >
    <script type="text/javascript" src="${ctx}/static/plugins/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx}/static/cropper/cropper.js"></script>
    <script type="text/javascript" src="${ctx}/static/cropper/croppers.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery-2.1.4.min.js"></script>




    <header class="lianjia-header">
        <div class="nav-wrap">
            <div class="wrapper">
                <div class="fl"><a href="#" class="logo"></a></div>
                <div class="fr nav">
                    <div class="fl">
                        <ul>
                            <li>
                                <a class="" href="${ctx}/user/${ctx}/user/210000/210200/queryHouse">租房</a>
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
            <a>填写信息</a>
            <a><cite>添加图片</cite></a>
            <a>添加完成</a>
        </span>


        <div class="layui-upload" style="margin-top: 80px;">
            <input type="hidden"  value="${houseId}" name="houseId">
            <input type="hidden" id="faceImg2" value="${faceImg2}" >
            <h2 style="margin-top: 30px;">封面上传</h2>
            <hr class="layui-bg-green" style="margin-bottom: 30px;">
                    <button type="button" class="layui-btn layui-btn-normal" id="fengMian">
                        <i class="layui-icon">&#xe67c;</i>上传封面
                    </button>
                    <br>只能上传房屋图片，不能包含有文字、数字、网址、名片等，只能上传一张，最大2M,您已上传${faceImg1}张，还能上传${faceImg2}张。</br>
                    <br><br>
                    <div style="width:180px;height:180px;border:3px solid #0099CC;border-radius: 5px;">
                        <img style="width: 180px;height:180px;" id="preview">
                    </div>
            <div class="layui-form-item" style="margin-top: 10px;">
                <div class="layui-input-inline">
                    <button class="layui-btn layui-btn-danger" id="commit1" onclick="return false">开始上传</button>
                </div>
            </div>

            <h2 style="margin-top: 50px;">图片上传</h2>
            <hr class="layui-bg-green" style="margin-bottom: 30px;">

            <div class="layui-upload">
                <button type="button" class="layui-btn layui-btn-normal" style="margin-top: 10px;" id="testList">选择图片文件</button>
                <br>只能上传房屋图片，不能包含有文字、数字、网址、名片等，最多上传10张，每张最大2M，
                每次可以上传一张或多张图片，您已上传${puTongImg}张，还能上传${puTongImg2}张。</br>
                <input type="hidden" value="${puTongImg2}" id="puTongImg2">
                <div class="layui-upload-list">
                    <table class="layui-table">
                        <thead>
                        <tr><th>文件名</th>
                            <th>大小</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr></thead>
                        <tbody id="demoList"></tbody>
                    </table>
                </div>
                <button type="button" class="layui-btn layui-btn-danger" id="testListAction">开始上传</button>
            </div>
            <h2 style="margin-top: 30px;">如果您暂时不想上传或者上传完成的话，请点击</h2>
            <hr class="layui-bg-green" style="margin-bottom: 30px;">
            <form action="${ctx}/user/houseInfo/${sessionScope.Username}">
                <button type="submit" class="layui-btn" id="next">完成</button>
            </form>



        </div>



    </div>

    <div class="lianjia-footer-simple">租房（大连） | 网络经营许可证 00000001号-1 | &copy; Copyright&copy;2018-2019 租房版权所有&nbsp;<div style="width:300px;color: #888c8e;font-size: 12px;line-height: 20px;margin: auto;"><a
            target="_blank"  style="display:inline-block;text-decoration:none;height:20px;line-height:20px;margin: 0 auto;text-align: center;"><img
            src="${ctx}/static/img/beian.png" style=" float:left;">
        <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px;color: #888c8e;">公网安备1000000001号</p>
    </a></div>
    </div>

    </body>
</head>



<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery','upload','layer'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;
        var upload = layui.upload;
        var layer = layui.layer;



        //封面上传
        upload.render({
            elem: '#fengMian',
            auto: false,//选择文件后不自动上传
            bindAction: '#commit1'
            ,url:'${ctx}/house/fengMianImg'
            //上传前的回调
            ,before: function () {
                this.data = {
                    houseId: $('input[name="houseId"]').val()
                }
            },
            //选择文件后的回调
            choose: function (obj) {
                obj.preview(function (index, file, result) {
                    if ( $('#faceImg2').val() == 0) {
                        layer.msg("上传达到最大次数限制。")
                    }else {
                        $('#preview').attr('src', result);
                    }


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
  //
  //       //创建一个头像上传组件
  //       croppers.render({
  //           elem: '#fengMian'
  //           ,saveW:150     //保存宽度
  //           ,saveH:150
  //           ,mark:1/1    //选取比例
  //           ,area:'900px'  //弹窗宽度
  // //图片上传接口返回和（layui 的upload 模块）返回的JOSN一样
  //
  //               ,done: function(url){ //上传完毕回调
  //               // $("#inputimgurl").val(url);
  //                $("#preview").attr('src',url);
  //           }
  //       });


        <%--var images = [];--%>
        <%--//多图片上传--%>
        <%--upload.render({--%>
            <%--elem: '#upload'--%>
            <%--,multiple: true--%>
            <%--,url:'${ctx}/house/puTongImg'--%>
            <%--,accept: 'images'--%>
            <%--,acceptMime:'image/jpg'--%>
            <%--,bindAction:'#commit2'--%>
            <%--,size:2048--%>
            <%--,number:10--%>
            // ,before: function () {
            //         this.data = {
            //             houseId: $('input[name="houseId"]').val()
            //         }
            //     }
            <%--,choose: function(obj){--%>
                <%--//预读本地文件示例，不支持ie8--%>
                <%--obj.preview(function(index, file, result){--%>
                    <%--if(images.length < 10){--%>
                        <%--//追加图片时添加事件--%>
                        <%--$('#preview2').append('<img class="layui-upload-images" src="'+ result +'" alt="'+ file.name +'" style="width: 150px; height:150px;" class="layui-upload-img" ondblclick="delImages(this)">');--%>
                        <%--//追加图片成功追加文件名至图片容器--%>
                        <%--images.push(file.filename);--%>

                    <%--}--%>
                    <%--else{--%>
                        <%--layer.msg("一次最多上传10张");--%>
                    <%--}--%>


                <%--});--%>
            <%--}--%>
            <%--,allDone: function(res){--%>
                <%--console.log(res.total);--%>
                <%--//如果上传失败--%>
                <%--if (res.code > 0) {--%>
                    <%--return layer.msg('上传失败');--%>
                <%--}--%>
                <%--//上传成功--%>
                <%--layer.alert("上传成功", {icon: 1}, function () {--%>
                    <%--parent.window.location.reload();--%>
                <%--})--%>
            <%--}--%>
        <%--});--%>

//多文件列表示例
        var demoListView = $('#demoList')
            ,uploadListIns = upload.render({
            elem: '#testList'
            ,url: '${ctx}/house/puTongImg'
            ,accept: 'images'
            ,multiple: true
            ,size:2048
            ,auto: false
            ,number:$('#puTongImg2').val()
            ,bindAction: '#testListAction'
            ,before: function () {
                this.data = {
                    houseId: $('input[name="houseId"]').val()
                }
            }
            ,choose: function(obj){
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                if ( $('#puTongImg2').val() <= 0) {
                    layer.msg("上传达到最大次数限制。")
                }else if(files.length > 10){
                    layer.msg("一次最多上传10张");
                }
                else{
                    //读取本地文件
                    obj.preview(function(index, file, result){
                        var tr = $(['<tr id="upload-'+ index +'">'
                            ,'<td>'+ file.name +'</td>'
                            ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
                            ,'<td>等待上传</td>'
                            ,'<td>'
                            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                            ,'</td>'
                            ,'</tr>'].join(''));

                        //单个重传
                        tr.find('.demo-reload').on('click', function(){
                            obj.upload(index, file);
                        });

                        //删除
                        tr.find('.demo-delete').on('click', function(){
                            delete files[index]; //删除对应的文件
                            tr.remove();
                            uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                        });

                        demoListView.append(tr);
                    });
                }

            }
            ,done: function(res, index, upload){
                if(res.code == 0){ //上传成功
                    var tr = demoListView.find('tr#upload-'+ index)
                        ,tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作

                    return delete this.files[index]; //删除文件队列已经上传成功的文件

                }
                this.error(index, upload);
            }
            ,error: function(index, upload){
                var tr = demoListView.find('tr#upload-'+ index)
                    ,tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            },allDone: function (res) {
                //上传成功
                layer.alert("上传成功", {icon: 1}, function () {
                    parent.window.location.reload();
                });
            }
        });




    });




</script>
</html>
