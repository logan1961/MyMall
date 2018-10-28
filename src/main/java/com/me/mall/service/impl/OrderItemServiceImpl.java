package com.me.mall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.OrderItem;
import com.me.mall.mapper.OrderItemMapper;
import com.me.mall.service.IOrderItemService;

@Service
public class OrderItemServiceImpl implements IOrderItemService{
	@Autowired
	private OrderItemMapper orderItemMapper;

	/**
	 * 添加到orderItem表
	 */
	@Override
	public ServerResponse add(OrderItem orderItem) {
		Integer count = orderItemMapper.insert(orderItem);
		if (count == 1) {
			return ServerResponse.createSuccess("添加数据库orderItem成功");
		} else {
			return ServerResponse.createError("添加数据库orderItem失败");
		}
	}

}
