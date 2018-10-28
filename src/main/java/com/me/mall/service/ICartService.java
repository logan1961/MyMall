package com.me.mall.service;

import java.util.List;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Cart;

public interface ICartService {

	ServerResponse addToCart(Cart cart);

	List<Cart> findCartByUserId(Integer id);

}
