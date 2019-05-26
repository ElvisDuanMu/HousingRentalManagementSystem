package com.dlu.controller;


import com.dlu.dto.HouseTransferDTO;
import com.dlu.pojo.*;
import com.dlu.service.ContractService;
import com.dlu.service.HouseInfoService;
import com.dlu.service.HouseTransferService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/houseTransfer")
public class HouseTransferController {

    @Autowired
    private HouseTransferService houseTransferService;
    @Autowired
    private HouseInfoService houseInfoService;
    @Autowired
    private ContractService contractService;

    /**
     * 管理员查询房源信息
     * @param houseTransferDTO
     * @param page
     * @return
     * @throws ParseException
     */
    @RequestMapping("/queryHouseTransfer")
    @ResponseBody
    public String queryHouseTransfer(HouseTransferDTO houseTransferDTO, Page page) throws ParseException {
        //时间string转date
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //数据转化
        if ( houseTransferDTO.getStartCreateDateString()!=null &&  !houseTransferDTO.getStartCreateDateString().equals("")
                && houseTransferDTO.getEndCreateDateString()!=null  &&  !houseTransferDTO.getEndCreateDateString().equals(""))
        {
            houseTransferDTO.setStartCreateDate(simpleDateFormat.parse(houseTransferDTO.getStartCreateDateString()));
            houseTransferDTO.setEndCreateDate(simpleDateFormat.parse(houseTransferDTO.getEndCreateDateString()));
        }

        //date转String格式
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //设置初始查询值
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        //记录查询到的总数
        int count = houseTransferService.queryCount(houseTransferDTO);
        List<HouseTransferAssociation> houseTransferAssociationList = houseTransferService.query(houseTransferDTO,page);
        if( count != 0 ){
            for (HouseTransferAssociation h:houseTransferAssociationList) {
                h.setCreateTimeString(simpleDateFormat1.format(h.getCreateTime()));
                h.setStartTimeString(simpleDateFormat.format(h.getStartTime()));
                h.setEndTimeString(simpleDateFormat.format(h.getEndTime()));
            }
        }

        Gson gson = new Gson();
        return gson.toJson(new PojoToJson("0","",String.valueOf(count),houseTransferAssociationList));

    }

