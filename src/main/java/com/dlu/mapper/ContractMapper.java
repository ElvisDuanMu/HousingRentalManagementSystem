package com.dlu.mapper;

import com.dlu.dto.ContractDTO;
import com.dlu.pojo.Contract;
import com.dlu.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ContractMapper {

    int queryAllCount();

    void addContract(Contract contract);

    int queryRunningCount(String name);

    List<Contract> queryRunningContract(@Param("name") String name, @Param("page") Page page);


    void updateContractMsg(Contract contract);

    String queryPartBPenaltyAdditionalClauses(Integer id);

    String queryPartBOther(Integer id);

    Contract queryById(Integer id);


    String queryPartBIsConfirm(Integer id);

    void partAConfirm(Contract contract);

    String queryPartAIsConfirm(Integer id);

    void partBConfirm(Contract contract);

    int queryFinishCount(String name);

    List<Contract> queryFinishContract(@Param("name") String name, @Param("page") Page page);

    int queryTerminationCount(String name);

    List<Contract> queryTerminationContract(@Param("name") String name, @Param("page") Page page);

    int queryExaminingContractInfoCount(ContractDTO ContractDTO);

    List<Contract> queryExaminingContractInfo(@Param("contractDTO") ContractDTO contractDTO, @Param("page") Page page);

    void acceptConfirm(@Param("id") Integer id, @Param("name") String name);

    void rejectConfirm(Integer id);

    int querySiteConfirmationContractInfoCount(ContractDTO contractDTO);

    List<Contract> querySiteConfirmationContractInfo(@Param("contractDTO") ContractDTO contractDTO, @Param("page") Page page);

    void siteConfirmation(Integer id);

    int queryAllContractInfoCount(ContractDTO contractDTO);

    List<Contract> queryAllContractInfo(@Param("contractDTO") ContractDTO contractDTO, @Param("page") Page page);

    void terminationConfirm(Integer id);

    void rejectConfirm(@Param("id") Integer id, @Param("name") String name);

    void updateStatus(Contract contract);

    int queryEndCount(String name);

    List<Contract> queryEndContract(@Param("name") String name, @Param("page") Page page);
}