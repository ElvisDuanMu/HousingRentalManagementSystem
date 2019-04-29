package com.dlu.pojo;

import java.util.Date;

public class Application {

    private Integer id;
    private Integer houseId;
    private String partAName;
    private String partBName;
    private String status;
    private Date createDate;
    private String createDateString;
    private Date updateDate;
    private String updateDateString;

    @Override
    public String toString() {
        return "Application{" +
                "id=" + id +
                ", houseId=" + houseId +
                ", partAName='" + partAName + '\'' +
                ", partBName='" + partBName + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public Application() {
    }

    public Application(Integer houseId, String partAName, String partBName, String status,Date createDate) {
        this.houseId = houseId;
        this.partAName = partAName;
        this.partBName = partBName;
        this.status = status;
        this.createDate = createDate;
    }

    public Application(Integer id, String status, Date updateDate) {
        this.id = id;
        this.status = status;
        this.updateDate = updateDate;
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

    public String getPartAName() {
        return partAName;
    }

    public void setPartAName(String partAName) {
        this.partAName = partAName;
    }

    public String getPartBName() {
        return partBName;
    }

    public void setPartBName(String partBName) {
        this.partBName = partBName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateDateString() {
        return createDateString;
    }

    public void setCreateDateString(String createDateString) {
        this.createDateString = createDateString;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateDateString() {
        return updateDateString;
    }

    public void setUpdateDateString(String updateDateString) {
        this.updateDateString = updateDateString;
    }
}
