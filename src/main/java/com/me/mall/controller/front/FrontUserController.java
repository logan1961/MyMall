package com.me.mall.controller.front;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.common.ServerResponse;
import com.me.mall.constant.MallConstant;
import com.me.mall.entity.Cart;
import com.me.mall.entity.User;
import com.me.mall.service.ICartService;
import com.me.mall.service.IUserService;
import com.me.mall.util.CartUtil;
import com.me.mall.vo.CartItemVO;
import com.me.mall.vo.CartVO;

@Controller
@RequestMapping("/user")
public class FrontUserController {
	@Autowired
	private IUserService UserService;
	@Autowired
	private ICartService cartService;
	
	@RequestMapping("/getLoginPage.shtml")
	public String getLoginPage(){
		return "/user/login";
	}
	
	/**
	 * 将cookie中的数据同步到数据库中的cart表
	 * @param username
	 * @param password
	 * @param session
	 * @return
	 */
	@RequestMapping("/login.shtml")
	@ResponseBody
	public ServerResponse login(String username,Integer password,HttpSession session,HttpServletRequest request,HttpServletResponse resp){
		ServerResponse response = UserService.login(username, password);
		System.out.println("这个respon是哈哈哈哈哈：" + response.getData());
		//用户存在
		if (response.isSuccess()) {
			//将用户设置到域对象中
			session.setAttribute(MallConstant.SESSION_USER,response.getData());
			
			//将cookie中的数据同步到数据库，删除cookie中的数据
			CartVO cartVO = CartUtil.getCartVOFromCookie(request);
			if (cartVO != null) {
				List<CartItemVO> cartItemVOList = cartVO.getCartItemVOList();
				Iterator<CartItemVO> iterator = cartItemVOList.iterator();
				while (iterator.hasNext()) {
					CartItemVO item = iterator.next();
					//将CartItem转换为Cart
					Cart cart = new Cart();
					
					//从Session中获得user信息
					User user = (User) session.getAttribute(MallConstant.SESSION_USER);
					Integer userId = user.getId();
					//将信息设置到Cart中
					cart.setUserId(userId);//用户ID
					cart.setProductId(item.getProduct().getId());//商品ID
					cart.setQuantity(item.getAmount());//商品数量
					cart.setChecked(item.getIsChecked());//选中状态
					cartService.addToCart(cart);
					
					//添加导数据库后，删除cookie
					Cookie cookie = new Cookie(MallConstant.CART_COOKIE, null);
					cookie.setMaxAge(0);
					cookie.setPath("/");
					resp.addCookie(cookie);
				}
			}
			
		}
		return response;
	}
}
