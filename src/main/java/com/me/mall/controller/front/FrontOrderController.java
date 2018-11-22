package com.me.mall.controller.front;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.me.mall.entity.Cart;
import com.me.mall.entity.Order;
import com.me.mall.entity.OrderItem;
import com.me.mall.entity.Product;
import com.me.mall.entity.Shipping;
import com.me.mall.entity.User;
import com.me.mall.service.ICartService;
import com.me.mall.service.IOrderItemService;
import com.me.mall.service.IOrderService;
import com.me.mall.service.IProductService;
import com.me.mall.service.IShippingService;
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
	@Autowired
	private ICartService cartService;
	@Autowired
	private IOrderItemService orderItemService;
	
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
		// 3、通过user得到数据库中Cart信息
		List<Cart> carts = cartService.findCartByUserId(user.getId());
		List<CartItemVO> cartItemVOList = new ArrayList<>();
		for (Cart cart : carts) {
			//只展示选中状态的商品
			if (cart.getChecked() == MallConstant.CART_CHECKED) {
				//获得商品信息
				Product product = productService.findById(cart.getProductId());
				CartItemVO cartItemVO = new CartItemVO();
				cartItemVO.setProduct(product);
				cartItemVO.setAmount(cart.getQuantity());
				cartItemVO.setIsChecked(cart.getChecked());
				cartItemVOList.add(cartItemVO);
			}
		}
		CartVO cartVO = new CartVO();
		cartVO.setCartItemVOList(cartItemVOList);
		model.addAttribute("cartVO", cartVO);
		return "/order/order";
		
		//cookie方法:用户登陆后仍保存在cookie
		/*CartItemVO cartItemVO = new CartItemVO();
		CartVO cartVO = CartUtil.getCartVOFromCookie(request);
		if (cartVO != null) {
			List<CartItemVO> cartItemVOList = cartVO.getCartItemVOList();
			Iterator<CartItemVO> iterator = cartItemVOList.iterator();
			while (iterator.hasNext()) {//只是判断有没有下一个
				CartItemVO item = iterator.next();
				// 不将没有勾选的商品展示到order界面
				if (item.getIsChecked() == MallConstant.CART_UNCHECKED) {
					iterator.remove();
					continue;
				}
				// 将勾选的product更新为详细信息，因为cookie里面的product只有id
				Product product = productService.findById(item.getProduct().getId());
				// 覆盖CartItemVO里面的Product
				item.setProduct(product);
			}
		}*/
	}
	
	/**
	 * 提交生成订单
	 * @return
	 */
	@RequestMapping("/addOrder.shtml")
	@ResponseBody
	public ServerResponse addOrder(Integer shippingId,HttpSession session,BigDecimal payment,HttpServletRequest request){
		//1、添加到数据库order表
		//从session中拿到user对象
		User user = (User) session.getAttribute(MallConstant.SESSION_USER);
		//创建订单对象order
		Order order = new Order();
		//生成订单编号
		Date date = new Date();
		SimpleDateFormat pattern = new SimpleDateFormat("yyyyMMddHHmmss");
		String orderNo = pattern.format(date);
		Long orderNoLong = Long.parseLong(orderNo);//格式转换
		
		order.setOrderNo(orderNoLong);//设置订单编号
		order.setUserId(user.getId());//设置user ID
		order.setShippingId(shippingId);//设置设置收获地址id
		order.setPayment(payment);//设置付款金额
		order.setPostage(0);//设置运费
		order.setStatus(20);//设置付款状态(已付款)
		
		//添加到数据库order表
		orderService.add(order);

		//2、添加到数据库orderItem表
		List<Cart> carts = cartService.findCartByUserId(user.getId());
		for (Cart cart : carts) {
			if (cart.getChecked() == MallConstant.CART_CHECKED) {
				OrderItem orderItem = new OrderItem();
				Product product = productService.findById(cart.getProductId());
				
				orderItem.setOrderNo(order.getOrderNo());//设置订单编号
				orderItem.setUserId(user.getId());//设置 user ID
				orderItem.setProductId(cart.getProductId());//设置商品ID
				orderItem.setProductName(product.getName());//设置商品名称
				orderItem.setProductImage(product.getMainImage());//设置商品主图
				orderItem.setCurrentUnitPrice(product.getPrice());//设置商品单价
				orderItem.setQuantity(cart.getQuantity());//设置商品订单数量
				//设置商品的总价格
				BigDecimal amount = new BigDecimal(cart.getQuantity().toString());//类型不匹配，需要转换成decimal类型
				BigDecimal totalPrice = product.getPrice().multiply(amount);//相乘
				orderItem.setTotalPrice(totalPrice);
				
				//添加到数据库orderItem表
				orderItemService.add(orderItem);
			}
		}
		return ServerResponse.createSuccess("提交订单成功");
	}
	
	/**
	 * 订单展示界面
	 * @return
	 */
	@RequestMapping("/getUserOrderPage.shtml")
	public String getUserOrderPage(){
		
		return "/order/user_order";
	}
}
