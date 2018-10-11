<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="${ctx}/static/front/img/title.ico" type="image/x-icon">
		<title>首页</title>
		<!--引入公共样式-->
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/public.css"/>
		<!--引入重置样式-->
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/reset.css"/>
		<!--引入主页内容样式-->
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/index.css"/>
		<!--jquery引入-->
		<script src="${ctx}/static/lib/jquery/jquery-1.11.1.js" type="text/javascript" charset="utf-8"></script>
		<!--主页js   index引入-->
		<script src="${ctx}/static/front/js/index.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ctx}/static/front/js/tyslide.js" type="text/javascript" charset="utf-8"></script>
		<script src="${ctx}/static/front/js/webSite.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<!--领券中心-->
		<div id="ticket" class="clear">
			<div id="ticket_title" class="left">
				<div id="ticket_title_one">
					
				</div>
				<div id="ticket_title_two">
					<div id="ticket_title_two_min"  class="bookDisnone"></div>
				</div>
				<div id="ticket_title_three" >
					
				</div>
			</div>
		</div>
		<!--搜索栏显示-->
		<div id="serch_top">
			<div class="box1200">
				<div class="serch_top_left left">
					logo
				</div>
				<form id="serch_top_form" action="#" method="post" >
					<input id="serch_top_text" type="text" name="serch_top_text" placeholder="创意文具" />
					<input id="serch_top_sub" type="button" value=""/>
				</form>
			</div>
		</div>
		<!--楼层效果-->
		<div id="floor" class="bookDisnone">
			<ul id="floor_con" class="floormin">
				<li id="floor_textbook">图书</li>
				<li id="floor_cloth">服装</li>
				<li id="floor_sport">户外</li>
				<li id="floor_children">童装</li>
				<li id="floor_household">家居</li>
				<li id="floor_generalize">推广</li>
				<li id="floor_top">顶部</li>
			</ul>
		</div>
		
		<!--顶部-->
		<div id="top"  class="box ">
			<div class="box1200 clear">
				<p id="topleft" class="left">legochina.cn</p>
				<p id="topright" class="right">
					<span class="topspan">欢迎光临<a class="reda" href="#">乐购</a>，请</span>
					<a class="graya" href="enter.html">登录</a>
					<span class="topspan">\</span>
					<a class="reda" href="login.html">注册</a>
				</p>
			</div>
			
		</div>
		<!--导航栏-->
		<div id="navmax" class="box1200 clear">
			<div id="logo">
				<img src="${ctx}/static/front/img/LOGO.jpg"/>
			</div>
			<div class="box1200 clear h30" >
				<form id="navmaxform" action="#" method="post" >
					<input id="navmaxtext" type="text" name="text" placeholder="创意文具" />
					<input id="navmaxsub" type="button" value=""/>
				</form>
				<div id="navmaxshop" class="clear">
					<div id="shopminleft">
						<a href="shopingcar.html">购物车</a>
					</div>
					<div id="shopminright">
						我的订单
					</div>
				</div>
			</div>
			<ul id="navmaxcon" class="clear">
				<li>图书</li>
				<li>电子书</li>
				<li>原创文学</li>
				<li>服装</li>
				<li>运动户外</li>
				<li>孕婴童</li>
				<li>家具</li>
				<li>创意文具</li>
				<li>地方特产</li>
				<li><a href="product_list.html">商品列表</a></li>
				<li><a href="VIP.html">会员中心</a></li>
			</ul>
		</div>
		<!--banner和左边菜单栏-->
		<div id="banner" class="box1200 clear">
			<div id="navleft">
				<li>
					<c:forEach items="${topCategoryList}" var="topCategory">
						<p class="title">${topCategory.name }</p>
						<div class="navleftcon">
							<div class="navleftconmin">
								<ul class="clear ">
									<c:forEach items="${secondCategoryList}" var="secondCategory">
										<c:if test="${secondCategory.parentId == topCategory.id}">
											<li>${secondCategory.name }</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
					</c:forEach>
				</li>
			</div>
			<div id="bannerCon">
				<div id="pptwrapper">
					<div class="pptbox" id="boxAnimate">
						<ul class="innerwrapper">
							<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
							<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
							<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
							<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
							<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
							<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
							
						</ul>
						<ul class="controls">
							<li class="current">1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
						</ul>			
						<span class="btnleft"></span>
						<span class="btnright"></span>
					</div>
				</div>
			</div>
			
		</div>
		<!--乐购今日推荐-->
		<div id="recommend" class="box1200 clear">
			<p class="recommendTitle"> 乐购.今日推荐</p>
			<!--小商品列表-->
			<div id="recommendConMin" class="clear">
					
				
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				<div class="recommendConMin">
					<div >
						<img src="${ctx}/static/front/img/demo-cp01.jpg"/>
						
					</div>
					<img src="${ctx}/static/front/img/qianggou.png"/>
					<p class="ht c_333">黑爵青蜂侠六建电竞游戏鼠标</p>
					<p class="fs14 f60 ht">全国联保&nbsp;一年免费包换</p>
					<p class="ht f60 fs24 m_t6">￥:299</p>
				</div>
				
				
			</div>
		</div>
		
		
		
		
		<!--电子书-->
		<div id="textbook" class="box1200 louti_top">
			
			<!--左边-->
			<div class="textbookleft clear">
				<!--标题-->
				<div class="publicTitle clear">
					<p>书.电子书</p>
					<ul class="clear">
						<li class="bookClick">最新上架</li>
						<li>独家畅销</li>
						<li>电子书</li>
					</ul>
				</div>
				
				
				<!--内容-->
				<div  class="bookClickMin .bookDisblock clear">
					<div class="textbookleftL clear">
							<div>
								<img src="${ctx}/static/front/img/ebookLeft.jpg"/>
							</div>
							<ul class="leftConMin">
								<li>11女包</li>
								<li>冰丝内裤</li>
								<li>蕾丝衬衫</li>
								<li>女包</li>
							</ul>
							<ul class="leftConMin">
								<li>女包</li>
								<li>冰丝内裤</li>
								<li>蕾丝衬衫</li>
								<li>女包</li>
							</ul>
							<ul class="leftConMin">
								<li>女包</li>
								<li>冰丝内裤</li>
								<li>蕾丝衬衫</li>
								<li>女包</li>
							</ul>
							
					</div>
					<div class="textbookleftC clear">
						<div class="top">
							<div id="pptwrapper1">
								<div class="pptbox  boxAnimate1">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>	
						<div class="min borderR">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<img src="${ctx}/static/front/img/demo-ebook.jpg"/>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min borderR">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<img src="${ctx}/static/front/img/demo-ebook.jpg"/>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
					</div>
					<div class="textbookleftR clear">
						<div class="min borderR borderB">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<img src="${ctx}/static/front/img/demo-ebook.jpg"/>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min  borderB">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<img src="${ctx}/static/front/img/demo-ebook.jpg"/>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min borderR ">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<img src="${ctx}/static/front/img/demo-ebook.jpg"/>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min ">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<img src="${ctx}/static/front/img/demo-ebook.jpg"/>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
					</div>
				</div>
				
				
				
				
				
				
				<div  class="bookClickMin bookDisnone clear">
					<div class="textbookleftL clear">
							<div>
								<img src="${ctx}/static/front/img/ebookLeft.jpg"/>
							</div>
							<ul class="leftConMin">
								<li>22女包</li>
								<li>冰丝内裤</li>
								<li>蕾丝衬衫</li>
								<li>女包</li>
							</ul>
							<ul class="leftConMin">
								<li>女包</li>
								<li>冰丝内裤</li>
								<li>蕾丝衬衫</li>
								<li>女包</li>
							</ul>
							<ul class="leftConMin">
								<li>女包</li>
								<li>冰丝内裤</li>
								<li>蕾丝衬衫</li>
								<li>女包</li>
							</ul>
							
					</div>
					<div class="textbookleftC clear">
						<div class="top">
							<div id="pptwrapper1">
								<div class="pptbox  boxAnimate1">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>	
						<div class="min borderR">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min borderR">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
					</div>
					<div class="textbookleftR clear">
						<div class="min borderR borderB">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min  borderB">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min borderR ">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min ">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
					</div>
				</div>
				   
				   
				   
				   
				   
				   
				   
				
				<div  class="bookClickMin bookDisnone clear">
					<div class="textbookleftL clear">
							<div>
								<img src="img/ebookLeft.jpg"/>
							</div>
							<ul class="leftConMin">
								<li>33女包</li>
								<li>冰丝内裤</li>
								<li>蕾丝衬衫</li>
								<li>女包</li>
							</ul>
							<ul class="leftConMin">
								<li>女包</li>
								<li>冰丝内裤</li>
								<li>蕾丝衬衫</li>
								<li>女包</li>
							</ul>
							<ul class="leftConMin">
								<li>女包</li>
								<li>冰丝内裤</li>
								<li>蕾丝衬衫</li>
								<li>女包</li>
							</ul>
							
					</div>
					<div class="textbookleftC clear">
						<div class="top">
							<div id="pptwrapper1">
								<div class="pptbox  boxAnimate1">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>	
						<div class="min borderR">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min borderR">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
					</div>
					<div class="textbookleftR clear">
						<div class="min borderR borderB">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min  borderB">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min borderR ">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
						<div class="min ">
							<p class="mintitle"><a href="product.html">奥运狂欢</a></p>
							<p class="mincon">10万种电子书&nbsp;直降40%</p>
							<div >
								<a href="product.html"><img src="${ctx}/static/front/img/demo-ebook.jpg"/></a>
							</div>
							<p class="minMonery">￥49<span>￥79</span></p>
						</div>
					</div>
				</div>
				
			</div>	
				
				
				<!--右边部分-->
				
			
			<div id="textbookright">
				<ul>
					<li id="textbookrightTitle">新书畅销榜</li>
					<li >
						<div class="bookDisnone clear textbook_title">
							<p class="textbookrightred left">1</p><p class="lispan left">就喜欢你看不惯我，又打不到我</p>
						</div>
						<div class="textbook_con clear">
							<p class="textbookrightred left">1</p>
							<div  class="left">
								<img  class="left"  src="${ctx}/static/front/img/demo-ebook.jpg"/>
								从你的全世界路过入选央视“2014中国好书”的80后作品！十年华语畅销小说
							</div>
						</div>
						
					</li>
					<li>
						<div  class="clear textbook_title">
							<p class="textbookrightred left">2</p><p class="lispan left">就喜欢你看不惯我，又打不到我</p>
						</div>
						<div class="bookDisnone textbook_con clear">
							<p class="textbookrightred">2</p>
							<div  class="left">
								<img  class="left"  src="${ctx}/static/front/img/demo-ebook.jpg"/>
								从你的全世界路过入选央视“2014中国好书”的80后作品！十年华语畅销小说
							</div>
						</div>
						
					</li>
					<li>
						<div  class="clear textbook_title">
							<p class="textbookrightred left">3</p><p class="lispan left">就喜欢你看不惯我，又打不到我</p>
						</div>
						<div class="bookDisnone textbook_con clear">
							<p class="textbookrightred">3</p>
							<div  class="left">
								<img  class="left"  src="${ctx}/static/front/img/demo-ebook.jpg"/>
								从你的全世界路过入选央视“2014中国好书”的80后作品！十年华语畅销小说
							</div>
						</div>
						
					</li>
					<li>
						<div  class="clear textbook_title">
							<p class="textbookrightred left">4</p><p class="lispan left">就喜欢你看不惯我，又打不到我</p>
						</div>
						<div class="bookDisnone textbook_con clear">
							<p class="textbookrightred">4</p>
							<div  class="left">
								<img  class="left"  src="${ctx}/static/front/img/demo-ebook.jpg"/>
								从你的全世界路过入选央视“2014中国好书”的80后作品！十年华语畅销小说
							</div>
						</div>
						
					</li>
					<li>
						<div  class="clear textbook_title">
							<p class="textbookrightred left">5</p><p class="lispan left">就喜欢你看不惯我，又打不到我</p>
						</div>
						<div class="bookDisnone textbook_con clear">
							<p class="textbookrightred">5</p>
							<div  class="left">
								<img  class="left"  src="${ctx}/static/front/img/demo-ebook.jpg"/>
								从你的全世界路过入选央视“2014中国好书”的80后作品！十年华语畅销小说
							</div>
						</div>
						
					</li>
					<li>
						<div  class="clear textbook_title">
							<p class="textbookrightred left">6</p><p class="lispan left">就喜欢你看不惯我，又打不到我</p>
						</div>
						<div class="bookDisnone textbook_con clear">
							<p class="textbookrightred">6</p>
							<div  class="left">
								<img  class="left"  src="${ctx}/static/front/img/demo-ebook.jpg"/>
								从你的全世界路过入选央视“2014中国好书”的80后作品！十年华语畅销小说
							</div>
						</div>
						
					</li>
					<li>
						<div  class="clear textbook_title">
							<p class="textbookrightred left">7</p><p class="lispan left">就喜欢你看不惯我，又打不到我</p>
						</div>
						<div class="bookDisnone textbook_con clear">
							<p class="textbookrightred">7</p>
							<div  class="left">
								<img  class="left"  src="${ctx}/static/front/img/demo-ebook.jpg"/>
								从你的全世界路过入选央视“2014中国好书”的80后作品！十年华语畅销小说
							</div>
						</div>
						
					</li>
					
				</ul>
			</div>
		</div>
		
		
		
		
		
		<!--服装-->
		<div id="cloth" class="box1200 clear louti_top">
			<!--标题-->
				<div class="publicTitle clear">
					<p>服装</p>
					<ul class="clear">
						<li class=" bookClick">女装内衣</li>
						<li>热销男装</li>
						<li>精品鞋靴</li>
					</ul>
				</div>
				<!--内容区1-->
				<div class="clothCon clear bookDisblock">
					
				<!--左边-->
					<div class="leftCon clear">
						<div>
							<img src="${ctx}/static/front/img/ebookLeft.jpg"/>
						</div>
						<ul class="leftConMin">
							<li>11女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
					</div>
					<!--中间-->
					<div class="centerCon ">
						<div class="centerConTop">
							<div id="pptwrapper2">
								<div class="pptbox  boxAnimate2">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>
						<div class="centerConBut">
							<img src="${ctx}/static/front/img/demo-centerPic-B.jpg"/>
						</div>
					</div>
					<!--右边-->
					<div class="rightCon clear">
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				<!--内容区2-->
				<div class="clothCon clear bookDisnone">
					
				<!--左边-->
					<div class="leftCon clear">
						<div>
							<img src="${ctx}/static/front/img/ebookLeft.jpg"/>
						</div>
						<ul class="leftConMin">
							<li>22女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
					</div>
					<!--中间-->
					<div class="centerCon ">
						<div class="centerConTop">
							<div id="pptwrapper2">
								<div class="pptbox  boxAnimate2">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>
						<div class="centerConBut">
							<img src="${ctx}/static/front/img/demo-centerPic-B.jpg"/>
						</div>
					</div>
					<!--右边-->
					<div class="rightCon clear">
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				<!--内容区3-->
				<div class="clothCon clear bookDisnone">
					
				<!--左边-->
					<div class="leftCon clear">
						<div>
							<img src="${ctx}/static/front/img/ebookLeft.jpg"/>
						</div>
						<ul class="leftConMin">
							<li>33女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
					</div>
					<!--中间-->
					<div class="centerCon ">
						<div class="centerConTop">
							<div id="pptwrapper2">
								<div class="pptbox  boxAnimate2">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>
						<div class="centerConBut">
							<img src="${ctx}/static/front/img/demo-centerPic-B.jpg"/>
						</div>
					</div>
					<!--右边-->
					<div class="rightCon clear">
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				
		</div>
		<div class="conImg">
			<img src="${ctx}/static/front/img/logo13_11.jpg"/>
			<img src="${ctx}/static/front/img/logo13_12.jpg"/>
			<img src="${ctx}/static/front/img/logo13_13.jpg"/>
			<img src="${ctx}/static/front/img/logo13_14.jpg"/>
			<img src="${ctx}/static/front/img/logo13_15.jpg"/>
			<img src="${ctx}/static/front/img/logo13_16.jpg"/>
			<img src="${ctx}/static/front/img/logo13_17.jpg"/>
			<img src="${ctx}/static/front/img/logo13_18.jpg"/>
			<img src="${ctx}/static/front/img/logo13_19.jpg"/>
		</div>
		<!--户外运动-->
		<div id="sport" class="box1200 louti_top">
			<!--标题-->
				<div class="publicTitle clear">
					<p>户外运动</p>
					<ul class="clear">
						<li class="bookClick">女装内衣</li>
						<li>热销男装</li>
						<li>精品鞋靴</li>
					</ul>
				</div>
				<!--内容区1-->
				<div class="sportCon clear bookDisblock">
					
				<!--左边-->
					<div class="leftCon clear">
						<div>
							<img src="${ctx}/static/front/img/ebookLeft.jpg"/>
						</div>
						<ul class="leftConMin">
							<li>11女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
					</div>
					<!--中间-->
					<div class="centerCon ">
						<div class="centerConTop">
							<div id="pptwrapper2">
								<div class="pptbox  boxAnimate2">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>
						<div class="centerConBut">
							<img src="img/demo-centerPic-B.jpg"/>
						</div>
					</div>
					<!--右边-->
					<div class="rightCon clear">
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				<!--内容区2-->
				<div class="sportCon clear bookDisnone">
					
				<!--左边-->
					<div class="leftCon clear">
						<div>
							<img src="${ctx}/static/front/img/ebookLeft.jpg"/>
						</div>
						<ul class="leftConMin">
							<li>22女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
					</div>
					<!--中间-->
					<div class="centerCon ">
						<div class="centerConTop">
							<div id="pptwrapper2">
								<div class="pptbox  boxAnimate2">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>
						<div class="centerConBut">
							<img src="img/demo-centerPic-B.jpg"/>
						</div>
					</div>
					<!--右边-->
					<div class="rightCon clear">
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				<!--内容区3-->
				<div class="sportCon clear bookDisnone">
					
				<!--左边-->
					<div class="leftCon clear">
						<div>
							<img src="${ctx}/static/front/img/ebookLeft.jpg"/>
						</div>
						<ul class="leftConMin">
							<li>33女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
					</div>
					<!--中间-->
					<div class="centerCon ">
						<div class="centerConTop">
							<div id="pptwrapper2">
								<div class="pptbox  boxAnimate2">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>
						<div class="centerConBut">
							<img src="img/demo-centerPic-B.jpg"/>
						</div>
					</div>
					<!--右边-->
					<div class="rightCon clear">
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				
		</div>
			
		<!--童装-->
		<div id="children" class="box1200 louti_top">
			<!--标题-->
				<div class="publicTitle clear">
					<p>童装</p>
					<ul class="clear">
						<li class="bookClick">女装内衣</li>
						<li>热销男装</li>
						<li>精品鞋靴</li>
					</ul>
				</div>
				<!--内容区1-->
				<div class=" bookDisblock clear childrenCon">
					
				<!--左边-->
					<div class="leftCon clear">
						<div>
							<img src="${ctx}/static/front/img/ebookLeft.jpg"/>
						</div>
						<ul class="leftConMin">
							<li>11女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
					</div>
					<!--中间-->
					<div class="centerCon ">
						<div class="centerConTop">
							<div id="pptwrapper2">
								<div class="pptbox  boxAnimate2">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>
						<div class="centerConBut">
							<img src="${ctx}/static/front/img/demo-centerPic-B.jpg"/>
						</div>
					</div>
					<!--右边-->
					<div class="rightCon clear">
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				<!--内容区2-->
				<div class=" bookDisnone clear childrenCon">
					
				<!--左边-->
					<div class="leftCon clear">
						<div>
							<img src="img/ebookLeft.jpg"/>
						</div>
						<ul class="leftConMin">
							<li>22女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
					</div>
					<!--中间-->
					<div class="centerCon ">
						<div class="centerConTop">
							<div id="pptwrapper2">
								<div class="pptbox  boxAnimate2">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>
						<div class="centerConBut">
							<img src="img/demo-centerPic-B.jpg"/>
						</div>
					</div>
					<!--右边-->
					<div class="rightCon clear">
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				<!--内容区3-->
				<div class="childrenCon clear bookDisnone">
					
				<!--左边-->
					<div class="leftCon clear">
						<div>
							<img src="img/ebookLeft.jpg"/>
						</div>
						<ul class="leftConMin">
							<li>33女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
						<ul class="leftConMin">
							<li>女包</li>
							<li>冰丝内裤</li>
							<li>蕾丝衬衫</li>
							<li>女包</li>
						</ul>
					</div>
					<!--中间-->
					<div class="centerCon ">
						<div class="centerConTop">
							<div id="pptwrapper2">
								<div class="pptbox  boxAnimate2">
									<ul class="innerwrapper">
										<li><a href="#"><img src="${ctx}/static/front/img/banner1.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner2.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner3.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner4.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner5.jpg"/></a></li>
										<li><a href="#"><img src="${ctx}/static/front/img/banner6.jpg"/></a></li>
									</ul>
									<ul class="controls">
										<li class="current">1</li>
										<li>2</li>
										<li>3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
									</ul>			
									<span class="btnleft"></span>
									<span class="btnright"></span>
								</div>
							</div>
						</div>
						<div class="centerConBut">
							<img src="img/demo-centerPic-B.jpg"/>
						</div>
					</div>
					<!--右边-->
					<div class="rightCon clear">
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConTop">
							<p class="rightConTopTitle">达芙妮</p>
							<p class="rightConTopCon">夏季凉鞋清仓</p>
							<p class="rightConTopnet">领77元优惠券</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				
		</div>
		<!--家居日用-->
		<div id="household" class="box1200 clear louti_top">
			<!--标题-->
				<div class="publicTitle clear">
					<p>家具日用</p>
				</div>
				<div id="householdleft">
					<img src="img/jiaju.png"/>
				</div>
				<div id="householdright" class="clear">
					<div class="rightConTop">
						<p class="rightConTopTitle">达芙妮</p>
						<p class="rightConTopCon">夏季凉鞋清仓</p>
						<p class="rightConTopnet">领77元优惠券</p>
						<div>
							<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
						</div>
					</div>
					<div class="rightConTop">
						<p class="rightConTopTitle">达芙妮</p>
						<p class="rightConTopCon">夏季凉鞋清仓</p>
						<p class="rightConTopnet">领77元优惠券</p>
						<div>
							<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
						</div>
					</div>
					<div class="rightConTop">
						<p class="rightConTopTitle">达芙妮</p>
						<p class="rightConTopCon">夏季凉鞋清仓</p>
						<p class="rightConTopnet">领77元优惠券</p>
						<div>
							<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
						</div>
					</div>
					<div class="rightConTop">
						<p class="rightConTopTitle">达芙妮</p>
						<p class="rightConTopCon">夏季凉鞋清仓</p>
						<p class="rightConTopnet">领77元优惠券</p>
						<div>
							<img src="${ctx}/static/front/img/demo-common-right-big.gif"/>
						</div>
					</div>
					<div id="householdrighttop" class="clear">
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
						<div class="rightConBut">
							<p class="rightConTopTitle">暑假清凉季</p>
							<p class="rightConTopCon">满199减30</p>
							<div>
								<img src="${ctx}/static/front/img/demo-common-right-small.jpg"/>
							</div>
						</div>
					</div>
				</div>
				
		</div>
		<!--推广商品-->
		<div id="generalize" class="box1200 clear louti_top">
			<div class="generalizeC clear"> 
				<p>推广商品</p> 
				<ul class="clear">
					<li class="current"></li>
					<li></li>
				</ul>
			</div>
			<div id="generalizeCon_one" class="generalizeCon clear" >
				<div class="generalizeMin current">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
			</div>
			
			
			
			
			
			
			
			
			<div id="generalizeCon_two" class="generalizeCon bookDisnone clear" >
				<div class="generalizeMin current">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
				<div class="generalizeMin">
					<div><img src="img/demo-pop.jpg"/></div>
					<h5>Pigeon法国制奶嘴，无毒天然乳胶</h5>
					<p class="generalizeMon">￥:189</p>
					<p class="generalizemin">已有<span>988</span>条评论</p>
				</div>
			</div>
			
		</div>
		
		<!--页脚-->
		<div class="box" id="footer">
			<div id="fanhuitop"><img src="img/top.png"/></div>
			<div class="box recommendTitle">
				
			</div>
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