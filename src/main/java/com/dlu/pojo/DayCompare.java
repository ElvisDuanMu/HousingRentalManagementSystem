package com.dlu.pojo;

/**
 * 时间比较类
 */

public class DayCompare {
    private Integer year;
    private Integer month;
    private Integer day;



    public DayCompare() {
    }
    public DayCompare(Integer year, Integer month, Integer day) {
        this.year = year;
        this.month = month;
        this.day = day;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }
}
