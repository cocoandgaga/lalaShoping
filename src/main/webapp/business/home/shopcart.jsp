<%--
  Created by IntelliJ IDEA.
  User: llb
  Date: 2021/1/5
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>购物车页面</title>

    <link href="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/business/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/business/css/cartstyle.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/business/css/optstyle.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/business/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

<!--顶部导航条 -->
<div class="am-container header">
    <ul class="message-l">
        <div class="topMessage">
            <div class="menu-hd">
                <c:if test="${sessionScope.login_user == null}" var="result">
                    <a href="${pageContext.request.contextPath}/business/home/login.jsp" target="_top" class="h">亲，请登录</a>
                    <a href="${pageContext.request.contextPath}/business/home/register.jsp" target="_top">免费注册</a>
                </c:if>
                <c:if test="${!result}">
                    <a href="#" target="_top">欢迎你,${sessionScope.login_user.loginName}</a>
                    <a href="${pageContext.request.contextPath}/cntApi/loginOut.do" target="_top">退出登录</a>
                </c:if>
            </div>
        </div>
    </ul>
    <ul class="message-r">
        <div class="topMessage home">
            <div class="menu-hd"><a href="${pageContext.request.contextPath}/index.do" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/business/frame.html" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
            </div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/business/home/shopcart.jsp" target="_top"><i
                    class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum"
                                                                                          class="h">0</strong></a></div>
        </div>
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
            </div>
        </div>
    </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
    <div class="logo"><img src="${pageContext.request.contextPath}/business/images/logo.png"/></div>
    <div class="logoBig">
        <li><img src="${pageContext.request.contextPath}/business/images/logobig.png"/></li>
    </div>

    <div class="search-bar pr">
        <a name="index_none_header_sysc" href="#"></a>
        <form>
            <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
            <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
        </form>
    </div>
</div>

