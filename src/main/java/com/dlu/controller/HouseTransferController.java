package com.dlu.controller;


import com.dlu.dto.HouseTransferDTO;
import com.dlu.pojo.HouseTransferAssociation;
import com.dlu.pojo.Money;
import com.dlu.pojo.Page;
import com.dlu.pojo.PojoToJson;
import com.dlu.service.HouseTransferService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/houseTransfer")
public class HouseTransferController {

    @Autowired
    private HouseTransferService houseTransferService;

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
        int count = houseTransferService.queryRentedHouseCountByPartAName(name);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<HouseTransferAssociation> houseTransferAssociationList = houseTransferService.queryRentedHouseByPartAName(name,page);
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
     * 查询已出租和已结束房源信息 条件查询(乙方)
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





}
