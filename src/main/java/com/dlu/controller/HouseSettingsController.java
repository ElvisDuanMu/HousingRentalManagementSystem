package com.dlu.controller;

import com.dlu.dto.HouseSettingsDTO;
import com.dlu.pojo.HouseSettings;
import com.dlu.pojo.Page;
import com.dlu.pojo.PojoToJson;
import com.dlu.service.HouseSettingsService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/houseSettings")
public class HouseSettingsController {

    @Autowired
    private HouseSettingsService houseSettingsService;

    /**
     * 多条件查询
     * @param name
     * @param houseSettingsDTO
     * @param model

     * @return
     * @throws ParseException
     */

    @RequestMapping("/{name}/querySettings")
    @ResponseBody
    public String querySettings(@PathVariable("name") String name, HouseSettingsDTO  houseSettingsDTO,
                                Page page) throws ParseException {
        //时间string转date
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //date转String格式
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //数据转化  时间前台传的字符串格式，转换成时间格式
        HouseSettings houseSettings = new HouseSettings();
        houseSettings.setTypeName(houseSettingsDTO.getTypeName());
        houseSettings.setCreateBy(houseSettings.getCreateBy());
        if ( houseSettingsDTO.getStartCreateDate()!=null && houseSettingsDTO.getStartCreateDate()!=""
                && houseSettingsDTO.getEndCreateDate()!=null  && houseSettingsDTO.getEndCreateDate()!="")
        {
            houseSettings.setStartCreateDate(simpleDateFormat.parse(houseSettingsDTO.getStartCreateDate()));
            houseSettings.setEndCreateDate(simpleDateFormat.parse(houseSettingsDTO.getEndCreateDate()));
            System.out.println(houseSettings.getStartCreateDate());
            System.out.println(houseSettings.getEndCreateDate());
        }
        //设置初始查询值
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        //记录查询到的总数
        int count = houseSettingsService.queryCount(houseSettings);
      //  int totalPage =(int)Math.ceil((float)count/limit);
       // page1.setTotalPage(totalPage);
        page.setTotalRecord(count);
        List<HouseSettings> houseSettingsList = houseSettingsService.query(houseSettings,page);
        //修改时间显示格式
        for (HouseSettings houseSettings1: houseSettingsList) {
            String createDateString = simpleDateFormat1.format(houseSettings1.getCreateDate());
            houseSettings1.setCreateDateString(createDateString);
            if (houseSettings1.getUpdateDate()!=null && !houseSettings1.getUpdateDate().equals(""))
            {
                String updateDateString = simpleDateFormat1.format(houseSettings1.getUpdateDate());
                houseSettings1.setUpdateDateString(updateDateString);
            }

        }

        Gson gson = new Gson();
        return gson.toJson(new PojoToJson("0","",String.valueOf(count),houseSettingsList));

    }



    /**
     * 添加新的房间设置信息
     * @param name
     * @param houseSettings
     * @return
     */
    @RequestMapping("/{name}/addNewSetting")
    public String addNewSetting(@PathVariable("name") String name, HouseSettings houseSettings){
        //Object adUserName = session.getAttribute("AdUserName");
        //String userId = adUserName.toString();
        System.out.println("typeName:"+houseSettings.getTypeName());
        houseSettingsService.addNewSettings(name,houseSettings);
        return "redirect:/administrator/"+name+"/toHouseSettings";
    }

    @RequestMapping("/{name}/deleteSetting")
    @ResponseBody
    public Map<String,Integer> deleteSetting( Integer settingsId ){
        Map<String,Integer> map = new HashMap<>();
        map.put("code" , 200);
        houseSettingsService.deleteSettingById(settingsId);
        return map;
    }

    @RequestMapping("{name}/updateSetting")
    @ResponseBody
    public Map<String,Integer > updateSetting(@PathVariable("name") String name,
                                              Integer settingsId,String typeName,String valueName){
        Date date = new Date();
        HouseSettings houseSettings = new HouseSettings();
        houseSettings.setSettingsId(settingsId);
        houseSettings.setTypeName(typeName);
        //根据类型名查询类型代码
        String typeCode = houseSettingsService.queryTypeCodeByTypeName(typeName);
        houseSettings.setTypeCode(typeCode);
        houseSettings.setValueName(valueName);
        houseSettings.setUpdateBy(name);
        houseSettings.setUpdateDate(date);
        System.out.println(houseSettings.toString());
        houseSettingsService.updateSetting(houseSettings);
        Map<String,Integer> map = new HashMap<>();
        map.put("code" , 200);
        return map;
    }

}
