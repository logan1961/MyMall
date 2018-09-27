package com.me.mall.controller.back;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.common.ServerResponse;
import com.me.mall.service.IUserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="/getLoginPage")
	public String getLoginPage() {
		return "/user/login";
	}
	
	@RequestMapping(value="/login")
	@ResponseBody
	public ServerResponse login(String username,Integer password,HttpSession session){
		ServerResponse response = userService.login(username,password);
		//用户存在
		if (response.isSuccess()) {
			session.setAttribute("User", response.getData());
		}
		
		return response;
	}
	
	@RequestMapping(value="/getUserPage")
	public String getUserPage(){
		return "/user/user_list";
	}
	
	@RequestMapping(value="/pageList")
	@ResponseBody
	public ServerResponse pageList(Integer page,Integer limit){
		ServerResponse serverResponse = userService.pageList(page,limit);
		return serverResponse;
	}
}
