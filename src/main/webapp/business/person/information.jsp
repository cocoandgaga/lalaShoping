<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人资料</title>

    <link href="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="${pageContext.request.contextPath}/business/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/business/css/infstyle.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/business/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
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

            <div class="user-info">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
                </div>
                <hr/>

                <!--头像 -->
                <div class="user-infoPic">

                    <div class="filePic">
                        <input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
                        <img class="am-circle am-img-thumbnail" src="${pageContext.request.contextPath}/business/images/getAvatar.do.jpg" alt="" />
                    </div>

                    <p class="am-form-help">头像</p>

                    <div class="info-m">
                        <div><b>用户名：<i>${ctmInfo.customerName}</i></b></div>
                        <div class="vip">
                            <span></span><a href="#">会员专享</a>
                        </div>
                    </div>
                </div>

                <!--个人信息 -->
                <div class="info-main">
                    <form class="am-form am-form-horizontal">
                        <input type="hidden" value="${ctmInfo.customerId}" id="ctmId">
                        <!-- 昵称 -->
                        <div class="am-form-group">
                            <label for="user-name2" class="am-form-label">昵称</label>
                            <div class="am-form-content">
                                <input type="text" id="user-name2" name="customer_name" value="${ctmInfo.customerName}">
                                <small></small>
                            </div>
                        </div>
                        <!-- 姓名 -->
                        <div class="am-form-group">
                            <label for="user-name" class="am-form-label">姓名</label>
                            <div class="am-form-content">
                                <input type="text" id="user-name" name="real_name" value="${ctmInfo.realName}">
                            </div>
                        </div>
                        <!-- 生日 -->
                        <div class="am-form-group">
                            <label class="am-form-label">性别</label>
                            <div class="am-form-content sex">
                                <input type="hidden" value="${ctmInfo.gender}" id="check-gender">
                                <label class="am-radio-inline">
                                    <input type="radio"  name="gender" id="male" value="0"> 男
                                </label>
                                <label class="am-radio-inline">
                                    <input type="radio" name="gender" id="female" value="1"> 女
                                </label>
                            </div>
                        </div>

                        <!-- 年月日 -->
                        <div class="am-form-group">
                            <label class="am-form-label">生日</label>
                            <div class="am-form-content birth" id="dateForm">
                                <div class="birth-select">
                                    <input type="hidden" id="year_val" value="${year}">
                                    <select  id="year" name="year">
                                    </select>
                                    <em>年</em>
                                </div>
                                <div class="birth-select2">
                                    <input type="hidden" id="month_val" value="${month}">
                                    <select id="month" name="month">
                                    </select>
                                    <em>月</em></div>
                                <div class="birth-select2">
                                    <input type="hidden" id="day_val" value="${day}">
                                    <select id="day" name="day">
                                    </select>
                                    <em>日</em>
                                </div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-phone" class="am-form-label">电话</label>
                            <div class="am-form-content">
                                <input id="user-phone" value="${ctmInfo.mobile}" type="tel">
                            </div>
                        </div>
                        <!-- 电子邮件 -->
                        <div class="am-form-group">
                            <label for="user-email" class="am-form-label">电子邮件</label>
                            <div class="am-form-content">
                                <input id="user-email" value="${ctmInfo.email}" type="email">
                            </div>
                        </div>

                        <div class="am-form-group address">
                            <c:forEach var="addr" items="${ctmAddresses}">
                                <label class="am-form-label">收货地址</label>
                                <div class="am-form-content address">

                                        <a href="address.jsp">
                                            <p class="new-mu_l2cw">
                                                <span class="province">${addr.province}</span>省
                                                <span class="city">${addr.city}</span>市
                                                <span class="dist">${addr.district}</span>区
                                                <span class="street">${addr.address}</span>
                                                <span class="am-icon-angle-right"></span>
                                            </p>
                                        </a>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="am-form-group safety">
                            <label class="am-form-label">账号安全</label>
                            <div class="am-form-content safety">
                                <a href="safety.jsp">
                                    <span class="am-icon-angle-right"></span>
                                </a>

                            </div>
                        </div>
                        <div class="info-btn">
                            <div class="am-btn am-btn-danger">保存修改</div>
                        </div>
                    </form>
                </div>

            </div>

        </div>
        <!--底部-->
        <div class="footer"></div>
    </div>
    <aside class="menu"></aside>
