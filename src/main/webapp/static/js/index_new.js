// 榧犳爣鏀惧埌鎴挎簮鍥剧墖涓婃晥鏋�
$(".common_house_model .img").hover(function(){
  $(this).find(".house_mess").stop().animate({"bottom":0},500)
},function(){
  $(this).find(".house_mess").stop().animate({"bottom":"-30px"},500)
})
// 鐐瑰嚮鍏ㄩ儴
$(".search_condition").click(function(){
  $(".search_c_list").slideToggle(300);
})
$(document).click(function(e){
  var target = $(e.target);
  if (target.closest(".search_condition").length == '0') {
    $(".search_c_list").slideUp(200);
  };
})
$(".search_c_list span").click(function(){
      var housetype=$(this).attr("data-housetype-id");
      var housetype_name=$(this).text();
      $(this).addClass("cur");
      $(this).siblings("span").removeClass("cur");
      $("#input_box").val("");
      $("#js_select").text(housetype_name);
      $("#js_housetype_val").val(housetype);
   });
// TA浠兘鍦ㄤ娇鐢ㄥ棬浣�
$(".peoples li").hover(function(){
  $(this).css("boxShadow","0 4px 6px 0 rgba(0,0,0,0.15)");
  $(this).stop().animate({"marginTop":"-10px"},300)
},function(){
  $(this).css("boxShadow","none");
  $(this).stop().animate({"marginTop":"0"},300)
})