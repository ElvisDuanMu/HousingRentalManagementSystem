// 获取地址栏参数
function getParam(key){
    var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
    var result = window.location.search.substr(1).match(reg);
    return result?decodeURIComponent(result[2]):null;
}
//设置cookie
function setCookie(cname,cvalue,exdays){
    var d = new Date();
    d.setTime(d.getTime() + (exdays*12*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires+";path=/"; 
}
//获取cookie
function getCookie(cname){
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
}
// 距离函数
var EARTH_RADIUS = 6370693.5; //地球半径  
function rad(d) {  
    return d * Math.PI / 180.0;  
}
function getDistance(lng1, lat1, lng2, lat2) {
    var radLat1 = rad(lat1);  
    var radLat2 = rad(lat2);  
    var a = radLat1 - radLat2;  
    var b = rad(lng1) - rad(lng2);  
    var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)  
            + Math.cos(radLat1) * Math.cos(radLat2)  
            * Math.pow(Math.sin(b / 2), 2)));  
    s = s * EARTH_RADIUS;  
    s = Math.round(s * 10000) / 10000;  
    s = parseInt(s);
    if (s>=1000) {
      s = (s/1000).toFixed(1) + "km";
    }else{
      s = s+"m";
    };
    return s;
}
// 设置本地存储
function setLocalStorage(lname,lvalue){
  localStorage.setItem(lname, JSON.stringify(lvalue));
}
// 获取本地存储
function getLocalStorage(lname){
  return JSON.parse(localStorage.getItem(lname));
}
// 数组中删除某项
Array.prototype.remove = function (val) {
    var index = this.indexOf(val);
    if(index > -1){this.splice(index,1);}
}
// 高亮按钮
function highlight(label){
    label.bind("input propertychange",function(){
        var a = false;
        label.each(function(){
            if ($(this).val() === "") {
                a = true;
            };
        }) 
        if(!a){
            $(".common_btn").removeClass("opacity");
        }else{
            $(".common_btn").addClass("opacity");
        }
    })
};
// hash
// !function(a) {
//   a.hash || (a.hash = function(b, c) {
//     function d(a) {
//     return "string" == typeof a
//     }
//     var e, f, g, h;
//     if (d(b) && "" != b) return e = new RegExp("(&" + b + "=[^&]*)|(\\b" + b + "=[^&]*&)|(\\b" + b + "=[^&]*)", "ig"),
//     f = new RegExp("&*\\b" + b + "=[^&]*", "i"),
//     "undefined" == typeof c ? (g = location.hash.match(f), g ? decodeURIComponent(a.trim(g[0].split("=")[1])) : null) : (null === c ? location.hash = location.hash.replace(e, "") : (c += "", h = location.hash.replace(e, ""), h += "&" + b + "=" + encodeURIComponent(c), location.hash = h), void 0)
//   })
// } (jQuery);
// 点击选择城市
$(".city_box").hover(function(){
  $(".city_list").stop().slideDown(300);
  $(this).find("i").removeClass("triangle_b").addClass("triangle_t");
},function(){
  $(".city_list").stop().slideUp(300);
  $(this).find("i").removeClass("triangle_t").addClass("triangle_b");
})
//-------------------------------------------------------------------
// 公共登录弹框
function login(){
  var loginHtml = '<div class="login_box"><div class="login"><h3>登录</h3><em class="login_close"></em><label class="tel"><span class="title">手机号</span><input type="text" maxlength="11" placeholder="请输入手机号码"></label><label class="pic_mess"><span class="title">图形验证码</span><input type="text" placeholder="请输入右侧验证码" maxlength="6"><span class="pic_code"><img src="/Home/House/verufy.html"></span></label><label class="sm"><span class="title">短信验证码</span><input type="text" maxlength="6" placeholder="请输入短信验证码"><button class="get_code">获取验证码</button></label><a href="javascript:;" class="login_btn opacity common_btn">立即登录</a></div></div>';
  $("body").append(loginHtml);
  highlight($(".login input"));
}
//-------------------------------------------------------------------------------------
// 公共APP找房
function app(){
  var apphtml = "";
      apphtml += '<div class="app_box"><div class="app"><em class="app_close"></em><div class="app_left"><img src="http://'+window.location.host+'/Public/images/app_jm.png"></div><div class="app_right"><h3>轻松找到好房源</h3><p>开启更多功能&nbsp;&nbsp;获取专属优惠</p><img src="http://'+window.location.host+'/Public/images/app.png"></div></div></div>';
  $("body").append(apphtml);
}
//---------------------------------------------------------------------
//回到顶部按钮
var gotophtml = '<a id="gotop" href="javascript:;"></a>';
$(document).on("click","#gotop",function(){
  $("html,body").animate({"scrollTop": "0"},500);
})
$("body").append(gotophtml);
// 显示隐藏回到顶部按钮
$(document).scroll(function(){
  var docHeight =  $(window).height();
  var scorllTop = $(document).scrollTop();
  if (scorllTop >= docHeight/2) {
    $("#gotop").fadeIn();
  }else{
    $("#gotop").fadeOut();
  };
});

