<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>地址管理</title>

    <link href="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/business/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/business/css/addstyle.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>

<body>
<!--头 -->
<header></header>
<div class="nav-table"></div>
<b class="line"></b>

<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-address">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
                </div>
                <hr/>
                <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
                    <c:forEach var="addr" items="${ctmAddresses}">
                        <c:if test="${addr.isDefault}">
                            <li class="user-addresslist defaultAddr">
                                <span class="new-option-r" value="${addr.customerAddrId}"><i class="am-icon-check-circle"></i>默认地址</span>
                        </c:if>
                        <c:if test="${!addr.isDefault}">
                            <li class="user-addresslist">
                            <span class="new-option-r" value="${addr.customerAddrId}"><i class="am-icon-check-circle"></i>设为默认</span>
                        </c:if>
                                <p class="new-tit new-p-re">
                                    <span class="new-txt">${addr.recvName}</span>
                                    <span class="new-txt-rd2">${addr.mobile}</span>
                                </p>
                                <div class="new-mu_l2a new-p-re">
                                    <p class="new-mu_l2cw">
                                        <span class="title">地址：</span>
                                        <span class="province">${addr.province}</span>省
                                        <span class="city">${addr.city}</span>市
                                        <span class="dist">${addr.district}</span>区
                                        <span class="street">${addr.address}</span></p>
                                </div>
                                <div class="new-addr-btn">
                                    <a href="${pageContext.request.contextPath}/updateConsignee/${addr.customerAddrId}"><i class="am-icon-edit"></i>编辑</a>
                                    <span class="new-addr-bar">|</span>
                                    <a href="${pageContext.request.contextPath}/deleteConsignee/${addr.customerAddrId}"><i class="am-icon-trash"></i>删除</a>
                                </div>
                            </li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
                <a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
                <!--例子-->
                <div class="am-modal am-modal-no-btn" id="doc-modal-1">

                    <div class="add-dress">

                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
                        </div>
                        <hr/>

                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                            <form class="am-form am-form-horizontal">
                                <div class="am-form-group">
                                    <label for="user-name" class="am-form-label">收货人</label>
                                    <div class="am-form-content">
                                        <input type="text" id="user-name" placeholder="收货人">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-phone" class="am-form-label">手机号码</label>
                                    <div class="am-form-content">
                                        <input id="user-phone" placeholder="手机号必填" type="email">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label class="am-form-label">所在地</label>
                                    <div class="am-form-content address">
                                        <select data-am-selected id="province">
                                            <option value="浙江省">浙江省</option>
                                            <option value="湖北省" selected>湖北省</option>
                                        </select>
                                        <select data-am-selected id="city">
                                            <option value="温州市">温州市</option>
                                            <option value="武汉市" selected>武汉市</option>
                                        </select>
                                        <select data-am-selected id="dist">
                                            <option value="瑞安区">瑞安区</option>
                                            <option value="洪山区" selected>洪山区</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-intro" class="am-form-label">详细地址</label>
                                    <div class="am-form-content">
                                        <textarea  rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
                                        <small>100字以内写出你的详细地址</small>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <a class="am-btn am-btn-danger save">保存</a>
                                        <a  class="am-close am-btn am-btn-danger mycancel" data-am-modal-close>取消</a>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    $(".new-option-r").click(function() {
                        $(this).parent('.user-addresslist').addClass("defaultAddr").removeClass("notdefault").siblings().removeClass("defaultAddr").addClass("notdefault");
                        let text = $(".defaultAddr").children('.new-option-r').text();
                        let customerAddrId=document.getElementsByClassName("defaultAddr")[0].getElementsByClassName("new-option-r")[0].getAttribute("value");
                        console.log(customerAddrId);
                        if (text=='默认地址'){
                        }else{
                            $(".defaultAddr").children('.new-option-r').text("默认地址");
                            $(".notdefault").children('.new-option-r').text("设为默认");
                        }

                        $.ajax({
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/updateConsigneeDefault',
                            data: {
                                "customerAddrId": customerAddrId
                            },
                            success: function (data) {
                                if(data.code == "200"){
                                    alert("设置成功");
                                }else{
                                    alert(data.message);
                                }
                            }

                        })

                    });

                    var $ww = $(window).width();
                    if($ww>640) {
                        $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                    }

                })
            </script>

            <script type="text/javascript">
                $(".save").click(function(){
                    let recvName = $('#user-name').val();
                    let mobile = $('#user-phone').val();
                    let province = $('#province').val();
                    let city = $('#city').val();
                    let district = $('#dist').val();
                    let address =  document.getElementById("user-intro").value;

                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/updateConsignee',
                        data: {
                            "recvName": recvName,
                            "mobile": mobile,
                            "province": province,
                            "city": city,
                            "district": district,
                            "address": address
                        },
                        success: function (data) {
                            if (data.code == "200"){
                                alert("新增地址成功");
                                window.location.reload();
                            }else {
                                alert(data.message);
                            }
                        }
                    });

                })
            </script>
            <script type="text/javascript">
                $('.mycancel').click(function () {
                    $('#user-name').val("");
                    $('#user-phone').val("");
                    $('#user-intro').val("");
                })

            </script>
            <div class="clear"></div>

        </div>
        <!--底部-->
        <div class="footer"></div>
    </div>
    <aside class="menu"></aside>
</div>

</body>
<script>
    $(function(){
        $("header").load("${pageContext.request.contextPath}/business/person/header.jsp");
        $(".nav-table").load("${pageContext.request.contextPath}/business/person/nav.jsp");
        $("div.footer").load("${pageContext.request.contextPath}/business/home/footer.jsp");
        $("aside").load("${pageContext.request.contextPath}/business/home/aside.jsp");
    })
</script>
</html>