<div class="clear"></div>
<!--购物车 -->
<div class="concent">
    <div id="cartTable">
        <div class="cart-table-th">
            <div class="wp">
                <div class="th th-chk">
                    <div id="J_SelectAll1" class="select-all J_SelectAll">

                    </div>
                </div>
                <div class="th th-item">
                    <div class="td-inner">商品信息</div>
                </div>
                <div class="th th-price">
                    <div class="td-inner">单价</div>
                </div>
                <div class="th th-amount">
                    <div class="td-inner">数量</div>
                </div>
                <div class="th th-sum">
                    <div class="td-inner">金额</div>
                </div>
                <div class="th th-op">
                    <div class="td-inner">操作</div>
                </div>
            </div>
        </div>
        <div class="clear"></div>

        <c:forEach items="${shopCarAndPicList}" var="scap">
        <tr class="item-list">
            <div class="bundle  bundle-last ">
                <div class="bundle-main">
                    <ul class="item-content clearfix">
                        <li class="td td-chk">
                            <div class="cart-checkbox ">
                                <input class="check" id="${scap.orderShopCart.goodsId}check" name="items" value="${scap.orderShopCart.goodsId}"
                                       type="checkbox">
                                <label for="${scap.orderShopCart.goodsId}check"></label>
                            </div>
                        </li>
                        <li class="td td-item">
                            <div class="item-pic">
                                <a href="#" target="_blank" data-title="${scap.orderShopCart.goodsName}"
                                   class="J_MakePoint" data-point="tbcart.8.12">
                                    <img id="${scap.orderShopCart.goodsId}img" src="${scap.goodsPicture.linkUrl}" class="itempic J_ItemImg" style="width: 100%"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="#" target="_blank" title="${scap.orderShopCart.goodsName}"
                                       class="item-title J_MakePoint" data-point="tbcart.8.11">${scap.orderShopCart.goodsName}</a>
                                </div>
                            </div>
                        </li>
                        <li class="td td-info">
                            <div class="item-props item-props-can">
                                <!-- 参数---------选择 -->
                                <div id="${scap.orderShopCart.goodsId}chooseAttr">
                                    ${scap.orderShopCart.goodsAttr}
                                </div>

                                <span id="${scap.orderShopCart.goodsId}" tabindex="0" class="btn-edit-sku theme-login">修改</span>
                                <i class="theme-login am-icon-sort-desc"></i>
                            </div>
                        </li>
                        <li class="td td-price">
                            <div class="item-price price-promo-promo">
                                <div class="price-content">
                                    <div class="price-line">
                                        <em class="price-original">${scap.orderShopCart.marketPrice}</em>
                                    </div>
                                    <div class="price-line">
                                        <em id="${scap.orderShopCart.goodsId}shopPrice" class="J_Price price-now" tabindex="0">${scap.orderShopCart.shopPrice}</em>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-amount">
                            <div class="amount-wrapper ">
                                <div class="item-amount ">
                                    <div class="sl">
                                        <input class="min am-btn" name="${scap.orderShopCart.goodsId}" type="button" value="-"/>
                                        <input id="${scap.orderShopCart.goodsId}amount" class="text_box" name="${scap.orderShopCart.goodsId}" type="text" value="${scap.orderShopCart.goodsAmount}" style="width:30px;"/>
                                        <input class="add am-btn" name="${scap.orderShopCart.goodsId}" type="button" value="+"/>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-sum">
                            <div class="td-inner">
                                <em id="${scap.orderShopCart.goodsId}sum" tabindex="0" class="J_ItemSum number">${scap.orderShopCart.shopPrice * scap.orderShopCart.goodsAmount}</em>
                            </div>
                        </li>
                        <li class="td td-op">
                            <div class="td-inner">
                                <a title="移入收藏夹" class="btn-fav" href="#">
                                    移入收藏夹</a>
                                <a href="delete.do?gid=${scap.orderShopCart.goodsId}" data-point-url="#" class="delete">
                                    删除</a>
                            </div>
                        </li>
                    </ul>

                </div>
            </div>
        </tr>
        <div class="clear"></div>
        </c:forEach>

    </div>
    <div class="clear"></div>

    <div class="float-bar-wrapper">
        <div id="J_SelectAll2" class="select-all J_SelectAll">
            <div class="cart-checkbox">
                <input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
                <label for="J_SelectAllCbx2"></label>
            </div>
            <span>全选</span>
        </div>
        <div class="operations">
            <a href="deleteAll.do" hidefocus="true" class="deleteAll">删除</a>
            <a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a>
        </div>
        <div class="float-bar-right">
            <div class="amount-sum">
                <span class="txt">已选商品</span>
                <em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
                <div class="arrow-box">
                    <span class="selected-items-arrow"></span>
                    <span class="arrow"></span>
                </div>
            </div>
            <div class="price-sum">
                <span class="txt">合计:</span>
                <strong class="price">¥<em id="J_Total">0.00</em></strong>
            </div>
            <div class="btn-area">
                <a href="pay.html" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
                    <span>结&nbsp;算</span></a>
            </div>
        </div>

    </div>

    <div class="footer">
        <div class="footer-hd">
            <p>
                <a href="#">恒望科技</a>
                <b>|</b>
                <a href="#">商城首页</a>
                <b>|</b>
                <a href="#">支付宝</a>
                <b>|</b>
                <a href="#">物流</a>
            </p>
        </div>
        <div class="footer-bd">
            <p>
                <a href="#">关于恒望</a>
                <a href="#">合作伙伴</a>
                <a href="#">联系我们</a>
                <a href="#">网站地图</a>
                <em>© 2015-2025 Hengwang.com 版权所有</em>
            </p>
        </div>
    </div>

</div>

<!--操作页面-->

<div class="theme-popover-mask"></div>

<div class="theme-popover">
    <div class="theme-span"></div>
    <div class="theme-poptit h-title">
        <a href="javascript:;" title="关闭" class="close">×</a>
    </div>
    <div class="theme-popbod dform">
        <form class="theme-signin" name="loginform" action="" method="post">

            <div class="theme-signin-left">
                <!-- 参数小窗 -->
                <div id="paramLi" >

                </div>

                <div class="theme-options">
                    <div class="cart-title number">数量</div>
                    <dd>
                        <input class="min am-btn am-btn-default" name="" type="button" value="-"/>
                        <input id="editAmount" class="text_box" name="" type="text" value="1" style="width:30px;"/>
                        <input class="add am-btn am-btn-default" name="" type="button" value="+"/>
                        <span class="tb-hidden">库存<span class="stock">1000</span>件</span>
                    </dd>

                </div>
                <div class="clear"></div>
                <div class="btn-op">
                    <div id="confirm" class="btn am-btn am-btn-warning">确认</div>
                    <div class="btn close am-btn am-btn-warning">取消</div>
                </div>

            </div>
            <div class="theme-signin-right">
                <div class="img-info">
                    <img src=""/>
                </div>
                <div class="text-info">
                    <span class="J_Price price-now"></span>
                    <span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
                </div>
            </div>

        </form>
    </div>
