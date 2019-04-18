package com.dlu.service.impl;

import com.dlu.dto.RegionDTO;
import com.dlu.mapper.RegionMapper;
import com.dlu.pojo.*;
import com.dlu.service.RegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("cityService")
public class RegionServiceImpl implements RegionService {

    @Autowired
    private RegionMapper regionMapper;

    @Override
    public List<Province> queryAllProvince() {
        return regionMapper.queryAllProvince();

    }

    @Override
    public List<City> queryCityByProvinceCode(String provinceCode) {
        return regionMapper.queryCityByProvinceCode(provinceCode);
    }

    @Override
    public List<District> queryDistrictByCity(String cityCode) {
        return regionMapper.queryDistrictByCity(cityCode);

    }

    @Override
    public int queryCount(RegionDTO regionDTO) {
        return regionMapper.queryCount(regionDTO);
    }

    @Override
    public List<Region> query(RegionDTO regionDTO, Page page) {
        return regionMapper.query(regionDTO,page);
    }

    @Override
    public String queryProvinceNameByProvinceCode(String provinceCode) {

        return regionMapper.queryProvinceNameByProvinceCode(provinceCode);
    }

    @Override
    public String queryCityNameByCityCode(String cityCode) {
        return regionMapper.queryCityNameByCityCode(cityCode);
    }


}
