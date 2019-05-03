package com.dlu.mapper;

import com.dlu.dto.HouseTransferDTO;
import com.dlu.dto.MoneyDTO;
import com.dlu.pojo.HouseTransferAssociation;
import com.dlu.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseTransferAssociationMapper {

    void addNewTransferInfo(HouseTransferAssociation houseTransferAssociation);

    int queryCount(HouseTransferDTO houseTransferDTO);

    List<HouseTransferAssociation> query(@Param("houseTransferDTO") HouseTransferDTO houseTransferDTO, @Param("page") Page page);

    int queryRentedHouseCountByPartAName(String name);

    List<HouseTransferAssociation> queryRentedHouseByPartAName(@Param("name") String name, @Param("page") Page page);

    int queryInfoCount(HouseTransferAssociation houseTransferAssociation);

    List<HouseTransferAssociation> queryInfo(@Param("houseTransferAssociation") HouseTransferAssociation houseTransferAssociation, @Param("page") Page page);


    List<Double> TotalMoney(MoneyDTO moneyDTO);


}