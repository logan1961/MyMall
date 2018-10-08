package com.me.mall.service;

import java.util.List;

import com.me.mall.common.ServerResponse;
import com.me.mall.entity.Product;

public interface IProductService {

	List<Product> list();

	ServerResponse pageList(Integer page,Integer limit, Product product);

	ServerResponse deleteById(Integer id);

	ServerResponse deleteAll(String ids);

	ServerResponse add(Product product);

	Product findById(Integer id);

	ServerResponse update(Product product);

}
