package com.dlu.pojo;

import java.io.Serializable;

/**
 * 分页处理
 */
public class Page implements Serializable {
    /**
     * 当前页
     */
    private Integer page;
    /**
     * 页大小
     */
    private Integer limit;
    /**
     * 总记录数
     */
    private Integer totalRecord;
    /**
     * 总页数
     */
    private Integer totalPage;
    /**
     * 开始页码数
     */
    private Integer start;


    public Page(Integer page, Integer limit, Integer totalRecord, Integer totalPage, Integer start) {
        this.page = page;
        this.limit = limit;
        this.totalRecord = totalRecord;
        this.totalPage = totalPage;
        this.start = start;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(Integer totalRecord) {
        this.totalRecord = totalRecord;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    @Override
    public String toString() {
        return "Page{" +
                "page=" + page +
                ", limit=" + limit +
                ", totalRecord=" + totalRecord +
                ", totalPage=" + totalPage +
                ", start=" + start +
                '}';
    }
}
