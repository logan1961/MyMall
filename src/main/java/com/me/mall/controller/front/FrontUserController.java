package com.me.mall.controller.front;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.common.ServerResponse;
import com.me.mall.constant.MallConstant;
import com.me.mall.service.IUserService;

@Controller
@RequestMapping("/user")
public class FrontUserController {
	@Autowired
	private IUserService UserService;
	
	@RequestMapping("/getLoginPage.shtml")
	public String getLoginPage(){
		return "/user/login";
	}
	
	@RequestMapping("/login.shtml")
	@ResponseBody
	public ServerResponse login(String username,Integer password,HttpSession session){
		ServerResponse response = UserService.login(username, password);
		//用户存在
		if (response.isSuccess()) {
			session.setAttribute(MallConstant.SESSION_USER,response.getData());
			//将cookie中的数据同步到数据库，删除cookie中的数据
			
		}
		return response;
	}
}