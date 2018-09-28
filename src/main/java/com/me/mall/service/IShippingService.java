package com.me.mall.service;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Shipping;

public interface IShippingService {

	ServerResponse pageList(Integer page,Integer limit, Shipping shipping);

	ServerResponse deleteById(Integer id);

	ServerResponse deleteAll(String ids);

}
