package com.dlu.pojo;

import java.util.List;

public class PojoToJson {
    private String code;
    private String msg;
    private String count;
    private List data;

    public PojoToJson(String code, String msg, String count, List data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    @Override
    public String toString() {
        return "PojoToJson{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                ", count='" + count + '\'' +
                ", data=" + data +
                '}';
    }
}
