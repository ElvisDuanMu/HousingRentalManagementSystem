package com.dlu.pojo;

import java.util.Date;

public class HouseTransferAssociation {
    private Integer transferId;

    private Integer houseId;

    private String partALoginName;

    private String partBLoginName;

    private String partAName;

    private String partBName;

    private String contractNumber;

    private Date startTime;
    
    private String startTimeString;

    private Date endTime;
    
    private String endTimeString;

    private Date createTime;

    private String createTimeString;

    private Date startCreateDate;

    private String startCreateDateString;

    private Date endCreateDate;

    private String endCreateDateString;

    private String createBy;

    private String status;

    private Region region;

    private Contract contract;

    public HouseTransferAssociation() {

    }

    public HouseTransferAssociation( Integer houseId, String partALoginName, String partBLoginName, String partAName, String partBName, String contractNumber, Date startTime, Date endTime, Date createTime, String createBy ,String status) {
        this.houseId = houseId;
        this.partALoginName = partALoginName;
        this.partBLoginName = partBLoginName;
        this.partAName = partAName;
        this.partBName = partBName;
        this.contractNumber = contractNumber;
        this.startTime = startTime;
        this.endTime = endTime;
        this.createTime = createTime;
        this.createBy = createBy;
        this.status = status;
    }

    public Integer getTransferId() {
        return transferId;
    }

    public void setTransferId(Integer transferId) {
        this.transferId = transferId;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
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

    public String getPartAName() {
        return partAName;
    }

    public void setPartAName(String partAName) {
        this.partAName = partAName == null ? null : partAName.trim();
    }

    public String getPartBName() {
        return partBName;
    }

    public void setPartBName(String partBName) {
        this.partBName = partBName == null ? null : partBName.trim();
    }

    public String getContractNumber() {
        return contractNumber;
    }

    public void setContractNumber(String contractNumber) {
        this.contractNumber = contractNumber == null ? null : contractNumber.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public String getStartTimeString() {
        return startTimeString;
    }

    public void setStartTimeString(String startTimeString) {
        this.startTimeString = startTimeString == null ? null : startTimeString.trim();
    }

    public String getEndTimeString() {
        return endTimeString;
    }

    public void setEndTimeString(String endTimeString) {
        this.endTimeString = endTimeString == null ?null:endTimeString.trim();
    }

    public String getCreateTimeString() {
        return createTimeString;
    }

    public void setCreateTimeString(String createTimeString) {
        this.createTimeString = createTimeString == null ? null:createTimeString.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null:status.trim();
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
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

    public String getStartCreateDateString() {
        return startCreateDateString;
    }

    public void setStartCreateDateString(String startCreateDateString) {
        this.startCreateDateString = startCreateDateString ==null? null:startCreateDateString.trim();
    }

    public String getEndCreateDateString() {
        return endCreateDateString;
    }

    public void setEndCreateDateString(String endCreateDateString) {
        this.endCreateDateString = endCreateDateString  ==null? null:endCreateDateString.trim();
    }
}