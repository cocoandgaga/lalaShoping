<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<article>
    <div class="mt-logo" >
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
            </ul>
            <ul class="message-r">
                <div class="topMessage home">
                    <div class="menu-hd"><a href="${pageContext.request.contextPath}/business/home/index.html" target="_top" class="h">商城首页</a></div>
                </div>
                <div class="topMessage my-shangcheng">
                    <div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/business/frame.html" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
                </div>
                <div class="topMessage mini-cart">
                    <div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/business/home/shopcart.html" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
                </div>
                <div class="topMessage favorite">
                    <div class="menu-hd"><a href="collection.html" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
                </div>
            </ul>
        </div>

        <!--悬浮搜索框-->

        <div class="nav white">
            <div class="logoBig">
                <li><img src="${pageContext.request.contextPath}/business/images/logobig.png" /></li>
            </div>

            <div class="search-bar pr">
                <a name="index_none_header_sysc" href="${pageContext.request.contextPath}/business/home/search.html"></a>
                <form>
                    <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                    <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                </form>
            </div>
        </div>

        <div class="clear"></div>
    </div>
    </div>
</article>