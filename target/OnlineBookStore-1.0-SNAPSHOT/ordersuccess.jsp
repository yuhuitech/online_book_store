<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head lang="en">
    <meta charset="utf-8" />
    <title>完成订单</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css" />
    <!--打开网页，顶部标签页右侧显示图标-->
    <link rel="Shortcut Icon" href="img/horse.ico">
    <!--引入外部样式表-->
    <link rel="stylesheet" href="css/resetcss.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/password.css" />
    <link rel="stylesheet" href="css/list.css" />
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
        <li></li>
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

        <a href="#"><div id="shopname">自营图书</div></a>
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


    <div class="cart mt">
        <div class="site">
            <p class=" wrapper clearfix">
                <span class="fl">完成订单</span>
                <img class="top" src="img/temp/cartTop03.png">
                <a href="/catalog" class="fr">继续购物&gt;</a>
            </p>
        </div>


        <div class="table wrapper">
            <div class="m-box">
                <div class="m-duigou"></div>
            </div>
        </div>

        <div class="footer">
            <div class="top">
                <div class="wrapper">
                    <div class="clearfix">
                        <a href="#2" class="fl"><img src="img/foot1.png"/></a>
                        <span class="fl">7天无理由退货</span>
                    </div>
                    <div class="clearfix">
                        <a href="#2" class="fl"><img src="img/foot2.png"/></a>
                        <span class="fl">15天免费换货</span>
                    </div>
                    <div class="clearfix">
                        <a href="#2" class="fl"><img src="img/foot3.png"/></a>
                        <span class="fl">满599包邮</span>
                    </div>
                    <div class="clearfix">
                        <a href="#2" class="fl"><img src="img/foot4.png"/></a>
                        <span class="fl">手机特色服务</span>
                    </div>
                </div>
            </div>
        </div>

        <div id="footer">
            All Rights Reserved @ 版权所有
        </div>

        <script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/public.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/jquery-validate.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/ordering.js" type="text/javascript" charset="utf-8"></script>

    </div>
</div>
</body>
</html>
