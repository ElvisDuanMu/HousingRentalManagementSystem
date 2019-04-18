package com.dlu.mapper;

import com.dlu.dto.RegionDTO;
import com.dlu.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RegionMapper {
    /**
     * 查询所有的省
     * @return
     */
    List<Province> queryAllProvince();

    List<City> queryCityByProvinceCode(@Param("provinceCode") String provinceCode);

    List<District> queryDistrictByCity(@Param("cityCode") String cityCode);

    int queryCount(RegionDTO regionDTO);

    List<Region> query(@Param("regionDTO") RegionDTO regionDTO, @Param("page") Page page);

    String queryProvinceNameByProvinceCode(@Param("provinceCode")String provinceCode);

    String queryCityNameByCityCode(@Param("cityCode") String cityCode);
}
