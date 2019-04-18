<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
    <TITLE>jquery多条件商品筛选特效</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>


    <style >
        body,h1,h2,h3,h4,h5,h6,p,ul,ol,li,form,img,dl,dt,dd,table,th,td,blockquote,fieldset,div,strong,label,em{margin:0;padding:0;border:0;}
        ul,ol,li{list-style:none;}
        input,button{margin:0;font-size:12px;vertical-align:middle;}
        body{font-size:12px;font-family:Arial, Helvetica, sans-serif; color:#333; margin:0 auto; }
        table{border-collapse:collapse;border-spacing:0;}
        a{ color:#333; text-decoration:none;}
        a:hover{ text-decoration:none;}

        .selectNumberScreen{ width:795px; height:240px; margin:20px auto;}
        .screenBox dl {border-bottom: #e6e6e6 1px dashed; width: 768px; overflow: hidden}
        .screenBox dl.noborder {border-bottom: 0px; border-left: 0px; border-top: 0px; border-right: 0px}
        .screenBox dl.goodstype {border-bottom: #e6e6e6 1px dashed}
        .screenBox dl dt {float: left; height: 30px}
        .screenBox dl dt {text-align: right; width: 100px; height: 22px; font-weight: 600; padding-top: 8px}
        .screenBox dl dd {position: relative; padding-bottom: 5px; padding-left: 0px; width: 620px; padding-right: 48px; float: left; height: 25px; overflow: hidden; padding-top: 0px}
        .screenBox dl dd a {line-height: 14px; margin: 9px 25px 0px 0px; display: inline-block; color: #36c; overflow: hidden; text-decoration: none}
        .screenBox dl dd a:hover {background: #39c; color: #fff}
        .screenBox dl dd a.selected {background: #39c; color: #fff}
        .screenBox dl dd span.more {position: absolute; width: 39px; display: block; height: 14px; top: 6px; cursor: pointer; right: 1px}
        .screenBox dl dd span.more label {display: inline-block; cursor: pointer}
        .hasBeenSelected {border: #b2d1ff 1px solid;padding:2px;width: 784px; margin-top: 10px; overflow: hidden;}
        .hasBeenSelected dl {width: 784px; background: #f6f8fd; overflow: hidden}
        .hasBeenSelected dl dt {float: left}
        .hasBeenSelected dl dd {float: left}
        .hasBeenSelected dl dt {text-align: right; line-height: 30px; width: 108px; height: 30px; font-weight: 600}
        .hasBeenSelected dl dd {padding-bottom: 4px; padding-left: 0px; width: 676px; padding-right: 0px; padding-top: 0px}
        .selectedInfor {border-bottom: #f60 1px solid; position: relative; border-left: #f60 1px solid; padding-bottom: 1px; margin: 4px 10px 0px 0px; padding-left: 5px; padding-right: 17px; display: block; white-space: nowrap; background: #fff; float: left; height: 17px; border-top: #f60 1px solid; border-right: #f60 1px solid; padding-top: 1px}
        .selectedInfor label {color: #f60}
        .eliminateCriteria {line-height: 21px; margin-top: 4px; width: 80px; float: left; color: #f60; cursor: pointer; font-weight: 600}
        .selectedInfor em {}


    </style>
</HEAD>
<BODY>

<div class="selectNumberScreen">
    <div id="selectList" class="screenBox screenBackground">
        <dl class="listIndex" attr="terminal_brand_s">
            <dt>品  牌：</dt>
            <dd><a href="javascript:void(0)" values2="" values1="" attrval="欧莱雅">欧莱雅</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="欧莱雅">欧莱雅</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="欧莱雅">欧莱雅</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="欧莱雅">欧莱雅</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="欧莱雅">欧莱雅</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="amoi">夏新</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="海信">海信</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="酷派">酷派</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="dell">dell</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="htc">htc</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="sony ericsson">索尼爱立信</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="三星">三星</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="诺基亚">诺基亚</a>
                <span class=more><label>更多</label><em class=open></em></span> </dd>
        </dl>
        <dl class="listIndex" attr="价格范围">
            <dt>价  格：</dt>
            <dd><a href="javascript:void(0)" values2="499" values1="1" attrval="1-499">1-499</a>
                <a href="javascript:void(0)" values2="999" values1="500" attrval="500-999">500-999</a>
                <a href="javascript:void(0)" values2="1999" values1="1000" attrval="1000-1999">1000-1999</a>
                <a href="javascript:void(0)" values2="2999" values1="2000" attrval="2000-2999">2000-2999</a>
                <a href="javascript:void(0)" values2="4999" values1="3000" attrval="3000-4999">3000-4999</a>
                <a href="javascript:void(0)" values2="0" values1="5000" attrval="5000以上">5000以上</a></dd>
        </dl>
        <dl class=" listIndex" attr="terminal_os_s">
            <dt>分  类：</dt>
            <dd><a href="javascript:void(0)" values2="" values1="" attrval="面部护肤">面部护肤</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="彩妆">彩妆</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="彩妆">彩妆</a>
                <a href="javascript:void(0)" values2="" values1="" attrval="彩妆">彩妆</a></dd>
        </dl>

    </div>
    <div class="hasBeenSelected">
        <dl>
            <dt>您已选择：</dt>
            <dd style="DISPLAY: none" class=clearDd>
                <div class=clearList></div>
                <div style="DISPLAY: none" class="eliminateCriteria">清除筛选条件</div>
        </dl>
    </div>
</div>

<script type=text/javascript src="${ctx}/static/js/jquery-2.1.4.min.js"></script>

<script>
    var dlNum  =$("#selectList").find("dl");
    for (i = 0; i < dlNum.length; i++) {
        $(".hasBeenSelected .clearList").append("<div class=\"selectedInfor selectedShow\" style=\"display:none\"><span></span><label></label><em></em></div>");
    }

    var refresh = "true";

    $(".listIndex a ").on("click",null,function(){
        var text =$(this).text();
        var selectedShow = $(".selectedShow");
        var textTypeIndex =$(this).parents("dl").index();
        var textType =$(this).parent("dd").siblings("dt").text();
        index = textTypeIndex -(2);
        $(".clearDd").show();
        $(".selectedShow").eq(index).show();
        $(this).addClass("selected").siblings().removeClass("selected");
        selectedShow.eq(index).find("span").text(textType);
        selectedShow.eq(index).find("label").text(text);
        var show = $(".selectedShow").length - $(".selectedShow:hidden").length;
        if (show > 1) {
            $(".eliminateCriteria").show();
        }

    });
    $(".selectedShow em").on("click",null,function(){
        $(this).parents(".selectedShow").hide();
        var textTypeIndex =$(this).parents(".selectedShow").index();
        index = textTypeIndex;
        $(".listIndex").eq(index).find("a").removeClass("selected");

        if($(".listIndex .selected").length < 2){
            $(".eliminateCriteria").hide();
        }
    });

    $(".eliminateCriteria").on("click",null,function(){
        $(".selectedShow").hide();
        $(this).hide();
        $(".listIndex a ").removeClass("selected");
    });
</script>
</BODY>
</HTML>