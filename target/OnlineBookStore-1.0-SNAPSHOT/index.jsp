<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <!--编码-->
    <meta charset="utf-8"/>
    <title>OnlineBookstore</title>
    <!--作者信息-->
    <meta name="author" content="www.vor.ink"/>
    <!--网页描述-->
    <meta name="description" content="imitateWeb"/>
    <!--关键字-->
    <meta name="keywords" content="shopping,web"/>
    <meta name="copyright" content="712所有"/>

    <!--以下meta属性根据自己的需要选择使用-->
    <!--网页搜索机器人向导。用来告诉搜索机器人哪些页面需要索引，哪些页面不需要索引-->
    <!--content的参数有all,none,index,noindex,follow,nofollow，默认是all-->
    <meta name="robots" content="no"/>
    <!--设定网页的到期时间。一旦网页过期，必须到服务器上重新调阅-->
    <meta http-equiv="expires" content="Wed, 26 Feb 2027 08：21：57 GMT"/>
    <!--禁止浏览器从本地机的缓存中调阅页面内容-->
    <meta http-equiv="Pragma" content="no-cache"/>
    <!--用来防止别人在框架里调用你的页面-->
    <meta http-equiv="Window-target" content="_top"/>
    <!--页面重定向，5s后跳转到新的url:http://www.baidu.com/-->
    <!--<meta http-equiv="refresh" content="5;url=http://www.baidu.com/" />-->
    <!--网页不会被缓存-->
    <meta http-equiv="Cache-Control" content="no-cache,must-revalidate"/>
    <!--通知IE采用其所支持的最新的模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">

    <!--打开网页，顶部标签页右侧显示图标-->
    <link rel="Shortcut Icon" href="img/horse.ico">
    <!--引入外部样式表-->
    <link rel="stylesheet" href="css/resetcss.css"/>
    <link rel="stylesheet" href="css/main.css"/>
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
            </c:when>
        </c:choose>
        <li><a href="/catalog" class="link">商品分类</a></li>
    </ul>
