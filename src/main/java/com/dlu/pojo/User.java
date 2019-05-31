package com.dlu.pojo;

public class User {
    private Integer userId;

    private String userLoginName;

    private String userPassword;

    private String userNickname;

    private String userStatus;

    private String userImgRelPath;

    private String userCity;

    private String userSex;

    private String userEmail;

    private String userPhone;

    private String userQq;

    private String userWechat;

    public User() {
    }

    public User(String userLoginName, String userPassword, String userNickname, String userStatus, String userImgRelPath, String userEmail) {
        this.userLoginName = userLoginName;
        this.userPassword = userPassword;
        this.userNickname = userNickname;
        this.userStatus = userStatus;
        this.userImgRelPath = userImgRelPath;
        this.userEmail = userEmail;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserLoginName() {
        return userLoginName;
    }

    public void setUserLoginName(String userLoginName) {
        this.userLoginName = userLoginName == null ? null : userLoginName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname == null ? null : userNickname.trim();
    }


    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getUserImgRelPath() {
        return userImgRelPath;
    }

    public void setUserImgRelPath(String userImgRelPath) {
        this.userImgRelPath = userImgRelPath;
    }

    public String getUserCity() {
        return userCity;
    }

    public void setUserCity(String userCity) {
        this.userCity = userCity;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserQq() {
        return userQq;
    }

    public void setUserQq(String userQq) {
        this.userQq = userQq;
    }

    public String getUserWechat() {
        return userWechat;
    }

    public void setUserWechat(String userWechat) {
        this.userWechat = userWechat;
    }
}