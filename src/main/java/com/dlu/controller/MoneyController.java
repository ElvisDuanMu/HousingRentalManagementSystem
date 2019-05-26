package com.dlu.controller;


import com.dlu.dto.MoneyDTO;
import com.dlu.dto.QueryInfoDTO;
import com.dlu.dto.QueryMoneyDTO;
import com.dlu.pojo.HouseTransferAssociation;
import com.dlu.pojo.Money;
import com.dlu.pojo.Page;
import com.dlu.pojo.PojoToJson;
import com.dlu.service.HouseTransferService;
import com.dlu.service.MoneyService;
import com.google.gson.Gson;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/money")
@Controller
public class MoneyController {

    @Autowired
    private MoneyService moneyService;
    @Autowired
    private HouseTransferService houseTransferService;


    /**
     * 查询房源具体支付时间以及双方支付状态信息
     * @param houseId
     * @param page
     * @return
     */
    @RequestMapping("/queryHouseMoneyDetail/{houseId}" )
    @ResponseBody
    public String queryHouseMoneyDetail(@PathVariable("houseId") Integer houseId, Page page){

        //查询房源具体租金交付日期数量
        int count = moneyService.queryHouseMoneyDetailCount(houseId);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<Money> moneyList = moneyService.queryHouseMoneyDetail(houseId,page);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Money m:moneyList) {
            if (m.getPartAConfirmDate() != null){
                m.setPartAConfirmDateString(simpleDateFormat.format(m.getPartAConfirmDate()));
            }
            if (m.getPartBConfirmDate() != null){
                m.setPartBConfirmDateString(simpleDateFormat.format(m.getPartBConfirmDate()));
            }
        }

        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),moneyList));

    }

    /**
     * 查询该房源的收入总金额
     * @param houseId
     * @return
     */
    @RequestMapping("/queryHousePay/{houseId}")
    @ResponseBody
    public Map<String,Double> queryHousePay(@PathVariable("houseId") Integer houseId){
        Double money = 0.0;
        List<Double> moneyList = moneyService.queryHousePay(houseId);
        if (moneyList.size() != 0){
            for (Double d:moneyList) {
                money += d;
            }
        }
        Map<String,Double> map = new HashMap<>();
        map.put("money",money);
        System.out.println(money);
        return map;
    }

    /**
     * 查询该房源的支付总金额
     * @param houseId
     * @return
     */
    @RequestMapping("/queryHouseHasPay/{houseId}")
    @ResponseBody
    public Map<String,Double> queryHouseHasPay(@PathVariable("houseId") Integer houseId){
        Double money = 0.0;
        List<Double> moneyList = moneyService.queryHouseHasPay(houseId);
        if (moneyList.size() != 0){
            for (Double d:moneyList) {
                money += d;
            }
        }
        Map<String,Double> map = new HashMap<>();
        map.put("money",money);
        System.out.println(money);
        return map;
    }

    /**
     * 甲方确认
     * @param id
     * @return
     */
    @RequestMapping("/partAConfirm/{id}")
    @ResponseBody
    public Map<String,Integer> partAConfirm(@PathVariable("id") Integer id){
        Money money = new Money();
        money.setId(id);
        money.setPartAConfirm("已确认");
        money.setStatus("已完成");
        money.setPartAConfirmDate(new Date());
        moneyService.updateMsg(money);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 乙方确认
     * @param id
     * @return
     */
    @RequestMapping("/partBConfirm/{id}")
    @ResponseBody
    public Map<String,Integer> partBConfirm(@PathVariable("id") Integer id){
        Money money = new Money();
        money.setId(id);
        money.setPartBConfirm("已确认");
        money.setPartBConfirmDate(new Date());
        moneyService.updateMsg(money);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 甲方查询总收入租金（条件查询）
     * @param moneyDTO
     * @return
     * @throws ParseException
     */
    @RequestMapping("/partATotalMoney")
    @ResponseBody
    public Map<String , Double> partATotalMoney(@RequestBody MoneyDTO moneyDTO)  {

        Double money = 0.0;
        List<Double> moneyList = houseTransferService.TotalMoney(moneyDTO);
        if (moneyList.size() != 0){
            for (Double d:moneyList) {
                money += d;
            }
        }
        Map<String ,Double> map = new HashMap<>();
        map.put("totalMoney",money);
        return map;
    }

    /**
     * 甲方查询已收入租金（条件查询）
     * @param moneyDTO
     * @return
     * @throws ParseException
     */
    @RequestMapping("/partAHasMoney")
    @ResponseBody
    public Map<String , Double> partAHasMoney(@RequestBody MoneyDTO moneyDTO) {

        Double money = 0.0;
        List<Double> moneyList = moneyService.currentMoney(moneyDTO);
        if (moneyList.size() != 0){
            for (Double d:moneyList) {
                money += d;
            }
        }
        Map<String ,Double> map = new HashMap<>();
        map.put("currentMoney",money);
        return map;
    }


    @RequestMapping("/prompt")
    @ResponseBody
    public Map<String,Integer> prompt(@RequestBody Money money){
        money.setPartAConfirmDate(new Date());
        moneyService.updateMsg(money);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }



    @RequestMapping("/queryAdMoney")
    @ResponseBody
    public String queryAdMoney(QueryMoneyDTO queryMoneyDTO, Page page) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (queryMoneyDTO.getStartCreateDateString() != null && !queryMoneyDTO.getStartCreateDateString().equals("")){
            queryMoneyDTO.setStartCreateDate(simpleDateFormat.parse(queryMoneyDTO.getStartCreateDateString()));
        }
        if (queryMoneyDTO.getEndCreateDateString() != null && !queryMoneyDTO.getEndCreateDateString().equals("")){
            queryMoneyDTO.setEndCreateDate(simpleDateFormat.parse(queryMoneyDTO.getEndCreateDateString()));
        }
        //查询数量
        int count = moneyService.AdQueryMoneyCount(queryMoneyDTO);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<HouseTransferAssociation> moneyList = moneyService.AdQueryMoney(queryMoneyDTO,page);
        for (HouseTransferAssociation m:moneyList) {
            if(m.getCreateTime() != null )
                m.setCreateTimeString(simpleDateFormat.format(m.getCreateTime()));
        }

        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),moneyList));

    }




}
