package com.me.mall.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.common.ServerResponse;

@Controller
@RequestMapping("/order")
public class FrontOrderController {
	
	/**
	 * 获得订单界面
	 * @return
	 */
	@RequestMapping("/getOrderPage.shtml")
	public String getOrderPage(){
		return "/order/order";
	}
	
	/**
	 * 提交订单
	 * @return
	 */
	@RequestMapping("/addOrder.shtml")
	@ResponseBody
	public ServerResponse addOrder(Integer shippingId){
		return ServerResponse.createSuccess();
	}
}
