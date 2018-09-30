package com.me.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Product;
import com.me.mall.service.IProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	@Autowired
	private IProductService productService;
	
	/**
	 * 测试
	 * @return
	 */
	@RequestMapping(value="/list")
	@ResponseBody
	public List<Product> list(){
		return productService.list(); 
	}
	
	@RequestMapping(value="/getProductsPage")
	public String getProductsPage(){
		return "/product/product_list";
	}
	
	@RequestMapping(value="/pageList")
	@ResponseBody
	public ServerResponse pageList(Integer page,Integer limit,Product product){
		ServerResponse serverResponse = productService.pageList(page,limit,product);
		System.out.println("测试" + serverResponse.getData());
		return serverResponse;
	}
	
	@RequestMapping(value="/deleteById")
	@ResponseBody
	public ServerResponse deleteById(Integer id){
		ServerResponse serverResponse = productService.deleteById(id);
		return serverResponse;
	}
	
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public ServerResponse deleteAll(String ids){
		ServerResponse serverResponse = productService.deleteAll(ids);
		return serverResponse;
	}
	
	@RequestMapping(value="/getAddPage")
	public String getAddPage(){
		return "/product/product_add";
	}
	
	@RequestMapping(value="add")
	public ServerResponse add(Product product){
		ServerResponse serverResponse = productService.add(product);
		return serverResponse;
	}
}
