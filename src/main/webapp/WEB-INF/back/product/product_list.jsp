<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表</title>
<link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
</head>
<body>
	<div class="layui-btn-group demoTable">
	  <button class="layui-btn" data-type="getCheckData">批量删除</button>
	  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
	  <button class="layui-btn" data-type="isAll">验证是否全选</button>
	</div>
	<table id="tableId" lay-filter="tableFilter"></table>
	
	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>

	<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/mylayer.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/util.js"></script>
	<script type="text/javascript">
		layui.use('table', function() {
			var table = layui.table;
			table.render({
			    elem: '#tableId'
			    ,url: '${ctx}/product/pageList.action' //数据接口
			    ,id:'layUITableId'
			    ,page: true //开启分页
			    ,cols: [[ //表头
			      {type: 'checkbox', fixed: 'left'}
			      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
			      ,{field: 'categoryId', title: '分类id', width:80}
			      ,{field: 'name', title: '商品名称', width:250, sort: true}
			      ,{field: 'subtitle', title: '商品副标题', width:170} 
			      ,{field: 'mainImage', title: '产品主图', width: 177}
			      ,{field: 'price', title: '价格', width: 80, sort: true}
			      ,{field: 'stock', title: '库存数量', width: 80}
			      ,{field: 'status', title: '商品状态', width: 70, sort: true}
			      ,{field: 'createTime', title: '创建时间', width: 135, sort: true}
			      ,{field: 'updateTime', title: '更新时间', width: 135, sort: true}
			      ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
			    ]]
			  });		
		  //监听头工具栏事件
		  //tool是工具条事件名
		   table.on('tool(tableFilter)', function(obj){
		    var data = obj.data; //获取选中的数据,json格式
		    var layEvent = obj.event;//获得lay-event的值
		    console.log(layEvent);
		     switch(layEvent){
		      case 'detail':
		        layer.msg('查看' + data.id);
		      break;
		      case 'edit':
		        if(data.length === 0){
		          layer.msg('请选择一行');
		        } else if(data.length > 1){
		          layer.msg('只能同时编辑一个');
		        } else {
		          layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
		        }
		      break;
		      case 'del':
		       layer.confirm('确定要删除吗？',function(index){
		    	   $.ajax({
		    		   url : '${ctx}/product/deleteById.action',
		    		   data : {"id" : data.id},
		    		   dataType : 'json',
		    		   success:function(resp){
		    			   if(resp.code == util.SUCCESS){
		    				   mylayer.success(resp.msg);
		    				   table.reload("layUITableId");
		    			   } else {
		    				   mylayer.errorMsg(resp.msg);
		    			   }
		    			   layer.close(index);
		    		   }
		    		   
		    	   });
		       });
		      break;
		    }; 
		  }); 
		  //
		  
		});  
	</script>
</body>
</html>