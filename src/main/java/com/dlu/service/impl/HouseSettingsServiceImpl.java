package com.dlu.service.impl;

import com.dlu.mapper.HouseSettingMapper;
import com.dlu.pojo.HouseSettings;
import com.dlu.pojo.Page;
import com.dlu.service.HouseSettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("houseSettingsService")
public class HouseSettingsServiceImpl implements HouseSettingsService {


    @Autowired
    private HouseSettingMapper houseSettingMapper;


    @Override
    public List<HouseSettings> query(HouseSettings houseSettings, Page page) {
        return houseSettingMapper.query(houseSettings,page);
    }

    @Override
    public Integer queryCount(HouseSettings houseSettings) {
        return houseSettingMapper.queryCount(houseSettings);
    }

    @Override
    public List<HouseSettings> queryAllTypeName() {

        return houseSettingMapper.queryAllTypeName();
    }


    @Override
    public void addNewSettings(String name, HouseSettings houseSettings) {
        houseSettings.setCreateBy(name);
        houseSettings.setCreateDate(new Date());
        if (houseSettings.getTypeCode()!=null && !houseSettings.getTypeCode().equals(""))
        {
            houseSettings.setValueId(1);
        }
        else{
            houseSettings.setTypeCode(houseSettingMapper.queryTypeCodeByTypeName(
                    houseSettings.getTypeName()
            ));
            Integer count = houseSettingMapper.queryCountByTypeName(houseSettings.getTypeName());
            houseSettings.setValueId(count+1);

        }
        houseSettingMapper.addNewSettings(houseSettings);
    }

    @Override
    public void deleteSettingById(Integer settingsId) {
        houseSettingMapper.deleteSettingById(settingsId);
    }

    @Override
    public String queryTypeCodeByTypeName(String typeName) {
        return houseSettingMapper.queryTypeCodeByTypeName(typeName);

    }

    @Override
    public void updateSetting(HouseSettings houseSettings) {
        houseSettingMapper.updateSetting(houseSettings);
    }
}
