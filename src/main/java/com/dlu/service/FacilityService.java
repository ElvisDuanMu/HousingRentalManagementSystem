package com.dlu.service;

import com.dlu.pojo.Facility;
import com.dlu.pojo.Page;

import java.util.List;

public interface FacilityService {

    void insertFacility(Facility facility);

    int queryCount();

    List<Facility> query(Page page);

    List<Facility> queryAllFacilities();
}
