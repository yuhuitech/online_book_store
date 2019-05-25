<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head lang="en">
    <meta charset="utf-8" />
    <title>我的订单</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css" />
    <!--打开网页，顶部标签页右侧显示图标-->
    <link rel="Shortcut Icon" href="img/horse.ico">
    <!--引入外部样式表-->
    <link rel="stylesheet" href="css/resetcss.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/password.css" />

</head>
<body>
<div id="header">
    <ul id="leftlist" class="list">
        <c:choose>
            <c:when test="${sessionScope.loginStatus=='false'}">
                <li><a href="login.html" class="link">请登录</a></li>
                <li><a href="register.html" class="link">免费注册</a></li>
            </c:when>
            <c:when test="${sessionScope.loginStatus=='true'}">
                <li><a href="#" class="link">欢迎！${sessionScope.user.userName},您的用户账号: ${sessionScope.user.userId}</a></li>
                <li>
                    <form id="logout" method="post" >
                        <a onclick="document.getElementById('logout').method='post';
								document.getElementById('logout').action='/loginAndRegister?status=2';
								document.getElementById('logout').submit();" class="link">退出</a>
                    </form>
                </li>
            </c:when>
        </c:choose>
    </ul>

    <ul id="rightlist" class="list">
        <c:choose>
            <c:when test="${sessionScope.loginStatus=='true'}">
                <li class="haschild">
                    <a href="/OrderManager" class="link" title="myorders">我的订单
                    </a>
                    <ul class="showdetail">
                        <li><a href="#" class="item">全部订单</a></li>
                        <li><a href="#" class="item">待付款订单</a></li>
                        <li><a href="#" class="item">待收货订单</a></li>
                        <li><a href="#" class="item">待评价订单</a></li>
                    </ul>
                </li>
                <li><a href="/ShopCart" class="link">购物车</a></li>
                <li class="haschild"><a href="#" class="link">收藏夹
                </a>
                    <ul class="showdetail">
                        <li><a href="#" class="item">收藏的商品</a></li>
                        <li><a href="#" class="item">收藏的店铺</a></li>
                    </ul>
                </li>
                <li><a href="/catalog" class="link">商品分类</a></li>
            </c:when>
        </c:choose>
    </ul>
</div>

<div id="content">

    <div id="shop">
        <!--店铺名称-->
        <a href="#">
            <div id="shopname">自营图书</div>
        </a>
        <!--搜索框-->
        <div id="search" class="query">
            <input type="text" id="select" placeholder="请输入搜索文字..."/>
            <button type="button" id="btnquery">搜索</button>
        </div>
    </div>

    <div id="shopmenus">
        <ul id="smenus">
            <li class="hasmenu">
                <a href="#" class="smenu">图书分类</a>
                <ul class="catalogs">
                    <li><a href="#" class="class">文学</a></li>
                    <li><a href="#" class="class">教育</a></li>
                    <li><a href="#" class="class">人文</a></li>
                    <li><a href="#" class="class">理科</a></li>
                    <li><a href="#" class="class">计算机</a></li>
                    <li><a href="#" class="class">童书</a></li>
                </ul>
            </li>
            <li><a href="#" class="smenu">首页</a></li>
            <li><a href="#" class="smenu">计算机馆</a></li>
            <li><a href="#" class="smenu">预售</a></li>
            <li><a href="#" class="smenu">活动</a></li>
            <li><a href="#" class="smenu">数字内容</a></li>
        </ul>
    </div>

    <c:forEach items="${sessionScope.orderList}" var="order">
        <div class="cart mt">
            <p class=" wrapper clearfix">
                <span class="fl"></span>
                <img class="top" src="">
                <a href="catalog.jsp" class="fr"></a>
            </p>
        </div>
        <div class="table wrapper">
            <div class="tr">&nbsp;&nbsp;
                <span>${order.orderDate}</span>
                <span>&nbsp;&nbsp;&nbsp;订单号：</span>
                <span>${order.orderId}</span>
            </div>
            <c:forEach items="${order.orderBooksList}" var="keyword">
                <div class="th" id="${keyword.bookID}">
                    <div class="pro clearfix">
                        <a class="fl" href="#">
                            <dl class="clearfix">
                                <dt class="fl">
                                    <img src="img/temp/${keyword.bookID}.jpg"  height="120" width="106">
                                </dt>
                                <dd class="fl">
                                    <p>${keyword.name}</p>
                                    <p>作者:</p>
                                    <p>${keyword.writer}</p>
                                </dd>
                            </dl>
                        </a>
                    </div>
                    <div class="number">
                        <p class="num clearfix">
                            <span class="fl">${keyword.amount}</span>
                        </p>
                    </div>
                    <div class="price sAll">￥<fmt:formatNumber value="${keyword.price*keyword.amount}" pattern="#.00"/></div>
                </div>
            </c:forEach>
            <div class="goOn">
                <a href="index1.jsp"></a>
            </div>
            <div class="tr clearfix">
                <p class="fr">
                    <span>共<small>${order.totalItem}</small>件商品</span>
                    <span>合计:&nbsp;<small>￥${order.totalPrice}</small></span>
                    <a href="#" class="count">申请售后</a>
                </p>
            </div>
        </div>
    </c:forEach>

    <div class="mask"></div>

    <div class="tipDel">
        <p class="clearfix">
            <span></br>我们的联系方式为：</br>
                tel: 6888 8888</br>
                address: </br>武汉大学信息学部国际软件学院</br></br>
                到店内享受售后服务哦~</br>
            </span>
            </br>
            <a class="fl cer" href="#">确定</a>

        </p>
    </div>

    <div id="footer">
        All Rights Reserved @ 版权所有
    </div>

    <script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/public.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery-validate.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/myorderlist.js" type="text/javascript" charset="utf-8"></script>
</div>
</body>
</html>
