package com.me.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Category;
import com.me.mall.mapper.CategoryMapper;
import com.me.mall.service.ICategoryService;

@Service
public class CategoryServiceImpl implements ICategoryService{
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public ServerResponse selectTopCategory() {
		List<Category> list = categoryMapper.selectTopCategory();
		return ServerResponse.createSuccess("查询成功", list);
	}

	@Override
	public ServerResponse selectSecondCategory(Integer topCategoryId) {
		List<Category> list = categoryMapper.selectSecondCategory(topCategoryId);
		return ServerResponse.createSuccess("查询成功", list);
	}

	@Override
	public List<Category> selectTopCategoryList() {
		return categoryMapper.selectTopCategory();
	}

	@Override
	public List<Category> selectSecondCategoryList() {
		return categoryMapper.selectSecondCategoryList();
	}
	
}
