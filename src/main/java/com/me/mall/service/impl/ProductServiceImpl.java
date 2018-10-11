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
	
	/**
	 * 分页
	 */
	@Override
	public ServerResponse pageList(Integer page, Integer limit,Product product) {
		//1.使用PageHelper插件设置分页
		//PageHelper文档参考github
		PageHelper.startPage(page,limit);
		//2.执行查询
		List<Product> list = productMapper.pageList(product);
		//使用PageInfo对结果进行包装
		PageInfo pageInfo = new PageInfo(list);
		//得到总数
		Integer count = (int)pageInfo.getTotal();
		System.out.println("数量" + count);
		return ServerResponse.createSuccess("查询成功",count,list);
	}

	@Override
	public ServerResponse deleteById(Integer id) {
		//删除正确只有一种情况，失败多种情况
		//如果存在表中存在外键关联，需要添加try-catch
		int count = productMapper.deleteByPrimaryKey(id);
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
			int count = productMapper.deleteAll(idArray);
			if (count == idArray.length) {
				return ServerResponse.createSuccess("删除成功");
			} else {
				return ServerResponse.createError("删除失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("删除失败");
		}
	}

	@Override
	public ServerResponse add(Product product) {
		int count = productMapper.insert(product);
		try {
			if (count == 1) {
				return ServerResponse.createSuccess("添加成功");
			} else {
				return ServerResponse.createError("添加失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("添加失败");
		}
	}

	@Override
	public Product findById(Integer id) {
		return productMapper.selectByPrimaryKey(id);
		
	}

	@Override
	public ServerResponse update(Product product) {
		int count = productMapper.updateByPrimaryKeySelective(product);
		try {
			if (count == 1) {
				return ServerResponse.createSuccess("修改成功");
			} else {
				return ServerResponse.createError("修改失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("修改失败");
		}
	}

}
