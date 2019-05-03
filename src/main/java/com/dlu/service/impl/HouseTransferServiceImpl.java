package com.dlu.service.impl;

import com.dlu.dto.HouseTransferDTO;
import com.dlu.dto.MoneyDTO;
import com.dlu.mapper.HouseTransferAssociationMapper;
import com.dlu.pojo.HouseTransferAssociation;
import com.dlu.pojo.Page;
import com.dlu.service.HouseTransferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("houseTransferService")
public class HouseTransferServiceImpl implements HouseTransferService {

    @Autowired
    private HouseTransferAssociationMapper houseTransferAssociationMapper;

    @Override
    public void addNewTransferInfo(HouseTransferAssociation houseTransferAssociation) {
        houseTransferAssociationMapper.addNewTransferInfo(houseTransferAssociation);
    }

    @Override
    public int queryCount(HouseTransferDTO houseTransferDTO) {
        return houseTransferAssociationMapper.queryCount(houseTransferDTO);
    }

    @Override
    public List<HouseTransferAssociation> query(HouseTransferDTO houseTransferDTO, Page page) {
        return houseTransferAssociationMapper.query(houseTransferDTO,page);
    }

    @Override
    public int queryRentedHouseCountByPartAName(String name) {
        return houseTransferAssociationMapper.queryRentedHouseCountByPartAName(name);
    }

    @Override
    public List<HouseTransferAssociation> queryRentedHouseByPartAName(String name, Page page) {
        return houseTransferAssociationMapper.queryRentedHouseByPartAName(name,page);
    }

    @Override
    public int queryInfoCount(HouseTransferAssociation houseTransferAssociation) {
        return houseTransferAssociationMapper.queryInfoCount(houseTransferAssociation);
    }

    @Override
    public List<HouseTransferAssociation> queryInfo(HouseTransferAssociation houseTransferAssociation, Page page) {
        return houseTransferAssociationMapper.queryInfo(houseTransferAssociation ,page);
    }

    @Override
    public List<Double> TotalMoney(MoneyDTO moneyDTO) {
        return houseTransferAssociationMapper.TotalMoney(moneyDTO);
    }



}
