package com.me.mall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Order;
import com.me.mall.mapper.OrderMapper;
import com.me.mall.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService{
	@Autowired
	private OrderMapper orderMapper;

	/**
	 * 添加到order表
	 * @return 
	 */
	@Override
	public ServerResponse add(Order order) {
		Integer count = orderMapper.insert(order);
		if (count == 1) {
			return ServerResponse.createSuccess("添加到数据库成功");
		} else {
			return ServerResponse.createError("添加到数据库失败");
		}
	}

}
