package com.dlu.service;

import com.dlu.dto.MoneyDTO;
import com.dlu.dto.QueryMoneyDTO;
import com.dlu.pojo.Contract;
import com.dlu.pojo.HouseTransferAssociation;
import com.dlu.pojo.Money;
import com.dlu.pojo.Page;

import java.util.List;

public interface MoneyService {
    void addNewMoneyMsg(Money money);

    int queryHouseMoneyDetailCount(Integer houseId);

    List<Money> queryHouseMoneyDetail(Integer houseId, Page page);

    List<Double> queryHousePay(Integer houseId);

    List<Double> queryHouseHasPay(Integer houseId);

    void updateMsg(Money money);

    List<Double> currentMoney(MoneyDTO moneyDTO);

    int AdQueryMoneyCount(QueryMoneyDTO queryMoneyDTO);

    List<HouseTransferAssociation> AdQueryMoney(QueryMoneyDTO queryMoneyDTO, Page page);

    List<Contract> queryTotalMoney(QueryMoneyDTO queryMoneyDTO);
}
