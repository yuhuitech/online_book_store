<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="basis.*" %>
<%@ page import="operations.ShopCartOperation" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="utf-8" />
		<title>购物车</title>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/proList.css" />
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


		<!--------------------------------------cart--------------------->
		<div class="cart mt">
			<!-----------------logo------------------->
			<!--<div class="logo">
				<h1 class="wrapper clearfix">
					<a href="index.jsp"><img class="fl" src="img/temp/logo.png"></a>
					<img class="top" src="img/temp/cartTop01.png">
				</h1>
			</div>-->
			<!-----------------site------------------->
			<div class="site">
				<p class=" wrapper clearfix">
					<span class="fl">购物车</span>
					<img class="top" src="img/temp/cartTop01.png">
					<a href="/catalog" class="fr">继续购物&gt;</a>
				</p>
			</div>
			<!-----------------table------------------->
			<div class="table wrapper">
				<div class="tr">
					<div>商品</div>
					<div>单价</div>
					<div>数量</div>
					<div>小计</div>
					<div>操作</div>
					<div></div>
				</div>
				<c:forEach items="${sessionScope.cartList}" var="keyword" varStatus="id">
					<div class="th" id="${keyword.bookID}" num="${keyword.totalItem}">
						<div class="pro clearfix">
							<label class="fl">
								<input class="checkboxhere" type="checkbox" ${keyword.state}/>
    							<span></span>
							</label>
							<a class="fl" href="#">
								<dl class="clearfix">
									<dt class="fl"><img src="img/temp/${keyword.bookID}.jpg"  height="120" width="106"></dt>
									<dd class="fl">
										<p>${keyword.bookName}</p>
										<p>作者:</p>
										<p>${keyword.bookWriter}</p>
									</dd>
								</dl>
							</a>
						</div>
						<div class="price">￥${keyword.pricePerCommodity}</div>
						<div class="number">
							<p class="num clearfix" id="${keyword.bookID}">
								<img class="fl sub" src="img/temp/sub.jpg">
								<span class="fl">${keyword.totalItem}</span>
								<img class="fl add" src="img/temp/add.jpg">
							</p>
						</div>
						<div class="price sAll">￥<fmt:formatNumber value="${keyword.pricePerCommodity*keyword.totalItem}" pattern="#.00"/></div>
						<div class="price"><a class="del" href="#2">删除</a></div>
					</div>
				</c:forEach>
				<div class="goOn">空空如也~<a href="index1.jsp">去逛逛</a></div>
				<div class="tr clearfix">
					<label class="fl">
						<input class="checkAll" type="checkbox"/>
						<span></span>
					</label>
					<p class="fl">
						<a href="#">全选</a>
						<a href="#" class="del">删除</a>
					</p>
					<p class="fr">
						<span>共<small id="sl">0</small>件商品</span>
						<span>合计:&nbsp;<small id="all">￥0.00</small></span>
						<a href="/OrderManagement?operation=1" class="count">结算</a>
					</p>
				</div>
			</div>
		</div>
		<div class="mask"></div>
		<div class="tipDel">
			<p>确定要删除该商品吗？</p>
			<p class="clearfix">
				<a class="fl cer" href="#">确定</a>
				<a class="fr cancel" href="#">取消</a>
			</p>
		</div>
		<!--返回顶部-->
		
		<!--footer-->
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
		


		<!----------------mask------------------->
		<div class="mask"></div>
		<!-------------------mask内容------------------->
		<div class="proDets">
			<img class="off" src="img/temp/off.jpg" />
			<div class="proCon clearfix">
				<div class="proImg fr">
					<img class="list" src="img/temp/proDet.jpg"  />
					<div class="smallImg clearfix">
						<img src="img/temp/proDet01.jpg" data-src="img/temp/proDet01_big.jpg">
						<img src="img/temp/proDet02.jpg" data-src="img/temp/proDet02_big.jpg">
						<img src="img/temp/proDet03.jpg" data-src="img/temp/proDet03_big.jpg">
						<img src="img/temp/proDet04.jpg" data-src="img/temp/proDet04_big.jpg">
					</div>
				</div>
				<div class="fl">
					<div class="proIntro change">
						<p>颜色分类</p>
						<div class="smallImg clearfix">
							<p class="fl on"><img src="img/temp/prosmall01.jpg" alt="白瓷花瓶+20支快乐花" data-src="img/temp/proBig01.jpg"></p>
							<p class="fl"><img src="img/temp/prosmall02.jpg" alt="白瓷花瓶+20支兔尾巴草" data-src="img/temp/proBig02.jpg"></p>
							<p class="fl"><img src="img/temp/prosmall03.jpg" alt="20支快乐花" data-src="img/temp/proBig03.jpg"></p>
							<p class="fl"><img src="img/temp/prosmall04.jpg" alt="20支兔尾巴草" data-src="img/temp/proBig04.jpg"></p>
						</div>
					</div>
					<div class="changeBtn clearfix">
						<a href="#2" class="fl"><p class="buy">确认</p></a>
						<a href="#2" class="fr"><p class="cart">取消</p></a>
					</div>
				</div>
			</div>
		</div>
		<div class="pleaseC">
			<p>请选择宝贝</p>
			<img class="off" src="img/temp/off.jpg" />
		</div>
		<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
</div>

	</body>
</html>
