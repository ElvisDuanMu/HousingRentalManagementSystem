package com.dlu.mapper;

import com.dlu.dto.HouseInfoAdDTO;
import com.dlu.dto.HouseInfoDTO;
import com.dlu.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseInfoMapper {

    /**
     * 添加信息的房源信息
     * @param houseInfoDTO
     */
    void addNewHouseInfo(HouseInfoDTO houseInfoDTO);

    /**
     * 添加房源Id和房租包含Id信息
     * @param houseId
     * @param contentId
     */
    void addHouseIdAndContentId(@Param("houseId") Integer houseId, @Param("contentId") Integer contentId);

    void addHouseIdAndFacilityId(@Param("houseId") Integer houseId,@Param("facilityId") Integer facilityId);

    void addHouseFaceImg(HouseImg houseImg);

    Integer queryHouseFaceImg(@Param("houseId") Integer houseId);

    Integer queryHousePuTongImg(@Param("houseId") Integer houseId);

    List<HouseInfo> query(@Param("houseInfoAdDTO") HouseInfoAdDTO houseInfoAdDTO, @Param("page") Page page);

    int queryCount(HouseInfoAdDTO houseInfoAdDTO);

    List<RentContent> queryRentContent(@Param("houseId") Integer houseId);

    List<Facility> queryFacility(@Param("houseId") Integer houseId);

    List<HouseImg> queryHouseFaceImgContent(@Param("houseId") Integer houseId);

    List<HouseImg> queryShowImg(Integer houseId);

    List<HouseInfo> queryByShowMessageByDistrict(@Param("houseInfo") HouseInfo houseInfo,@Param("page")Page page,@Param("tab")Tab tab);

    Integer queryByShowMessageByDistrictCount(HouseInfo houseInfo);

    int queryExamCount(HouseInfoDTO houseInfoDTO);

    List<HouseInfo> queryExam(@Param("houseInfoDTO")HouseInfoDTO houseInfoDTO,@Param("page") Page page);

    void check(HouseInfo houseInfo);

    HouseInfo queryHouseInfoByHouseId(@Param("houseId") Integer houseId);

    void updateStatus(HouseInfo houseInfo);

    Double queryHousePrice(@Param("houseId") Integer houseId);


    int queryHouseInfoByUserNameAndStatusCount(HouseInfo houseInfo);

    List<HouseInfo> queryHouseInfoByUserNameAndStatus(@Param("houseInfo") HouseInfo houseInfo, @Param("page") Page page);

    void updateHouseInfo(HouseInfoDTO houseInfoDTO);

    void deleteHouseIdAndContentId(Integer houseId);

    void deleteHouseIdAndFacilityId(Integer houseId);

    List<HouseImg> queryAllImgContent(@Param("houseId") Integer houseId, @Param("page") Page page);

    void deleteImg(Integer id);

    List<HouseInfo> queryAnalysisPrice(Region region);
}