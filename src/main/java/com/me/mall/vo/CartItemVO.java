package com.me.mall.vo;

import com.me.mall.entity.Product;

/**
 * 购物项
 * @author LLLLogan
 *
 */
public class CartItemVO {
	// 购物车中的商品
	private Product product;
	//购物车中商品的数量
	private Integer amount;
	//商品是否选择：1为选中；0为未选中
	private Integer isChecked;
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public Integer getAmount() {
		return amount;
	}
	
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
	public Integer getIsChecked() {
		return isChecked;
	}
	
	public void setIsChecked(Integer isChecked) {
		this.isChecked = isChecked;
	}

	@Override
	public String toString() {
		return "CartItemVO [product=" + product + ", amount=" + amount + ", isChecked=" + isChecked + "]";
	}
	
}
