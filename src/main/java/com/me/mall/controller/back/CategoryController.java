package com.me.mall.controller.back;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.common.ServerResponse;
import com.me.mall.service.ICategoryService;

@Controller
@RequestMapping(value="/category")
public class CategoryController {
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value="/selectTopCategory")
	@ResponseBody
	public ServerResponse getCategorysPage(){
		ServerResponse serverResponse = categoryService.selectTopCategory();
		return serverResponse;
	}
	
	@RequestMapping(value="/selectSecondCategory")
	@ResponseBody
	public ServerResponse selectSecondCategory(Integer topCategoryId){
		ServerResponse serverResponse = categoryService.selectSecondCategory(topCategoryId);
		return serverResponse;
	}
}
