<%--
  Created by IntelliJ IDEA.
  User: zxj
  Date: 2020/12/31
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>修改密码</title>

    <link href="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/business/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/business/css/stepstyle.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/business/js/jquery-1.7.2.min.js"></script>
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

            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
            </div>
            <hr/>
            <!--进度条-->
            <div class="m-progress">
                <div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
                    <span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
                    <span class="u-progress-placeholder"></span>
                </div>
                <div class="u-progress-bar total-steps-2">
                    <div class="u-progress-bar-inner"></div>
                </div>
            </div>
            <form class="am-form am-form-horizontal">
                <div class="am-form-group">
                    <label for="user-old-password" class="am-form-label">原密码</label>
                    <div class="am-form-content">
                        <input type="password" id="user-old-password" placeholder="请输入原登录密码">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="user-new-password" class="am-form-label">新密码</label>
                    <div class="am-form-content">
                        <input type="password" id="user-new-password" placeholder="由数字、字母组合">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="user-confirm-password" class="am-form-label">确认密码</label>
                    <div class="am-form-content">
                        <input type="password" id="user-confirm-password" placeholder="请再次输入上面的密码">
                    </div>
                </div>
                <div class="info-btn">
                    <div class="am-btn am-btn-danger">保存修改</div>
                </div>

            </form>

        </div>
        <!--底部-->
        <div class="footer"></div>
    </div>
    <aside class="menu"></aside>
</div>
</body>

<script type="text/javascript">
    $('.info-btn').click(function () {
        let u_old = $('#user-old-password').val();
        let u_new = $('#user-new-password').val();
        let u_confirm= $('#user-confirm-password').val();
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/cntApi/updatepassword',
            data: {
                "old_password": u_old,
                "new_password": u_new,
                "confirm_password": u_confirm
            },
            success: function (data) {
                if (data.code == '200'){
                    alert("修改密码成功");
                }else{
                    alert(data.message);
                }
            }
        })
    })
</script>

<script>
    $(function () {
        $("header").load("${pageContext.request.contextPath}/business/person/header.jsp");
        $(".nav-table").load("${pageContext.request.contextPath}/business/person/nav.jsp");
        $("div.footer").load("${pageContext.request.contextPath}/business/home/footer.jsp");
        $("aside").load("${pageContext.request.contextPath}/business/home/aside.jsp");
    })
</script>
</html>
