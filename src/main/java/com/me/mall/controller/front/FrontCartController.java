package com.me.mall.controller.front;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Product;
import com.me.mall.service.IProductService;
import com.me.mall.vo.CartItemVO;
import com.me.mall.vo.CartVO;

@Controller
@RequestMapping("/cart")
public class FrontCartController {
	// 设置到Cookie中购物车的名字
	private final String CART_COOKIE = "cart_cookie";
	// 购物车选中状态
	private final Integer CART_CHECKED = 1;
	// 购物车未选中状态
	private final Integer CART_UNCHECKED = 0;
	
	@Autowired
	private IProductService productService;

	// "${ctx}/cart/getCartPage.shtml?productId=${product.id}&amount="+$("#amount").val()+"&isChecked=1";
	@RequestMapping("/getCartPage.shtml")
	public String getCartPage(HttpServletRequest request, Model model) {
		// 将Cookie里面购物车转换成CartVO这个对象
		CartVO cartVO = getCartVOFromCookie(request);
		List<CartItemVO> cartItemVOList = cartVO.getCartItemVOList();
		// CartItemVO里面的Product只有id，我们要在购物车页面展示商品的详细信息，
		// 所以要根据这个id查找出产品的详细信息，直接把原来的Product替换
		for (CartItemVO cartItemVO : cartItemVOList) {
			Product product = productService.findById(cartItemVO.getProduct().getId());
			cartItemVO.setProduct(product);
		}
		model.addAttribute("cartVO", cartVO);
		return "/cart/cart";
	}

	@RequestMapping("/addCart.shtml")
	@ResponseBody
	public ServerResponse addCart(Integer productId, Integer amount, Integer isChecked, 
			HttpServletRequest request, HttpServletResponse response) {
		// 1、将Cookie里面的购物车转换为CartVO对象(类似于从数据库里面取出所有)
		CartVO cartVO = getCartVOFromCookie(request);
		if (null == cartVO) {
			cartVO = new CartVO();
		}
		
		// 2、往CartVO里面添加这个购物项
		//（购物车中所有数据转换为CartVO对象）
		boolean result = addCartVO(cartVO, productId, amount, isChecked);
		if (result == false) {
			return ServerResponse.createError("添加购物车失败");
		}
		
		// 3、将CartVO对象设置到Cookie（类似于将所有数据写到数据库中）
		setCartVoToCookie(cartVO, response);
		return ServerResponse.createSuccess("添加购物车成功");
	}

	/**
	 * TODO: 可以加上异常情况的判断，例如：1、商品已经下架 2、库存不够
	 * 这些情况都应该返回添加购物车失败
	 * 
	 * @param cartVO
	 * @param productId
	 * @param amount
	 * @param isChecked
	 */
	private boolean addCartVO(CartVO cartVO, Integer productId, Integer amount, Integer isChecked) {
		boolean isExist = false;
		List<CartItemVO> cartItemVOList = cartVO.getCartItemVOList();
		Product product = productService.findById(productId);
		for (CartItemVO cartItemVO : cartItemVOList) {
			// 1、productId对应的商品已经在CartVO里面的话，只是将数量更新
			if (cartItemVO.getProduct().getId().intValue() == productId.intValue()) {
				isExist = true;
				int newAmount = cartItemVO.getAmount() + amount;
				// 判断商品有没有查过库存
				if (newAmount > product.getStock()) {
					// 超出库存，返回false，添加购物车失败
					return false;
				}
				cartItemVO.setAmount(newAmount);
				// 将是否选中的状态修改为选中状态isChecked=1
				cartItemVO.setIsChecked(CART_CHECKED);
			}
		}
		
		// 2、productId对应的商品不在CartVO里面的话，添加这个CartItemVO到CartVO
		// 在原来CartVO购物车里面没有找到这个商品，直接添加这个商品
		if (isExist == false) {
			CartItemVO cartItemVO = new CartItemVO();
			Product prod = new Product();
			prod.setId(productId);
			cartItemVO.setProduct(prod);
			cartItemVO.setAmount(amount);
			cartItemVO.setIsChecked(CART_CHECKED);
			
			cartItemVOList.add(cartItemVO);
		}
		return true;
	}

	/**
	 * 将Cookie中的购物车信息转换为CartVO对象
	 * 
	 * @param request
	 * @return
	 */
	private CartVO getCartVOFromCookie(HttpServletRequest request) {
		CartVO cartVO = null;
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象中不为null才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		// 将客户端中购物车cookie拿出来
		Cookie[] cookies = request.getCookies();
		if (null != cookies && cookies.length != 0) {
			for (Cookie cookie : cookies) {
				if (CART_COOKIE.equals(cookie.getName())) {
					// 找到了客户端cookie中购物车信息
					// "{\"cartItemVOList\":[{\"product\":{\"id\":278},\"amount\":10,\"isChecked\":1},{\"product\":{\"id\":183},\"amount\":2,\"isChecked\":0}]}"
					String value = cookie.getValue();
					try {
						// 将json字符串转换为Java对象
						cartVO = objectMapper.readValue(value, CartVO.class);
					} catch (JsonParseException e) {
						e.printStackTrace();
					} catch (JsonMappingException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return cartVO;
	}

	/**
	 * 将CartVO对象设置到Cookie中
	 * @param response
	 * @param cartVO
	 */
	private void setCartVoToCookie(CartVO cartVo, HttpServletResponse response) {
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象中不为null才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		// 将cartVo对象以json形式放到cookie
		StringWriter stringWriter = new StringWriter();
		try {
			objectMapper.writeValue(stringWriter, cartVo);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 将购物车json放到cookie
		Cookie cookie = new Cookie(CART_COOKIE, stringWriter.toString());
		// 设置cookie的存储时间
		cookie.setMaxAge(60 * 60 * 24);// 单位秒
		// 设置cookie路径
		cookie.setPath("/");
		// 将cookie发送到浏览器
		response.addCookie(cookie);
	}
	
}