</div>
<div id="content">
    <!--搜索框-->
    <div id="search">
        <input type="text" id="select" placeholder="请输入搜索文字..."/>
        <button type="button" id="btnquery">搜索</button>
    </div>
    <!--左侧导航菜单-->
    <div id="catalog">
        <h2 id="goods">书籍分类</h2>

        <div class="catalog">
            <h3>特色分类</h3>
            <ul>
                <li><a href="#" class="linkbrand">畅销榜</a></li>
                <li><a href="#" class="linkbrand">热搜榜</a></li>
            </ul>
            <h3>文学综合类</h3>
            <ul>
                <li><a href="#" class="linkbrand">小说</a></li>
                <li><a href="#" class="linkbrand hotgood">文学</a></li>
                <li><a href="#" class="linkbrand">传记</a></li>
                <li><a href="#" class="linkbrand">青春</a></li>
                <li><a href="#" class="linkbrand">悬疑</a></li>
                <li><a href="#" class="linkbrand">科幻</a></li>
                <li><a href="#" class="linkbrand">散文</a></li>
                <li><a href="#" class="linkbrand">纪实</a></li>
            </ul>
            <h3>教育类</h3>
            <ul>
                <li><a href="#" class="linkbrand">中小教辅</a></li>
                <li><a href="#" class="linkbrand">外语学习</a></li>
                <li><a href="#" class="linkbrand">考试复习</a></li>
                <li><a href="#" class="linkbrand">教材</a></li>
                <li><a href="#" class="linkbrand">字典</a></li>
                <li><a href="#" class="linkbrand">作文</a></li>
                <li><a href="#" class="linkbrand hotgood">高考</a></li>
            </ul>
            <h3>计算机类</h3>
            <ul>
                <li><a href="#" class="linkbrand">编程语言</a></li>
                <li><a href="#" class="linkbrand">办公软件</a></li>
                <li><a href="#" class="linkbrand">计算机安全</a></li>
                <li><a href="#" class="linkbrand hotgood">人工智能</a></li>
                <li><a href="#" class="linkbrand">操作系统</a></li>
                <li><a href="#" class="linkbrand">数据库</a></li>
            </ul>
            <h3>原版书</h3>
            <ul>
                <li><a href="#" class="linkbrand">英文原版</a></li>
                <li><a href="#" class="linkbrand">港台原版</a></li>
                <li><a href="#" class="linkbrand">日文原版</a></li>
            </ul>
        </div>
    </div>



    <div id="menus">
        <ul>
            <li><a href="#" class="menu">首页</a></li>
            <li><a href="#" class="menu">预售</a></li>
            <li><a href="#" class="menu">活动</a></li>
            <li><a href="#" class="menu">特色书店</a></li>
            <li><a href="#" class="menu">数字内容</a></li>
        </ul>
    </div>
    <div id="turnimg">
        <ul id="imgs">
            <li><a href="#"><img src="img/1.jpg"/></a></li>
            <li><a href="#"><img src="img/2.jpg"/></a></li>
            <li><a href="#"><img src="img/3.jpg"/></a></li>
            <li><a href="#"><img src="img/4.jpg"/></a></li>
        </ul>
        <ul id="circles">
            <li class="currimg" data-num="0"></li>
            <li class="circle" data-num="1"></li>
            <li class="circle" data-num="2"></li>
            <li class="circle" data-num="3"></li>
        </ul>
        <div class="arr left" id="arrL">
            <div id="leftarr"></div>
        </div>
        <div class="arr right" id="arrR">
            <div id="rightarr"></div>
        </div>
    </div>
    <div id="notice">
        <div id="status">
            <h1>最新动态<a href="#" id="more">查看更多</a></h1>
            <ul>
                <li><a href="#" class="notice"><span>[活动1]&nbsp;&nbsp;</span>618图书大满减</a></li>
                <li><a href="#" class="notice"><span>[活动2]&nbsp;&nbsp;</span>人文社科好书钜惠</a></li>
                <li><a href="#" class="notice"><span>[活动3]&nbsp;&nbsp;</span>全名阅读，书香五月</a></li>
                <li><a href="#" class="notice"><span>[活动4]&nbsp;&nbsp;</span>旧书回收活动</a></li>
                <li><a href="#" class="notice"><span>[活动5]&nbsp;&nbsp;</span>图书品类联合满减购</a></li>
            </ul>
        </div>
        <div id="tabs">
            <h1>图书榜单</h1>
            <ul>
                <li><a href="#" class="notice"><span>[榜单1]&nbsp;&nbsp;</span>新书排行榜</a></li>
                <li><a href="#" class="notice"><span>[榜单2]&nbsp;&nbsp;</span>年度畅销榜</a></li>
                <li><a href="#" class="notice"><span>[榜单3]&nbsp;&nbsp;</span>计算机书籍榜</a></li>
                <li><a href="#" class="notice"><span>[榜单4]&nbsp;&nbsp;</span>受欢迎图书榜</a></li>
            </ul>
        </div>
    </div>
    <div id="showgoods">
        <ul>
            <li><a href="good.html" target="_blank"><img src="img/1.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/2.png"></a></li>
            <li><a href="good.html" target="_blank"><img src="img/3.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/4.png"></a></li>
            <li><a href="good.html" target="_blank"><img src="img/5.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/1.png"></a></li>
            <li><a href="good.html" target="_blank"><img src="img/2.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/3.png"></a></li>
            <li><a href="good.html" target="_blank"><img src="img/4.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/5.png"></a></li>
            <li><a href="good.html" target="_blank"><img src="img/1.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/2.png"></a></li>
            <li><a href="good.html" target="_blank"><img src="img/3.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/4.png"></a></li>
            <li><a href="good.html" target="_blank"><img src="img/5.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/1.png"></a></li>
            <li><a href="good.html" target="_blank"><img src="img/2.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/3.png"></a></li>
            <li><a href="good.html" target="_blank"><img src="img/4.png"></a></li>
            <li><a href="goodDetail.html" target="_blank"><img src="img/5.png"></a></li>
        </ul>
    </div>
</div>

<div id="footer">
    All Rights Reserved @ 版权所有
</div>
<script src="js/home.js"></script>
</body>

</html>