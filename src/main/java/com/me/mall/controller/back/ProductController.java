package com.me.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.entity.Product;
import com.me.mall.service.IProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value="/list")
	@ResponseBody
	public List<Product> list(){
		return productService.list(); 
	}
}
