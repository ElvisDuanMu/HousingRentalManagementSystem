package com.dlu.dto;


import java.util.Arrays;

public class HouseInfoDTO {

    private String houseName;

    private Integer orientationId;

    private Integer leasingId;

    private Integer floor;

    private Integer totalFloor;

    private String provinceCode;

    private String cityCode;

    private String districtCode;

    private String addressCommunity;

    private Integer addressBuilding;

    private Integer addressUnit;

    private Integer addressRoom;

    private Integer typeRooms;

    private Integer typeHalls;

    private Integer typeBathrooms;

    private Integer renovationId;

    private Double houseArea;

    private Double housePrice;


    private String houseInfo;

    private Integer inspectionId;

    private String houseElevator;

    private String housePark;

    private Integer houseRentTypeId;

    private String houseCheckTimeString;

    private Integer housePeople;

    private String contacts;

    private Integer identityId;

    private String telephone;

    private String pet;

    private String sex;

    private Integer[] contentId;

    private Integer[] facilityId;

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public Integer getOrientationId() {
        return orientationId;
    }

    public void setOrientationId(Integer orientationId) {
        this.orientationId = orientationId;
    }

    public Integer getLeasingId() {
        return leasingId;
    }

    public void setLeasingId(Integer leasingId) {
        this.leasingId = leasingId;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getTotalFloor() {
        return totalFloor;
    }

    public void setTotalFloor(Integer totalFloor) {
        this.totalFloor = totalFloor;
    }

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

    public String getAddressCommunity() {
        return addressCommunity;
    }

    public void setAddressCommunity(String addressCommunity) {
        this.addressCommunity = addressCommunity;
    }

    public Integer getAddressBuilding() {
        return addressBuilding;
    }

    public void setAddressBuilding(Integer addressBuilding) {
        this.addressBuilding = addressBuilding;
    }

    public Integer getAddressUnit() {
        return addressUnit;
    }

    public void setAddressUnit(Integer addressUnit) {
        this.addressUnit = addressUnit;
    }

    public Integer getAddressRoom() {
        return addressRoom;
    }

    public void setAddressRoom(Integer addressRoom) {
        this.addressRoom = addressRoom;
    }

    public Integer getTypeRooms() {
        return typeRooms;
    }

    public void setTypeRooms(Integer typeRooms) {
        this.typeRooms = typeRooms;
    }

    public Integer getTypeHalls() {
        return typeHalls;
    }

    public void setTypeHalls(Integer typeHalls) {
        this.typeHalls = typeHalls;
    }

    public Integer getTypeBathrooms() {
        return typeBathrooms;
    }

    public void setTypeBathrooms(Integer typeBathrooms) {
        this.typeBathrooms = typeBathrooms;
    }

    public Integer getRenovationId() {
        return renovationId;
    }

    public void setRenovationId(Integer renovationId) {
        this.renovationId = renovationId;
    }

    public Double getHouseArea() {
        return houseArea;
    }

    public void setHouseArea(Double houseArea) {
        this.houseArea = houseArea;
    }

    public Double getHousePrice() {
        return housePrice;
    }

    public void setHousePrice(Double housePrice) {
        this.housePrice = housePrice;
    }

    public String getHouseInfo() {
        return houseInfo;
    }

    public void setHouseInfo(String houseInfo) {
        this.houseInfo = houseInfo;
    }

    public Integer getInspectionId() {
        return inspectionId;
    }

    public void setInspectionId(Integer inspectionId) {
        this.inspectionId = inspectionId;
    }

    public String getHouseElevator() {
        return houseElevator;
    }

    public void setHouseElevator(String houseElevator) {
        this.houseElevator = houseElevator;
    }

    public String getHousePark() {
        return housePark;
    }

    public void setHousePark(String housePark) {
        this.housePark = housePark;
    }

    public Integer getHouseRentTypeId() {
        return houseRentTypeId;
    }

    public void setHouseRentTypeId(Integer houseRentTypeId) {
        this.houseRentTypeId = houseRentTypeId;
    }

    public String getHouseCheckTimeString() {
        return houseCheckTimeString;
    }

    public void setHouseCheckTimeString(String houseCheckTimeString) {
        this.houseCheckTimeString = houseCheckTimeString;
    }

    public Integer getHousePeople() {
        return housePeople;
    }

    public void setHousePeople(Integer housePeople) {
        this.housePeople = housePeople;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public Integer getIdentityId() {
        return identityId;
    }

    public void setIdentityId(Integer identityId) {
        this.identityId = identityId;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPet() {
        return pet;
    }

    public void setPet(String pet) {
        this.pet = pet;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer[] getContentId() {
        return contentId;
    }

    public void setContentId(Integer[] contentId) {
        this.contentId = contentId;
    }

    public Integer[] getFacilityId() {
        return facilityId;
    }

    public void setFacilityId(Integer[] facilityId) {
        this.facilityId = facilityId;
    }

    @Override
    public String toString() {
        return "HouseInfoDTO{" +
                "houseName='" + houseName + '\'' +
                ", orientationId=" + orientationId +
                ", leasingId=" + leasingId +
                ", floor=" + floor +
                ", totalFloor=" + totalFloor +
                ", provinceCode='" + provinceCode + '\'' +
                ", cityCode='" + cityCode + '\'' +
                ", districtCode='" + districtCode + '\'' +
                ", addressCommunity='" + addressCommunity + '\'' +
                ", addressBuilding=" + addressBuilding +
                ", addressUnit=" + addressUnit +
                ", addressRoom=" + addressRoom +
                ", typeRooms=" + typeRooms +
                ", typeHalls=" + typeHalls +
                ", typeBathrooms=" + typeBathrooms +
                ", renovationId=" + renovationId +
                ", houseArea=" + houseArea +
                ", housePrice=" + housePrice +
                ", houseInfo='" + houseInfo + '\'' +
                ", inspectionId=" + inspectionId +
                ", houseElevator='" + houseElevator + '\'' +
                ", housePark='" + housePark + '\'' +
                ", houseRentTypeId=" + houseRentTypeId +
                ", houseCheckTimeString='" + houseCheckTimeString + '\'' +
                ", housePeople=" + housePeople +
                ", contacts='" + contacts + '\'' +
                ", identityId=" + identityId +
                ", telephone='" + telephone + '\'' +
                ", pet='" + pet + '\'' +
                ", sex='" + sex + '\'' +
                ", contentId=" + Arrays.toString(contentId) +
                ", facilityId=" + Arrays.toString(facilityId) +
                '}';
    }
}
