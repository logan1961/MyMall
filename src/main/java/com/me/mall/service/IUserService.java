package com.me.mall.service;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.User;

public interface IUserService {

	ServerResponse login(String username, Integer password);

	ServerResponse pageList(Integer page, Integer limit, User user);

	ServerResponse deleteById(Integer id);

	ServerResponse deleteAll(String ids);

}
