package com.me.mall.controller.front;

import java.util.List;

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
	
	@RequestMapping("/getProductListPage.shtml")
	public String getProductListPage(Integer categoryId,Model model){
		//根据分类id查询该类商品列表
		List<Product> productList = productService.getProductListById(categoryId);
		model.addAttribute("productList",productList);
		return "/product/product_list";
	}
	
	/**
	 * 得到商品详情界面
	 * @param productId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getProductDetailPage.shtml")
	public String getProductDetailPage(Integer productId,Model model){
		//展示商品的详情
		Product product = productService.findById(productId);
		//添加到域对象
		model.addAttribute("product",product);
		return "/product/product_detail";
	}
	
}
