package com.dlu.dto;

import java.util.Date;

public class HouseTransferDTO {

    private String province;
    private String city;
    private String district;
    private Integer houseId;
    private String addressCommunity;
    private String userLoginName;
    private String status;
    private Date startCreateDate;
    private String startCreateDateString;
    private Date endCreateDate;
    private String endCreateDateString;
    private String checkBy;

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public String getAddressCommunity() {
        return addressCommunity;
    }

    public void setAddressCommunity(String addressCommunity) {
        this.addressCommunity = addressCommunity;
    }

    public String getUserLoginName() {
        return userLoginName;
    }

    public void setUserLoginName(String userLoginName) {
        this.userLoginName = userLoginName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getStartCreateDate() {
        return startCreateDate;
    }

    public void setStartCreateDate(Date startCreateDate) {
        this.startCreateDate = startCreateDate;
    }

    public String getStartCreateDateString() {
        return startCreateDateString;
    }

    public void setStartCreateDateString(String startCreateDateString) {
        this.startCreateDateString = startCreateDateString;
    }

    public Date getEndCreateDate() {
        return endCreateDate;
    }

    public void setEndCreateDate(Date endCreateDate) {
        this.endCreateDate = endCreateDate;
    }

    public String getEndCreateDateString() {
        return endCreateDateString;
    }

    public void setEndCreateDateString(String endCreateDateString) {
        this.endCreateDateString = endCreateDateString;
    }

    public String getCheckBy() {
        return checkBy;
    }

    public void setCheckBy(String checkBy) {
        this.checkBy = checkBy;
    }
}
