package com.dlu.pojo;

import java.util.Date;

public class HouseInfo {
    private Integer houseId;

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


    private String createName;

    private Date createDate;

    private String createDateString;

    private String updateName;

    private Date updateDate;

    private String updateDateString;

    private String houseInfo;

    private Integer inspectionId;

    private String houseElevator;

    private Integer houseStatusId;

    private String housePark;

    private Integer houseRentTypeId;

    private Date houseCheckTime;

    private String houseCheckTimeString;

    private Integer housePeople;

    private String examName;

    private Date examDate;

    private String examDateString;

    private String contacts;

    private Integer identityId;

    private String telephone;

    private Integer checkStatusId;

    private String pet;

    private String sex;

    private String detailAddress;

    private String examInfo;

    //搜索小区或街道
    private String address;

    //封装朝向
    private Orientation orientation;
    //封装租赁方式
    private Leasing leasing;
    //封装省
    private Province province;
    //封装市
    private City city;
    //封装区
    private District district;
    //封装装修
    private Renovation renovation;
    //封装看房
    private Inspection inspection;
    //封装房子状态
    private HouseStatus houseStatus;
    //封装租金方式
    private RentType rentType;
    //封装身份
    private Identity identity;
    //封装审核方式
    private CheckStatus checkStatus;
    //封装照片
    private HouseImg houseImg;
    //租金包含内容字符串
    private String rentContentString;
    //房间设施字符串
    private String houseFacilityString;
    //面积最大值最小值
    private Integer houseAreaMin;
    private Integer houseAreaMax;
    //租金最大值最小值
    private Integer housePriceMin;
    private Integer housePriceMax;

    public HouseInfo() {
    }

    public HouseInfo(Integer houseId, Integer houseStatusId) {
        this.houseId = houseId;
        this.houseStatusId = houseStatusId;
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

    public Integer getHousePriceMin() {
        return housePriceMin;
    }

    public void setHousePriceMin(Integer housePriceMin) {
        this.housePriceMin = housePriceMin;
    }

    public Integer getHousePriceMax() {
        return housePriceMax;
    }

    public void setHousePriceMax(Integer housePriceMax) {
        this.housePriceMax = housePriceMax;
    }

    public String getRentContentString() {
        return rentContentString;
    }

    public void setRentContentString(String rentContentString) {
        this.rentContentString = rentContentString;
    }


    public String getHouseFacilityString() {
        return houseFacilityString;
    }

    public void setHouseFacilityString(String houseFacilityString) {
        this.houseFacilityString = houseFacilityString;
    }



    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName == null ? null : houseName.trim();
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
        this.addressCommunity = addressCommunity == null ? null : addressCommunity.trim();
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


    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateName() {
        return updateName;
    }

    public void setUpdateName(String updateName) {
        this.updateName = updateName;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getHouseInfo() {
        return houseInfo;
    }

    public void setHouseInfo(String houseInfo) {
        this.houseInfo = houseInfo == null ? null : houseInfo.trim();
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
        this.houseElevator = houseElevator == null ? null : houseElevator.trim();
    }

    public Integer getHouseStatusId() {
        return houseStatusId;
    }

    public void setHouseStatusId(Integer houseStatusId) {
        this.houseStatusId = houseStatusId;
    }

    public String getHousePark() {
        return housePark;
    }

    public void setHousePark(String housePark) {
        this.housePark = housePark == null ? null : housePark.trim();
    }


    public Integer getHousePeople() {
        return housePeople;
    }

    public void setHousePeople(Integer housePeople) {
        this.housePeople = housePeople;
    }

    public Integer getHouseRentTypeId() {
        return houseRentTypeId;
    }

    public void setHouseRentTypeId(Integer houseRentTypeId) {
        this.houseRentTypeId = houseRentTypeId;
    }

    public Date getHouseCheckTime() {
        return houseCheckTime;
    }

    public void setHouseCheckTime(Date houseCheckTime) {
        this.houseCheckTime = houseCheckTime;
    }


    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts == null ? null : contacts.trim();
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
        this.telephone = telephone == null ? null : telephone.trim();
    }


    public Integer getCheckStatusId() {
        return checkStatusId;
    }

    public void setCheckStatusId(Integer checkStatusId) {
        this.checkStatusId = checkStatusId;
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

    public String getHouseCheckTimeString() {
        return houseCheckTimeString;
    }

    public void setHouseCheckTimeString(String houseCheckTimeString) {
        this.houseCheckTimeString = houseCheckTimeString;
    }

    public Orientation getOrientation() {
        return orientation;
    }

    public void setOrientation(Orientation orientation) {
        this.orientation = orientation;
    }

    public Leasing getLeasing() {
        return leasing;
    }

    public void setLeasing(Leasing leasing) {
        this.leasing = leasing;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    public Renovation getRenovation() {
        return renovation;
    }

    public void setRenovation(Renovation renovation) {
        this.renovation = renovation;
    }

    public Inspection getInspection() {
        return inspection;
    }

    public void setInspection(Inspection inspection) {
        this.inspection = inspection;
    }

    public HouseStatus getHouseStatus() {
        return houseStatus;
    }

    public void setHouseStatus(HouseStatus houseStatus) {
        this.houseStatus = houseStatus;
    }

    public RentType getRentType() {
        return rentType;
    }

    public void setRentType(RentType rentType) {
        this.rentType = rentType;
    }

    public Identity getIdentity() {
        return identity;
    }

    public void setIdentity(Identity identity) {
        this.identity = identity;
    }

    public CheckStatus getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(CheckStatus checkStatus) {
        this.checkStatus = checkStatus;
    }

    public String getCreateDateString() {
        return createDateString;
    }

    public void setCreateDateString(String createDateString) {
        this.createDateString = createDateString;
    }

    public String getUpdateDateString() {
        return updateDateString;
    }

    public void setUpdateDateString(String updateDateString) {
        this.updateDateString = updateDateString;
    }

    public HouseImg getHouseImg() {
        return houseImg;
    }

    public void setHouseImg(HouseImg houseImg) {
        this.houseImg = houseImg;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public Date getExamDate() {
        return examDate;
    }

    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }

    public String getExamDateString() {
        return examDateString;
    }

    public void setExamDateString(String examDateString) {
        this.examDateString = examDateString;
    }

    public String getExamInfo() {
        return examInfo;
    }

    public void setExamInfo(String examInfo) {
        this.examInfo = examInfo == null? null : examInfo.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}