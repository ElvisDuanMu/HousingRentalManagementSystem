package com.dlu.mapper;

import com.dlu.dto.HouseTransferDTO;
import com.dlu.dto.MoneyDTO;
import com.dlu.pojo.HouseTransferAssociation;
import com.dlu.pojo.Page;
import com.dlu.pojo.Region;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseTransferAssociationMapper {

    void addNewTransferInfo(HouseTransferAssociation houseTransferAssociation);

    int queryCount(HouseTransferDTO houseTransferDTO);

    List<HouseTransferAssociation> query(@Param("houseTransferDTO") HouseTransferDTO houseTransferDTO, @Param("page") Page page);

    int queryRentedHouseCountByPartNameAndStatus(HouseTransferAssociation houseTransferAssociation);

    List<HouseTransferAssociation>queryRentedHouseByPartNameAndStatus(@Param("houseTransferAssociation") HouseTransferAssociation houseTransferAssociation, @Param("page") Page page);

    int queryInfoCount(HouseTransferAssociation houseTransferAssociation);

    List<HouseTransferAssociation> queryInfo(@Param("houseTransferAssociation") HouseTransferAssociation houseTransferAssociation, @Param("page") Page page);


    List<Double> TotalMoney(MoneyDTO moneyDTO);


    int queryHouseBreakdownCount(HouseTransferAssociation houseTransferAssociation);

    List<HouseTransferAssociation> queryHouseBreakdown(@Param("houseTransferAssociation") HouseTransferAssociation houseTransferAssociation, @Param("page") Page page);

    int queryEndHouseCountByPartNameAndStatus(@Param("name") String name, @Param("status") String status);

    List<HouseTransferAssociation> queryEndHouseByPartNameAndStatus(@Param("name") String name, @Param("status") String status, @Param("page") Page page);

    void updateStatus(HouseTransferAssociation houseTransferAssociation);

    Integer queryDistrictCount(Region regionQuery);
}