package com.me.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.me.mall.entity.Category;
import com.me.mall.service.ICategoryService;

@Controller
public class FrontIndexController {
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping("/index.shtml")
	public String index(Model model){
		//查询出商品分类
		List<Category> topCategoryList = categoryService.selectTopCategoryList();
		//添加到域对象
		model.addAttribute("topCategoryList",topCategoryList);
		//查询出商品二级分类
		List<Category> secondCategoryList = categoryService.selectSecondCategoryList();
		//添加到域对象
		model.addAttribute("secondCategoryList",secondCategoryList);
		return "/index";
	}

}
