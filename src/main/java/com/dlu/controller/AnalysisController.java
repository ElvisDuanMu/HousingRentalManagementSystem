package com.dlu.controller;


import com.dlu.pojo.*;
import com.dlu.service.HouseInfoService;
import com.dlu.service.HouseTransferService;
import com.dlu.service.RegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/analysis")
public class AnalysisController {

    @Autowired
    private HouseInfoService houseInfoService;
    @Autowired
    private RegionService regionService;
    @Autowired
    private HouseTransferService houseTransferService;

    @RequestMapping("/housePrice")
    @ResponseBody
    public Map<String,Object> housePrice(@RequestBody Region region){
        //结果保留两位小数
        DecimalFormat df = new DecimalFormat("0.00");
        Map<String, Object> map = new HashMap<>();
        //存储区域
        List<String> districtArray = new ArrayList<>();
        //存储最大值
        List<String> maxPriceList = new ArrayList<>();
        //存储最小值
        List<String> minPriceList = new ArrayList<>();
        //存储平均值
        List<String> averagePriceList = new ArrayList<>();
        //声明一个查询类
        Region regionQuery = new Region();
        regionQuery.setLeasingId(region.getLeasingId());
        regionQuery.setHouseAreaMin(region.getHouseAreaMin());
        regionQuery.setHouseAreaMax(region.getHouseAreaMax());
        //判断省是否含有值，若为空则搜索全国
        if(region.getProvinceCode().equals("") || region.getProvinceCode() == null) {
            List<Province> provinceList = regionService.queryAllProvince();
            //处理省
            for (Province province : provinceList) {
                //放入list中
                districtArray.add(province.getProvinceName().substring(0, 2));
                //将省代码放入查询类中
                regionQuery.setProvinceCode(province.getProvinceCode());
                //查询各省的价格
                List<HouseInfo> priceList = houseInfoService.queryAnalysisPrice(regionQuery);
                if (priceList.size() != 0) {
                    //查询最高值并放入进去
                    maxPriceList.add(df.format(priceList.stream().mapToDouble(HouseInfo::getHousePrice).max().getAsDouble()));
                    //查询最小值并放入进去
                    minPriceList.add(df.format(priceList.stream().mapToDouble(HouseInfo::getHousePrice).min().getAsDouble()));
                    //计算平均值并放入进去
                    averagePriceList.add(df.format(priceList.stream().mapToDouble(HouseInfo::getHousePrice).average().getAsDouble()));
                } else {
                    maxPriceList.add("0");
                    minPriceList.add("0");
                    averagePriceList.add("0");
                }
            }
        }else if (region.getCityCode() == null || region.getCityCode().equals("")){
            //省有值市没有值，查询该省所有市
            List<City> cityList = regionService.queryCityByProvinceCode(region.getProvinceCode());
            //处理市
            for (City city : cityList) {
                districtArray.add(city.getCityName());
                //将市代码放入查询类中
                regionQuery.setCityCode(city.getCityCode());
                //查询各市的价格
                List<HouseInfo> priceList = houseInfoService.queryAnalysisPrice(regionQuery);
                if (priceList.size() != 0) {
                    //查询最高值并放入进去
                    maxPriceList.add(df.format(priceList.stream().mapToDouble(HouseInfo::getHousePrice).max().getAsDouble()));
                    //查询最小值并放入进去
                    minPriceList.add(df.format(priceList.stream().mapToDouble(HouseInfo::getHousePrice).min().getAsDouble()));
                    //计算平均值并放入进去
                    averagePriceList.add(df.format(priceList.stream().mapToDouble(HouseInfo::getHousePrice).average().getAsDouble()));
                } else {
                    maxPriceList.add("0");
                    minPriceList.add("0");
                    averagePriceList.add("0");
                }
            }
        }else {
            //省市都有值，查询该市所有区
            List<District> districtList = regionService.queryDistrictByCity(region.getCityCode());
            //处理区
            for (District district : districtList) {
                districtArray.add(district.getDistrictName());
                //将区代码放入查询类中
                regionQuery.setDistrictCode(district.getDistrictCode());
                //查询各区的价格
                List<HouseInfo> priceList = houseInfoService.queryAnalysisPrice(regionQuery);
                if (priceList.size() != 0) {
                    //查询最高值并放入进去
                    maxPriceList.add(df.format(priceList.stream().mapToDouble(HouseInfo::getHousePrice).max().getAsDouble()));
                    //查询最小值并放入进去
                    minPriceList.add(df.format(priceList.stream().mapToDouble(HouseInfo::getHousePrice).min().getAsDouble()));
                    //计算平均值并放入进去
                    averagePriceList.add(df.format(priceList.stream().mapToDouble(HouseInfo::getHousePrice).average().getAsDouble()));
                } else {
                    maxPriceList.add("0");
                    minPriceList.add("0");
                    averagePriceList.add("0");
                }
            }
        }
        map.put("district",districtArray);
        map.put("maxPrice",maxPriceList);
        map.put("minPrice",minPriceList);
        map.put("averagePrice",averagePriceList);
        return map;
    }

    /**
     * 查询房源热度
     * @param region
     * @return
     */
    @RequestMapping("/houseLike")
    @ResponseBody
    public Map<String,Object> houseLike(@RequestBody Region region) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //声明一个查询类
        Region regionQuery = new Region();
        //处理时间
        if (region.getStartCreateDateString() != null &&  !region.getStartCreateDateString().equals("")){
            regionQuery.setStartCreateDate(simpleDateFormat.parse(region.getStartCreateDateString()));
        }
        if (region.getEndCreateDateString() != null && !region.getEndCreateDateString().equals("")){
            regionQuery.setEndCreateDate(simpleDateFormat.parse(region.getEndCreateDateString()));
        }
        Map<String, Object> map = new HashMap<>();
        //存储区域
        List<String> districtArray = new ArrayList<>();
        //存储数量值
        List<Integer> countList = new ArrayList<>();
        //判断省是否含有值，若为空则搜索全国
        if(region.getProvinceCode().equals("") || region.getProvinceCode() == null) {
            List<Province> provinceList = regionService.queryAllProvince();
            //处理省
            for (Province province : provinceList) {
                //放入List中
                districtArray.add(province.getProvinceName().substring(0, 2));
                //将省代码放入查询类中
                regionQuery.setProvinceCode(province.getProvinceCode());
                //查询各省的租房数量
                Integer count = houseTransferService.queryDistrictCount(regionQuery);
                //数量放入list中
                countList.add(count);
            }
        }else if (region.getCityCode() == null || region.getCityCode().equals("")){
            //省有值市没有值，查询该省所有市
            List<City> cityList = regionService.queryCityByProvinceCode(region.getProvinceCode());
            //处理市
            for (City city : cityList) {
                districtArray.add(city.getCityName());
                //将市代码放入查询类中
                regionQuery.setCityCode(city.getCityCode());
                //查询各市的租房数量
                Integer count = houseTransferService.queryDistrictCount(regionQuery);
                //数量放入list中
                countList.add(count);
            }
        }else {
            //省市都有值，查询该市所有区
            List<District> districtList = regionService.queryDistrictByCity(region.getCityCode());
            //处理区
            for (District district : districtList) {
                districtArray.add(district.getDistrictName());
                //将区代码放入查询类中
                regionQuery.setDistrictCode(district.getDistrictCode());
                //查询各区的租房数量
                Integer count = houseTransferService.queryDistrictCount(regionQuery);
                //数量放入list中
                countList.add(count);
            }
        }
        map.put("district",districtArray);
        map.put("count",countList);

        return map;
    }
}
