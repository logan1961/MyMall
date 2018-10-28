package com.me.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Cart;
import com.me.mall.mapper.CartMapper;
import com.me.mall.service.ICartService;

@Service
public class CartServiceImpl implements ICartService{
	@Autowired
	private CartMapper cartMapper;
	
	/**
	 * 添加到Cart表
	 */
	@Override
	public ServerResponse addToCart(Cart cart) {
		Integer count = cartMapper.insert(cart);
		if (count != 1) {
			return ServerResponse.createError("添加数据库Cart表失败");
		} else {
			return ServerResponse.createSuccess("添加数据库Cart表成功");
		}
	}
	
	/**
	 * 根据userId找到cart信息
	 */
	@Override
	public List<Cart> findCartByUserId(Integer id) {
		List<Cart> carts = cartMapper.findCartByUserId(id);
		return carts;
	}
	
}
