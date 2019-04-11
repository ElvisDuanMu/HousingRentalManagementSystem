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
}
