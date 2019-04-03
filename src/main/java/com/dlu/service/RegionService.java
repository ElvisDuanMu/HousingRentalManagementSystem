package com.dlu.service;


import com.dlu.dto.RegionDTO;
import com.dlu.pojo.*;

import java.util.List;

public interface RegionService {
    List<Province> queryAllProvince();

    List<City> queryCityByProvinceCode(String provinceCode);

    List<District> queryDistrictByCity(String cityCode);

    int queryCount(RegionDTO regionDTO);

    List<Region> query(RegionDTO regionDTO, Page page);
}
