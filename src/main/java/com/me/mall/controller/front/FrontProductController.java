package com.me.mall.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.me.mall.entity.Product;
import com.me.mall.service.IProductService;

@Controller
@RequestMapping(value="/product")
public class FrontProductController {
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value="/getProductDetailPage.shtml")
	public String getProductDetailPage(Integer productId,Model model){
		//展示商品的详情
		Product product = productService.findById(productId);
		//添加到域对象
		model.addAttribute("product",product);
		return "/product/product_detail";
	}
}
