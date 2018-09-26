package com.me.mall.entity;

import java.util.Date;

public class Shipping {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.user_id
     *
     * @mbggenerated
     */
    private Integer userId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.receiver_name
     *
     * @mbggenerated
     */
    private String receiverName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.receiver_phone
     *
     * @mbggenerated
     */
    private String receiverPhone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.receiver_mobile
     *
     * @mbggenerated
     */
    private String receiverMobile;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.receiver_province
     *
     * @mbggenerated
     */
    private String receiverProvince;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.receiver_city
     *
     * @mbggenerated
     */
    private String receiverCity;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.receiver_district
     *
     * @mbggenerated
     */
    private String receiverDistrict;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.receiver_address
     *
     * @mbggenerated
     */
    private String receiverAddress;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.receiver_zip
     *
     * @mbggenerated
     */
    private String receiverZip;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.create_time
     *
     * @mbggenerated
     */
    private Date createTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shipping.update_time
     *
     * @mbggenerated
     */
    private Date updateTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shipping
     *
     * @mbggenerated
     */
    public Shipping(Integer id, Integer userId, String receiverName, String receiverPhone, String receiverMobile, String receiverProvince, String receiverCity, String receiverDistrict, String receiverAddress, String receiverZip, Date createTime, Date updateTime) {
        this.id = id;
        this.userId = userId;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
        this.receiverMobile = receiverMobile;
        this.receiverProvince = receiverProvince;
        this.receiverCity = receiverCity;
        this.receiverDistrict = receiverDistrict;
        this.receiverAddress = receiverAddress;
        this.receiverZip = receiverZip;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shipping
     *
     * @mbggenerated
     */
    public Shipping() {
        super();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.id
     *
     * @return the value of shipping.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.id
     *
     * @param id the value for shipping.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.user_id
     *
     * @return the value of shipping.user_id
     *
     * @mbggenerated
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.user_id
     *
     * @param userId the value for shipping.user_id
     *
     * @mbggenerated
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.receiver_name
     *
     * @return the value of shipping.receiver_name
     *
     * @mbggenerated
     */
    public String getReceiverName() {
        return receiverName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.receiver_name
     *
     * @param receiverName the value for shipping.receiver_name
     *
     * @mbggenerated
     */
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName == null ? null : receiverName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.receiver_phone
     *
     * @return the value of shipping.receiver_phone
     *
     * @mbggenerated
     */
    public String getReceiverPhone() {
        return receiverPhone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.receiver_phone
     *
     * @param receiverPhone the value for shipping.receiver_phone
     *
     * @mbggenerated
     */
    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone == null ? null : receiverPhone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.receiver_mobile
     *
     * @return the value of shipping.receiver_mobile
     *
     * @mbggenerated
     */
    public String getReceiverMobile() {
        return receiverMobile;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.receiver_mobile
     *
     * @param receiverMobile the value for shipping.receiver_mobile
     *
     * @mbggenerated
     */
    public void setReceiverMobile(String receiverMobile) {
        this.receiverMobile = receiverMobile == null ? null : receiverMobile.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.receiver_province
     *
     * @return the value of shipping.receiver_province
     *
     * @mbggenerated
     */
    public String getReceiverProvince() {
        return receiverProvince;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.receiver_province
     *
     * @param receiverProvince the value for shipping.receiver_province
     *
     * @mbggenerated
     */
    public void setReceiverProvince(String receiverProvince) {
        this.receiverProvince = receiverProvince == null ? null : receiverProvince.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.receiver_city
     *
     * @return the value of shipping.receiver_city
     *
     * @mbggenerated
     */
    public String getReceiverCity() {
        return receiverCity;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.receiver_city
     *
     * @param receiverCity the value for shipping.receiver_city
     *
     * @mbggenerated
     */
    public void setReceiverCity(String receiverCity) {
        this.receiverCity = receiverCity == null ? null : receiverCity.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.receiver_district
     *
     * @return the value of shipping.receiver_district
     *
     * @mbggenerated
     */
    public String getReceiverDistrict() {
        return receiverDistrict;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.receiver_district
     *
     * @param receiverDistrict the value for shipping.receiver_district
     *
     * @mbggenerated
     */
    public void setReceiverDistrict(String receiverDistrict) {
        this.receiverDistrict = receiverDistrict == null ? null : receiverDistrict.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.receiver_address
     *
     * @return the value of shipping.receiver_address
     *
     * @mbggenerated
     */
    public String getReceiverAddress() {
        return receiverAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.receiver_address
     *
     * @param receiverAddress the value for shipping.receiver_address
     *
     * @mbggenerated
     */
    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress == null ? null : receiverAddress.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.receiver_zip
     *
     * @return the value of shipping.receiver_zip
     *
     * @mbggenerated
     */
    public String getReceiverZip() {
        return receiverZip;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.receiver_zip
     *
     * @param receiverZip the value for shipping.receiver_zip
     *
     * @mbggenerated
     */
    public void setReceiverZip(String receiverZip) {
        this.receiverZip = receiverZip == null ? null : receiverZip.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.create_time
     *
     * @return the value of shipping.create_time
     *
     * @mbggenerated
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.create_time
     *
     * @param createTime the value for shipping.create_time
     *
     * @mbggenerated
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column shipping.update_time
     *
     * @return the value of shipping.update_time
     *
     * @mbggenerated
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column shipping.update_time
     *
     * @param updateTime the value for shipping.update_time
     *
     * @mbggenerated
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shipping
     *
     * @mbggenerated
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userId=").append(userId);
        sb.append(", receiverName=").append(receiverName);
        sb.append(", receiverPhone=").append(receiverPhone);
        sb.append(", receiverMobile=").append(receiverMobile);
        sb.append(", receiverProvince=").append(receiverProvince);
        sb.append(", receiverCity=").append(receiverCity);
        sb.append(", receiverDistrict=").append(receiverDistrict);
        sb.append(", receiverAddress=").append(receiverAddress);
        sb.append(", receiverZip=").append(receiverZip);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append("]");
        return sb.toString();
    }
}