var host = window.location.host;
var http ="http://" +host + "/Home/House/";
//-------------------------------------------------------------------------------------
// 公共底部
// var bottomHtml = '<div class="common_footer"><div class="common_w cf"><dl><dt>hizhu.com</dt><dd><a href="http://'+window.location.host+'/Home/House/about.html#c='+$.hash("c")+'" rel="nofollow">关于我们</a></dd><dd><a href="http://'+window.location.host+'/Home/House/contact.html#c='+$.hash("c")+'">联系我们</a></dd><dd><a href="https://www.lagou.com/gongsi/j63227.html">加入我们</a></dd></dl><dl class="partner"><dt>合作伙伴</dt><dd><a href="javascript:;">青客</a><a href="javascript:;">爱上租</a></dd><dd><a href="javascript:;">魔方</a><a href="javascript:;">世联行</a></dd><dd><a href="javascript:;">万科</a><a href="javascript:;">龙湖</a></dd><dd><a href="javascript:;">朗诗</a></dd></dl><dl><dt>帮助</dt><dd><a href="http://'+window.location.host+'/Home/House/question.html#c='+$.hash("c")+'">常见问题</a></dd><dd><a href="http://'+window.location.host+'/Home/House/feedback.html#c='+$.hash("c")+'">意见反馈</a></dd><dd><a href="http://'+window.location.host+'/Home/House/sitemap.html#c='+$.hash("c")+'">网站地图</a></dd></dl><dl class="last"><dt>关注我们</dt><dd class="cf"><img class="wx_box" src="http://'+window.location.host+'/Public/images/ewm2.png"><a class="wx" href="javascript:;"></a><a class="wb" href="http://weibo.com/hizhu2015?refer_flag=1001030101_"></a></dd></dl></div><p class="icp">@hizhu.com&nbsp;&nbsp;&nbsp;沪ICP备15016401号</p> </div>';
// $("body").append(bottomHtml);
// 微信移上去效果
$(".wx").hover(function(){
  $(".wx_box").stop().fadeIn();
},function(){
  $(".wx_box").stop().fadeOut();
})
//初始化数据
var city_code = getCookie("city_code") || "001009001";
var city_name = getCookie("city_name") || "shanghai";
var cityzname = decodeURI(getCookie("cityzname")) || "上海";
var customer_id = getCookie("customer_id") || '';//用户Id
var user_mobile = getCookie("user_mobile");//用户手机号

//判断是否支持本地缓存
function isLocalStorage() {
    var testKey = 'test',
            storage = window.localStorage;
    try {
        storage.setItem(testKey, 'testValue');
        storage.removeItem(testKey);
        return true;
    } catch (error) {
        return false;
    }
}
// 获取区域数据
function getAreaData(){
  var areaData;
  var city_code=$("#index_city").val();
  $.ajax({
    type:"GET",
    async:false,
    dataType:'json',
    url:http+"regionscopes_json.html",
    data:{city_code:city_code},
    success:function(data){
      areaData = data;
    }
  })
  return areaData;
};
// 得到合租刷选数据
function getselect(){
  var selectData;
  $.ajax({
    type:"GET",
    async:false,
    dataType:'json',
    url:http+"select.html",
    data:{city_code:city_code},
    success:function(data){
      setLocalStorage("selectData"+city_code,data);
      selectData = data;
    }
  })
  return selectData;
};
//根据商圈ID获取板块ID
function getRegionid(id){
  var areaDataCache = getAreaData();//得到区域模板缓存
  for(var i=0;i < areaDataCache.data.length;i++){
    if(areaDataCache.data[i].id == id){
      return areaDataCache.data[i].parent_id;
    }
  }
};
// 得到配置文件
function getConfig(){
  var configData;
  $.ajax({
    type:"GET",
    async:false,
    dataType:'json',
    url:http+"config_ditu.html",
    data:{city_code:city_code},
    success:function(data){
      configData = data;
    }
  })
  return configData;
};
// 房源列表

 $("#js_save_house").click(function(){
  var host_url=$(".logo").attr('href');
    var get_city_url=$("#get_city_url").val();
  window.open(get_city_url+'mycollection.html','_blank');
 })
