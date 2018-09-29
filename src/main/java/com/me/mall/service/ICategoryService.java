package com.me.mall.service;

import com.me.mall.common.ServerResponse;

public interface ICategoryService {

	ServerResponse selectTopCategory();

	ServerResponse selectSecondCategory(Integer topCategoryId);

}
