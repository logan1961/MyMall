package com.me.mall.service;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.OrderItem;

public interface IOrderItemService {

	ServerResponse add(OrderItem orderItem);

}
