<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>乐购商城-提交订单</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/CSS/reset.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/CSS/main.css"/>
</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到乐购商城!</div>
			<div class="fr">
				<div class="login_info fl">
					欢迎您：<em></em>
				</div>
				<div class="login_btn fl">
					<a href="login.html">登录</a>
					<span>|</span>
					<a href="register.html">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span>
					<a href="user_center_info.html">用户中心</a>
					<span>|</span>
					<a href="cart.html">我的购物车</a>
					<span>|</span>
					<a href="user_center_order.html">我的订单</a>
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logo.png"/></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;提交订单</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品"/>
			<input type="button" class="input_btn fr" name="" value="搜索"/>
		</div>		
	</div>
	<h3 class="common_title">确认收货地址</h3>
		<div class="common_list_con clearfix">
				<dl>
					<dt>寄送到：</dt>
					<c:forEach items="${shippings}" var="shipping">
						<input id="shippingId" type="hidden" value="${shipping.id}"/>
						<dd><input type="radio" name="" checked="checked"/>${shipping.receiverProvince}省&nbsp;&nbsp;&nbsp;&nbsp; ${shipping.receiverCity}市&nbsp;&nbsp;&nbsp;&nbsp;${shipping.receiverDistrict}&nbsp;&nbsp;&nbsp;&nbsp;${shipping.receiverAddress}&nbsp;&nbsp;&nbsp;&nbsp;(${shipping.receiverName}&nbsp;收)&nbsp;&nbsp;&nbsp;&nbsp;${shipping.receiverMobile}</dd>
					</c:forEach>
				</dl>
				<a href="user_center_site.html" class="edit_site">编辑收货地址</a>
		</div>
	
	<h3 class="common_title">支付方式</h3>	
	<div class="common_list_con clearfix">
		<div class="pay_style_con clearfix">
			<input type="radio" name="pay_style" checked/>
			<label class="cash">货到付款</label>
			<input type="radio" name="pay_style"/>
			<label class="weixin">微信支付</label>
			<input type="radio" name="pay_style"/>
			<label class="zhifubao"></label>
			<input type="radio" name="pay_style"/>
			<label class="bank">银行卡支付</label>
		</div>
	</div>

	<h3 class="common_title">商品列表</h3>
	
	<div class="common_list_con clearfix">
		<c:forEach items="${cartVO.cartItemVOList}" var="cartItemVO">
			<ul class="goods_list_th clearfix">
				<li class="col01">商品名称</li>
				<li class="col03">商品价格</li>
				<li class="col04">数量</li>
				<li class="col05">小计</li>		
			</ul>
			<input type="hidden" id="productId${cartItemVO.product.id}" name="productIds" value="${cartItemVO.product.id}" />
			<ul class="goods_list_td clearfix">
				<li class="col01">&nbsp;</li>
				<li class="col02"><img src="/pic/${cartItemVO.product.mainImage}"/></li>
				<li class="col03">${cartItemVO.product.name}</li>
				<li class="col05">￥${cartItemVO.product.price}</li>
				<li class="col06">${cartItemVO.amount}</li>
				<li class="col07" id="price${cartItemVO.product.id}">${cartItemVO.product.price * cartItemVO.amount}</li>	
			</ul>
		</c:forEach>
	</div>
	<h3 class="common_title">总金额结算</h3>
	<div class="common_list_con clearfix">
		<div class="settle_con">
			<div class="total_goods_count">共<em>${cartVO.cartItemVOList.size()}</em>件商品，总金额<b id="totalPrice"></b></div>
			<div class="transit">运费：<b>0元</b></div>
			<div class="total_pay">实付款：<b>￥</b><b id="totalPrice2"></b></div>
		</div>
	</div>

	<div class="order_submit clearfix">
		<a href="javascript:;" id="order_btn" onclick="addOrder()">提交订单</a>
	</div>	

	<div class="footer">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>

	<div class="popup_con">
		<div class="popup">
			<p>订单提交成功！</p>
		</div>
		
		<div class="mask"></div>
	</div>
	<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/mylayer.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/util.js"></script>
	<script type="text/javascript">
		layui.use(['layer'],function(){
			var layer = layui.layer;
		});
		
		$('#order_btn').click(function() {
			localStorage.setItem('order_finish',2);

			$('.popup_con').fadeIn('fast', function() {

				setTimeout(function(){
					$('.popup_con').fadeOut('fast',function(){
						window.location.href = 'index.html';
					});	
				},3000)
				
			});
		});
		
		$(function(){
			//页面加载完刷新总价格
			refreshTotalPrice();
		})
		
		//订单页面总金额
		function refreshTotalPrice(){
			var totalPrice = 0.00;
			var productIds = $("[name = productIds]");
			for(var i = 0; i < productIds.length; i++){
				var product = productIds[i].getAttribute("id");
				//原形式productId,截出id
				var id = product.substr("productId".length);
				var OrderTotalPrice = $("#price"+id).html();
				console.log(OrderTotalPrice);
				//将字符串类型转化为float
				totalPrice += parseFloat(OrderTotalPrice); 
				console.log(totalPrice);
			}
			$("#totalPrice").html("￥" + totalPrice);
			$("#totalPrice2").html(totalPrice);
		}
		
		//提交订单
		function addOrder(){
			//拿到订单的id
			var shippingId = $("#shippingId").val();
			//拿到实付款的总金额
			var payment = $("#totalPrice2").html();
			//拿到每一项的金额
			var totalPrice = $("price").val();
			console.log(totalPrice);
			$.ajax({
				url : "addOrder.shtml",
				type : "POST",
				data : {"shippingId": shippingId,"payment" : payment},
				dataType : "json",
				success : function(resp){
					if(resp.code == util.SUCCESS){
						location.href = "getUserOrderPage.shtml";
					} else {
						mylayer.errorMsg(resp.msg);
					}
				}
			});
		}
	</script>
</body>
</html>