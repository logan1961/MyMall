<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
<link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
<style type="text/css">
	.mainForm{
		margin : 20px 100px 20px 20px;
	}
</style>
</head>
<body>
	<div class="mainForm">
	<form class="layui-form layui-form-pane" action="">
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品名称</label>
	    <div class="layui-input-block">
	      <input type="text" name="name" autocomplete="off" placeholder="请输入标题" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品副标题</label>
	    <div class="layui-input-block">
	      <input type="text" name="subtitle" autocomplete="off" placeholder="请输入商品副标题" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品分类</label>
	    <div class="layui-input-inline">
	      <select id="topCategory" lay-filter="topCategoryFilter">
	      </select>
	    </div>
	    <div class="layui-input-inline">
	      <select name="categoryId" id="secondCategory">
	        <option>请选择二级分类</option>
	      </select>
	    </div>
	  </div>
	   <div class="layui-form-item">
	    <label class="layui-form-label">价格</label>
	    <div class="layui-input-inline">
	      <input type="text" name="price" lay-verify="required" placeholder="请输入商品价格" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品库存</label>
	    <div class="layui-input-inline">
	      <input type="text" name="stock" lay-verify="required" placeholder="请输入商品库存" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item" pane="">
	    <label class="layui-form-label">商品状态</label>
	    <div class="layui-input-block">
	      <input type="radio" name="status" value="1" title="上架" checked="">
	      <input type="radio" name="status" value="0" title="下架">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品主图</label>
	    <input type="hidden" name="mainImage" id="mainImage"/>
	    <div class="layui-input-inline">
	      <div class="layui-upload-drag" id="mainImg">
		  	  <i class="layui-icon"></i>
		  	  <p>点击上传，或将文件拖拽到此处</p>
		  </div>
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">商品描述</label>
	    <div class="layui-input-block">
	      <textarea name="detail" placeholder="请输入内容" class="layui-textarea"></textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <button class="layui-btn" onclick="submitForm()" lay-filter="demo2">添加</button>
	  </div>
	</form>
	</div>
	
	<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/mylayer.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/util.js"></script>
	<script type="text/javascript">
		  layui.use(['upload','form'], function() {
			var form = layui.form;
			var upload = layui.upload; 
		  //分类下拉框
		  //监听select选择
		  //下拉框选中时触发，回调函数返回一个object参数，携带两个成员
	       form.on('select(topCategoryFilter)',function(data){
			  console.log(data.elem);//得到select原始DOM对象
			  console.log(data.value);//得到被选中的值
			  console.log(data.othis);//得到美化后的DOM对象 
			   $.ajax({
				url : "${ctx}/category/selectSecondCategory.action",
				type : "post",
				data : {"topCategoryId" : data.value},
				dataType : "json",
				success : function(resp){
					console.log(resp);
					if(resp.code == util.SUCCESS){
						var html ="<option value=''>请选择二级分类</option>" ;
						var data = resp.data;
						for(var i= 0; i < data.length; i++){
							html += "<option value='"+ resp.data[i].id +"'>"+resp.data[i].name+"</option>";
						}
						$("#secondCategory").html(html);
						form.render('select'); //刷新select选择框渲染
					} else {
						mylayer.errorMsg(resp.msg);
					}
				}
			  });
	      }); 
		  upload.render({
	    	elem: '#mainImg'
	    	,url: '/upload/'
	    	,done: function(res){
	      		console.log(res)
	    	}
		  });
		    });
		  //加载一级分类下拉框,topCategoryFilter监听select标签
		   $(function(){
			  $.ajax({
				  url : "${ctx}/category/selectTopCategory.action",
				  type : "post",
				  dataType : "json",
				  success : function(resp){
					  console.log(resp);
					  if(resp.code == util.SUCCESS){
						  var html = "<option value=''>请选择一级分类</option>";
						  var data = resp.data;
						  console.log(data);
						  for(var i= 0; i < data.length; i++){
							  html += "<option value='"+ data[i].id +"'>"+data[i].name+"</option>";
						  }
						  $("#topCategory").html(html);
					  } else {
						  mylayer.errorMsg(resp.msg); 
					  }
				  }
			  });
		  });
		
	</script>
</body>
</html>