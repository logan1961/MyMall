package com.me.mall.mapper;

import com.me.mall.entity.Order;

public interface OrderMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbggenerated
     */
    int insert(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbggenerated
     */
    int insertSelective(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbggenerated
     */
    Order selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Order record);
}