    /**
     *
     * 查询已出租房源信息
     * @param name
     * @return
     */
    @RequestMapping("/queryRentedHouseListInfo/{name}")
    @ResponseBody
    public String queryRentedHouseListInfo(@PathVariable("name") String name, Page page){

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        HouseTransferAssociation houseTransferAssociation = new HouseTransferAssociation();
        houseTransferAssociation.setPartALoginName(name);
        houseTransferAssociation.setStatus("正在出租");
        int count = houseTransferService.queryRentedHouseCountByPartNameAndStatus(houseTransferAssociation);
        System.out.println(count);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<HouseTransferAssociation> houseTransferAssociationList = houseTransferService.queryRentedHouseByPartNameAndStatus(houseTransferAssociation,page);
        if (houseTransferAssociationList.size()!=0){
            for (HouseTransferAssociation h : houseTransferAssociationList) {
                h.setCreateTimeString(simpleDateFormat.format(h.getCreateTime()));
                h.setStartTimeString(simpleDateFormat1.format(h.getStartTime()));
                h.setEndTimeString(simpleDateFormat1.format(h.getEndTime()));
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),houseTransferAssociationList));
    }

    /**
     *
     * 查询租到的房源信息
     * @param name
     * @return
     */
    @RequestMapping("/queryAlreadyRentedHouseListInfo/{name}")
    @ResponseBody
    public String queryAlreadyRentedHouseListInfo(@PathVariable("name") String name, Page page){

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        HouseTransferAssociation houseTransferAssociation = new HouseTransferAssociation();
        houseTransferAssociation.setPartBLoginName(name);
        houseTransferAssociation.setStatus("正在出租");
        int count = houseTransferService.queryRentedHouseCountByPartNameAndStatus(houseTransferAssociation);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<HouseTransferAssociation> houseTransferAssociationList = houseTransferService.queryRentedHouseByPartNameAndStatus(houseTransferAssociation,page);
        if (houseTransferAssociationList.size()!=0){
            for (HouseTransferAssociation h : houseTransferAssociationList) {
                h.setCreateTimeString(simpleDateFormat.format(h.getCreateTime()));
                h.setStartTimeString(simpleDateFormat1.format(h.getStartTime()));
                h.setEndTimeString(simpleDateFormat1.format(h.getEndTime()));
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),houseTransferAssociationList));
    }

    /**
     *
     * 查询已结束的房源信息
     * @param name
     * @return
     */
    @RequestMapping("/queryEndHouseListInfo/{name}")
    @ResponseBody
    public String queryEndHouseListInfo(@PathVariable("name") String name, Page page){

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        String status = "已结束";
        int count = houseTransferService.queryEndHouseCountByPartNameAndStatus(name,status);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<HouseTransferAssociation> houseTransferAssociationList = houseTransferService.queryEndHouseByPartNameAndStatus(name,status,page);
        if (houseTransferAssociationList.size()!=0){
            for (HouseTransferAssociation h : houseTransferAssociationList) {
                h.setCreateTimeString(simpleDateFormat.format(h.getCreateTime()));
                h.setStartTimeString(simpleDateFormat1.format(h.getStartTime()));
                h.setEndTimeString(simpleDateFormat1.format(h.getEndTime()));
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),houseTransferAssociationList));
    }

    /**
     *
     * 查询已退租的房源信息
     * @param name
     * @return
     */
    @RequestMapping("/queryBreakdownHouseListInfo/{name}")
    @ResponseBody
    public String queryBreakdownHouseListInfo(@PathVariable("name") String name, Page page){

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        String status = "已退租";
        int count = houseTransferService.queryEndHouseCountByPartNameAndStatus(name,status);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<HouseTransferAssociation> houseTransferAssociationList = houseTransferService.queryEndHouseByPartNameAndStatus(name,status,page);
        if (houseTransferAssociationList.size()!=0){
            for (HouseTransferAssociation h : houseTransferAssociationList) {
                h.setCreateTimeString(simpleDateFormat.format(h.getCreateTime()));
                h.setStartTimeString(simpleDateFormat1.format(h.getStartTime()));
                h.setEndTimeString(simpleDateFormat1.format(h.getEndTime()));
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),houseTransferAssociationList));
    }

    /**
     *
     * 查询已出租和已结束房源信息 条件查询 时间范围(甲方)
     * @param
     * @return
     */
    @RequestMapping("/queryPartAInfo")
    @ResponseBody
    public String queryPartAInfo( HouseTransferAssociation houseTransferAssociation, Page page) throws ParseException {


        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        if (houseTransferAssociation.getStartCreateDateString() != null && houseTransferAssociation.getStartCreateDateString() !=""){
            houseTransferAssociation.setStartCreateDate(simpleDateFormat1.parse(houseTransferAssociation.getStartCreateDateString()));
        }
        if (houseTransferAssociation.getEndCreateDateString() != null && houseTransferAssociation.getEndCreateDateString() !=""){
            houseTransferAssociation.setEndCreateDate(simpleDateFormat1.parse(houseTransferAssociation.getEndCreateDateString()));
        }
        int count = houseTransferService.queryInfoCount(houseTransferAssociation);


        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<HouseTransferAssociation> houseTransferAssociationList = houseTransferService.queryInfo(houseTransferAssociation,page);
        if (houseTransferAssociationList.size()!=0){
            for (HouseTransferAssociation h : houseTransferAssociationList) {
                h.setCreateTimeString(simpleDateFormat.format(h.getCreateTime()));
                h.setStartTimeString(simpleDateFormat1.format(h.getStartTime()));
                h.setEndTimeString(simpleDateFormat1.format(h.getEndTime()));
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),houseTransferAssociationList));
    }

    /**
     *
     * 查询已出租和已结束房源信息 条件查询 时间(乙方)
     * @param
     * @return
     */
    @RequestMapping("/queryPartBInfo")
    @ResponseBody
    public String queryPartBInfo( HouseTransferAssociation houseTransferAssociation, Page page) throws ParseException {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        if (houseTransferAssociation.getStartCreateDateString() != null && houseTransferAssociation.getStartCreateDateString() !=""){
            houseTransferAssociation.setStartCreateDate(simpleDateFormat1.parse(houseTransferAssociation.getStartCreateDateString()));
        }
        if (houseTransferAssociation.getEndCreateDateString() != null && houseTransferAssociation.getEndCreateDateString() !=""){
            houseTransferAssociation.setEndCreateDate(simpleDateFormat1.parse(houseTransferAssociation.getEndCreateDateString()));
        }
        int count = houseTransferService.queryInfoCount(houseTransferAssociation);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<HouseTransferAssociation> houseTransferAssociationList = houseTransferService.queryInfo(houseTransferAssociation,page);
        if (houseTransferAssociationList.size()!=0){
            for (HouseTransferAssociation h : houseTransferAssociationList) {
                h.setCreateTimeString(simpleDateFormat.format(h.getCreateTime()));
                h.setStartTimeString(simpleDateFormat1.format(h.getStartTime()));
                h.setEndTimeString(simpleDateFormat1.format(h.getEndTime()));
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),houseTransferAssociationList));
    }


    @RequestMapping("/queryRunningHouse")
    @ResponseBody
    public String queryRunningHouse( HouseTransferAssociation houseTransferAssociation, Page page) throws ParseException {

        houseTransferAssociation.setStatus("正在出租");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");

        int count = houseTransferService.queryHouseBreakdownCount(houseTransferAssociation);


        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<HouseTransferAssociation> houseTransferAssociationList = houseTransferService.queryHouseBreakdown(houseTransferAssociation,page);
        if (houseTransferAssociationList.size()!=0){
            for (HouseTransferAssociation h : houseTransferAssociationList) {
                h.setCreateTimeString(simpleDateFormat.format(h.getCreateTime()));
                h.setStartTimeString(simpleDateFormat1.format(h.getStartTime()));
                h.setEndTimeString(simpleDateFormat1.format(h.getEndTime()));
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),houseTransferAssociationList));
    }


    /**
     * 管理员结束管理
     * @param houseId
     * @return
     */
    @RequestMapping("/end/{houseId}")
    @ResponseBody
    public Map<String,Integer> end(@PathVariable("houseId") Integer houseId){
        //房源租赁关系结束
        HouseTransferAssociation houseTransferAssociation = new HouseTransferAssociation();
        houseTransferAssociation.setHouseId(houseId);
        houseTransferAssociation.setStatus("已结束");
        houseTransferService.updateStatus(houseTransferAssociation);

        //房源状态结束
        HouseInfo houseInfo = new HouseInfo();
        houseInfo.setHouseId(houseId);
        houseInfo.setHouseStatusId(6);
        houseInfoService.updateStatus(houseInfo);

        //合同结束状态
        Contract contract = new Contract();
        contract.setHouseId(houseId);
        contract.setStatus("已结束");
        contractService.updateStatus(contract);

        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 管理员退租管理
     * @param houseId
     * @return
     */
    @RequestMapping("/stop/{houseId}")
    @ResponseBody
    public Map<String,Integer> stop(@PathVariable("houseId") Integer houseId){
        //房源租赁关系结束
        HouseTransferAssociation houseTransferAssociation = new HouseTransferAssociation();
        houseTransferAssociation.setHouseId(houseId);
        houseTransferAssociation.setStatus("已退租");
        houseTransferService.updateStatus(houseTransferAssociation);

        //房源状态结束
        HouseInfo houseInfo = new HouseInfo();
        houseInfo.setHouseId(houseId);
        houseInfo.setHouseStatusId(5);
        houseInfoService.updateStatus(houseInfo);

        //合同结束状态
        Contract contract = new Contract();
        contract.setHouseId(houseId);
        contract.setStatus("已终止");
        contractService.updateStatus(contract);

        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;

    }



}
