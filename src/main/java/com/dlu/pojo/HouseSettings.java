package com.dlu.pojo;



import java.util.Date;

public class HouseSettings {
    private Integer settingsId;

    private String typeCode;

    private String typeName;

    private Integer valueId;

    private String valueName;

    private String createBy;

    private Administrator createAdministrator;

    private Date createDate;

    private String createDateString;

    private Date startCreateDate;

    private Date endCreateDate;

    private String updateBy;

    private Administrator updateAdministrator;

    private Date updateDate;

    private String updateDateString;

    public Integer getSettingsId() {
        return settingsId;
    }

    public void setSettingsId(Integer settingsId) {
        this.settingsId = settingsId;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode == null ? null : typeCode.trim();
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public Integer getValueId() {
        return valueId;
    }

    public void setValueId(Integer valueId) {
        this.valueId = valueId;
    }

    public String getValueName() {
        return valueName;
    }

    public void setValueName(String valueName) {
        this.valueName = valueName == null ? null : valueName.trim();
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }


    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Administrator getCreateAdministrator() {
        return createAdministrator;
    }

    public void setCreateAdministrator(Administrator createAdministrator) {
        this.createAdministrator = createAdministrator;
    }

    public Administrator getUpdateAdministrator() {
        return updateAdministrator;
    }

    public void setUpdateAdministrator(Administrator updateAdministrator) {
        this.updateAdministrator = updateAdministrator;
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


    @Override
    public String toString() {
        return "HouseSettings{" +
                "settingsId=" + settingsId +
                ", typeCode='" + typeCode + '\'' +
                ", typeName='" + typeName + '\'' +
                ", valueId=" + valueId +
                ", valueName='" + valueName + '\'' +
                ", createBy='" + createBy + '\'' +
                ", createAdministrator=" + createAdministrator +
                ", createDate=" + createDate +
                ", createDateString='" + createDateString + '\'' +
                ", startCreateDate=" + startCreateDate +
                ", endCreateDate=" + endCreateDate +
                ", updateBy='" + updateBy + '\'' +
                ", updateAdministrator=" + updateAdministrator +
                ", updateDate=" + updateDate +
                ", updateDateString='" + updateDateString + '\'' +
                '}';
    }
}