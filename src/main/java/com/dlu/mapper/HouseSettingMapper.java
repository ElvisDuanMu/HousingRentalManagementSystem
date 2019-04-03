package com.dlu.mapper;

import com.dlu.pojo.HouseSettings;
import com.dlu.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseSettingMapper {

    /**
     * 条件查询信息
     * @param houseSettings
     * @param page
     * @return
     */
    List<HouseSettings> query(@Param("houseSettings") HouseSettings houseSettings, @Param("page") Page page);

    /**
     * 条件查询总数
     * @param houseSettings
     * @return
     */
    Integer queryCount(HouseSettings houseSettings);

    /**
     * 查询所有的类型名称
     * @return
     */
    List<HouseSettings> queryAllTypeName();

    /**
     * 通过类型名称查询类型代码
     * @param typeName
     * @return
     */
    String queryTypeCodeByTypeName(@Param("typeName")String typeName);

    void addNewSettings(HouseSettings houseSettings);

    Integer queryCountByTypeName(@Param("typeName")String typeName);

    void deleteSettingById(Integer settingsId);

    Integer updateSetting(HouseSettings houseSettings);
}