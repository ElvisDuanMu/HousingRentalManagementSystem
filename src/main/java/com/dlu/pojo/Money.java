package com.dlu.pojo;

import java.util.Date;

public class Money {
    private Integer id;

    private Integer houseId;

    private String partALoginName;

    private String partBLoginName;

    private String payDate;

    private Double payMoney;

    private String status;

    private String partAConfirm;

    private String partBConfirm;

    private String prompt;


    private Date partAConfirmDate;

    private String partAConfirmDateString;

    private Date partBConfirmDate;

    private String partBConfirmDateString;

    private String startCreateDate;

    private String endCreateDate;


    public Money() {
    }

    public Money(Integer houseId, String partALoginName, String partBLoginName, String payDate, Double payMoney, String status, String partAConfirm, String partBConfirm) {
        this.houseId = houseId;
        this.partALoginName = partALoginName;
        this.partBLoginName = partBLoginName;
        this.payDate = payDate;
        this.payMoney = payMoney;
        this.status = status;
        this.partAConfirm = partAConfirm;
        this.partBConfirm = partBConfirm;
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
        this.houseId = houseId ;
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
        this.partBLoginName = partBLoginName == null ? null : partBLoginName.trim();
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate == null ? null : payDate.trim();
    }

    public Double getPayMoney() {
        return payMoney;
    }

    public void setPayMoney(Double payMoney) {
        this.payMoney = payMoney;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getPartAConfirm() {
        return partAConfirm;
    }

    public void setPartAConfirm(String partAConfirm) {
        this.partAConfirm = partAConfirm == null ? null : partAConfirm.trim();
    }

    public String getPartBConfirm() {
        return partBConfirm;
    }

    public void setPartBConfirm(String partBConfirm) {
        this.partBConfirm = partBConfirm == null ? null: partBConfirm.trim();
    }

    public String getPrompt() {
        return prompt;
    }

    public void setPrompt(String prompt) {
        this.prompt = prompt == null ? null : prompt.trim();
    }


    public Date getPartAConfirmDate() {
        return partAConfirmDate;
    }

    public void setPartAConfirmDate(Date partAConfirmDate) {
        this.partAConfirmDate = partAConfirmDate;
    }

    public String getPartAConfirmDateString() {
        return partAConfirmDateString;
    }

    public void setPartAConfirmDateString(String partAConfirmDateString) {
        this.partAConfirmDateString = partAConfirmDateString == null ? null: partAConfirmDateString.trim();
    }

    public Date getPartBConfirmDate() {
        return partBConfirmDate;
    }

    public void setPartBConfirmDate(Date partBConfirmDate) {
        this.partBConfirmDate = partBConfirmDate;
    }

    public String getPartBConfirmDateString() {
        return partBConfirmDateString;
    }

    public void setPartBConfirmDateString(String partBConfirmDateString) {
        this.partBConfirmDateString = partBConfirmDateString == null?null:partBConfirmDateString.trim();
    }

    public String getStartCreateDate() {
        return startCreateDate;
    }

    public void setStartCreateDate(String startCreateDate) {
        this.startCreateDate = startCreateDate;
    }

    public String getEndCreateDate() {
        return endCreateDate;
    }

    public void setEndCreateDate(String endCreateDate) {
        this.endCreateDate = endCreateDate;
    }
}