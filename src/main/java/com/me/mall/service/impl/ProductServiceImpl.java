package com.me.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.me.mall.common.ServerResponse;
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

	@Override
	public ServerResponse pageList(Integer page, Integer limit) {
		//1.使用PageHelper插件设置分页
		//PageHelper文档参考github
		PageHelper.startPage(page,limit);
		//2.执行查询
		List<Product> list = productMapper.list();
		//使用PageInfo对结果进行包装
		PageInfo pageInfo = new PageInfo(list);
		//得到总数
		Integer count = (int)pageInfo.getTotal();
		return ServerResponse.createSuccess("查询成功",count,list);
	}

}
