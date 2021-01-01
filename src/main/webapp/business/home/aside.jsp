<%--
  Created by IntelliJ IDEA.
  User: zxj
  Date: 2020/12/31
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul>
    <li class="person active">
        <a href="${pageContext.request.contextPath}/business/person/index.jsp"><i class="am-icon-user"></i>个人中心</a>
    </li>
    <li class="person">
        <p><i class="am-icon-newspaper-o"></i>个人资料</p>
        <ul>
            <li> <a href="${pageContext.request.contextPath}/queryCustomerInfo/1">个人信息</a></li>
            <li> <a href="${pageContext.request.contextPath}/queryCustomerInfo/2">安全设置</a></li>
            <li> <a href="${pageContext.request.contextPath}/queryCustomerConsignee">地址管理</a></li>
        </ul>
    </li>
    <li class="person">
        <p><i class="am-icon-balance-scale"></i>我的交易</p>
        <ul>
            <li><a href="${pageContext.request.contextPath}/business/person/order.jsp">订单管理</a></li>
        </ul>
    </li>
    <li class="person">
        <p><i class="am-icon-dollar"></i>我的资产</p>
        <ul>
            <li> <a href="${pageContext.request.contextPath}/business/person/points.jsp">我的积分</a></li>
        </ul>
    </li>

    <li class="person">
        <p><i class="am-icon-tags"></i>我的收藏</p>
        <ul>
        </ul>
    </li>

    <li class="person">
        <p><i class="am-icon-qq"></i>在线客服</p>
        <ul>
            <li> <a href="${pageContext.request.contextPath}/business/person/consultation.jsp">商品咨询</a></li>
        </ul>
    </li>
</ul>
