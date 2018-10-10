package com.me.mall.service;

import java.util.List;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Category;

public interface ICategoryService {

	ServerResponse selectTopCategory();

	ServerResponse selectSecondCategory(Integer topCategoryId);

	List<Category> selectTopCategoryList();

	List<Category> selectSecondCategoryList();

}
