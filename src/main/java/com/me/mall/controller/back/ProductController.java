package com.me.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	/**
	 * 获得商品展示页面
	 * @return
	 */
	@RequestMapping(value="/getProductsPage")
	public String getProductsPage(){
		return "/product/product_list";
	}
	
	/**
	 * 商品分页
	 * @param page
	 * @param limit
	 * @param product
	 * @return
	 */
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
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public ServerResponse deleteAll(String ids){
		ServerResponse serverResponse = productService.deleteAll(ids);
		return serverResponse;
	}
	
	/**
	 * 获得添加页面
	 * @return
	 */
	@RequestMapping(value="/getAddPage")
	public String getAddPage(){
		return "/product/product_add";
	}
	
	/**
	 * 商品信息添加
	 * @param product
	 * @return
	 */
	@RequestMapping(value="/add")
	@ResponseBody
	public ServerResponse add(Product product){
		System.out.println("商品内容是：" + product);
		ServerResponse serverResponse = productService.add(product);
		return serverResponse;
	}
	
	/**
	 * 获得修改界面
	 * @return
	 */
	@RequestMapping(value="/toUpdate")
	public String toUpdate(Integer id,Model model){
		System.out.println("操作的id是" + id);
		Product product = productService.findById(id);
		model.addAttribute("product",product);
		return "/product/product_update";
	}
	
	/**
	 * 修改
	 * @return
	 */
	@RequestMapping(value="/update")
	@ResponseBody
	public ServerResponse update(Product product){
		System.out.println("修改的内容是" + product);
		ServerResponse serverResponse = productService.update(product);
		return serverResponse;
	}
}
