package com.dlu.service.impl;

import com.dlu.dto.MoneyDTO;
import com.dlu.mapper.MoneyMapper;
import com.dlu.pojo.Money;
import com.dlu.pojo.Page;
import com.dlu.service.MoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("moneyService")
public class MoneyServiceImpl implements MoneyService {

    @Autowired
    private MoneyMapper moneyMapper;

    @Override
    public void addNewMoneyMsg(Money money) {
        moneyMapper.addNewMoneyMsg(money);
    }

    @Override
    public int queryHouseMoneyDetailCount(Integer houseId) {
        return moneyMapper.queryHouseMoneyDetailCount(houseId);
    }

    @Override
    public List<Money> queryHouseMoneyDetail(Integer houseId, Page page) {
        return moneyMapper.queryHouseMoneyDetail(houseId,page);
    }

    @Override
    public List<Double> queryHousePay(Integer houseId) {
        return moneyMapper.queryHousePay(houseId);
    }

    @Override
    public List<Double> queryHouseHasPay(Integer houseId) {
        return moneyMapper.queryHouseHasPay(houseId);
    }

    @Override
    public void updateMsg(Money money) {
        moneyMapper.updateMsg(money);
    }

    @Override
    public List<Double> currentMoney(MoneyDTO moneyDTO) {
        return moneyMapper.currentMoney(moneyDTO);
    }
}
