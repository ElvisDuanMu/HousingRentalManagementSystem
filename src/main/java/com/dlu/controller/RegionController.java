package com.dlu.controller;

import com.dlu.dto.RegionDTO;
import com.dlu.pojo.*;
import com.dlu.service.RegionService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/regionSettings")
public class RegionController {

    @Autowired
    private RegionService regionService;


    /**
     * 根据省查找市
     */
    @RequestMapping("/queryCityByProvinceCode/{provinceCode}")
    @ResponseBody
    public List<City> queryCityByProvinceCode(@PathVariable("provinceCode") String provinceCode){
        List<City> cityList = regionService.queryCityByProvinceCode(provinceCode);
        return cityList;
    }

    /**
     * 根据市查找区
     */
    @RequestMapping("/queryDistrictByCity/{cityCode}")
    @ResponseBody
    public List<District> queryDistrictByCity(@PathVariable("cityCode") String cityCode){
        List<District> districtList = regionService.queryDistrictByCity(cityCode);
        return districtList;
    }


    @RequestMapping("/{name}/queryRegion")
    @ResponseBody
    public String queryRegion(RegionDTO regionDTO, Page page){

        int start = page.getLimit()*(page.getPage() -1) ;
        page.setStart(start);
        //记录查询到的总数
        int count = regionService.queryCount(regionDTO);
        List<Region> regionList = regionService.query(regionDTO,page);
        Gson gson = new Gson();
        return gson.toJson(new PojoToJson("0","",String.valueOf(count),regionList));


    }

}
