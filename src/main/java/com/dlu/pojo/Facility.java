package com.dlu.pojo;

public class Facility {
    private Integer facilityId;

    private String facilityName;

    private String facilityNewName;

    private String facilityImgPath;

    private String facilityImgRelPath;

    public Facility() {
    }

    public Facility(String facilityName, String facilityNewName, String facilityImgPath,String facilityImgRelPath) {
        this.facilityName = facilityName;
        this.facilityNewName = facilityNewName;
        this.facilityImgPath = facilityImgPath;
        this.facilityImgRelPath = facilityImgRelPath;
    }

    public Integer getFacilityId() {
        return facilityId;
    }

    public void setFacilityId(Integer facilityId) {
        this.facilityId = facilityId;
    }

    public String getFacilityName() {
        return facilityName;
    }

    public void setFacilityName(String facilityName) {
        this.facilityName = facilityName;
    }

    public String getFacilityNewName() {
        return facilityNewName;
    }

    public void setFacilityNewName(String facilityNewName) {
        this.facilityNewName = facilityNewName == null ? null : facilityNewName.trim();
    }

    public String getFacilityImgPath() {
        return facilityImgPath;
    }

    public void setFacilityImgPath(String facilityImgPath) {
        this.facilityImgPath = facilityImgPath == null ? null : facilityImgPath.trim();
    }

    public String getFacilityImgRelPath() {
        return facilityImgRelPath;
    }

    public void setFacilityImgRelPath(String facilityImgRelPath) {
        this.facilityImgRelPath = facilityImgRelPath;
    }
}