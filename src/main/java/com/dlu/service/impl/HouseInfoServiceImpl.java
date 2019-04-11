package com.dlu.service.impl;

import com.dlu.dto.HouseInfoDTO;
import com.dlu.mapper.HouseInfoMapper;
import com.dlu.pojo.*;
import com.dlu.service.HouseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("houseInfoService")
public class HouseInfoServiceImpl implements HouseInfoService {

    @Autowired
    private HouseInfoMapper houseInfoMapper;

    @Override
    public void addNewHouseInfo(HouseInfoDTO houseInfoDTO) {
         houseInfoMapper.addNewHouseInfo(houseInfoDTO);
    }

    @Override
    public void addHouseIdAndContentId(Integer houseId, Integer contentId) {
        houseInfoMapper.addHouseIdAndContentId(houseId,contentId);
    }

    @Override
    public void addHouseIdAndFacilityId(Integer houseId, Integer facilityId) {
        houseInfoMapper.addHouseIdAndFacilityId(houseId,facilityId);
    }

    @Override
    public void addHouseFaceImg(HouseImg houseImg) {
        houseInfoMapper.addHouseFaceImg(houseImg);
    }

    @Override
    public Integer queryHouseFaceImg(Integer houseId) {
        return houseInfoMapper.queryHouseFaceImg(houseId);
    }

    @Override
    public Integer queryHousePuTongImg(Integer houseId) {
        return houseInfoMapper.queryHousePuTongImg(houseId);
    }

    @Override
    public List<HouseInfo> query(HouseInfoDTO houseInfoDTO, Page page) {
        return houseInfoMapper.query(houseInfoDTO,page);
    }

    @Override
    public int queryCount(HouseInfoDTO houseInfoDTO) {
        return houseInfoMapper.queryCount(houseInfoDTO);
    }

    @Override
    public List<RentContent> queryRentContent(Integer houseId) {
        return houseInfoMapper.queryRentContent(houseId);
    }

    @Override
    public List<Facility> queryFacility(Integer houseId) {
        return houseInfoMapper.queryFacility(houseId);
    }
}
