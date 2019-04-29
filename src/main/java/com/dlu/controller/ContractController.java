package com.dlu.controller;


import com.dlu.dto.ContractDTO;
import com.dlu.pojo.*;
import com.dlu.service.ContractService;
import com.dlu.service.HouseInfoService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/contract")
public class ContractController {

    @Autowired
    private ContractService contractService;
    @Autowired
    private HouseInfoService houseInfoService;


    /**
     * 查询未完成的合同
     * @param name
     * @param page
     * @return
     */
    @RequestMapping("/queryRunningContract/{name}")
    @ResponseBody
    public String queryRunningContract(@PathVariable("name") String name, Page page){

        //查询总数
        int count = contractService.queryRunningCount(name);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        //查询结果
        List<Contract> contractList = contractService.queryRunningContract(name,page);
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),contractList));
    }

    /**
     * 查询已完成的合同
     * @param name
     * @param page
     * @return
     */
    @RequestMapping("/queryFinishContract/{name}")
    @ResponseBody
    public String queryFinishContract(@PathVariable("name") String name, Page page){
        //查询总数
        int count = contractService.queryFinishCount(name);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        //查询结果
        List<Contract> contractList = contractService.queryFinishContract(name,page);
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),contractList));
    }

    /**
     * 查询已终止的合同
     * @param name
     * @param page
     * @return
     */
    @RequestMapping("/queryTerminationContract/{name}")
    @ResponseBody
    public String queryTerminationContract(@PathVariable("name") String name, Page page){
        //查询总数
        int count = contractService.queryTerminationCount(name);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        //查询结果
        List<Contract> contractList = contractService.queryTerminationContract(name,page);
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),contractList));
    }



    /**
     * 乙方填写信息
     * @param contract
     * @return
     */
    @RequestMapping("/partBFillIn")
    @ResponseBody
    public Map<String,Integer> partBFillIn(@RequestBody Contract contract){
        String str = "";
        //处理乙方承担内容
        if(contract.getPartBCostArray().length > 0){
            for (String s:contract.getPartBCostArray()) {
                str = str + s +"  ";
            }
            contract.setPartBCost(str);
        }else {
            contract.setPartBCost("无");
        }
        //处理状态
        contract.setStatus("等待甲方（出租人）填写合同信息");
        //处理居间服务费为一个月房租
        //查找一个月租金
        Double price = houseInfoService.queryHousePrice(contract.getHouseId());
        contract.setPartBIntermediaryCosts(price);
        //处理居间服务费大写
        String money = ComputingEquipment.digitUppercase(price);
        contract.setPartBIntermediaryCostsUppercase(money);
        //处理乙方违约责任附加条款
        if ( !contract.getPenaltyAdditionalClauses().equals("无")){
            contract.setPenaltyAdditionalClauses("乙方：" + contract.getPenaltyAdditionalClauses());
        }
        //处理乙方争议事项附加条款
        if ( !contract.getOther().equals("无")){
            contract.setOther("乙方：" + contract.getOther());
        }
        contractService.updateContractMsg(contract);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 甲方填写信息
     * @param contract
     * @return
     * @throws ParseException
     */
    @RequestMapping("/partAFillIn")
    @ResponseBody
    public Map<String,Integer> partAFillIn(@RequestBody Contract contract) throws ParseException {
        String str = "";
        //处理甲方承担内容
        if(contract.getPartACostArray().length > 0){
            for (String s:contract.getPartACostArray()) {
                str = str + s +"  ";
            }
            contract.setPartACost(str);
        }else{
            contract.setPartACost("无");
        }
        //处理状态
        contract.setStatus("等待双方确认合同信息");
        //修改两人确认信息为未确认
        contract.setPartAConfirm("未确认");
        contract.setPartBConfirm("未确认");

        //处理月租
        //查询房源id的租金
        Double price = houseInfoService.queryHousePrice(contract.getHouseId());
        //修改月租并改为大写
        contract.setMonthlyRent(price);
        contract.setMonthlyRentUppercase(ComputingEquipment.digitUppercase(price));

        //处理时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //起始时间
        Date startDate = simpleDateFormat.parse(contract.getStartDateString());
        contract.setStartDate(startDate);
        //结束时间
        Date endDate = simpleDateFormat.parse(contract.getEndDateString());
        contract.setEndDate(endDate);
        //将结束日期+1天（计算时最后一天因为是零点不算，所以要加上）
        Calendar c = Calendar.getInstance();
        c.setTime(endDate);
        c.add(Calendar.DAY_OF_MONTH , 1);
        Date endDate1 = c.getTime();
        //计算时间间隔
        DayCompare dayCompare1 = ComputingEquipment.dayComparePrecise(startDate,endDate1);
        //处理负数问题
        if (dayCompare1.getMonth() == -4){
            dayCompare1.setMonth(8);
            dayCompare1.setYear(dayCompare1.getYear()- 1);
        }
        if (dayCompare1.getMonth() == -3){
            dayCompare1.setMonth(9);
            dayCompare1.setYear(dayCompare1.getYear()- 1);
        }
        if (dayCompare1.getMonth() == -2){
            dayCompare1.setMonth(10);
            dayCompare1.setYear(dayCompare1.getYear()- 1);
        }
        if (dayCompare1.getMonth() == -1){
            dayCompare1.setMonth(11);
            dayCompare1.setYear(dayCompare1.getYear()- 1);
        }
        String duration = dayCompare1.getYear() + "年 " + dayCompare1.getMonth() + "月";
        contract.setDuration(duration);
        //计算时间间隔总月数
        DayCompare dayCompare2 = ComputingEquipment.dayCompare(startDate,endDate1);
        Integer allMonth =  dayCompare2.getMonth();
        //处理交房日期
        contract.setPartADeliveryTime(simpleDateFormat.parse(contract.getPartADeliveryTimeString()));

        //处理金钱
        //计算总租金及租金
        Double totalPrice = price * allMonth;
        //处理小数点后两位
        DecimalFormat df = new DecimalFormat("#.00");
        contract.setTotalPrice(Double.valueOf(df.format(totalPrice)));
        //总租金大写
        contract.setTotalPriceUppercase(ComputingEquipment.digitUppercase(Double.valueOf(df.format(totalPrice))));
        //押金大写
        //一个月房租为押金
        contract.setDeposit(price);
        contract.setDepositUppercase(ComputingEquipment.digitUppercase(price));
        //居间服务费大写
        //一个月房租为押金
        contract.setPartAIntermediaryCosts(price);
        contract.setPartAIntermediaryCostsUppercase(ComputingEquipment.digitUppercase(price));

        //查询乙方填写的违约责任附加条款
        String partBOfTen = contractService.queryPartBPenaltyAdditionalClauses(contract.getId());
        //处理违约责任附加条款
        //如果是乙方是无，甲方不管有无直接覆盖；如果乙方有，甲方无，保留乙方；如果甲乙双方都有全部保留
        if ( ! partBOfTen.equals("无")){
            if (contract.getPenaltyAdditionalClauses().equals("无")){
                contract.setPenaltyAdditionalClauses(partBOfTen);
            } else{
                String msg = "甲方：" +contract.getPenaltyAdditionalClauses() + ";"+partBOfTen;
                contract.setPenaltyAdditionalClauses(msg);
            }
        }else{
            if ( !contract.getPenaltyAdditionalClauses().equals("无")){
                contract.setPenaltyAdditionalClauses("甲方：" + contract.getPenaltyAdditionalClauses());
            }
        }

        //查询乙方填写的其他约定事项
        String partBOfTwelve = contractService.queryPartBOther(contract.getId());
        //处理其他条款
        //如果是乙方是无，甲方为无直接覆盖，甲方有则添加甲方：；如果乙方有，甲方无，保留乙方；如果甲乙双方都有全部保留
        if(!partBOfTwelve.equals("无")){
            if (contract.getOther().equals("无")){
                contract.setOther(partBOfTwelve);
            }else {
                String msg1 =  "甲方：" + contract.getOther() + ";" + partBOfTwelve;
                contract.setOther(msg1);
            }
        }else {
            if ( !contract.getOther().equals("无")){
                contract.setOther("甲方：" + contract.getOther());
            }
        }

        contractService.updateContractMsg(contract);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 管理员编辑信息
     * @param contract
     * @return
     * @throws ParseException
     */
    @RequestMapping("/administratorEdit")
    @ResponseBody
    public Map<String,Integer> administratorEdit(@RequestBody Contract contract) throws ParseException {

        String str = "";
        //处理乙方承担内容
        if(contract.getPartBCostArray().length > 0){
            for (String s:contract.getPartBCostArray()) {
                str = str + s +"  ";
            }
            contract.setPartBCost(str);
        }else {
            contract.setPartBCost("无");
        }
        String str1 = "";
        //处理甲方承担内容
        if(contract.getPartACostArray().length > 0){
            for (String s:contract.getPartACostArray()) {
                str1 = str1 + s +"  ";
            }
            contract.setPartACost(str1);
        }else{
            contract.setPartACost("无");
        }



        //处理时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //起始时间
        Date startDate = simpleDateFormat.parse(contract.getStartDateString());
        contract.setStartDate(startDate);
        //结束时间
        Date endDate = simpleDateFormat.parse(contract.getEndDateString());
        contract.setEndDate(endDate);
        //将结束日期+1天（计算时最后一天因为是零点不算，所以要加上）
        Calendar c = Calendar.getInstance();
        c.setTime(endDate);
        c.add(Calendar.DAY_OF_MONTH , 1);
        Date endDate1 = c.getTime();
        //计算时间间隔
        DayCompare dayCompare1 = ComputingEquipment.dayComparePrecise(startDate,endDate1);
        //处理负数问题
        if (dayCompare1.getMonth() == -4){
            dayCompare1.setMonth(8);
            dayCompare1.setYear(dayCompare1.getYear()- 1);
        }
        if (dayCompare1.getMonth() == -3){
            dayCompare1.setMonth(9);
            dayCompare1.setYear(dayCompare1.getYear()- 1);
        }
        if (dayCompare1.getMonth() == -2){
            dayCompare1.setMonth(10);
            dayCompare1.setYear(dayCompare1.getYear()- 1);
        }
        if (dayCompare1.getMonth() == -1){
            dayCompare1.setMonth(11);
            dayCompare1.setYear(dayCompare1.getYear()- 1);
        }
        String duration = dayCompare1.getYear() + "年 " + dayCompare1.getMonth() + "月";
        contract.setDuration(duration);
        //计算时间间隔总月数
        DayCompare dayCompare2 = ComputingEquipment.dayCompare(startDate,endDate1);
        Integer allMonth =  dayCompare2.getMonth();
        //处理交房日期
        contract.setPartADeliveryTime(simpleDateFormat.parse(contract.getPartADeliveryTimeString()));

        //处理金钱
        //计算总租金及租金
        Double price = houseInfoService.queryHousePrice(contract.getHouseId());
        Double totalPrice = price * allMonth;
        //处理小数点后两位
        DecimalFormat df = new DecimalFormat("#.00");
        contract.setTotalPrice(Double.valueOf(df.format(totalPrice)));
        //总租金大写
        contract.setTotalPriceUppercase(ComputingEquipment.digitUppercase(Double.valueOf(df.format(totalPrice))));

        contractService.updateContractMsg(contract);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }


    /**
     * 查看合同信息(弹出层)
     * @param id
     * @return
     */
    @RequestMapping("/viewContractMsg/{id}")
    @ResponseBody
    public List<Contract> viewContractMsg(@PathVariable("id")Integer id){
        Contract contract = contractService.queryById(id);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
        contract.setStartDateString(simpleDateFormat.format(contract.getStartDate()));
        contract.setEndDateString(simpleDateFormat.format(contract.getEndDate()));
        contract.setPartADeliveryTimeString(simpleDateFormat.format(contract.getPartADeliveryTime()));
        List<Contract> contractList = new ArrayList<>();
        contractList.add(contract);
        return contractList;
    }


    /**
     * 甲方确认
     * @param id
     * @return
     */
    @RequestMapping("/parAConfirm/{id}")
    @ResponseBody
    public Map<String,Integer> partAConfirm(@PathVariable("id")Integer id){
        //查询乙方确认情况
        String partB = contractService.queryPartBIsConfirm(id);
        Contract contract = new Contract();
        contract.setId(id);
        //如果乙方确认完毕，则更改合同状态为等待审核
        if (partB.equals("已确认")){
            contract.setStatus("等待审核");
        }
        //甲方确认合同信息
        contract.setPartAConfirm("已确认");
        contractService.partAConfirm(contract);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 乙方确认
     * @param id
     * @return
     */
    @RequestMapping("/parBConfirm/{id}")
    @ResponseBody
    public Map<String,Integer> partBConfirm(@PathVariable("id")Integer id){
        //查询甲方确认情况
        String partA = contractService.queryPartAIsConfirm(id);
        Contract contract = new Contract();
        contract.setId(id);
        //如果甲方确认完毕，则更改合同状态为等待审核
        if (partA.equals("已确认")){
            contract.setStatus("等待审核");
        }
        //乙方确认合同信息
        contract.setPartBConfirm("已确认");
        contractService.partBConfirm(contract);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;

    }

    /**
     * 管理员查询待审核合同（ 多条件精确查询：用户昵称、合同编号、真实姓名）
     * @param
     * @param page
     * @return
     */
    @RequestMapping("/queryExaminingContractInfo")
    @ResponseBody
    public String queryExaminingContractInfo(ContractDTO contractDTO, Page page){
        //仅查询待审核合同数量
        int count = contractService.queryExaminingContractInfoCount(contractDTO);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        //仅查询待审核合同
        List<Contract> contractList =  contractService.queryExaminingContractInfo(contractDTO,page);
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),contractList));
    }

    /**
     * 管理员查询待现场确认合同 (条件精确查询：合同编号)
     * @param contractDTO
     * @param page
     * @return
     */
    @RequestMapping("/querySiteConfirmationContractInfo")
    @ResponseBody
    public String querySiteConfirmationContractInfo(ContractDTO contractDTO,Page page){
        //仅查询待现场确认合同数量
        int count = contractService.querySiteConfirmationContractInfoCount(contractDTO);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        //仅查询待现场确认合同
        List<Contract> contractList =  contractService.querySiteConfirmationContractInfo(contractDTO,page);
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),contractList));
    }

    /**
     * 管理员通过合同
     * @param id
     * @return
     */
    @RequestMapping("/acceptConfirm/{id}/{name}")
    @ResponseBody
    public Map<String,Integer> acceptConfirm(@PathVariable("id") Integer id,@PathVariable("name") String name){
        //通过合同
        contractService.acceptConfirm(id,name);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 管理员未通过合同
     * @param id
     * @return
     */
    @RequestMapping("/rejectConfirm/{id}/{name}")
    @ResponseBody
    public Map<String,Integer> rejectConfirm(@PathVariable("id") Integer id,@PathVariable("name") String name){
        //通过合同
        contractService.rejectConfirm(id,name);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 管理员进行现场确认
     * @param id
     * @return
     */
    @RequestMapping("/siteConfirmation/{id}")
    @ResponseBody
    public Map<String,Integer> siteConfirmation(@PathVariable("id") Integer id){
        //现场确认
        contractService.siteConfirmation(id);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 管理员查看所有合同信息 （多条件精确查询：合同编号、用户昵称、真实姓名、合同状态）
     * @param contractDTO
     * @param page
     * @return
     */
    @RequestMapping("/queryAllContractInfo")
    @ResponseBody
    public String queryAllContractInfo(ContractDTO contractDTO, Page page){
        //查询所有合同信息
        int count = contractService.queryAllContractInfoCount(contractDTO);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        //查询所有合同信息
        List<Contract> contractList =  contractService.queryAllContractInfo(contractDTO,page);
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),contractList));
    }


    /**
     * 管理员终止合同
     * @param id
     * @return
     */
    @RequestMapping("/terminationConfirm/{id}")
    @ResponseBody
    public Map<String,Integer> terminationConfirm(@PathVariable("id") Integer id){
        //通过合同
        contractService.terminationConfirm(id);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }




}
