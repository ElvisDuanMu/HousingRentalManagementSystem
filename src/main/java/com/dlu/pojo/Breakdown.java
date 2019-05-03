package com.dlu.pojo;

import java.util.Date;

public class Breakdown {
    private Integer id;

    private Integer houseId;

    private String title;

    private String content;

    private String status;

    private Date createDate;

    private String createDateString;

    private Date solveDate;

    private String solveDateString;

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getSolveDate() {
        return solveDate;
    }

    public void setSolveDate(Date solveDate) {
        this.solveDate = solveDate;
    }

    public String getCreateDateString() {
        return createDateString;
    }

    public void setCreateDateString(String createDateString) {
        this.createDateString = createDateString ==null ? null:createDateString.trim();
    }

    public String getSolveDateString() {
        return solveDateString;
    }

    public void setSolveDateString(String solveDateString) {
        this.solveDateString = solveDateString == null ? null :solveDateString.trim();
    }
}