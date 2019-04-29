package com.dlu.pojo;

public class HouseImg {
    private Integer id;

    private Integer houseId;

    private String imgName;

    private String imgPath;

    private String imgRelPath;

    private String imgType;

    public HouseImg() {
    }

    public HouseImg(Integer houseId, String imgName, String imgPath, String imgRelPath, String imgType) {
        this.houseId = houseId;
        this.imgName = imgName;
        this.imgPath = imgPath;
        this.imgRelPath = imgRelPath;
        this.imgType = imgType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName == null ? null : imgName.trim();
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath == null ? null : imgPath.trim();
    }

    public String getImgRelPath() {
        return imgRelPath;
    }

    public void setImgRelPath(String imgRelPath) {
        this.imgRelPath = imgRelPath == null ? null : imgRelPath.trim();
    }

    public String getImgType() {
        return imgType;
    }

    public void setImgType(String imgType) {
        this.imgType = imgType == null ? null : imgType.trim();
    }
}