</div>
</body>
<script>
    $(function () {
        $("header").load("${pageContext.request.contextPath}/business/person/header.jsp");
        $(".nav-table").load("${pageContext.request.contextPath}/business/person/nav.jsp");
        $("div.footer").load("${pageContext.request.contextPath}/business/home/footer.jsp");
        $("aside").load("${pageContext.request.contextPath}/business/home/aside.jsp");
    })
</script>
<script type="text/javascript">
    let gender = $('#check-gender').val();
    if(gender=="false"){
        $("#male").attr('checked', 'checked');
    }else if (gender=="true"){
        $("#female").attr('checked', 'checked');
    }
</script>
<script type="text/javascript">
    $(".info-btn").click(function(){
        let customerId = $('#ctmId').val();
        let customerName= $('#user-name2').val();
        let realName = $('#user-name').val();
        let gender = $('input:radio:checked').val();
        let mobile = $('#user-phone').val();
        let email = $('#user-email').val();
        let year = $('#year').val();
        let month = $('#month').val();
        let day = $('#day').val();
        let birthday=year+'.'+month+'.'+day;
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/updateCustomerInfo",
            data:  {
                "customerId": customerId,
                "customerName": customerName,
                "realName": realName,
                "gender": gender,
                "mobile": mobile,
                "email": email,
                "birthday": birthday
            },
            success: function (response) {
                    console.log(response);
                    if(response.code == "200"){
                        alert("修改成功")
                         window.location.reload();
                    }else{
                       alert('错误信息:'+response.message);
                    }
                }
        });




    })
</script>
<script type="text/javascript">
    $(function(){
        let year_val = $('#year_val').val();
        var i = 1945;
        var date=new Date();
        var dropList='';
        for(i; i<date.getFullYear(); i++){
            if(i == year_val){
                dropList = dropList + "<option value='" + i + "' selected>" + i + "</option>";
            }else {
                dropList = dropList + '<option value="' + i + '">' + i + '</option>'
            }
        }
        $('#dateForm select[name=year]').html(dropList);//生成年份下拉列表

        let monthly='';
        let month_var = $('#month_val').val();
        var j=1;
        for(j; j<13; j++){
            if (j == month_var){
                monthly = monthly + "<option value='" + j + "' selected>" + j + "</option>";
            }
            else {
                monthly = monthly + '<option value="' + j + '">' + j + '</option>'
            }
        }
        $('#dateForm select[name=month]').html(monthly);//生成月份下拉列表

        let daily='';
        let day_var=$('#day_val').val()
        for(let day=1;day<=31;day++){
            if (day == day_var) {
                daily = daily + "<option value='" + day + "' selected>" + day + "</option>";
            }
            else {
                daily = daily + '<option value="' + day + '">' + day + '</option>';
            }

        }
        $('#dateForm select[name=day]').html(daily);
        $('#dateForm select[name=month]').change(function(){
            var currentDay;
            var total;
            var flag=$("#year option:selected").val();
            var currentMonth=$('#dateForm select[name=month]').val();
            console.log(currentMonth);
            switch (currentMonth){
                case "1":
                case "3":
                case "5":
                case "7":
                case "8":
                case "10":
                case "12":total=31;break;
                case "4":
                case "6":
                case "9":
                case "11":total=30;break;
                case "2":
                    //闰年 整除4但是不整除100 或者整除400
                    if( (flag%4 == 0 && flag%100 !== 0 ) || flag%400 == 0){
                        console.log(flag);
                        total=29;
                    }else {
                        total=28;
                    }
                default :break
            }
            for(let day=1;day<=total;day++){
                currentDay=currentDay+'<option value="'+day+'">'+day+'</option>'
            }
            $('#dateForm select[name=day]').html(currentDay);//生成日期下拉列表
        });
    });
</script> 
</html>
