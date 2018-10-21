<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>乐购商城_购物车</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/CSS/login_style.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/CSS/cart_style.css" />
		<link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
	</head>

	<body>
		<div class="bg_color">
			<div class="top_center">
				<div class="left">
					<span class="wel">欢迎来到乐购商城！</span>
				</div>
				<div class="right">
					<ul>
						<li>
							<a class="login" href="login.html" target="_blank">请登录</a>
						</li>
						<li>
							<a href="register.html" target="_blank">快速注册</a>
						</li>
						<li>
							<a class="collect" href="">我的收藏</a>
						</li>
						<li>
							<a class="indent" href="">我的订单</a>
						</li>
						<li>
							<a class=phone href="">手机靓购</a>
						</li>
						<li>
							<a href="">我的积分</a>
						</li>
						<li>
							<a href="">我的评价</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="logo_center">
			<div class="left">
				<img class="logo_img" src="${ctx}/static/front/img/LOGO.png" />
				<span class="car_text">购物车</span>
			</div>
			<div class="right">
				<input class="car_input" type="text" />
				<input class="car_search" type="button" value="搜索" />
			</div>
		</div>
		<div class="title">
			<div class="title_top">
				<ul>
					<li>
						<a href="">全部商品</a>
					</li>
					<li>
						<a href="">降价商品</a>
					</li>
					<li>
						<a href="">库存紧张</a>
					</li>
				</ul>
				<p style="margin:0;padding-right: 10px; float: right;line-height: 40px;">配送至：<span style="border: 1px solid rgb(51,51,51);">山东省 青岛市 市南区 <img src="${ctx}/static/front/img/narrow.png"/></span></p>
			</div>
			<div class="title_center">
				<ul style="color: #666666;margin-top: 10px;margin-bottom: 10px;">
					<li style="margin-left: 16px;margin-right: 8px;">
						<input type="checkbox" />
					</li>
					<li style="margin-left: 8px;margin-right: 38px;">全选</li>
					<li style="margin-left: 38px;margin-right: 168px;">商品</li>
					<li style="margin-left: 138px;margin-right: 58px;">单价</li>
					<li style="margin-left: 58px;margin-right: 58px;">数量</li>
					<li style="margin-left: 58px;margin-right: 58px;">小计</li>
					<li style="margin-left: 58px;margin-right: 36px;">操作</li>
				</ul>
			</div>
		</div>
		<c:forEach items="${cartVO.cartItemVOList}" var="cartItemVO">
			<div class="car_1">
				<div class="car_1_top">
					<img src="${ctx}/static/front/img/158.png" />
					<p class="car_1_top_p">
						<span class="span1">
							活动商品购满¥105.00 , 即可加价换购商品1件&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span>
						<span class="span2">
							&nbsp;查看换购品
						</span>
						<span class="span3">
							&nbsp;&nbsp;去凑单&gt;
						</span>
					</p>
				</div>
				<div class="car_2_bottom">
					<div class="car_con_1">
						<c:if test="${cartItemVO.isChecked == 1}">
							<input id="checkbox${cartItemVO.product.id}" name="selectCheckbox" checked="checked" type="checkbox" onclick="updateCartItemStatus(${cartItemVO.product.id})" />
						</c:if>
						<c:if test="${cartItemVO.isChecked == 0}">
							<input name="selectCheckbox" id="checkbox${cartItemVO.product.id}" type="checkbox" onclick="updateCartItemStatus(${cartItemVO.product.id})" />
						</c:if>
					</div>
					<div class="car_con_2">
						<img width="85px" height="100px" src="/pic/${cartItemVO.product.mainImage}" />
					</div>
					<div class="car_con_3">
						<p class="p_title">${cartItemVO.product.name }</p>
						<img src="${ctx}/static/front/img/160.png" />
						<p class="p_seven">&nbsp;支持7天无理由退货</p>
						<img src="${ctx}/static/front/img/161.png" />
						<p class="p_select">&nbsp;选包装</p>
					</div>
					<ul class="car_ul">
						<li class="price">
							<span id="price${cartItemVO.product.id}" style="color:#666666">
								¥ ${cartItemVO.product.price}
							</span>
						</li>
						<li class="num_select">
							<input class="car_ul_btn1" type="button" onclick="updateAmount(${cartItemVO.product.id},${cartItemVO.product.price},-1)" value="-" />
							<input id="num${cartItemVO.product.id}" class="car_ul_text" type="text" value="${cartItemVO.amount}" placeholder="${cartItemVO.amount }" />
							<input class="car_ul_btn2" type="button" onclick="updateAmount(${cartItemVO.product.id},${cartItemVO.product.price},1)" value="+" />
						</li>
						<li class="money">
							￥
							<span id="cartItemTotalPrice${cartItemVO.product.id}" style="color: #F41443;">${cartItemVO.product.price * cartItemVO.amount}</span>
						</li>
						<li class="delete">
							<img onclick="deleteCartItemById(${cartItemVO.product.id})" src="${ctx}/static/front/img/166.png" />
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</c:forEach>
		<div class="total">
				<ul style="color: #666666;margin-top: 10px;margin-bottom: 10px;">
					<li style="margin-left: 16px;margin-right: 8px;">
						<input type="checkbox" />
					</li>
					<li style="margin-left: 8px;margin-right: 265px;">全选</li>
					<li style="margin-left: 200px;margin-right: 18px;">总金额（已免运费）：￥<span id="totalPrice" style="color: #F41443;"></span></li>
					<li class="total_right"><a onclick="getOrderPage()">立即结算</a></li>
				</ul>
			</div>
					<div class="sp">
			<div class="sp1">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp2">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp3">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp4">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="more">
			<div class="mb1">
				<ul>
					<li>
						购物指南
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;免费注册
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;开通支付宝
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;支付宝充值
						</a>
					</li>
				</ul>
			</div>
			<div class="mb2">
				<ul>
					<li>
						品质保障
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;发票保障
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;售后规则
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;缺货赔付
						</a>
					</li>
				</ul>
			</div>
			<div class="mb3">
				<ul>
					<li>
						支付方式
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;快捷支付
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;信用卡
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;货到付款
						</a>
					</li>
				</ul>
			</div>
			<div class="mb4">
				<ul>
					<li>
						商家服务
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;商家入驻
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;商家中心
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;运营服务
						</a>
					</li>
				</ul>
			</div>
			<div class="mb5">
				<ul>
					<li>
						手机靓淘
					</li>
					<li>
						<img src="${ctx}/static/front/img/98.png"/>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="link">
			<ul>
				<li>
					<a href="">
						关于靓淘
					</a>
				</li>
				<li>
					<a href="">
						帮助中心
					</a>
				</li>
				<li>
					<a href="">
						开放平台
					</a>
				</li>
				<li>
					<a href="">
						诚聘精英
					</a>
				</li>
				<li>
					<a href="">
						联系我们
					</a>
				</li>
				<li>
					<a href="">
						网站合作
					</a>
				</li>
				<li>
					<a href="">
						法律声明及隐私政策
					</a>
				</li>
				<li>
					<a href="">
						知识产权
					</a>
				</li>
				<li>
					<a href="">
						廉政举报
					</a>
				</li>
				<li>
					<a href="">
						规则意见征集
					</a>
				</li>
			</ul>
		</div>
		<div class="copyright">
			COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利. 客服热线：400-123-888888<br /> 
			京公网安备 110101020011226|京ICP证111033号|食品流通许可证 SP1101051110165515（1-1）|营业执照
		</div>
	</body>
	
	<!-- 登录弹窗界面 -->
	<div class="banner">
	  <div class="login" style="display:none" id="loginForm">
		<form id="login-form">
			<ul>
				<li class="login_title_1">
					<a href="">密码登录</a>

				</li>
				<li class="login_title_2">
					<a href="">扫码登录</a>
				</li>
				<li>
					<input id="username" name="username" class="login_user" type="text" placeholder="会员名/邮箱/手机号" />
					<input id="password" name="password" class="login_password" type="password" placeholder="密码" />
					<input class="login_btn" type="button" onclick="login()" value="登录" />
				</li>
				<li class="login_select">
					<a class="weibo" href="">微博登录</a>
					<a class="zhifubao" href="">支付宝登录</a><br />
				</li>
				<li class="renmenber_user">
					<input type="checkbox" value="remer_user" id="remer_user" />
					<label for="remer_user">记住用户名</label>
				</li>
				<li class="login_bottom">
					<a href="">忘记密码</a>
					<a href="">免费注册</a>
				</li>
			</ul>
		</form>
	</div>
	</div>
	<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/mylayer.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/util.js"></script>
	<script type="text/javascript">
		layui.use(['layer']),function(){
			var layer = layui.layer;
		}
		
		$(function(){
			//页面加载完刷新总价格
			refreshTotalPrice();
		})
		
		//更新购物车中商品的数量
		function updateAmount(productId,price,num){
			//String类型
			var amount = $("#num" + productId).val();
			$.ajax({
				url:"${ctx}/cart/addOrUpdateCart.shtml",
				data:{"productId":productId,"amount":num,"isChecked":1},
				type:"POST",
				dataType:"json",
				success : function(resp){
					if(resp.code == util.SUCCESS){
						mylayer.success(resp.msg);
						amount = parseInt(amount) + num;
						$("#num" + productId).val(amount);
						var totalPrice = amount * price;
						$("#cartItemTotalPrice"+productId).html(totalPrice);
						refreshTotalPrice();
					} else {
						mylayer.errorMsg(resp.msg);
					}
				}
			})
		}
		
		//根据商品id删除购物车中购物项
		function deleteCartItemById(productId){
			layer.confirm("您确定要删除么？",function(){
				$.ajax({
					url:"${ctx}/cart/deleteCartItemById.shtml",
					data:{"productId":productId},
					type:"POST",
					datatype:"json",
					success:function(resp){
						if(resp.code == util.SUCCESS){
							mylayer.success(resp.msg);
							//移除div，往上找三个parent
							$("#checkbox" + productId).parent().parent().parent().remove();
						} else {
							mylayer.errorMsg(resp.msg);
						}
					}
				})
			})
		}
		
		//点击checkbox时，选择或取消商品在购物商城中的状态
		function updateCartItemStatus(productId){
			var isChecked = $("#checkbox" + productId).prop("checked");
			if(isChecked){
				isChecked = 1;
			} else {
				isChecked = 0;
			}
			$.ajax({
				url:"${ctx}/cart/addOrUpdateCart.shtml",
				data:{"productId":productId,"isChecked":isChecked},
				type:"POST",
				dataType:"json",
				success:function(resp){
					if(resp.code == util.SUCCESS){
						mylayer.success(resp.msg);
						//刷新价格
						refreshTotalPrice();
					}else {
						mylayer.errorMsg(resp.msg);
					}
				}
			})
		}
		
		//更新购物车总价格
		function refreshTotalPrice(){
			var checkboxs = $("input[name=selectCheckbox]:checked");
			var totalPrice = 0.00;
			for(var i = 0; i < checkboxs.length;i++){
				var checkboxId = checkboxs[i].getAttribute("id");
				//原形式checkbox111,截出id
				var id = checkboxId.substr("checkbox".length);
				var cartItemTotalPrice = $("#cartItemTotalPrice"+id).html();
				console.log(cartItemTotalPrice);
				//将字符串类型转化为float
				totalPrice += parseFloat(cartItemTotalPrice); 
				console.log(totalPrice);
			}
			$("#totalPrice").html(totalPrice);
		}
		
		//跳转结算界面
		function getOrderPage(){
			//todo:用户没有勾选任何商品checkbox，给用户一个提示：您还没有选择任何商品
			// Session也是一个域对象，${USER}从request域对象找不到从Session域对象找
			var user = "${USER}";
			if(user == ""){//用户未登录
				layer.open({
					type : 1,
					title : "登录",
					offset : "50px",
					area : ['400px','450px'],
					content : $('#loginForm')
				});
			} else {//用户已经登录，直接跳转生成订单界面
				window.location.href="${ctx}/order/getOrderPage.shtml";
			}
		}
		
		//登录
		function login(){
			var username = $("#username").val();
			var password = $("#password").val();
			//判断用户名是否为空
			if(util.isNull(username)){
				mylayer.errorMsg("用户名不能为空");
				return;
			}
			//用户名格式是否合法
			if(!isUsernameValid(username)){
				mylayer.errorMsg("用户名不合法，请输入3-5为数字、字母、下划线");
				return;
			}
			//判断密码是否为空
			if(util.isNull(password)){
				mylayer.errorMsg("密码不能为空");
			}
			//ajax验证用户名密码,
			$.ajax({
				url : "${ctx}/user/login.shtml",
				type : "POST",
				dataType : "json",
				data : $("#login-form").serialize(),
				success : function(data) {
					if(data.code == util.SUCCESS){
						mylayer.successUrl(data.msg, "${ctx}/order/getOrderPage.shtml");						
					} else {
						mylayer.errorMsg(data.msg);
					}
				}
			});
		}
		
		//验证用户名是否合法
		function isUsernameValid(value){
			var pattern = /^\w{5,10}$/;
			return pattern.test(value);
		}
	</script>
</html>