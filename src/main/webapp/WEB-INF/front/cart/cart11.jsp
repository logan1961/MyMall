<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<!--引入公共样式-->
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/public.css"/>
		<!--引入重置样式-->
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/reset.css"/>
		<!--引入提交订单内容样式-->
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/shopingcar.css"/>
		<!--jquery引入-->
		<script src="${ctx}/static/lib/jquery/jquery-1.11.1.js" type="text/javascript" charset="utf-8"></script>
		<!--提交订单js   index引入-->
		<script src="${ctx}/static/front/js/shopingcar.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div id="top" class="box">
			<div class="box1200 clear">
				<p id="topleft" class="left">legochina.cn</p>
				<p id="topright" class="right">
					<span class="topspan">欢迎光临乐购，请</span>
					<a class="graya" href="enter.html">登录</a>
					<span class="topspan">\</span>
					<a class="reda" href="login.html">注册</a>
				</p>
			</div>
			
		</div>
			<!--导航栏-->
		<div id="navmax" class="box1200 clear">
			<div id="logo">
				<img src="${ctx}/static/front/img/images/Clearing_02.jpg"/>
			</div>
			<div class="box1200 clear h30" >
				<form id="navmaxform" action="#" method="post" >
					<input id="navmaxtext" type="text" name="text" placeholder="设计中的设计" />
					<input id="navmaxsub" type="button" value=""/>
				</form>
			</div>
			<div class="navmax_text right">运送至
				<select class="navmax_text_select">
					<option value="">成都高新区三环</option>
					<option value=""></option>
					<option value=""></option>
				</select>
			</div>
		</div>
		
		
		<!--主内容区-->
		<div id="shpocar" class="box1200">
			<p class="misg">商品数量（<span class="num_button">0</span>）</p>
			<div id="shoptitle" class="clear">
				<p><input class="check_all" type="checkbox" name="checkboxOne"  value="" />全选</p>
				<p>商品</p>
				<p>单价</p>
				<p>数量</p>
				<p>小计</p>
				<p>操作</p>
			</div>
			
			
			
			
			
			
			
			<div  class="shopCon border_top clear">
				<div class="shopConMin clear ">
					<p><input  class="check_min"  type="checkbox" name="checkboxT" value="" /></p>
					<div class="shopConMin_img">
						<p><img src="${ctx}/static/front/img/goumai.png"/></p>
					</div>
					<p>从你的全世界路过</p>
					<p class="price_min">41.01</p>
					<p>
						<input class="text" type="text" name="rext" value="1" />
						<span class="jia">+</span>
						<span class="jian">-</span>
					</p>
					<p class="price">41.01</p>
					<p>
						<span>删除</span>
						<br />
						<span >移到我的关注</span>
					</p>
				</div>
			</div>
				<div  class="shopCon border_top clear">
				<div class="shopConMin clear ">
					<p><input  class="check_min"  type="checkbox" name="checkboxT" value="" /></p>
					<div class="shopConMin_img">
						<p><img src="${ctx}/static/front/img/goumai.png"/></p>
					</div>
					<p>从你的全世界路过</p>
					<p class="price_min">41.01</p>
					<p>
						<input class="text" type="text" name="rext" value="1" />
						<span class="jia">+</span>
						<span class="jian">-</span>
					</p>
					<p class="price">41.01</p>
					<p>
						<span>删除</span>
						<br />
						<span >移到我的关注</span>
					</p>
				</div>
			</div>
			
			<div id="indent" class="clear">
				<div id="indentL" class="clear">
					<p><input class="check_all" type="checkbox" name="checkboxOne"  value="" />全选</p>
					<p>删除选中商品</p>
				</div>
				<div id="indentR">
					<p id="mun_t">已选<span class="num_button">1</span>件商品</p>
					<p class="indentR_box">总价<span>41.00</span></p>
					<p>去结算</p>
				</div>
			</div>
		</div>
		<div id="like" class="box1200">
			<!--人气单品展示区-->
		<div id="show" class="box1200">
			<div id="showTitle">
				<p>猜你喜欢</p>
			</div>
			
			<!--小个商品-->
			<div class="clear" id="showCon">
				<div class="showConMin showConMinClick">
					<div class="showConMinBook">
						<img src="${ctx}/static/front/img/book-min.png"/>
					</div>
					<div><img src="img/8zhe.png"/></div>
					<p>白夜行    &nbsp;东野上吾</p>
					<p>推荐：<img src="img/xingxing.png"/></p>
					<p><span>￥38.00</span> <span>￥58.00</span></p>
				</div>
				<div class="showConMin ">
					<div class="showConMinBook">
						<img src="${ctx}/static/front/img/book-min.png"/>
					</div>
					<div><img src="img/8zhe.png"/></div>
					<p>白夜行    &nbsp;东野上吾</p>
					<p>推荐：<img src="${ctx}/static/front/img/xingxing.png"/></p>
					<p><span>￥38.00</span> <span>￥58.00</span></p>
				</div>
				<div class="showConMin">
					<div class="showConMinBook">
						<img src="${ctx}/static/front/img/book-min.png"/>
					</div>
					<div><img src="img/8zhe.png"/></div>
					<p>白夜行    &nbsp;东野上吾</p>
					<p>推荐：<img src="${ctx}/static/front/img/xingxing.png"/></p>
					<p><span>￥38.00</span> <span>￥58.00</span></p>
				</div>
				<div class="showConMin">
					<div class="showConMinBook">
						<img src="${ctx}/static/front/img/book-min.png"/>
					</div>
					<div><img src="img/8zhe.png"/></div>
					<p>白夜行    &nbsp;东野上吾</p>
					<p>推荐：<img src="${ctx}/static/front/img/xingxing.png"/></p>
					<p><span>￥38.00</span> <span>￥58.00</span></p>
				</div>
				<div class="showConMin">
					<div class="showConMinBook">
						<img src="${ctx}/static/front/img/book-min.png"/>
					</div>
					<div><img src="img/8zhe.png"/></div>
					<p>白夜行    &nbsp;东野上吾</p>
					<p>推荐：<img src="${ctx}/static/front/img/xingxing.png"/></p>
					<p><span>￥38.00</span> <span>￥58.00</span></p>
				</div>
				
			</div>
			
		</div>
		</div>
		
		
		
		
	<!--页脚-->
		<div class="box" id="footer">
			<p class="box recommendTitle"></p>
			<div class="box" id="footermax">
				<div id="footertop">
					<div class="footertop">
						
					</div>
					<div id="footertop2" class="footertop">
						
					</div>
					<div id="footertop3" class="footertop">
						
					</div>
					<div id="footertop4"  class="footertop">
						
					</div>
				</div>
			</div>
			<div id="footerCenter" class=" clear">
				<ul class="footermin">
					<li class="footerminbox">购物指南</li>
					<li>购物流程</li>
					<li>发票制度</li>
					<li>账户管理</li>
					<li>会员优惠</li>
				</ul>
				<ul class="footermin">
					<li class="footerminbox">购物指南</li>
					<li>购物流程</li>
					<li>发票制度</li>
					<li>账户管理</li>
					<li>会员优惠</li>
				</ul>
				<ul class="footermin">
					<li class="footerminbox">购物指南</li>
					<li>购物流程</li>
					<li>发票制度</li>
					<li>账户管理</li>
					<li>会员优惠</li>
				</ul>
				<ul class="footermin">
					<li class="footerminbox">购物指南</li>
					<li>购物流程</li>
					<li>发票制度</li>
					<li>账户管理</li>
					<li>会员优惠</li>
				</ul>
				<ul class="footermin">
					<li class="footerminbox">购物指南</li>
					<li>购物流程</li>
					<li>发票制度</li>
					<li>账户管理</li>
					<li>会员优惠</li>
				</ul>
			</div>
			<div id="footerbut">
				<a href="#">公司简介</a>|<a href="#">Investor&nbsp;Relations</a>|<a href="#">网站联盟</a>|<a href="#">乐购招商</a>|<a href="#">机构销售</a>|<a href="#">手机乐购</a>|<a href="#">官方Blog</a>|<a href="#">热词搜索</a>
				<p><span>Copyrigth</span> <span>(C)</span> <span>乐购网</span> <span>2004-2016</span> <span>All</span> <span>Rights</span> <span>Reserved</span> </p>
			</div>
		</div>
	</body>
</html>
