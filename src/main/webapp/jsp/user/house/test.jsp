
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <style>
        *{
            padding: 0;
            margin: 0;}
        form {
            width: 570px;
            height: 300px;
            margin: 100px auto;
        }
        label{
            width: 64px;
            float: left;
            clear: left;
            height: 36px;
            line-height: 36px;
            margin-top: 10px;
        }
        input {
            width: 300px;
            height: 36px;
            line-height: 36px;
            margin-top: 10px;
            text-indent: 8px;
            font-size: 16px;
            font-family: "微软雅黑";
            border: 1px solid #ccc;
            float: left;
        }
        #sub{
            width: 302px;
            height: 40px;
            border: 1px solid #ccc;
            background: #888;
            color: #fff;
            font-size: 18px;
            text-indent: 0;
        }
        .spa{
            height: 36px;
            line-height: 36px;
            width: 204px;
            display: inline-block;
            float: left;
            font-size: 12px;
            color: #BD362F;
            text-indent: 10px;
            margin-top: 10px;
        }
    </style>
</head>

<body>
<form action="" method="post">
    <label id="name">姓&nbsp;名：</label><input type="text" name="username" id="username" value="" placeholder="请输入姓名" /><span class="spa spa1"></span><br />
    <label id="phone">手机号：</label><input type="text" name="userphone" id="userphone" value="" placeholder="请输入手机号" /><span class="spa spa2"></span><br />
    <label id="address">地&nbsp;址：</label><input type="text" name="useraddress" id="useraddress" value="" placeholder="请输入地址" /><span class="spa spa3"></span><br />
    <label>&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="submit" value="注册" id="sub" />
</form>
<script type="text/javascript" src="${ctx}/static/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
    window.onload=function(){
        $("#username").focus()
    }
    /************************  失焦判断  **********************************/
    $("input").blur(function(){
        $(".spa").css("color","#BD362F")
        if($(this).is("#username")){             //姓名判断
            var na=/^[\u4E00-\u9FA5]{2,4}$/
            if($("#username").val()!=""){
                if(!(na.test($("#username").val()))){
                    $(".spa1").text("请输入2-4个汉字");
                    $(this).css("border","1px solid #BD362F")
                    return false;
                }else if(na){
                    $(".spa1").text("");
                    return true;
                }
            }else{
                $(".spa1").text("");
            }
        }
        if($(this).is("#userphone")){            //手机号判断
            var ph=/^1[3|5|7|8|][0-9]{9}$/
            if($("#userphone").val()!=""){
                if(!(ph.test($("#userphone").val()))){
                    $(".spa2").text("请输入正确手机号");
                    $(this).css("border","1px solid #BD362F")
                    return false;
                }else if(ph){
                    $(".spa2").text("");
                    return true;
                }
            }else{
                $(".spa2").text("");
            }
        }

        if($(this).is("#useraddress")){            //地址判断
            var ad=/^(?=.*?[\u4E00-\u9FA5])[\dA-Za-z\u4E00-\u9FA5]{8,32}/;
            if($("#useraddress").val()!=""){
                if(!(ad.test($("#useraddress").val()))){
                    $(".spa3").text("请输入正确地址");
                    $(this).css("border","1px solid #BD362F")
                    return false;
                }else if(ad){
                    $(".spa3").text("");
                    return true;
                }
            }else{
                $(".spa3").text("");
            }
        }
    })
    /********************** 聚焦提示 ************************/
    $("input").focus(function(){
        if($(this).is("#username")){
            $(".spa1").text("2-4个汉字").css("color","#aaa")
            $(this).css("border","1px solid #aaa")
        }
        if($(this).is("#userphone")){
            $(".spa2").text("11位手机号码").css("color","#aaa")
            $(this).css("border","1px solid #aaa")
        }
        if($(this).is("#useraddress")){
            $(".spa3").text("最少8个字符（汉字、字母和数字）").css("color","#aaa")
            $(this).css("border","1px solid #aaa")
        }
    })
    /*********************** 提交验证 ***************************/
    $("#sub").click(function(){
        var na=/^[\u4E00-\u9FA5]{2,4}$/;   //姓名正则
        var ph=/^1[3|5|7|8|][0-9]{9}$/;    //手机号正则
        var ad=/^(?=.*?[\u4E00-\u9FA5])[\dA-Za-z\u4E00-\u9FA5]{8,32}/;     //地址正则
        if(na.test($("#username").val())&&ph.test($("#userphone").val())&&ad.test($("#useraddress").val())){
            return true;
        }else{
            if($("#username").val()==""){
                $(".spa1").text('请你填写用户名')
            }
            if($("#userphone").val()==""){
                $(".spa2").text('请你填写手机号')
            }
            if($("#useraddress").val()==""){
                $(".spa3").text('请你填写地址')
            }
            return false;
        }
    })
</script>
</body>

</html>
