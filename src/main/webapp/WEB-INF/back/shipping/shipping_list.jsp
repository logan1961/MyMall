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
	<!-- 表格上方操作按钮 -->
	<div class="demoTable">
		收货人姓名：
		<div class="layui-inline">
			<input type="text" style="width:200px;height:30px" id="searchName">
		</div>
		商品副标题：
		<div class="layui-inline">
			<input type="text" style="width:200px;height:30px" id="searchSubtitle">
		</div>
	  	<button class="layui-btn" data-type="search">搜索</button>
	  	<button class="layui-btn" data-type="deleteAll">批量删除</button>
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
			    ,url: '${ctx}/shipping/pageList.action' //数据接口
			    ,id:'layUITableId'
			    ,page: true //开启分页
			    ,cols: [[ //表头
			      {type: 'checkbox', fixed: 'left'}
			      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
			      ,{field: 'user_id', title: '用户id', width:80}
			      ,{field: 'receiver_name', title: '收货姓名', width:150, sort: true}
			      ,{field: 'receiver_phone', title: '收货固定电话', width:170} 
			      ,{field: 'receiver_mobile', title: '收货移动电话', width: 177}
			      ,{field: 'receiver_province', title: '省份', width: 80, sort: true}
			      ,{field: 'receiver_city', title: '城市', width: 80}
			      ,{field: 'receiver_district', title: '区/县', width: 70, sort: true}
			      ,{field: 'receiver_address', title: '详细地址', width: 135, sort: true}
			      ,{field: 'receiver_zip', title: '邮编', width: 135, sort: true}
			      ,{field: 'create_time', title: '创建时间', width: 135, sort: true}
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
		        layer.msg('当前id：' + data.id);
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
		    		   url : '${ctx}/shipping/deleteById.action',
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
		  
		  //批量删除等操作
	   	 var active = {
				  deleteAll: function(){ //获取选中数据
					  var checkStatus = table.checkStatus('layUITableId')
			       	  var data = checkStatus.data;
			       	  console.log(data);//选中行的数据
			       	  console.log(checkStatus.data.length);//获取选中行的数量
			          console.log(checkStatus.isAll);//表格是否全选
			          var ids = util.getSelectedIds(data);
			          console.log(ids);
			          layer.confirm('确定要删除这些数据吗？', function(index){
			        	  
				    	  $.ajax({
				    	  url:"${ctx}/shipping/deleteAll.action",
				    	  data:{"ids":ids},
				    	  dataType:"json",
				          success:function(resp) {
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
			    }
			    ,search: function(){ //按条件搜索
			    	table.reload('layUITableId',{
			    		where:{
			    			name:$("#searchName").val(),
			    			subtitle:$("#searchSubtitle").val(),
			    		}
			    		,page:{
			    			curr:1//重新从第一页开始
			    		}
			    	});
			    }
			    ,isAll: function(){ //验证是否全选
				      var checkStatus = table.checkStatus('layUITableId');
				      layer.msg(checkStatus.isAll ? '全选': '未全选')
			    }
			  };
			  
		  	  //判断类型，执行对应的方法
			  $('.demoTable .layui-btn').on('click', function(){
				   	var type = $(this).data('type');
				   	active[type] ? active[type].call(this) : '';
			   });
		});  
	</script>
</body>
</html>