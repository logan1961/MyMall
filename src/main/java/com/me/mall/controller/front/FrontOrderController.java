package com.me.mall.controller.front;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.common.ServerResponse;
import com.me.mall.constant.MallConstant;
import com.me.mall.entity.Order;
import com.me.mall.entity.Product;
import com.me.mall.entity.Shipping;
import com.me.mall.entity.User;
import com.me.mall.service.IOrderService;
import com.me.mall.service.IProductService;
import com.me.mall.service.IShippingService;
import com.me.mall.util.CartUtil;
import com.me.mall.vo.CartItemVO;
import com.me.mall.vo.CartVO;

@Controller
@RequestMapping("/order")
public class FrontOrderController {
	@Autowired
	private IShippingService shippingService;
	@Autowired
	private IProductService productService;
	@Autowired
	private IOrderService orderService;
	
	/**
	 * 获得订单界面
	 * @return
	 */
	@RequestMapping("/getOrderPage.shtml")
	public String getOrderPage(HttpServletRequest request,HttpSession session,Model model){
		// 1、从Session中获得User对象
		User user = (User) session.getAttribute(MallConstant.SESSION_USER);
		// 2、通过user得到用户的收货地址
		List<Shipping> shippings = shippingService.selectByUserId(user.getId());
		model.addAttribute("shippings", shippings);
		// 3、将Cookie里面购物城信息转换为CartVO对象
		CartVO cartVO = CartUtil.getCartVOFromCookie(request);
		List<CartItemVO> cartItemVOList = cartVO.getCartItemVOList();
		Iterator<CartItemVO> iterator = cartItemVOList.iterator();
		while (iterator.hasNext()) {//只是判断有没有下一个
			CartItemVO item = iterator.next();
			// 没有勾选的移除
			if (item.getIsChecked() == MallConstant.CART_UNCHECKED) {
				iterator.remove();
				continue;
			}
			// 将勾选的product更新为详细信息，因为cookie里面的product只有id
			Product product = productService.findById(item.getProduct().getId());
			// 覆盖CartItemVO里面的Product
			item.setProduct(product);
		}
		model.addAttribute("cartVO", cartVO);
		return "/order/order";
	}
	
	/**
	 * 提交生成订单
	 * @return
	 */
	@RequestMapping("/addOrder.shtml")
	@ResponseBody
	public ServerResponse addOrder(Integer shippingId){
		//创建订单对象order
		Order order = new Order();
		return ServerResponse.createSuccess();
	}
}
