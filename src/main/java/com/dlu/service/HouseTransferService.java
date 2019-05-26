package com.dlu.service;


import com.dlu.dto.HouseTransferDTO;
import com.dlu.dto.MoneyDTO;
import com.dlu.pojo.HouseTransferAssociation;
import com.dlu.pojo.Page;

import java.util.List;

public interface HouseTransferService {
    void addNewTransferInfo(HouseTransferAssociation houseTransferAssociation);

    int queryCount(HouseTransferDTO houseTransferDTO);

    List<HouseTransferAssociation> query(HouseTransferDTO houseTransferDTO, Page page);

    int queryRentedHouseCountByPartNameAndStatus(HouseTransferAssociation houseTransferAssociation);

    List<HouseTransferAssociation> queryRentedHouseByPartNameAndStatus(HouseTransferAssociation houseTransferAssociation, Page page);

    int queryInfoCount(HouseTransferAssociation houseTransferAssociation);

    List<HouseTransferAssociation> queryInfo(HouseTransferAssociation houseTransferAssociation, Page page);


    List<Double> TotalMoney(MoneyDTO moneyDTO);


    int queryHouseBreakdownCount(HouseTransferAssociation houseTransferAssociation);


    List<HouseTransferAssociation> queryHouseBreakdown(HouseTransferAssociation houseTransferAssociation, Page page);

    int queryEndHouseCountByPartNameAndStatus(String name, String status);

    List<HouseTransferAssociation> queryEndHouseByPartNameAndStatus(String name, String status, Page page);

    void updateStatus(HouseTransferAssociation houseTransferAssociation);
}
