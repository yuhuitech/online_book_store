<!DOCTYPE html>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="operations.BookDAO" %>
<%@ page import="operations.BookOperations" %>
<%@ page import="java.util.List" %>
<%@ page import="basis.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%
    String bookID = request.getParameter("id");
    SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) request.getServletContext().getAttribute("SqlSessionFactory");
    Book book = BookOperations.getBook(sqlSessionFactory,bookID);
    request.setAttribute("book",book);
%>

<head>
    <meta charset="UTF-8">
    <title>《${requestScope.book.name}》</title>
    <meta name="author" content="www.vor.ink"/>
    <meta name="description" content="imitateWeb"/>
    <meta name="keywords" content="good,detail"/>
    <meta name="copyright" content="712所有"/>
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
                        <a onclick="document.getElementById('logout').method='post'; document.getElementById('logout').action='/loginAndRegister?status=2'; document.getElementById('logout').submit();" class="link">退出</a>
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
        <li>
            <form id="shopcart" method="post" >
                <a href="/ShopCart" class="link">购物车</a>
            </form>
        </li>
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
    <div id="goodshow">
        <div id="imags" style="overflow: visible">
            <div class="imgbox">
                <!-- 商品大图 -->
                <a class="smallimg" href="#">
                    <img id="smallimg" alt="加载中..." src="img/temp/${requestScope.book.bookId}.jpg">
                </a>
                <!--商品细节大图-->
                <div class="bigbox">
                    <img id="bimg" alt="加载中..." src="img/temp/${requestScope.book.bookId}.jpg">
                </div>
                <!--大图上的显示区域遮罩层-->
                <div id="layer">
                </div>
            </div>
            <!--缩略图-->
            <div class="imgsbox">
                <ul id="imgslist">
                    <li class="imglist selected">
                        <!-- 商品小图 -->
                        <img class="simg" alt="加载中..." src="img/temp/${requestScope.book.bookId}.jpg">
                    </li>
                    <li class="imglist">
                        <!-- 商品小图 -->
                        <img class="simg" alt="加载中..." src="img/temp/${requestScope.book.bookId}.jpg">
                    </li>
                    <li class="imglist">
                        <!-- 商品小图 -->
                        <img class="simg" alt="加载中..." src="img/temp/${requestScope.book.bookId}.jpg">
                    </li>
                   
                </ul>
            </div>
        </div>
        <div id="imgtxt">
            <h2>${requestScope.book.name}</h2>
            <div class="goodinfo">${requestScope.book.writer}</div>
            <div class="goodinfo">价格&nbsp;&nbsp;&nbsp;&nbsp;<span class="price">￥${requestScope.book.price}</span></div>
            <div class="goodinfo">配送&nbsp;&nbsp;&nbsp;&nbsp;<span class="price">包邮</span></div>
            <div class="goodinfo" id="size">优惠券&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="quan-item">                                
                    <s></s>
                    <b></b>
                    <span class="text">满105减6</span>                            
                </span>    
                <span class="quan-item">                              
                    <s></s><b></b> 
                    <span class="text">满200减16</span>                            
                </span>

            </div>
            <div class="goodinfo" id="color"></p>

                <div class="dd J-prom-wrap p-promotions-wrap">
                    <div class="p-promotions">
                        <ins id="prom-mbuy" data-url="https://cd.jd.com/qrcode?skuId=10480831&amp;location=1&amp;isWeChatStock=2"></ins>
                        <ins id="prom-gift" clstag="shangpin|keycount|product|zengpin_3" style="display: none;"></ins>
                        <ins id="prom"></ins>
                        <ins id="prom-one">
                            <div class="J-prom"> 
                                <div class="prom-item" data-code="15"><em class="hl_red_bg">满减</em>
                                    <em>满100元减20元，满200元减50元，满300元减100元</em>
                                    <a href="//sale.jd.com/act/d3jQcOWlPDB.html" clstag="shangpin|keycount|product|满减" target="_blank"> 
                                        &nbsp;&nbsp;详情 <s class="s-arrow">&gt;&gt;</s>
                                    </a>             
                                </div>          
                                  <div class="prom-item" data-code="17">
                                    <em class="hl_red_bg">加价购</em>                
                                    <em>满19元另加19.90元，或满29元另加15.90元，或满39元另加9.90元，即可在购物车换购热销商品</em>                
                                    <a href="//sale.jd.com/act/n27wZ4gl5RWVA.html" clstag="shangpin|keycount|product|加价购" target="_blank">                   
                                     &nbsp;&nbsp;详情 
                                        <s class="s-arrow">&gt;&gt;</s>                </a>             </div>        </div></ins>
                                       
                                        <ins id="prom-phone"></ins>
                                        <ins id="prom-phone-jjg"></ins>
                                        <ins id="prom-tips"></ins>
                                        <ins id="prom-quan"></ins>
                                        <div class="J-prom-more view-all-promotions" style="visibility: hidden;">
                                         <span class="prom-sum">共<em class="prom-number J-prom-count">2</em>项促销</span>
                                            <a href="#none" class="view-link"><i class="i-arrow"></i></a>
                                        </div>
                                    <div class="p-promotions-notice"><i class="sprite-tips"></i>以上促销可在购物车任选其一</div></div>
                                </div>

            <div class="goodinfo">数量&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" min="1" id="num" value="1"/></div>
            <div class="goodinfo"><input onclick="ajax();" type="button" value="加入购物车" class="btngood" id="btnbuy"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" onclick="goToCart();" value="查看购物车" class="btngood" id="btnadd"/></div>
        </div>
        <div id="recommend">   
        </div>
    </div>
    <div id="gooddetail">

    </div>
</div>
</div>


<div id="footer">
    All Rights Reserved @ 版权所有
</div>


<!--显示高清大图-->
<div id="showbigimg"><img src="img/good1.jpg" id="bigimg"></div>
<script src="js/publicgood.js"></script>
<script src="js/jquery-2.1.4.js"></script>
<script>
    function getAmount() {
        var numObj = $("#num").val();
        return numObj;
    }

    function ajax() {
        var url ="/ShopCart" ;
        var amount = getAmount();
        $.ajax({
            type:'POST',
            url:url,
            data: {
                "status":"1",
                "amounts":amount,
                "bookID": "${requestScope.book.bookId}"
            },
            success:function(data) {
                alert("成功添加 "+amount+" 件到购物车");
            }
        });
    }

    function goToCart() {
        window.location.href="/ShopCart";
    }
</script>

<script type="text/javascript" src="js/mejqzoom.js"></script>
</body>
</html>