var mylayer = {
		
	msg : function(contents) {
		layer.confirm(
			contents,
			function(index) {
				console.log("确定");
				layer.close(index);
			}
		);
	},
	
	alert : function(contents) {
		layer.alert(
			contents
		);
	},
	
	//有图标，自动关闭，没有后续操作
	success : function(contents) {
		layer.msg(
			contents,
			{icon:1, time:3000}
		);
	},
	
	//有图标，自动关闭，跳转
	successUrl : function(contents, url) {
		layer.msg(
			contents,
			{icon:1, time:1000},
			function() {//msg消失之后触发的函数
				location.href = url;
			}
		);
	},
	
	//有图标，自动关闭，没有后续操作
	errorMsg : function(contents) {
		layer.msg(
			contents,
			{icon:2, time:3000}
		);
	},
	
	//有图标，不自动关闭，没有后续操作
	errorAlert : function(contents) {
		layer.alert(
			contents,
			{icon:2}
		);
	},
	
	//没有图标，询问层，确认按钮后有后续操作
	confirm : function(contents, url) {
		layer.confirm(
			contents,
			function(index) {
				console.log("点击了确定");
				location.href = url;
				layer.close(index);
			},
			function(index) {
				console.log("点击了取消");
			}
		);
	}
}
