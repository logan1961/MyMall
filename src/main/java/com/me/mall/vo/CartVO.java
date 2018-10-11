package com.me.mall.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * 购物车VO：由很多CartItemVO构成
 * @author LLLLogan
 *
 */
public class CartVO {
	// 购物车里面购物项CartItemVO集合
	private List<CartItemVO> cartItemVOList = new ArrayList<>();

	public List<CartItemVO> getCartItemVOList() {
		return cartItemVOList;
	}

	public void setCartItemVOList(List<CartItemVO> cartItemVOList) {
		this.cartItemVOList = cartItemVOList;
	}
}
