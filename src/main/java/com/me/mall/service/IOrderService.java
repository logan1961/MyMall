package com.me.mall.service;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Order;

public interface IOrderService {

	ServerResponse add(Order order);

}
