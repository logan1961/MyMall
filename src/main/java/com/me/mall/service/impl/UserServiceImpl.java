package com.me.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Product;
import com.me.mall.entity.User;
import com.me.mall.mapper.UserMapper;
import com.me.mall.service.IUserService;

@Service
public class UserServiceImpl implements IUserService{
	@Autowired
	private UserMapper userMapper;

	@Override
	public ServerResponse login(String username, Integer password) {
		//用户名存不存在
		int count = userMapper.checkUserName(username);
		if (count == 0) {
			return ServerResponse.createError("用户名不存在");
		} 			
		User user = userMapper.selectLogin(username,password);
		if (user == null) {
			return ServerResponse.createError("密码错误");
		}
		user.setPassword("");
		return ServerResponse.createSuccess("登陆成功",user);
	}

	@Override
	public ServerResponse pageList(Integer page, Integer limit,User user) {
		PageHelper.startPage(page, limit);
		List<Product> list = userMapper.pageList(user);
		PageInfo pageInfo = new PageInfo(list);
		Integer count = (int) pageInfo.getTotal();
		return ServerResponse.createSuccess("查询成功",count,list);
	}

	@Override
	public ServerResponse deleteById(Integer id) {
		int count = userMapper.deleteByPrimaryKey(id);
		if (count == 1) {
			return ServerResponse.createSuccess("删除成功");
		} else {
			return ServerResponse.createError("删除失败");
		}
	}

	@Override
	public ServerResponse deleteAll(String ids) {
		String[] idArray = ids.split(",");
		try {
			int count = userMapper.deleteAll(idArray);
			if (count == idArray.length) {
				return ServerResponse.createSuccess("删除成功");
			} else {
				return ServerResponse.createError("删除失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("删除失败");
		}
	}

}
