package com.dlu.pojo;

import java.util.Date;

public class Region {
    private Integer provinceId;
    private String provinceCode;
    private String provinceName;
    private Integer cityId;
    private String cityCode;
    private String cityName;
    private Integer districtId;
    private String districtCode;
    private String districtName;

    //数据分析用
    private Date startCreateDate;
    private String startCreateDateString;
    private Date endCreateDate;
    private String endCreateDateString;
    private Integer leasingId;
    private Integer houseAreaMin;
    private Integer houseAreaMax;

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Integer getDistrictId() {
        return districtId;
    }

    public void setDistrictId(Integer districtId) {
        this.districtId = districtId;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
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

    public Integer getLeasingId() {
        return leasingId;
    }

    public void setLeasingId(Integer leasingId) {
        this.leasingId = leasingId;
    }

    public Integer getHouseAreaMin() {
        return houseAreaMin;
    }

    public void setHouseAreaMin(Integer houseAreaMin) {
        this.houseAreaMin = houseAreaMin;
    }

    public Integer getHouseAreaMax() {
        return houseAreaMax;
    }

    public void setHouseAreaMax(Integer houseAreaMax) {
        this.houseAreaMax = houseAreaMax;
    }
}
