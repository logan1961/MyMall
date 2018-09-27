package com.me.mall.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/index")
	public String index(){
		return "/index";
	}
	
	@RequestMapping(value="/getHomePage")
	public String getHomePage(){
		return "/mainPage";
	}
	
	@RequestMapping(value="/getTablePage")
	public String getTablePage(){
		return "/basic_table";
	}
}
