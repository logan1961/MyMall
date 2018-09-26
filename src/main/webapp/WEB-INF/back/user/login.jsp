<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>登录</title>
		<link rel="stylesheet" href="${ctx}/static/back/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${ctx}/static/back/css/login.css" />
	</head>

	<body class="beg-login-bg">
		<div class="beg-login-box">
			<header>
				<h1>后台登录</h1>
			</header>
			<div class="beg-login-main">
				<form id="login_form" class="layui-form" method="post">
				<input name="__RequestVerificationToken" type="hidden" value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81" />
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe612;</i>
                    </label>
						<input type="text" id="userName" name="userName" lay-verify="userName" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
					</div>
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe642;</i>
                    </label>
						<input type="password" id="password" name="password" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input">
					</div>
					<div class="layui-form-item">
						<!-- beg-pull-left居左 -->
						<div class="beg-pull-left beg-login-remember">
							<label>记住帐号？</label>
							<input type="checkbox" name="rememberMe" value="true" lay-skin="switch" checked title="记住帐号">
						</div>
						
						<div class="beg-clear"></div>
					</div>
				</form>
				<div style="text-align:center">
					<button ="text-align：center" class="layui-btn layui-btn-primary" lay-submit lay-filter="login" onclick="submitForm()">
	                	<i class="layui-icon">&#xe650;</i> 登录
	               	</button>
				</div>
			</div>
			<footer >
				<p >Logan_w © </p>
			</footer>
		</div>
		<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.1.js"></script>
		<script src="${ctx}/static/common/mylayer.js"></script>
		<script type="text/javascript" src="${ctx}/static/lib/layui/layui.js"></script>
		<script>
			layui.use(['layer', 'form'], function() {
				var layer = layui.layer,
					$ = layui.jquery,
					form = layui.form();
					
				 form.on('submit(login)',function(data){
					location.href='index.html';
					return false;
				});
			}); 
		</script>
		<script type="text/javascript">
			function submitForm(){
				/* 1、验证用户名
        		1.1、用户名不能为空
        		1.2、是否合法：5-10位数字或字母
        		2、密码不能为空
        		3、ajax提交用户名和密码，根据后台返回的ServerResponse决定进行什么操作 */
        		var username = $("#userName").val();
				console.log(username);
        		var password = $("#password").val();
        		// 1.1、用户名不能为空
        		if(username == '' || username == undefined || username == null) {
        			mylayer.errorMsg("用户名不能为空");
        			return;
        		}
        		// 1.2、是否合法：5-10位数字或字母
        		var pattern = /^[0-9a-zA-Z]{5,10}$/;
        		if(!pattern.test(username)) {
        			mylayer.errorMsg("格式非法，请输入5-10位数字或字母");
        			return;
        		}
        		//2、密码不能为空
        		if(password == '' || password == undefined || password == null) {
        			mylayer.errorMsg("密码不能为空");
        			return;
        		}
        		
        		//3、ajax提交用户名和密码，根据后台返回的ServerResponse决定进行什么操作
        		$.ajax({
        			url:"${ctx}/user/login.action",
        			type:"post",
        			dataType:"json",
        			data:$("#login_form").serialize(),
        			success:function(resp) {
        				console.log(resp);
        				if(resp.code == 0){
        					mylayer.successUrl(resp.msg, "${ctx}/index.action");
        				} else {
        					mylayer.errorMsg(resp.msg);
        				}
        			}
        		});
        		
        	}
		</script>
	</body>

</html>