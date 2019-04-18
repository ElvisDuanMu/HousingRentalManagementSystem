package com.dlu.dto;

import java.util.Arrays;

public class ShowHouseDTO {

    private String provinceCode;

    private String cityCode;

    private String districtCode;

    private String leasing;

    private String housePriceMin;

    private String housePriceMax;

    private String orientation;

    private String typeRooms;

    private String houseAreaMin;

    private String houseAreaMax;

    private String[] teSe;

    //当前页码值
    private Integer page;

    //每页限制
    private Integer limit;

    //tab下标
    private Integer tabIndex;

    //tab值
    private Integer tabValue;



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

    public String getLeasing() {
        return leasing;
    }

    public void setLeasing(String leasing) {
        this.leasing = leasing;
    }


    public String getHousePriceMin() {
        return housePriceMin;
    }

    public void setHousePriceMin(String housePriceMin) {
        this.housePriceMin = housePriceMin;
    }

    public String getHousePriceMax() {
        return housePriceMax;
    }

    public void setHousePriceMax(String housePriceMax) {
        this.housePriceMax = housePriceMax;
    }

    public String getHouseAreaMin() {
        return houseAreaMin;
    }

    public void setHouseAreaMin(String houseAreaMin) {
        this.houseAreaMin = houseAreaMin;
    }

    public String getHouseAreaMax() {
        return houseAreaMax;
    }

    public void setHouseAreaMax(String houseAreaMax) {
        this.houseAreaMax = houseAreaMax;
    }

    public String getOrientation() {
        return orientation;
    }

    public void setOrientation(String orientation) {
        this.orientation = orientation;
    }

    public String getTypeRooms() {
        return typeRooms;
    }

    public void setTypeRooms(String typeRooms) {
        this.typeRooms = typeRooms;
    }


    public String[] getTeSe() {
        return teSe;
    }

    public void setTeSe(String[] teSe) {
        this.teSe = teSe;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getTabIndex() {
        return tabIndex;
    }

    public void setTabIndex(Integer tabIndex) {
        this.tabIndex = tabIndex;
    }

    public Integer getTabValue() {
        return tabValue;
    }

    public void setTabValue(Integer tabValue) {
        this.tabValue = tabValue;
    }

    @Override
    public String toString() {
        return "ShowHouseDTO{" +
                "provinceCode='" + provinceCode + '\'' +
                ", cityCode='" + cityCode + '\'' +
                ", districtCode='" + districtCode + '\'' +
                ", leasing='" + leasing + '\'' +
                ", housePriceMin='" + housePriceMin + '\'' +
                ", housePriceMax='" + housePriceMax + '\'' +
                ", orientation='" + orientation + '\'' +
                ", typeRooms='" + typeRooms + '\'' +
                ", houseAreaMin='" + houseAreaMin + '\'' +
                ", houseAreaMax='" + houseAreaMax + '\'' +
                ", teSe=" + Arrays.toString(teSe) +
                ", page=" + page +
                ", limit=" + limit +
                ", tabIndex=" + tabIndex +
                ", tabValue=" + tabValue +
                '}';
    }
}