//--------------------------------------------------------------------------------------
$("#login").click(function(){
  login();
  $("body").css({"height":"100%","overflow":"hidden"});
});
// 点击关闭图标
$(document).on("click",".login_close",function(){
  $(".login_box").remove();
  $("body").css({"height":"auto","overflow":"auto"});
});
// 点击蒙层隐藏登录框
$(document).on("click",".login_box",function(e){
  var target = $(e.target);
  if (target.closest(".login").length == 0) {
    $(".login_box").remove();
    $("body").css({"height":"auto","overflow":"auto"});
  }else{return;};
});
// 输入框获取焦点
$(".login input").focus(function(){
  $(this).parent("label").addClass("selected").removeClass("error");
});
$(".pic_mess input").focus(function(){
  $(this).siblings(".title").text('图形验证码');
  var isMobile=/^(((1))+\d{10})$/;//判断手机号是否填写正确
  if ($(".tel input").val() == '') {
    $(".tel").addClass("error");
    $(".tel").find(".title").text("请输入手机号码");
  }else if(!isMobile.test($(".login input").val())) {
    $(".tel").addClass("error");
    $(".tel").find(".title").text("手机号码错误");
  };
});
$(".tel input").focus(function(){
  $(this).siblings(".title").text('手机号');
});
$(".sm input").focus(function(){
  $(this).siblings(".title").text('短信验证码');
});
// 输入框失去焦点
$(".login input").blur(function(){
  $(this).parent("label").removeClass("selected");
});
// 点击图形验证码切换
$(document).on("click",".pic_code img",function(){
  $(this).attr('src',http+'/verufy?d='+Math.random());
})
//点击获取验证码
$(document).on("click",".get_code",function(){
  var tel = $(".tel input").val();//获取手机号
  var code = $(".pic_mess input").val();//获取图形验证码
  if (tel == '') {
    $(".tel").addClass("error");
    $(".tel").find(".title").text("请输入手机号码");
    return;
  };
  if (code == '') {
    $(".pic_mess").addClass("error");
    $(".pic_mess").find(".title").text("请输入图形验证码");
    $(".pic_code img").attr('src',http+'/verufy?d='+Math.random());
    return;
  };
  var isMobile = /^1[34578]\d{9}$/;//判断手机号是否填写正确
  var is_auth=getCookie("house_data_type_id");
  var code_type=is_auth.substring(3,7)+"dN03icxj1";
  var code_time=Date.parse(new Date());
  if (isMobile.test(tel)) {
    $.post(http+'verifyimgcode.html',{imgcode:code},function(data){
      var data = $.parseJSON(data);//json字符串转为对象
      if (data.status == '200') {
        $(".get_code").text("已发送(60s)");
        daojishi();
        $(".sm input").trigger("focus");
        //请求发短信接口
        $.ajax({
          type: "POST",
          url: http+"pushPhoneCode.html",
          data: {phone:tel,imgcode:code,is_auth:is_auth,code_type:code_type,code_time:code_time},
          async: false,
          dataType:"json",
          success: function(data){
            if (data.status=="400") {
                alert(data.msg);
              }
           }
        });
      }else if(data.status == '400'){
        $(".pic_mess").addClass("error");
        $(".pic_mess").find(".title").text("图形验证码错误");
        $(".pic_code img").attr('src',http+'/verufy?d='+Math.random());
      };
    })
  }else{
    $(".tel").addClass("error");
    $(".tel").find(".title").text("手机号码错误");
  };
});
function daojishi(){
  var count = 60 , d = $(".get_code");
  t = setInterval(function(){
      count--;
      d.text('已发送('+count+'s)');
      d.attr("disabled","disabled");
      if(count == 0){
        d.text('重新发送');
        clearInterval(t);
        d.attr("disabled",false);
      }
  },1000);
}
//点击登录账号
$(document).on("click",".login_btn",function(){
  if (!$(this).hasClass("opacity")) {
    var tel = $(".tel input").val();//获取手机号
    var code = $(".pic_mess input").val();//获取图形验证码
    var smcode = $(".sm input").val();//短信验证码
    var isMobile=/^1[34578]\d{9}$/;//判断手机号是否填写正确
    if (isMobile.test(tel)) {
      if (smcode != '') {
        $.ajax({
          type: "POST",
          url: http+'submit.html',
          data: {phone: tel,phonecode:smcode},
          async: false,
          dataType:"json",
          success: function(data){
            if (data.status == '200') {
              $(".login_box").hide();
              setCookie("is_owner",data.is_owner);
              window.location.reload();
            }else if(data.status == '400'){
              $(".sm").addClass("error");
              $(".sm").find(".title").text(data.msg);
            };
          }
        })
      }else{
        $(".sm").addClass("error");
        $(".sm").find(".title").text("请输入短信验证码");
      };
    }else{
      $(".tel").addClass("error");
      $(".tel").find(".title").text("请输入有效的手机号");
    };
  }
});
//--------------------------------------------------------------------------------------
// 点击APP找房
$("#app").click(function(){
  app();
  $("body").css({"height":"100%","overflow":"hidden"});
})
// 点击关闭图标
$(document).on("click",".app_close",function(){
  $(".app_box").remove();
  $("body").css({"height":"auto","overflow":"auto"});
})
// 点击蒙层隐藏登录框
$(document).on("click",".app_box",function(e){
  var target = $(e.target);
  if (target.closest(".app").length == 0) {
    $(".app_box").remove();
    $("body").css({"height":"auto","overflow":"auto"});
  }else{return;};
});
//——————————————————————————————————————————————————————————————————————————————————————
if(user_mobile){
  $(".login_btn_text").text("个人中心");
  $("#login").addClass("login_btn2");
  $("#login").unbind("click");
}else{
  $(".login_btn_text").text("登录");
  $("#login").removeClass("login_btn2");
};
//点击退出登录
$("#js_out_login").click(function(){
  setCookie("user_mobile",'',-1);
  setCookie("customer_id",'',-1);
  setCookie("is_owner",'',-1);
  setCookie("user_commission"+user_mobile,'',-1);
  $(".login_btn_text").text("登录");
  $("#login").removeClass("login_btn2");
  window.location.reload();
});
// ---------------------------------------------------------------
// 搜索框
var now = -1,
    dataArr = '',
    a = '';
