package com.dlu.dto;

public class AdministratorLoginDTO{
    private String administratorName;
    private String administratorPassword;

    public String getAdministratorName() {
        return administratorName;
    }

    public void setAdministratorName(String administratorName) {
        this.administratorName = administratorName;
    }

    public String getAdministratorPassword() {
        return administratorPassword;
    }

    public void setAdministratorPassword(String administratorPassword) {
        this.administratorPassword = administratorPassword;
    }

    @Override
    public String toString() {
        return "AdministratorLoginDTO{" +
                "administratorName='" + administratorName + '\'' +
                ", administratorPassword='" + administratorPassword + '\'' +
                '}';
    }
}
