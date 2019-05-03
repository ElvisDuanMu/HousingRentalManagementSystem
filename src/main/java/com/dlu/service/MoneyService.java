package com.dlu.service;

import com.dlu.dto.MoneyDTO;
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
}
