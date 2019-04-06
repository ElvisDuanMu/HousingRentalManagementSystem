package com.dlu.service;

import com.dlu.pojo.*;

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

    /**
     * 查询所有的出租类型
     * @return
     */
    List<RentType> queryAllRentType();

    List<Orientation> queryAllOrientation();

    List<Renovation> queryAllRenovation();

    List<RentContent> queryAllRentContent();

    List<Identity> queryAllIdentity();
}
