<%--
  Created by IntelliJ IDEA.
  User: llb
  Date: 2020/12/31
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/css/amazeui.css" />
    <link href="${pageContext.request.contextPath}/business/css/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="${pageContext.request.contextPath}/business/resource/js/jquery.cookie.js"></script>
</head>

<body>

<div class="login-boxtitle">
    <a href="home.html"><img alt="logo" src="${pageContext.request.contextPath}/business/images/logobig.png" /></a>
</div>

<div class="login-banner">
    <div class="login-main">
        <div class="login-banner-bg"><span></span><img src="${pageContext.request.contextPath}/business/images/big.jpg" /></div>
        <div class="login-box">

            <h3 class="title">登录商城</h3>

            <div class="clear"></div>

            <div class="login-form">
                <form id="infoForm" action="${pageContext.request.contextPath}/cntApi/login.do">
                    <div class="user-name">
                        <label for="userName"><i class="am-icon-user"></i></label>
                        <input type="text" name="userName" id="userName" placeholder="邮箱/手机/用户名">
                    </div>
                    <div class="user-pass">
                        <label for="password"><i class="am-icon-lock"></i></label>
                        <input type="password" name="pwd" id="password" placeholder="请输入密码">
                    </div>
                    <div class="message">
                        <c:if test="${pwdError == true }">
                            <span id="errorMsg" style="background-color: #ec2636">账号或密码错误！！！</span>
                        </c:if>

                    </div>
                </form>
            </div>

            <div class="login-links">
                <label for="remember-me"><input id="remember-me" type="checkbox" name="remember-me">记住密码</label>
                <a href="#" class="am-fr">忘记密码</a>
                <a href="${pageContext.request.contextPath}/business/home/register.jsp" class="zcnext am-fr am-btn-default">注册</a>
                <br />
            </div>
            <div class="am-cf">
                <input type="submit" form="infoForm" id="loginBtn" value="登 录" class="am-btn am-btn-primary am-btn-sm">
            </div>
            <div class="partner">
                <h3>合作账号</h3>
                <div class="am-btn-group">
                    <li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
                    <li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
                    <li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
                </div>
            </div>

        </div>
    </div>
</div>


<div class="footer ">
    <div class="footer-hd ">
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
    <div class="footer-bd ">
        <p>
            <a href="#">关于恒望</a>
            <a href="#">合作伙伴</a>
            <a href="#">联系我们</a>
            <a href="#">网站地图</a>
            <em>© 2015-2025 Hengwang.com 版权所有</em>
        </p>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/business/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="./js/login.js"></script>
<script>
    // $(function() {
    //     // $.cookie('input的name值') 把 cookie 里的值赋给 input
    //     if($.cookie('remember-me')) {
    //          var un = $('#userName').val($.cookie('userName'));
    //          var pd =  $('#password').val($.cookie('pwd'));
    //          if(un != undefined){
    //              alert(un);
    //              alert(pd);
    //          }
    //          else {
    //              alert("查无此号");
    //          }
    //
    //     }
    //     else {
    //         alert("查无此号0");
    //     }
    //
    //     $('#loginBtn').on('click', function(){
    //         if($("#remember-me").prop("checked") == true) {
    //             var userName = $("#userName").val();
    //             var passWord = $("#password").val();
    //             // 存储一个带7天期限的 cookie
    //             $.cookie("remember-me", "true", {
    //                 expires: 7 , // 存储期限 单位：天
    //                 path: '/'
    //             });
    //             $.cookie("userName", userName, {
    //                 expires: 7,
    //                 path: '/'
    //             });
    //             $.cookie("pwd", passWord, {
    //                 expires: 7,
    //                 path: '/'
    //             });
    //         } else {
    //             // 删除 cookie
    //             $.cookie("remember-me", "", {
    //                 expires: -1,
    //                 path: '/'
    //             });
    //             $.cookie("username", "", {
    //                 expires: -1,
    //                 path: '/'
    //             });
    //             $.cookie("pwd", "", {
    //                 expires: -1,
    //                 path: '/'
    //             });
    //         }
    //     })
    // });
</script>
</html>
