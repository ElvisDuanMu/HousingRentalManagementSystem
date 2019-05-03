package com.dlu.dto;

import java.util.Date;

public class MoneyDTO {

    private String partALoginName;
    private String partBLoginName;
    private Date startCreateDate;
    private Date endCreateDate;

    public MoneyDTO() {
    }

    public MoneyDTO(String partALoginName, Date startCreateDate, Date endCreateDate) {
        this.partALoginName = partALoginName;
        this.startCreateDate = startCreateDate;
        this.endCreateDate = endCreateDate;
    }



    @Override
    public String toString() {
        return "MoneyDTO{" +
                "partALoginName='" + partALoginName + '\'' +
                ", partBLoginName='" + partBLoginName + '\'' +
                ", startCreateDate=" + startCreateDate +
                ", endCreateDate=" + endCreateDate +
                '}';
    }

    public String getPartALoginName() {
        return partALoginName;
    }

    public void setPartALoginName(String partALoginName) {
        this.partALoginName = partALoginName == null ? null : partALoginName.trim();
    }

    public String getPartBLoginName() {
        return partBLoginName;
    }

    public void setPartBLoginName(String partBLoginName) {
        this.partBLoginName = partBLoginName == null ? null : partALoginName.trim();
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
}


