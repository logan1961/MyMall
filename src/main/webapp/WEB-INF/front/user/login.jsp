<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/back/css/bootstrap.min.css"/>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div style="margin:10px auto"  class="col-md-2  frame">
					<div class="container" style="margin:5px 100px"><h3>欢迎登录</h3></div>
					<form action="${pageContext.request.contextPath}/login?method=login" method="post">
						用户名：<input type="text" class="form-control" name="name" id="loginName" onblur="checkLoginName()"/><br/>
						密码：<input type = "text" class="form-control" name="password" id="loginPassword" onblur="checkLoginPassword()"/><br/>
						验证码：<input type="text" class="form-control" name="checkCode"/><br/>
						<img id="codeImg" alt="" src="${pageContext.request.contextPath}/checkImg" onclick="refreshCode()">
						<input style="margin:0px 5px 0px 50px;" type="submit" class="btn btn-success" value="登录" onclick="loginMsg()">
						<input style="margin:0px 5px 0px 0px;" type="reset" class="btn btn-default" value="重置">
						<input type="button" class="btn btn-default" value="注册" onclick="javascrtpt:window.location.href='${ctx}/register.jsp'">
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.1.js"></script>
		<script src="${ctx}/static/back/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/common/mylayer.js"></script>
		<script type="text/javascript" src="${ctx}/static/lib/layui/layui.js"></script>
		<script type="text/javascript">
			layui.use(['layer'],function(){
				var layer = layui.layer;
			});
			
			//点击刷新验证码
			function refreshCode() {
				$("#codeImg").attr("src","${ctx}/checkImg?"+Math.random())
			}
			
			function checkLoginName() {
				var name = document.getElementById("loginName").value;
				var reg = /^\w{2,10}$/
				if (!name.match(reg)) {
					mylayer.errorMsg('用户名不合法：请输入3-10位字母、数字、下划线');
				} else {
					mylayer.success('用户名合法');
				}
			}
			
			function checkLoginPassword() {
				var password = document.getElementById("loginPassword").value;
				var reg = /^\w{2,16}$/;
				if (!password.match(reg)) {
					mylayer.errorMsg('密码不合法：请输入3-16位字母、数字、下划线');
				} else {
					mylayer.success('密码合法');
				}
			}
			
		</script>
	</body>
</html>