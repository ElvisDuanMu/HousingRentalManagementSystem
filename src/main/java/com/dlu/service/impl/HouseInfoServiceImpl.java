package com.dlu.service.impl;

import com.dlu.dto.HouseInfoAdDTO;
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
    public List<HouseInfo> query(HouseInfoAdDTO houseInfoAdDTO, Page page) {
        return houseInfoMapper.query(houseInfoAdDTO,page);
    }

    @Override
    public int queryCount(HouseInfoAdDTO houseInfoAdDTO) {
        return houseInfoMapper.queryCount(houseInfoAdDTO);
    }

    @Override
    public List<RentContent> queryRentContent(Integer houseId) {
        return houseInfoMapper.queryRentContent(houseId);
    }

    @Override
    public List<Facility> queryFacility(Integer houseId) {
        return houseInfoMapper.queryFacility(houseId);
    }

    @Override
    public List<HouseImg> queryHouseFaceImgContent(Integer houseId) {
        return houseInfoMapper.queryHouseFaceImgContent(houseId);
    }

    @Override
    public List<HouseImg> queryShowImg(Integer houseId) {
        return houseInfoMapper.queryShowImg(houseId);
    }

    @Override
    public List<HouseInfo> queryByShowMessageByDistrict(HouseInfo houseInfo, Page page,Tab tab) {
        return houseInfoMapper.queryByShowMessageByDistrict(houseInfo,page,tab);
    }

    @Override
    public Integer queryByShowMessageByDistrictCount(HouseInfo houseInfo) {
        return houseInfoMapper.queryByShowMessageByDistrictCount(houseInfo);
    }

    @Override
    public int queryExamCount(HouseInfoDTO houseInfoDTO) {
        return houseInfoMapper.queryExamCount(houseInfoDTO);
    }

    @Override
    public List<HouseInfo> queryExam(HouseInfoDTO houseInfoDTO, Page page) {
        return houseInfoMapper.queryExam(houseInfoDTO,page);
    }

    @Override
    public void check(HouseInfo houseInfo) {
        houseInfoMapper.check(houseInfo);
    }

    @Override
    public HouseInfo queryHouseInfoByHouseId(Integer houseId) {
        return houseInfoMapper.queryHouseInfoByHouseId(houseId);
    }

    @Override
    public void updateStatus(HouseInfo houseInfo) {
        houseInfoMapper.updateStatus(houseInfo);
    }

    @Override
    public Double queryHousePrice(Integer houseId) {
        return houseInfoMapper.queryHousePrice(houseId);
    }

    @Override
    public int queryHouseInfoByUserNameAndStatusCount(HouseInfo houseInfo) {
        return houseInfoMapper.queryHouseInfoByUserNameAndStatusCount(houseInfo);
    }

    @Override
    public List<HouseInfo> queryHouseInfoByUserNameAndStatus(HouseInfo houseInfo, Page page) {
        return houseInfoMapper.queryHouseInfoByUserNameAndStatus(houseInfo,page);
    }

    @Override
    public void updateHouseInfo(HouseInfoDTO houseInfoDTO) {
        houseInfoMapper.updateHouseInfo(houseInfoDTO);
    }

    @Override
    public void deleteHouseIdAndContentId(Integer houseId) {
        houseInfoMapper.deleteHouseIdAndContentId(houseId);
    }

    @Override
    public void deleteHouseIdAndFacilityId(Integer houseId) {
        houseInfoMapper.deleteHouseIdAndFacilityId(houseId);
    }

    @Override
    public List<HouseImg> queryAllImgContent(Integer houseId, Page page) {
        return houseInfoMapper.queryAllImgContent(houseId,page);
    }

    @Override
    public void deleteImg(Integer id) {
        houseInfoMapper.deleteImg(id);
    }

    @Override
    public List<HouseInfo> queryAnalysisPrice(Region region) {
        return houseInfoMapper.queryAnalysisPrice(region);
    }


}
