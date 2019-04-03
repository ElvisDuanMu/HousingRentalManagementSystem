package com.dlu.service.impl;

import com.dlu.mapper.FacilityMapper;
import com.dlu.pojo.Facility;
import com.dlu.pojo.Page;
import com.dlu.service.FacilityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("facilityService")
public class FacilityServiceImpl implements FacilityService {

    @Autowired
    private FacilityMapper facilityMapper;
    @Override
    public void insertFacility(Facility facility) {
        facilityMapper.insertFacility(facility);
    }

    @Override
    public int queryCount() {
        return facilityMapper.queryCount();
    }

    @Override
    public List<Facility> query(Page page) {
        return facilityMapper.query(page);
    }
}
