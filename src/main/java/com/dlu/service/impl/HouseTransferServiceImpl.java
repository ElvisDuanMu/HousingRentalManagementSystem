package com.dlu.service.impl;

import com.dlu.dto.HouseTransferDTO;
import com.dlu.dto.MoneyDTO;
import com.dlu.mapper.HouseTransferAssociationMapper;
import com.dlu.pojo.HouseTransferAssociation;
import com.dlu.pojo.Page;
import com.dlu.pojo.Region;
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
    public int queryRentedHouseCountByPartNameAndStatus(HouseTransferAssociation houseTransferAssociation) {
        return houseTransferAssociationMapper.queryRentedHouseCountByPartNameAndStatus(houseTransferAssociation);
    }

    @Override
    public List<HouseTransferAssociation> queryRentedHouseByPartNameAndStatus(HouseTransferAssociation houseTransferAssociation, Page page) {
        return houseTransferAssociationMapper.queryRentedHouseByPartNameAndStatus(houseTransferAssociation,page);
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

    @Override
    public int queryHouseBreakdownCount(HouseTransferAssociation houseTransferAssociation) {
        return houseTransferAssociationMapper.queryHouseBreakdownCount(houseTransferAssociation);
    }

    @Override
    public List<HouseTransferAssociation> queryHouseBreakdown(HouseTransferAssociation houseTransferAssociation, Page page) {
        return houseTransferAssociationMapper.queryHouseBreakdown(houseTransferAssociation,page);
    }

    @Override
    public int queryEndHouseCountByPartNameAndStatus(String name, String status) {

        return houseTransferAssociationMapper.queryEndHouseCountByPartNameAndStatus(name,status);
    }

    @Override
    public List<HouseTransferAssociation> queryEndHouseByPartNameAndStatus(String name, String status, Page page) {
        return houseTransferAssociationMapper.queryEndHouseByPartNameAndStatus(name,status,page);
    }

    @Override
    public void updateStatus(HouseTransferAssociation houseTransferAssociation) {
        houseTransferAssociationMapper.updateStatus(houseTransferAssociation);
    }

    @Override
    public Integer queryDistrictCount(Region regionQuery) {
        return houseTransferAssociationMapper.queryDistrictCount(regionQuery);
    }


}
