package com.dlu.dto;

public class UserDTO {
    private String userLoginName;
    private String userPassword;

    public String getUserLoginName() {
        return userLoginName;
    }

    public void setUserLoginName(String userLoginName) {
        this.userLoginName = userLoginName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "userLoginName='" + userLoginName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                '}';
    }
}
