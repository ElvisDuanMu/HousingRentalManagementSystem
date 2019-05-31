package com.dlu.service;

import com.dlu.dto.HouseInfoAdDTO;
import com.dlu.dto.HouseInfoDTO;
import com.dlu.pojo.*;

import java.util.List;


public interface HouseInfoService {


    void addNewHouseInfo(HouseInfoDTO houseInfoDTO);

    void addHouseIdAndContentId(Integer houseId, Integer contentId);

    void addHouseIdAndFacilityId(Integer houseId, Integer facilityId);

    void addHouseFaceImg(HouseImg houseImg);

    Integer queryHouseFaceImg(Integer houseId);

    Integer queryHousePuTongImg(Integer houseId);

    List<HouseInfo> query(HouseInfoAdDTO houseInfoAdDTO, Page page);

    int queryCount(HouseInfoAdDTO houseInfoAdDTO);

    List<RentContent> queryRentContent(Integer houseId);

    List<Facility> queryFacility(Integer houseId);

    List<HouseImg> queryHouseFaceImgContent(Integer houseId);

    List<HouseImg> queryShowImg(Integer houseId);

    List<HouseInfo> queryByShowMessageByDistrict(HouseInfo houseInfo,Page page,Tab tab);

    Integer queryByShowMessageByDistrictCount(HouseInfo houseInfo);

    int queryExamCount(HouseInfoDTO houseInfoDTO);

    List<HouseInfo> queryExam(HouseInfoDTO houseInfoDTO, Page page);

    void check(HouseInfo houseInfo);

    HouseInfo queryHouseInfoByHouseId(Integer houseId);

    void updateStatus(HouseInfo houseInfo);

    Double queryHousePrice(Integer houseId);


    int queryHouseInfoByUserNameAndStatusCount(HouseInfo username);

    List<HouseInfo> queryHouseInfoByUserNameAndStatus(HouseInfo houseInfo, Page page);

    void updateHouseInfo(HouseInfoDTO houseInfoDTO);

    void deleteHouseIdAndContentId(Integer houseId);

    void deleteHouseIdAndFacilityId(Integer houseId);

    List<HouseImg> queryAllImgContent(Integer houseId, Page page);

    void deleteImg(Integer id);

    List<HouseInfo> queryAnalysisPrice(Region region);
}
