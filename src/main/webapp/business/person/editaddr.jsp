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
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址编辑</strong> / <small>Address&nbsp;edit</small></div>
                </div>
                <hr/>
                <div class="clear"></div>

                <!--例子-->
                <div class="am-modal am-modal-no-btn" id="doc-modal-1">

                    <div class="add-dress">
                        <hr/>

                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                            <form class="am-form am-form-horizontal">
                                <input type="hidden" value="${ctmConsignee.customerAddrId}" id="addrId">
                                <div class="am-form-group">
                                    <label for="user-name" class="am-form-label">收货人</label>
                                    <div class="am-form-content">
                                        <input type="text" id="user-name" value="${ctmConsignee.recvName}">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-phone" class="am-form-label">手机号码</label>
                                    <div class="am-form-content">
                                        <input id="user-phone" placeholder="手机号必填" type="email" value="${ctmConsignee.mobile}">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label class="am-form-label">所在地</label>
                                    <div class="am-form-content address">
                                        <select data-am-selected id="modify-province">
                                            <option selected="selected">${ctmConsignee.province}</option>
                                        </select>
                                        <select data-am-selected id="modify-city">
                                            <option selected="selected">${ctmConsignee.city}</option>
                                        </select>
                                        <select data-am-selected id="modify-dist">
                                            <option selected="selected">${ctmConsignee.district}</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-intro" class="am-form-label">详细地址</label>
                                    <div class="am-form-content">
                                        <textarea class="" rows="3" id="user-intro">${ctmConsignee.address}</textarea>
                                        <small>100字以内写出你的详细地址...</small>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <a class="am-btn am-btn-danger mysave">保存</a>
                                        <a class="am-close am-btn am-btn-danger mycancel" data-am-modal-close>取消</a>
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
                        $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                    });

                    var $ww = $(window).width();
                    if($ww>640) {
                        $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                    }

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

<script type="text/javascript">
    $(".mysave").click(function(){
        let addrId = $('#addrId').val();
        let recvName = $('#user-name').val();
        let mobile = $('#user-phone').val();
        let province = $('#modify-province').val();
        let city = $('#modify-city').val();
        let district = $('#modify-dist').val();
        let address =  document.getElementById("user-intro").value;

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/updateConsignee',
            data: {
                "customerAddrId": addrId,
                "recvName": recvName,
                "mobile": mobile,
                "province": province,
                "city": city,
                "district": district,
                "address": address
            },
            success: function (data) {
                if (data.code == "200"){
                    alert("修改地址成功");
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

<script>
    $(function(){
        $("header").load("${pageContext.request.contextPath}/business/person/header.jsp");
        $(".nav-table").load("${pageContext.request.contextPath}/business/person/nav.jsp");
        $("div.footer").load("${pageContext.request.contextPath}/business/home/footer.jsp");
        $("aside").load("${pageContext.request.contextPath}/business/home/aside.jsp");
    })
</script>
<script type="text/javascript">
    $(function () {
        $.getJSON("address.json",function (data) {
                    $.each(data,function (i,item) {
                            console.log(item.name);
                            console.log(item.city);
                            $.each(item.city,function (i,t) {
                                    console.log(i);
                                    console.log(t.name);
                                    console.log(t.area);
                                }

                            )
                    });
        })
    })
</script>
</html>