</div>
<!--引导 -->
<div class="navCir">
    <li><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li><a href="${pageContext.request.contextPath}/business/person/index.html"><i class="am-icon-user"></i>我的</a></li>
</div>
<script>
    ///////////////////////////////////////////////////////////////////////////////////////////
    $(function() {
        //加载购物车物品数量/////////////////////////////////
        $.ajax({
            url: "J_MiniCartNum.do",
            //不能省略，否则后面的data无法读取
            data: {
            },
            type: "POST",
            dataType: "html",
            success: function (data) {//参数data它接受了服务器响应的数据
                $("#J_MiniCartNum").text(data);
            }
        })

        ////////页面+、-按钮/////////////////////////////////
        $(".sl>.add").click(function(e){
            let t=$(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val())+1);
            if(parseInt(t.val())>1000){
                t.val(1000);
            }
            let gid = $(this).attr("name");
            let shopPrice = $("#"+gid+"shopPrice").text();
            $("#" + gid + "sum").text(shopPrice * $("#" + gid + "amount").val());
            $.ajax({
                url: "changeParam.do",
                //不能省略，否则后面的data无法读取
                data: {
                    "gid": t.attr("name"),
                    "attr": $("#" + t.attr("name") + "chooseAttr").text(),
                    "amount": t.val()
                },
                type: "POST",
                dataType: "html",
                success: function (data) {//参数data它接受了服务器响应的数据
                }
            })
        })
        $(".sl>.min").click(function(){
            let t=$(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val())-1);
            if(parseInt(t.val())<0){
                t.val(0);
            }
            let gid = $(this).attr("name");
            let shopPrice = $("#"+gid+"shopPrice").text();
            $("#" + gid + "sum").text(shopPrice * $("#" + gid + "amount").val());
            $.ajax({
                url: "changeParam.do",
                //不能省略，否则后面的data无法读取
                data: {
                    "gid": t.attr("name"),
                    "attr": $("#" + t.attr("name") + "chooseAttr").text(),
                    "amount": t.val()
                },
                type: "POST",
                dataType: "html",
                success: function (data) {//参数data它接受了服务器响应的数据
                }
            })
        })

        //根据chooseAll决定是否可以清空购物车///////////////////////////////////
        var chooseAll = false;
        //全选
        $("#J_SelectAllCbx2").on("click",function (){
            if ($(this).is(":checked")){
                $("input[name='items']").each(function () {
                    $(this).prop("checked", true);
                })
                chooseAll = true;
            }
            else {
                $("[name=items]:checkbox").each(function () {
                    $(this).removeAttr("checked");
                })
                chooseAll = false;
            }

        })
        $(".operations>.deleteAll").click(function (){
            return chooseAll;
        })

        //计算选中的产品种类数量///////////////////////////////////
        $("input:checkbox").on("click",function (){
            let count = $("input[name='items']:checked");
            let tp = 0;
            $("#J_SelectedItemsCount").text(count.length);
            $.each(count,function (){
                let gid = $(this).val();
                tp = tp + parseInt($("#" + gid + "sum").text());
            })
            $("#J_Total").text(tp);
        })
    });

    //doogsId///////////////////////////////////
    var gid = "";
    //商店价格
    var shopPrice=0;

    //点击打开编辑参数界面///////////////////////////////////////////////////////////////////////
    $(".btn-edit-sku").on("click",function (){
        $.ajax({
            url:"edit.do",
            //不能省略，否则后面的data无法读取
            data:{
                "goodsId": $(this).attr("id")
            },
            type:"POST",
            dataType:"html",
            success:function(data){//参数data它接受了服务器响应的数据
                data = JSON.parse(data);
                var str = "";
                if(data.size != null){
                    var size = data.size;
                    var array = new Array();
                    array = size.split(",");
                    str += "<li class='theme-options'><div class='cart-title'>尺寸：</div><ul>";
                    for(let i=0; i<array.length; i++){
                        if(i == 0){
                            str += "<li class='sku-line selected'>"+ array[i] +"<i></i></li>";
                        }
                        else{
                            str += "<li class='sku-line'>"+ array[i] +"<i></i></li>";
                        }

                    }
                    str += "</ul></li>";
                }
                if(data.packages != null){
                    var packages = data.packages;
                    var array1 = new Array();
                    array1 = packages.split(",");
                    str += "<li class='theme-options'><div class='cart-title'>包装：</div><ul>";
                    for(let i=0; i<array1.length; i++){
                        if(i == 0){
                            str += "<li class='sku-line selected'>"+ array1[i] +"<i></i></li>";
                        }
                        else{
                            str += "<li class='sku-line'>"+ array1[i] +"<i></i></li>";
                        }
                    }
                    str += "</ul></li>";
                }
                $("#paramLi").html(str);
            }
        });
        //给gid赋值，区分是哪个商品的修改界面/////
        gid = $(this).attr("id");

        //将对应的商品图片和价格加载到修改界面//////
        $(".img-info>img").attr("src",$("#"+$(this).attr("id")+"img").attr("src"));
        $(".text-info>.J_Price").html("￥"+$("#"+$(this).attr("id")+"shopPrice").text());
        shopPrice = $("#"+$(this).attr("id")+"shopPrice").text();
        $("#editAmount").val($("#" + gid + "amount").val());
    })

    //选中参数//////////////////////////////////////////
    $("#paramLi").on("click",".sku-line",function (e){
        if(!$(this).hasClass("selected")){
            $(this).siblings().removeClass("selected");
            $(this).addClass("selected");
        }
    })

    //确认修改///////////////////////////////////////////
    $("#confirm").on("click",function (){
        let str = "";
        //查找选中的包含参数li标签，并将内容暂存到str
        var liArray = $("#paramLi").find("li");
        $.each(liArray,function (){
            if($(this).hasClass("selected")){
                str += $(this).text();
            }
        })
        if (isNaN(parseInt($("#editAmount").val()))){
            $("#editAmount").val(1);
        }
        else if (parseInt($("#editAmount").val()) < 0){
            $("#editAmount").val(1);
        }
        else if(parseInt($("#editAmount").val())>1000){
            $("#editAmount").val(1000);
        }
        //如果数量或属性被修改则发送ajax更改数据库////////////////
        if (str != $("#" + gid + "chooseAttr").text() || $("#" + gid + "amount").val() != $("#editAmount").val()){
            $.ajax({
                url: "changeParam.do",
                //不能省略，否则后面的data无法读取
                data: {
                    "gid": gid,
                    "attr": str,
                    "amount": $("#editAmount").val()
                },
                type: "POST",
                dataType: "html",
                success: function (data) {//参数data它接受了服务器响应的数据
                }
            })

            //修改购买属性、数量和总价////////////
            $("#" + gid + "chooseAttr").html(str);
            $("#" + gid + "amount").val($("#editAmount").val());
            $("#" + gid + "sum").text(shopPrice * $("#" + gid + "amount").val());
        }

        //移除修改的虚线框和界面///////////////
        $(".td-info>.item-props").removeClass("selected");
        $("#" + gid).removeClass("selected");
        $(".theme-popover").css("display","none");
    })

    //监听数量变化
    $(".sl>.text_box").bind("input propertychange",function (e){
        if (isNaN(parseInt($(this).val()))){
            $(this).val(1);
        }
        if(parseInt(t.val())>1000){
            t.val(1000);
        }
        let gid = $(this).attr("name");
        let shopPrice = $("#"+gid+"shopPrice").text();
        $("#" + gid + "sum").text(shopPrice * $("#" + gid + "amount").val());
        $.ajax({
            url: "changeParam.do",
            //不能省略，否则后面的data无法读取
            data: {
                "gid": $(this).attr("name"),
                "attr": $("#" + $(this).attr("name") + "chooseAttr").text(),
                "amount": $(this).val()
            },
            type: "POST",
            dataType: "html",
            success: function (data) {//参数data它接受了服务器响应的数据
            }
        })
    })
</script>
<style>
    .theme-popover{
        height: 50%;
        overflow: auto;
    }
    #J_MiniCartNum{
        color: orangered;
    }
</style>
</body>

</html>
