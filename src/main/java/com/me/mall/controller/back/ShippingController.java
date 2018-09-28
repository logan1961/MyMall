package com.me.mall.controller.back;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Shipping;
import com.me.mall.service.IShippingService;

@Controller
@RequestMapping(value="/shipping")
public class ShippingController {
	@Autowired
	private IShippingService shippingService;
	
	@RequestMapping(value="/getShippingsPage")
	public String getShippingsPage(){
		return "/shipping/shipping_list";
	}
	
	@RequestMapping(value="/pageList")
	@ResponseBody
	public ServerResponse pageList(Integer page,Integer limit,Shipping shipping){
		ServerResponse serverResponse = shippingService.pageList(page,limit,shipping);
		System.out.println("测试" + serverResponse.getData());
		return serverResponse;
	}
	
	@RequestMapping(value="/deleteById")
	@ResponseBody
	public ServerResponse deleteById(Integer id){
		ServerResponse serverResponse = shippingService.deleteById(id);
		return serverResponse;
	}
	
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public ServerResponse deleteAll(String ids){
		ServerResponse serverResponse = shippingService.deleteAll(ids);
		return serverResponse;
	}
}
