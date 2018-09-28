package com.me.mall.service;

import com.me.mall.common.ServerResponse;

public interface IUserService {

	ServerResponse login(String username, Integer password);

	ServerResponse pageList(Integer page, Integer limit);

	ServerResponse deleteById(Integer id);

	ServerResponse deleteAll(String ids);

}
