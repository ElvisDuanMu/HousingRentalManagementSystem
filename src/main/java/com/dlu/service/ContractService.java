package com.dlu.service;

import com.dlu.dto.ContractDTO;
import com.dlu.pojo.Contract;
import com.dlu.pojo.Page;

import java.util.List;

public interface ContractService {
    int queryAllCount();

    void addContract(Contract contract);

    int queryRunningCount(String name);

    List<Contract> queryRunningContract(String name, Page page);


    void updateContractMsg(Contract contract);

    String queryPartBPenaltyAdditionalClauses(Integer id);

    String queryPartBOther(Integer id);

    Contract queryById(Integer id);


    String queryPartBIsConfirm(Integer id);

    void partAConfirm(Contract contract);

    String queryPartAIsConfirm(Integer id);

    void partBConfirm(Contract contract);

    int queryFinishCount(String name);

    List<Contract> queryFinishContract(String name, Page page);

    int queryTerminationCount(String name);

    List<Contract> queryTerminationContract(String name, Page page);

    int queryExaminingContractInfoCount(ContractDTO examiningContractDTO);

    List<Contract> queryExaminingContractInfo(ContractDTO contractDTO, Page page);

    void acceptConfirm(Integer id, String name);

    void rejectConfirm(Integer id, String name);

    int querySiteConfirmationContractInfoCount(ContractDTO contractDTO);

    List<Contract> querySiteConfirmationContractInfo(ContractDTO contractDTO, Page page);

    void siteConfirmation(Integer id);

    int queryAllContractInfoCount(ContractDTO contractDTO);

    List<Contract> queryAllContractInfo(ContractDTO contractDTO, Page page);

    void terminationConfirm(Integer id);
}
