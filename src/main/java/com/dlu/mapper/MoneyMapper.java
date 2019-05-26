package com.dlu.mapper;

import com.dlu.dto.MoneyDTO;
import com.dlu.dto.QueryInfoDTO;
import com.dlu.dto.QueryMoneyDTO;
import com.dlu.pojo.HouseTransferAssociation;
import com.dlu.pojo.Money;
import com.dlu.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MoneyMapper {

    void addNewMoneyMsg(Money money);

    int queryHouseMoneyDetailCount(Integer houseId);

    List<Money> queryHouseMoneyDetail(@Param("houseId") Integer houseId, @Param("page") Page page);

    List<Double> queryHousePay(Integer houseId);

    List<Double> queryHouseHasPay(Integer houseId);

    void updateMsg(Money money);

    List<Double> currentMoney(MoneyDTO moneyDTO);

    int AdQueryMoneyCount(QueryMoneyDTO queryMoneyDTO);

    List<HouseTransferAssociation> AdQueryMoney(@Param("queryMoneyDTO") QueryMoneyDTO queryMoneyDTO, @Param("page") Page page);
}