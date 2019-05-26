package com.dlu.service.impl;

import com.dlu.dto.ContractDTO;
import com.dlu.mapper.ContractMapper;
import com.dlu.pojo.Contract;
import com.dlu.pojo.Page;
import com.dlu.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("contractService")
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractMapper contractMapper;


    @Override
    public int queryAllCount() {
        return contractMapper.queryAllCount();
    }

    @Override
    public void addContract(Contract contract) {
        contractMapper.addContract(contract);
    }

    @Override
    public int queryRunningCount(String name) {
        return contractMapper.queryRunningCount(name);
    }

    @Override
    public List<Contract> queryRunningContract(String name, Page page) {
        return contractMapper.queryRunningContract(name,page);
    }

    @Override
    public void updateContractMsg(Contract contract) {
        contractMapper.updateContractMsg(contract);
    }

    @Override
    public String queryPartBPenaltyAdditionalClauses(Integer id) {
        return contractMapper.queryPartBPenaltyAdditionalClauses(id);
    }

    @Override
    public String queryPartBOther(Integer id) {
        return contractMapper.queryPartBOther(id);
    }

    @Override
    public Contract queryById(Integer id) {
        return contractMapper.queryById(id);
    }

    @Override
    public String queryPartBIsConfirm(Integer id) {
        return contractMapper.queryPartBIsConfirm(id);
    }

    @Override
    public void partAConfirm(Contract contract) {
        contractMapper.partAConfirm(contract);
    }

    @Override
    public String queryPartAIsConfirm(Integer id) {
        return contractMapper.queryPartAIsConfirm(id);
    }

    @Override
    public void partBConfirm(Contract contract) {
        contractMapper.partBConfirm(contract);
    }

    @Override
    public int queryFinishCount(String name) {
        return contractMapper.queryFinishCount(name);
    }

    @Override
    public List<Contract> queryFinishContract(String name, Page page) {
        return contractMapper.queryFinishContract(name,page);
    }

    @Override
    public int queryTerminationCount(String name) {
        return contractMapper.queryTerminationCount(name);
    }

    @Override
    public List<Contract> queryTerminationContract(String name, Page page) {
        return contractMapper.queryTerminationContract(name ,page);
    }

    @Override
    public int queryExaminingContractInfoCount(ContractDTO examiningContractDTO) {
        return contractMapper.queryExaminingContractInfoCount(examiningContractDTO);
    }

    @Override
    public List<Contract> queryExaminingContractInfo(ContractDTO ContractDTO, Page page) {
        return contractMapper.queryExaminingContractInfo(ContractDTO ,page);
    }

    @Override
    public void acceptConfirm(Integer id, String name) {
        contractMapper.acceptConfirm(id,name);
    }

    @Override
    public void rejectConfirm(Integer id, String name) {
        contractMapper.rejectConfirm(id,name);
    }

    @Override
    public int querySiteConfirmationContractInfoCount(ContractDTO contractDTO) {
        return contractMapper.querySiteConfirmationContractInfoCount(contractDTO);
    }

    @Override
    public List<Contract> querySiteConfirmationContractInfo(ContractDTO contractDTO, Page page) {
        return contractMapper.querySiteConfirmationContractInfo(contractDTO,page);
    }

    @Override
    public void siteConfirmation(Integer id) {
        contractMapper.siteConfirmation(id);
    }

    @Override
    public int queryAllContractInfoCount(ContractDTO contractDTO) {
        return contractMapper.queryAllContractInfoCount(contractDTO);
    }

    @Override
    public List<Contract> queryAllContractInfo(ContractDTO contractDTO, Page page) {
        return contractMapper.queryAllContractInfo(contractDTO, page);
    }

    @Override
    public void terminationConfirm(Integer id) {
        contractMapper.terminationConfirm(id);
    }

    @Override
    public void updateStatus(Contract contract) {
         contractMapper.updateStatus(contract);
    }

    @Override
    public int queryEndCount(String name) {
        return contractMapper.queryEndCount(name);

    }

    @Override
    public List<Contract> queryEndContract(String name, Page page) {
        return contractMapper.queryEndContract(name,page);
    }


}
