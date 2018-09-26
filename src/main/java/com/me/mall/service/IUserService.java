package com.me.mall.service;

import com.me.mall.common.ServerResponse;

public interface IUserService {

	ServerResponse login(String username, Integer password);

}
