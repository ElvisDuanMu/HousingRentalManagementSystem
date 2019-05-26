package com.dlu.dto;


import java.util.Date;

public class QueryMoneyDTO {

    private String provinceCode;
    private String cityCode;
    private String districtCode;
    private String checkBy;
    private Date startCreateDate;
    private String startCreateDateString;
    private Date endCreateDate;
    private String endCreateDateString;

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getCheckBy() {
        return checkBy;
    }

    public void setCheckBy(String checkBy) {
        this.checkBy = checkBy;
    }

    public Date getStartCreateDate() {
        return startCreateDate;
    }

    public void setStartCreateDate(Date startCreateDate) {
        this.startCreateDate = startCreateDate;
    }

    public Date getEndCreateDate() {
        return endCreateDate;
    }

    public void setEndCreateDate(Date endCreateDate) {
        this.endCreateDate = endCreateDate;
    }

    public String getStartCreateDateString() {
        return startCreateDateString;
    }

    public void setStartCreateDateString(String startCreateDateString) {
        this.startCreateDateString = startCreateDateString;
    }

    public String getEndCreateDateString() {
        return endCreateDateString;
    }

    public void setEndCreateDateString(String endCreateDateString) {
        this.endCreateDateString = endCreateDateString;
    }
}
