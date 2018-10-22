package com.me.mall.controller.front;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.mall.common.ServerResponse;
import com.me.mall.constant.MallConstant;
import com.me.mall.entity.Product;
import com.me.mall.service.IProductService;
import com.me.mall.util.CartUtil;
import com.me.mall.vo.CartItemVO;
import com.me.mall.vo.CartVO;

@Controller
@RequestMapping("/cart")
public class FrontCartController {
	
	@Autowired
	private IProductService productService;
	
	/**
	 * 得到购物车界面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getCartPage.shtml")
	public String getCartPage(HttpServletRequest request, Model model) {
		// 将Cookie里面购物车转换成CartVO这个对象
		CartVO cartVO = CartUtil.getCartVOFromCookie(request);
		if (null != cartVO) {//购物车存在
			List<CartItemVO> cartItemVOList = cartVO.getCartItemVOList();
			// CartItemVO里面的Product只有id，我们要在购物车页面展示商品的详细信息，
			// 所以要根据这个id查找出产品的详细信息，直接把原来的Product替换
			for (CartItemVO cartItemVO : cartItemVOList) {
				Product product = productService.findById(cartItemVO.getProduct().getId());
				cartItemVO.setProduct(product);
			}
			model.addAttribute("cartVO", cartVO);
		}
		return "/cart/cart";
	}
	
	/**
	 * 添加或修改购物车
	 * @param productId
	 * @param amount
	 * @param isChecked
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addOrUpdateCart.shtml")
	@ResponseBody
	public ServerResponse addOrUpdateCart(Integer productId, Integer amount, Integer isChecked, 
			HttpServletRequest request, HttpServletResponse response) {
		// 1、将Cookie里面的购物车转换为CartVO对象(类似于从数据库里面取出所有)
		CartVO cartVO = CartUtil.getCartVOFromCookie(request);
		if (null == cartVO) {
			cartVO = new CartVO();
		}
		
		// 2、往CartVO里面添加这个购物项
		//（购物车中所有数据转换为CartVO对象）
		boolean isExist = false;
		List<CartItemVO> cartItemVOList = cartVO.getCartItemVOList();
		Product product = productService.findById(productId);
		for (CartItemVO cartItemVO : cartItemVOList) {
			// 2.1、productId对应的商品已经在CartVO里面的话，只是将数量更新
			if (cartItemVO.getProduct().getId().intValue() == productId.intValue()) {
				isExist = true;
				//当amount没有发生变化时也可以执行
				if (null != amount) {
					int newAmount = cartItemVO.getAmount() + amount;
					// 判断商品有没有查过库存
					if (newAmount < 0) {
						//数量不合法
						return ServerResponse.createError("商品数量不合法");
					}
					if (newAmount > product.getStock() ) {
						// 超出库存，返回false，添加购物车失败
						return ServerResponse.createError("超出库存");
					}
					cartItemVO.setAmount(newAmount);
				}
				if (null != isChecked) {
					// 将是否选中的状态修改为选中状态isChecked=1
					cartItemVO.setIsChecked(isChecked);
				}
				CartUtil.setCartVOToCookie(cartVO, response);
				return ServerResponse.createSuccess("更新成功");
			}
		}
		
		// 2.2、productId对应的商品不在CartVO里面的话，添加这个CartItemVO到CartVO
		// 在原来CartVO购物车里面没有找到这个商品，直接添加这个商品
		if (isExist == false) {
			CartItemVO cartItemVO = new CartItemVO();
			Product prod = new Product();
			prod.setId(productId);
			cartItemVO.setProduct(prod);
			cartItemVO.setAmount(amount);
			cartItemVO.setIsChecked(MallConstant.CART_CHECKED);
			
			cartItemVOList.add(cartItemVO);
		}
				
		// 3、将CartVO对象设置到Cookie（类似于将所有数据写到数据库中）
		CartUtil.setCartVOToCookie(cartVO, response);
		return ServerResponse.createSuccess("添加购物车成功");
	}
	
	/**
	 * 根据id删除购物车中的cartItemVO
	 * @param productId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteCartItemById.shtml")
	@ResponseBody
	public ServerResponse deleteCartItemById(Integer productId
			,HttpServletRequest request
			,HttpServletResponse response){
		//将cookie中地购物车转换为CartVO对象
		CartVO cartVO = CartUtil.getCartVOFromCookie(request);
		if (null == cartVO) {
			return ServerResponse.createError("获取购物车失败");
		}
		
		List<CartItemVO> cartItemVOList = cartVO.getCartItemVOList();
		//在遍历的时候不能用普通方法删除，应使用迭代器删除
		Iterator<CartItemVO> iterator = cartItemVOList.iterator();
		while (iterator.hasNext()) {
			CartItemVO cartItemVO = iterator.next();
			if (cartItemVO.getProduct().getId().intValue() 
					== productId.intValue() ) {
				iterator.remove();
			}
		}
		
		//将cartVO对象写到cookie中
		CartUtil.setCartVOToCookie(cartVO, response);
		return ServerResponse.createSuccess("删除购物车成功");
	}
	
	/**
	 * 将商品添加到购物车的CartVO中
	 * TODO: 可以加上异常情况的判断，例如：1、商品已经下架 2、库存不够
	 * 这些情况都应该返回添加购物车失败
	 * 
	 * @param cartVO
	 * @param productId
	 * @param amount
	 * @param isChecked
	 */
	private boolean addOrUpdateCartVO(CartVO cartVO, Integer productId, Integer amount, Integer isChecked) {
		boolean isExist = false;
		List<CartItemVO> cartItemVOList = cartVO.getCartItemVOList();
		Product product = productService.findById(productId);
		for (CartItemVO cartItemVO : cartItemVOList) {
			// 1、productId对应的商品已经在CartVO里面的话，只是将数量更新
			if (cartItemVO.getProduct().getId().intValue() == productId.intValue()) {
				isExist = true;
				//当amount没有发生变化时也可以执行
				if (null != amount) {
					int newAmount = cartItemVO.getAmount() + amount;
					// 判断商品有没有查过库存
					if (newAmount > product.getStock() || newAmount < 0) {
						// 超出库存，返回false，添加购物车失败
						return false;
					}
					cartItemVO.setAmount(newAmount);
				}
				if (null != isChecked) {
					// 将是否选中的状态修改为选中状态isChecked=1
					cartItemVO.setIsChecked(isChecked);
				}
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
			cartItemVO.setIsChecked(MallConstant.CART_CHECKED);
			
			cartItemVOList.add(cartItemVO);
		}
		return true;
	}

}
