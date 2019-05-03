package com.dlu.service;

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

    List<HouseInfo> query(HouseInfoDTO houseInfoDTO, Page page);

    int queryCount(HouseInfoDTO houseInfoDTO);

    List<RentContent> queryRentContent(Integer houseId);

    List<Facility> queryFacility(Integer houseId);

    List<HouseImg> queryHouseFaceImgContent(Integer houseId);

    List<HouseImg> queryShowImg(Integer houseId);

    List<HouseInfo> queryByShowMessageByDistrict(HouseInfo houseInfo,Page page,Tab tab);

    Integer queryByShowMessageByDistrictCount(HouseInfo houseInfo);

    int queryExamCount(HouseInfoDTO houseInfoDTO);

    List<HouseInfo> queryExam(HouseInfoDTO houseInfoDTO, Page page);

    void checkSuccess(HouseInfo houseInfo);

    HouseInfo queryHouseInfoByHouseId(Integer houseId);

    void updateStatus(HouseInfo houseInfo);

    Double queryHousePrice(Integer houseId);



}
