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

    int queryRentedHouseCountByPartAName(String name);

    List<HouseTransferAssociation> queryRentedHouseByPartAName(String name, Page page);

    int queryInfoCount(HouseTransferAssociation houseTransferAssociation);

    List<HouseTransferAssociation> queryInfo(HouseTransferAssociation houseTransferAssociation, Page page);


    List<Double> TotalMoney(MoneyDTO moneyDTO);



}
