<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<form id="form_add" class="layui-form layui-form-pane" action="">
	  <div class="layui-form-item">
	  	<input type="hidden" name="id" value="${product.id }">
	    <label class="layui-form-label">商品名称</label>
	    <div class="layui-input-block">
	      <input type="text" name="name" autocomplete="off" placeholder="请输入标题" value="${product.name }" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品副标题</label>
	    <div class="layui-input-block">
	      <input type="text" name="subtitle" autocomplete="off" placeholder="请输入商品副标题" value="${product.subtitle }" class="layui-input">
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
	      <input type="text" name="price" lay-verify="required" placeholder="请输入商品价格" value="${product.price }" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品库存</label>
	    <div class="layui-input-inline">
	      <input type="text" name="stock" lay-verify="required" placeholder="请输入商品库存" value="${product.stock }" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item" pane="">
	    <label class="layui-form-label">商品状态</label>
	    <div class="layui-input-block">
	    	<input type="hidden" id="product_status" value="${product.status}" >
	    	<input type="radio" id="on" name="status" value="1" title="上架" >
	    	<input type="radio" id="off" name="status" value="0" title="下架" >
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品主图</label>
	    <!-- 隐藏的标签，目的是提交表单时将图片的信息传到数据库 -->
	    <input type="hidden" name="mainImage" id="mainImage"/>
	    <div class="layui-upload">
		  <button type="button" class="layui-btn" id="uploadImgBtn">上传图片</button>
		  <div class="layui-upload-list">
		    <img style="width:200px;height:200px" class="layui-upload-img" src="/pic/${product.mainImage}" id="mainImg">
		    <p id="demoText"></p>
		  </div>
		</div>   
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">商品描述</label>
	    <div class="layui-input-block">
	      <textarea id="editor_id" name="detail" style="height:500px" placeholder="请输入内容" class="layui-textarea">${product.detail }</textarea>
	    </div>
	  </div>
	</form>
	    <button class="layui-btn" onclick="submitForm()" lay-filter="demo2">修改</button>
	</div>
	
	<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/mylayer.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/static/common/util.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/kindeditor/kindeditor.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/kindeditor/lang/zh_CN.js"></script>
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
							html += "<option value='"+ data[i].id +"'>"+ data[i].name +"</option>";
						}
						$("#secondCategory").html(html);
						form.render('select'); //刷新select选择框渲染
					} else {
						mylayer.errorMsg(resp.msg);
					}
				}
			  });
	      }); 
	       //图片上传
		  var uploadInst = upload.render({
			     elem: '#uploadImgBtn'
			    ,url: '${ctx}/upload/uploadImg.action'
			    ,before: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#mainImg').attr('src', result); //图片链接（base64）
			      });
			    }
			    ,done: function(resp){
			       if(resp.code == util.SUCCESS) {
			    	   //给这个隐藏标签填上value值<input type="hidden" name="mainImage" id="mainImage"/>
			    	   $("#mainImage").val(resp.data);
			       }
			    }
			    ,error: function(){
			      //演示失败状态，并实现重传
			      var demoText = $('#demoText');
			      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			      demoText.find('.demo-reload').on('click', function(){
			        uploadInst.upload();
			      });
			    }
		    });
		  });
		  
		   $(function(){
			  //radio按钮回显当前状态
			  var status = $("#product_status").val();
			  if(status == '1'){
				  $("#on").prop("checked",true);
			  } else {
				  $("#off").prop("checked",true);
			  }
			  
		  //加载一级分类下拉框,topCategoryFilter监听select标签
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
						  //form.render('select'); //刷新select选择框渲染
					  } else {
						  mylayer.errorMsg(resp.msg); 
					  }
				  }
			  });
		  });
		   
		  //ajax方式提交表单
		  function submitForm(){
			  $.ajax({
				  url : "${ctx}/product/update.action",
				  data : $('#form_add').serialize(),
				  type : "POST",
				  dataType : "json",
				  success : function(resp){
					  if(resp.code == util.SUCCESS){
						  mylayer.confirm("修改成功，是否跳转到商品界面?","${ctx}/product/getProductsPage.action");
					  } else {
						  mylayer.errorMsg(resp.msg);
					  }
				  }
			  })
		  }
		  
		  var myKindEditor ;
          KindEditor.ready(function(K) {
              var kingEditorParams = {
                   //指定上传文件参数名称
                   filePostName  : "file",
                   //指定上传文件请求的url。
                   uploadJson : '${ctx}/upload/uploadImgByEditor.action',
                   //上传类型，分别为image、flash、media、file
                   dir : "image",
                   afterBlur: function () { this.sync(); }
             }
            var editor = K.editor(kingEditorParams);
            
           //富文本编辑器
           myKindEditor = KindEditor.create('#form_add[name=detail]', kingEditorParams);
         });
	</script>
</body>
</html>