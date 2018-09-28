<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
</head>
<body>
	<table id="tableId" lay-filter="test"></table>
	
	<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/mylayer.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
			    elem: '#tableId'
			    ,url: '${ctx}/user/pageList.action' //数据接口
			    ,page: true //开启分页
			    ,cols: [[ //表头
			      {field: 'id', title: '用户表ID', width:80, sort: true, fixed: 'left'}
			      ,{field: 'username', title: '用户名', width:180}
			      ,{field: 'password', title: '用户密码', width:180, sort: true}
			      ,{field: 'email', title: '电子邮件', width:180} 
			      ,{field: 'phone', title: '电话', width: 177}
			      ,{field: 'question', title: '找回密码问题', width: 80, sort: true}
			      ,{field: 'answer', title: '找回密码答案', width: 80}
			      ,{field: 'role', title: '角色', width: 135, sort: true}
			      ,{field: 'createTime', title: '创建时间', width: 135, sort: true}
			      ,{field: 'updateTime', title: '更新时间', width: 135, sort: true}
			    ]]
			  });
		});
	</script>
</body>
</html>