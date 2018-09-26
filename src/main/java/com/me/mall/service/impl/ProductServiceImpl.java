package com.me.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.mall.entity.Product;
import com.me.mall.mapper.ProductMapper;
import com.me.mall.service.IProductService;

@Service
public class ProductServiceImpl implements IProductService{
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<Product> list() {
		return productMapper.list();
	}

}