//监听keyup事件
$(".input_box").focus(function(){
  $(this).trigger("keyup");
})
// 用户粘贴触发事件
var content = document.getElementById("input_box");
if ($("#input_box").length != 0) {
  detectPaste(content, function(pasteInfo) {
      $(".input_box").val(pasteInfo.text);
      $(".input_box").trigger("keyup");
  });
};
$(".input_box").keyup(function(e){
  clearTimeout(a);
  var $this = $(this);
  var word = $.trim($(".input_box").val()).replace(/[:.#?\\]/g,'');
  var keycode = e.keyCode;//获取键盘code
  var get_city_url=$("#get_city_url").val();
  var housetype_val=$("#js_housetype_val").val();
  var housetype_f=0;
  var housetype_h=0;
  if(housetype_val==11){
      housetype_h=housetype_val;
  }else{
      housetype_f=housetype_val;
  }
  // 请求数据
  if (keycode != 38 && keycode != 40) {
    $(".search_result").empty().hide();
  };
  if (word.length != '0') {
    //如果是下键
    if (keycode == 40) {
        now ++;
        if (now == 10 || now == dataArr.data.length) {
          now = 0;
        };
        $(".search_result li").each(function(){
          var index = $(this).attr("data-index");
          var val = $(this).find("p").text();
          if (index == now) {
            $(".search_result li").removeClass("cur");
            $(this).addClass("cur");
            $(".input_box").val(val);
          };
        })
        return;
    }
    //如果是上键
    if (keycode == 38) {
        e.preventDefault();
        now --;
        if (now == -1) {
          now = 9;
        };
        $(".search_result li").each(function(){
          var index = $(this).attr("data-index");
          var val = $(this).find("p").text();
          if (index == now) {
            $(".search_result li").removeClass("cur");
            $(this).addClass("cur");
            $(".input_box").val(val);
          };
        })
        return;
    }
    $(".history").hide();
    now = -1;
    a = setTimeout(function(){
      $.ajax({
        type:"GET",
        async:true,
        dataType:'json',
        url:http+"getsearchekey.html",
        data:{city_code:city_code,keyword:word},
        success:function(data){
          $(".search_result").empty().hide();
          dataArr = data;
          var dataMes = data.data || '';
          if (dataMes.length == 0) {
            $(".search_result").empty().hide();
          }else{
            var metroArr = [],xzArr=[],regionArr=[],addArr=[],xqArr=[],gyArr=[];
            for(var i = 0; i < dataMes.length;i++){
              if (dataMes[i].type_name == '地铁线') {
                metroArr.push(dataMes[i]);
              };
              if (dataMes[i].type_name == '行政区') {
                xzArr.push(dataMes[i]);
              };
              if (dataMes[i].type_name == '商圈') {
                regionArr.push(dataMes[i]);
              };
              if (dataMes[i].type_name == '地标') {
                addArr.push(dataMes[i]);
              };
              if (dataMes[i].type_name == '小区') {
                xqArr.push(dataMes[i]);
              };
              if (dataMes[i].type_name == '品牌公寓') {
                gyArr.push(dataMes[i]);
              };
            }

            // 地铁数据
         if (metroArr.length != 0) {

              var metroList = '';
              metroList += '<div class="metro_result"><ul>'
              if (metroArr.length <= 3) {
                for(var i=0;i<metroArr.length;i++){
                  metroList += '<li><a href="'+get_city_url+'dtlist1/a'+metroArr[i].id+'/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key='+metroArr[i].estate_name+'"><p>'+metroArr[i].estate_name+'</p><span>'+metroArr[i].type_name+'</span></a></li>';
                }
                metroList += '</ul></div>';
              }else if(metroArr.length > 3){
                for(var i = 0;i < 3;i++){
                  metroList += '<li><a href="'+get_city_url+'dtlist1/a'+metroArr[i].id+'/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key='+metroArr[i].estate_name+'"><p>'+metroArr[i].estate_name+'</p><span>'+metroArr[i].type_name+'</span></a></li>';
                }
                metroList += '</ul>';
                metroList += '<a class="more" href="javascript:;">查看更多'+metroArr[0].type_name+'</a>';
                metroList += '<div class="more_list">';
                for(var i = 3;i < metroArr.length;i++){
                  metroList += '<a href="'+get_city_url+'dtlist1/a'+metroArr[i].id+'/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key='+metroArr[i].estate_name+'">'+metroArr[i].estate_name+'</a>';
                }
                metroList += '</div></div>';
              };
              $(".search_result").empty().show().append(metroList);
            };
            //行政区数据
            if (xzArr.length != 0) {
              var xzList = '';
              xzList += '<div class="xz_result"><ul>'
              if (xzArr.length <= 3) {
                for(var i=0;i<xzArr.length;i++){
                  xzList += '<li><a href="'+get_city_url+'sqlist1/a'+xzArr[i].id+'/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key='+xzArr[i].estate_name+'"><p>'+xzArr[i].estate_name+'</p><span>'+xzArr[i].type_name+'</span></a></li>';
                }
                xzList += '</ul></div>';
              }else if(xzArr.length > 3){
                for(var i = 0;i < 3;i++){
                  xzList += '<li><a href="'+get_city_url+'sqlist1/a'+xzArr[i].id+'/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key='+xzArr[i].estate_name+'"><p>'+xzArr[i].estate_name+'</p><span>'+xzArr[i].type_name+'</span></a></li>';
                }
                xzList += '</ul>';
                xzList += '<a class="more" href="javascript:;">查看更多'+xzArr[0].type_name+'</a>';
                xzList += '<div class="more_list">';
                for(var i = 3;i < xzArr.length;i++){
                  xzList += '<a href="'+get_city_url+'sqlist1/a'+xzArr[i].id+'/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key='+xzArr[i].estate_name+'">'+xzArr[i].estate_name+'</a>';
                }
                xzList += '</div></div>';
              };
              $(".search_result").empty().show().append(xzList);
            };
            //商圈
            if (regionArr.length != 0) {
              var regionList = '';
              regionList += '<div><ul>';
              if (regionArr.length <= 3) {
                for(var i=0;i<regionArr.length;i++){
                  var regionId = getRegionid(regionArr[i].id);
                  regionList += '<li><a href="'+get_city_url+'sqlist2/a'+regionId+'/b'+regionArr[i].id+'/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key='+regionArr[i].estate_name+'"><p>'+regionArr[i].estate_name+'</p><span>'+regionArr[i].type_name+'</span></a></li>';
                }
                regionList += '</ul></div>';
              }else if(regionArr.length > 3){
                for(var i = 0;i < 3;i++){
                  var regionId = getRegionid(regionArr[i].id);
                  regionList += '<li><a href="'+get_city_url+'sqlist2/a'+regionId+'/b'+regionArr[i].id+'/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key='+regionArr[i].estate_name+'"><p>'+regionArr[i].estate_name+'</p><span>'+regionArr[i].type_name+'</span></a></li>';
                }
                regionList += '</ul>';
                regionList += '<a class="more" href="javascript:;">查看更多'+regionArr[0].type_name+'</a>';
                regionList += '<div class="more_list">';
                for(var i = 3;i < regionArr.length;i++){
                   var regionId = getRegionid(regionArr[i].id);
                  regionList += '<a href="'+get_city_url+'sqlist2/a'+regionId+'/b'+regionArr[i].id+'/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key='+regionArr[i].estate_name+'">'+regionArr[i].estate_name+'</a>';
                }
                regionList += '</div></div>';
              };
              $(".search_result").show().append(regionList);
            };
             //品牌公寓
            if (gyArr.length != 0) {
              var gyList = '';
              for(var i=0;i<gyArr.length;i++){
                gyList += '<li><a href="'+get_city_url+'sqlist1/a0/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key_self='+gyArr[i].result_no+'&key='+gyArr[i].estate_name+'&search_id='+gyArr[i].id+'&type_no='+gyArr[i].type_no+'"><p>'+gyArr[i].estate_name+'</p><span>'+gyArr[i].type_name+'</span></a></li>';
              }
              gyList += '</ul></div>';
              $(".search_result").empty().show().append(gyList);
            };
            // 小区数据
            if (xqArr.length != 0) {
              var xqList = '';
              xqList += '<div class="xq_result"><ul>';
              if (xqArr.length <= 3) {
                for(var i = 0;i < xqArr.length;i++){
                  xqList += '<li><a href="'+get_city_url+'sqlist1/a0/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key_self='+xqArr[i].result_no+'&key='+xqArr[i].estate_name+'&search_id='+xqArr[i].id+'&type_no='+xqArr[i].type_no+'"><p>'+xqArr[i].estate_name+'</p><em>'+xqArr[i].estate_address+'</em><span>'+xqArr[i].type_name+'</span></a></li>';
                }
                xqList += '</ul></div>';
              }else if(xqArr.length > 3){
                for(var i = 0;i < 3;i++){
                  xqList += '<li><a href="'+get_city_url+'sqlist1/a0/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key_self='+xqArr[i].result_no+'&key='+xqArr[i].estate_name+'&search_id='+xqArr[i].id+'&type_no='+xqArr[i].type_no+'"><p>'+xqArr[i].estate_name+'</p><em>'+xqArr[i].estate_address+'</em><span>'+xqArr[i].type_name+'</span></a></li>';
                }
                xqList += '</ul>';
                xqList += '<a class="more" href="javascript:;">查看更多'+xqArr[0].type_name+'</a>';
                xqList += '<div class="more_list">';
                for(var i = 3;i < xqArr.length;i++){
                  xqList += '<a href="'+get_city_url+'sqlist1/a0/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/?key_self='+xqArr[i].result_no+'&key='+xqArr[i].estate_name+'&search_id='+xqArr[i].id+'&type_no='+xqArr[i].type_no+'">'+xqArr[i].estate_name+'</a>';
                }
                xqList += '</div></div>';
              };
              $(".search_result").show().append(xqList);
            };
            //地标
            if (addArr.length != 0) {
              var liLen = $(".search_result li").length;
              var addList = '';
              addList += '<div><ul>';
              if (addArr.length >= (10-liLen)) {
                for(var i = 0;i < (10-liLen);i++){
                  addList += '<li><a class="db" href="'+get_city_url+'sqlist1/a0/b0/c0/d0/e0/f'+housetype_f+'/g0/h0/?key_self='+addArr[i].result_no+'&key='+addArr[i].estate_name+'&sort=5&distance=10000&latitude='+addArr[i].lat+'&longitude='+addArr[i].lng+'&type_no='+addArr[i].type_no+'&search_id='+addArr[i].id+'"><p>'+addArr[i].estate_name+'</p><em>'+addArr[i].estate_address+'</em><span>'+addArr[i].type_name+'</span></a></li>';
                }
                addList += '</ul></div>';
              }else{
                for(var i = 0;i < addArr.length;i++){
                  addList += '<li><a class="db" href="'+get_city_url+'sqlist1/a0/b0/c0/d0/e0/f'+housetype_f+'/g0/h0/?key_self='+addArr[i].result_no+'&key='+addArr[i].estate_name+'&sort=5&distance=10000&latitude='+addArr[i].lat+'&longitude='+addArr[i].lng+'&type_no='+addArr[i].type_no+'&search_id='+addArr[i].id+'"><p>'+addArr[i].estate_name+'</p><em>'+addArr[i].estate_address+'</em><span>'+addArr[i].type_name+'</span></a></li>';
                }
                addList += '</ul></div>';
              };
              $(".search_result").show().append(addList);
            };
            $(".history").hide();
            $(".search_result li").each(function(index){
                $(this).attr("data-index",index);
                $(".search_result li").last().css("border","0");
            })
          }; 
        }
      });
    },500)
  }else{
      var historyData = getCookie("history"+city_code);//历史记录数据
      if (historyData) {
        var arr = historyData.split("+");
        var historyhtml = "";
        for(var i = 0;i < arr.length;i++){
          var point_index = decodeURI(arr[i]).split(",");
          var title = point_index[0];
          var url = point_index[1];
          var span = point_index[2];
          if (span == '地标') {
            historyhtml += '<li><a class="db" href="'+url+'"><p>'+title+'</p>';
          }else{
            historyhtml += '<li><a href="'+url+'"><p>'+title+'</p>';
          };
          if (span) {
            historyhtml += '<span>'+span+'</span>'
          };
          historyhtml += '</a></li>';
        }
        $(".history_main").html(historyhtml);
        $(".history").show();
        $(".search_result").empty().hide();
      };
  };
});
// 点击下拉列表数据设置缓存
$(document).on("click",".search_result li",function(){
  var val = $(this).find("p").text();
  var val2 = $(this).find("span").text();
  var href = $(this).find("a").prop("href");
  setHistoryItems(city_code,val+","+href+","+val2);
})
//点击清除记录
$(".clearhistory").click(function(){
  clearHistory();
  $(".history").hide();
})
// 点击查看更多
$(document).on("click",".more",function(){
  if (!$(this).hasClass("more_hover")) {
    $(".more").removeClass("more_hover");
    $(".more_list").hide();
    $(this).siblings(".more_list").show();
    $(this).addClass("more_hover");
  }else{
    $(this).siblings(".more_list").hide();
    $(this).removeClass("more_hover");
  };
})
$(".input_box").keydown(function(e){
  var keycode = e.keyCode;//获取键盘code
  if (keycode == '13') {//按了enter键
    var val = $(".input_box").val();
    if (val == '') {
        var get_city_url=$("#get_city_url").val();
        var housetype_val=$("#js_housetype_val").val();
        var housetype_f=0;
        var housetype_h=0;
        if(housetype_val==11){
            housetype_h=housetype_val;
        }else{
            housetype_f=housetype_val;
        }
       window.location.href = get_city_url+'sqlist1/a0/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/';
    }else{
      if ($(".search_result li").length != '0') {
        if ($(".search_result li.cur").length == 0) {
          var href = $(".search_result li").first().find("a").prop("href");
          var text = $(".search_result li").first().find("p").text();
          var val2 = $(".search_result li").first().find("span").text();
          setHistoryItems(city_code,text+","+href+","+val2);
         window.location.href = href;
        }else{
          var href = $(".search_result li.cur").find("a").prop("href");
          var text = $(".search_result li.cur").find("p").text();
          var val2 = $(".search_result li.cur").find("span").text();
          setHistoryItems(city_code,text+","+href+","+val2);
          window.location.href = href;
        };
      }
      // else{
      //   setHistoryItems(city_code,val+',http://'+window.location.host+"/"+city_name+'/roomlist.html?come=zdy&key_self=1&key='+val+'#c='+$.hash("c"));
      //   window.location.href = 'http://'+window.location.host+"/"+city_name+'/roomlist.html?come=zdy&key_self=1&key='+val+'#c='+$.hash("c");
      // };
    };
  };
})
// 点击搜索图标
$(".icon_search").click(function(){
  var val = $(".input_box").val();
  if (val == '') {
      var get_city_url=$("#get_city_url").val();
      var housetype_val=$("#js_housetype_val").val();
      var housetype_f=0;
      var housetype_h=0;
      if(housetype_val==11){
          housetype_h=housetype_val;
      }else{
          housetype_f=housetype_val;
      }
   window.location.href = get_city_url+'sqlist1/a0/b0/c0/d0/e0/f'+housetype_f+'/g0/h'+housetype_h+'/';
  }else{
    var lis = $(".search_result li");
    if (lis.length != '0') {
      if ($(".search_result li.cur").length == 0) {
        var href = lis.first().find("a").prop("href");
        var text = lis.first().find("p").text();
        var text2 = lis.first().find("span").text();
        setHistoryItems(city_code,text+","+href+","+text2);
        window.location.href = href;
      }else{
        var href = $(".search_result li.cur").find("a").prop("href");
        var text = $(".search_result li.cur").find("p").text();
        var text2 = $(".search_result li.cur").find("span").text();
        setHistoryItems(city_code,text+","+href+","+text2);
        window.location.href = href;
      };
    }
    // else{
    //   setHistoryItems(city_code,val+',http://'+window.location.host+"/"+city_name+'/roomlist.html?come=zdy&key_self=1&key='+val+'#c='+$.hash("c"));
    //   window.location.href = 'http://'+window.location.host+"/"+city_name+'/roomlist.html?come=zdy&key_self=1&key='+val+'#c='+$.hash("c");
    // };
  };
})
// 搜索框高亮
$(document).click(function(e){
  var target = $(e.target);
  if (target.closest(".input_wrapper").length != '0') {
    $(".common_search").css("border","1px solid #35b9f1");
  }else{
    $(".search_result").hide();
    $(".history").hide();
    $(".common_search").css("border","1px solid #d9e3f4");
  };
})
// 历史记录
function setHistoryItems(citycode,keyword) {
  var hisArr = [];
  keyword = keyword.trim();
  var historyItems = getCookie("history"+citycode);//得到存入的关键词
  if (!historyItems) {//如果不存在历史记录
    hisArr.unshift(encodeURI(keyword));//将关键词添加到数组的第一项
    setCookie("history"+citycode,hisArr.join("+"));
  } else {
    var items = getCookie("history"+citycode).split("+");//得到历史纪录数组
    var point_index = encodeURI(keyword).split(",");
    var title = point_index[0];//获取用户输入的内容
    var span = point_index[2];
    var newArr = [];
    for(var i=0;i<items.length;i++){
      var point = items[i].split(",");
      var title2 = point[0];
      newArr.push(title2);//历史记录中输入的内容
    }
    //根据用户输入的关键词来去重，如果是同样的内容则不保存历史记录
    if ($.inArray(title,newArr) == -1) {
      items.unshift(encodeURI(keyword));
    }else{
      for(var i=0;i<items.length;i++){
        var point = items[i].split(",");
        var title2 = point[0];
        var span2 = point[2];
        if (title == title2 && span == span2) {
          items.remove(items[i]);
        };
      }
      items.unshift(encodeURI(keyword));
    };
    if (items.length > 10) {
      var newArr = [];
      for(var i=0;i<10;i++){
        newArr.push(items[i]);
      }
      items = newArr;
    };
    setCookie("history"+citycode,items.join("+"));
  } 
}
function clearHistory() {
  setCookie("history"+city_code,"",-1);
}
$(document).on("click",".history_main li",function(){
  var text = $(this).find("p").text();
  var url = $(this).find("a").prop("href");
  var span = $(this).find("span").text();
  if (span.length != 0) {
    setHistoryItems(city_code,text+","+url+","+span);
  }else{
    setHistoryItems(city_code,text+","+url);
  };
  window.location.reload();
})

function getSelectionBoundary(el, start) {
    var property = start ? "selectionStart" : "selectionEnd";
    var originalValue, textInputRange, precedingRange
        , pos, bookmark, isAtEnd;
                        
    if(typeof el[property] == "number") {
        return el[property];
    }
    else if(document.selection && document.selection.createRange) {
        el.focus();
        var range = document.selection.createRange();
        if(range) {
            if(document.selection.type == "Text") {
                range.collapse(!!start);
            }
            originalValue = el.value;
            textInputRange = el.createTextRange();
            precedingRange = el.createTextRange();
            pos = 0;
            bookmark = range.getBookmark();
            textInputRange.moveToBookmark(bookmark);
            if(/[\r\n]/.test(originalValue)) {
                try {
                    range.move("character", 1);
                    isAtEnd = (range.parentElement() != el);
                }
                catch(ex) {
                    isAtEnd = true;
                }
                range.moveToBookmark(bookmark);
                if(isAtEnd) {
                    pos = originalValue.length;
                }
                else {
                    textInputRange.text = " ";
                    precedingRange.setEndPoint("EndToStart",
                        textInputRange);
                    pos = precedingRange.text.length - 1;
                    textInputRange.moveStart("character", -1);
                    textInputRange.text = "";
                }
            }
            else {
                precedingRange.setEndPoint("EndToStart", textInputRange);
                pos = precedingRange.text.length;
            }
            return pos;
        }
    }
    return 0;
}                 
function getInputSelection(ele) {
    var start = getSelectionBoundary(ele, true),
    end = getSelectionBoundary(ele, false);
    return {
        start: start,
        end: end,
        length: end - start,
        text: ele.value.slice(start, end)
    };
}                     
function detectPaste(ele, callback) {
    ele.onpaste = function() {
        var sel = getInputSelection(ele);
        var initialLength = ele.value.length;
        window.setTimeout(function() {
            var val = ele.value;
            var pastedTextLength =
                val.length - (initialLength - sel.length);
            var end = sel.start + pastedTextLength;
            callback({
                start: sel.start,
                end: end,
                length: pastedTextLength,
                text: val.slice(sel.start, end),
                replacedText: sel.text
            });
        }, 1);
    };
}
//动态改变meta值
// function meta(val){
//   // meta信息更改
//   $(document).attr("title","【"+val+"租房子|"+val+"租房网|"+val+"房屋出租】-"+val+"嗨住租房");
//   $("meta[name='keywords']").attr('content',val+"租房子|"+val+"出租房");
//   $("meta[name='description']").attr('content',val+"出租房网为您提供最新、最真实的"+cityzname+"出租房个人信息、"+val+"出租房公寓信息，欢迎您来到嗨住租房"+val+"出租房网。");
// }
// meta(cityzname);