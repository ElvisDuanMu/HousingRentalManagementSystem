package com.dlu.mapper;

import com.dlu.pojo.Facility;
import com.dlu.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FacilityMapper {

    void insertFacility(Facility facility);

    int queryCount();

    List<Facility> query(@Param("page") Page page);

    List<Facility> queryAllFacilities();
}