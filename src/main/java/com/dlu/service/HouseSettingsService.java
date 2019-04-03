package com.dlu.service;

import com.dlu.pojo.HouseSettings;
import com.dlu.pojo.Page;

import java.util.List;

public interface HouseSettingsService {
    List<HouseSettings> query(HouseSettings houseSettings,Page page);

    /**
     * 返回总记录数
     */
    Integer queryCount(HouseSettings houseSettings);

    /**
     * 查询所有类型名称
     * @return
     */
    List<HouseSettings> queryAllTypeName();




    void addNewSettings(String name, HouseSettings houseSettings);

    void deleteSettingById(Integer settingsId);

    String queryTypeCodeByTypeName(String typeName);

    void updateSetting(HouseSettings houseSettings);
}
