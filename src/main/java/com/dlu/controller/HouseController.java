package com.dlu.controller;


import com.dlu.dto.HouseInfoDTO;
import com.dlu.dto.ShowHouseDTO;
import com.dlu.pojo.*;
import com.dlu.service.HouseInfoService;

import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/house")
public class HouseController {

    private static String uploadPath = "D:\\imgSources\\houseImg"+ File.separator;
    @Autowired
    private HouseInfoService houseInfoService;

    @RequestMapping("/addNewHouseInfo")
    public String addNewHouseInfo(HouseInfoDTO houseInfoDTO, HttpSession httpSession) throws ParseException {
        //处理创建人
        Object create_name = httpSession.getAttribute("Username");
        houseInfoDTO.setCreateName(create_name.toString());
        //处理创建时间
        houseInfoDTO.setCreateDate(new Date());
        //处理看房时间格式转化
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        houseInfoDTO.setHouseCheckTime(simpleDateFormat.parse(houseInfoDTO.getHouseCheckTimeString()));
        //处理核查状态
        houseInfoDTO.setCheckStatusId(1);
        //处理租赁状态
        houseInfoDTO.setHouseStatusId(1);
        //处理出租方式标题
        if(houseInfoDTO.getLeasingId() == 1){
            String title = "整租  "+houseInfoDTO.getHouseName();
            houseInfoDTO.setHouseName(title);
        }
        else {
            String title = "合租  "+houseInfoDTO.getHouseName();
            houseInfoDTO.setHouseName(title);
        }
        //添加到房源信息表,并获取houseId
        houseInfoService.addNewHouseInfo(houseInfoDTO);
        Integer houseId = houseInfoDTO.getHouseId();
        System.out.println(houseId);
        //处理租金包含内容
        for (Integer  contentId:houseInfoDTO.getContentId()) {
            houseInfoService.addHouseIdAndContentId(houseId,contentId);
        }
        //处理房源包含设施
        for (Integer facilityId:houseInfoDTO.getFacilityId()) {
            houseInfoService.addHouseIdAndFacilityId(houseId,facilityId);
        }
        return "redirect:/user/toAddHouseImg/" + houseId;
    }

    @RequestMapping("/fengMianImg")
    @ResponseBody
    public UploadMsg fengMianImg(@RequestParam("file") MultipartFile multipartFile, HouseImg houseImg , Model model) throws IOException {
        Map<String,Object> map = new HashMap<>();
        if (multipartFile != null&& !multipartFile.isEmpty()){
            //不空才传
            //获取原始文件名
            String originalFilename = multipartFile.getOriginalFilename();
            //先截取原文件的文件名前缀
            String fileNamePrefix = originalFilename.substring(0,originalFilename.lastIndexOf("."));
            //加工处理名文件，将原文件名加时间
            String newFileNamePrefix = fileNamePrefix + new Date().getTime();
            //得到新文件名
            String newFileName = newFileNamePrefix + originalFilename.substring(originalFilename.lastIndexOf("."));
            //构建文件对象
            File file = new File(uploadPath + newFileName);
            //上传
            multipartFile.transferTo(file);
            map.put("src",file);
            String location = uploadPath + newFileName;
            //获取相对路径名称
            String relLocation = "\\imgSources\\houseImg\\" + newFileName;
            houseImg.setImgName(newFileName);
            houseImg.setImgPath(location);
            houseImg.setImgRelPath(relLocation);
            houseImg.setImgType("封面图片");
            houseInfoService.addHouseFaceImg(houseImg);
        }
        return new UploadMsg(0,"0", map );
    }

    @RequestMapping("/puTongImg")
    @ResponseBody
    public UploadMsg pyTongImg(@RequestParam("file") MultipartFile[] multipartFiles, HouseImg houseImg , Model model) throws IOException {
        List<String> fileNames = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        if (multipartFiles != null&& multipartFiles.length>0){
            for (MultipartFile multipartFile:multipartFiles) {
                //获取原始文件名
                String originalFilename = multipartFile.getOriginalFilename();
                //先截取原文件的文件名前缀
                String fileNamePrefix = originalFilename.substring(0,originalFilename.lastIndexOf("."));
                //加工处理名文件，将原文件名加时间
                String newFileNamePrefix = fileNamePrefix + new Date().getTime();
                //得到新文件名
                String newFileName = newFileNamePrefix + originalFilename.substring(originalFilename.lastIndexOf("."));
                //构建文件对象
                File file = new File(uploadPath + newFileName);
                //上传
                multipartFile.transferTo(file);
                map.put("src",file);
                String location = uploadPath + newFileName;
                //获取相对路径名称
                String relLocation = "\\imgSources\\houseImg\\" + newFileName;
                houseImg.setImgName(newFileName);
                houseImg.setImgPath(location);
                houseImg.setImgRelPath(relLocation);
                houseImg.setImgType("展示图片");
                houseInfoService.addHouseFaceImg(houseImg);
            }
        }
        return new UploadMsg(0,"0", map );
    }

    /**
     * 房源信息界面 管理员部分
     * @param name
     * @param page
     * @return
     */

    @RequestMapping("/{name}/queryHouseInfo")
    @ResponseBody
    public String queryHouseInfo(@PathVariable("name") String name, Page page){
        HouseInfoDTO houseInfoDTO = new HouseInfoDTO();
        //date转String格式
        // 创建时间和修改时间
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // 最早入住时间
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        //设置初始查询值
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        //记录查询的总数
        int count = houseInfoService.queryCount(houseInfoDTO);
        page.setTotalRecord(count);
        List<HouseInfo> houseInfoList = houseInfoService.query(houseInfoDTO,page);
        //修改时间显示格式
        for (HouseInfo houseInfo: houseInfoList) {
            //处理创建时间
            String createDateString = simpleDateFormat1.format(houseInfo.getCreateDate());
            houseInfo.setCreateDateString(createDateString);
            //处理修改时间
            if (houseInfo.getUpdateDate()!=null && !houseInfo.getUpdateDate().equals(""))
            {
                String updateDateString = simpleDateFormat1.format(houseInfo.getUpdateDate());
                houseInfo.setUpdateDateString(updateDateString);
            }
            //处理最早入住时间
            String checkTimeString = simpleDateFormat2.format(houseInfo.getHouseCheckTime());
            houseInfo.setHouseCheckTimeString(checkTimeString);
            //处理审核时间
            if (houseInfo.getExamDate()!=null && !houseInfo.getExamDate().equals(""))
            {
                String examDateString = simpleDateFormat1.format(houseInfo.getExamDate());
                houseInfo.setExamDateString(examDateString);
            }

        }
        //获取租金包含内容  获取房屋设施
        for (HouseInfo houseInfo:houseInfoList){
            //租金包含内容
            List<RentContent> rentContentList = houseInfoService.queryRentContent(houseInfo.getHouseId());
            String contentMsg = "";
            for (RentContent rentContent : rentContentList) {
                contentMsg = contentMsg + rentContent.getContentName()+"    ";
            }
            houseInfo.setRentContentString(contentMsg);
            //房源包含设施
            List<Facility> facilityList = houseInfoService.queryFacility(houseInfo.getHouseId());
            String facilityMsg= "";
            for (Facility facility:facilityList){
                facilityMsg = facilityMsg + facility.getFacilityName() + "    ";
            }
            houseInfo.setHouseFacilityString(facilityMsg);
        }


        Gson gson = new Gson();
        return gson.toJson(new PojoToJson("0","",String.valueOf(count),houseInfoList));

    }

    /**
     * 查询封面图片
     * @param houseId
     * @return
     */
    @RequestMapping("/queryFaceImg/{houseId}")
    @ResponseBody
    public List<HouseImg> queryFaceImg(@PathVariable("houseId")Integer houseId){
        List<HouseImg> list = houseInfoService.queryHouseFaceImgContent(houseId);
        return list;
    }

    /**
     * 查询展示图片
     * @param houseId
     * @return
     */
    @RequestMapping("/queryShowImg/{houseId}")
    @ResponseBody
    public List<HouseImg> queryShowImg(@PathVariable("houseId") Integer houseId){
        List<HouseImg> list = houseInfoService.queryShowImg(houseId);
        return list;
    }

    /**
     * 房源信息界面 用户部分
     * @param showHouseDTO
     * @return
     */
    @RequestMapping("/userHouseInfo")
    @ResponseBody
    public List<Object> userHouseInfo(@RequestBody ShowHouseDTO showHouseDTO){
        System.out.println(showHouseDTO);
        HouseInfo houseInfo = new HouseInfo();
        //处理省市
        houseInfo.setProvinceCode(showHouseDTO.getProvinceCode());
        houseInfo.setCityCode(showHouseDTO.getCityCode());
        //处理区
        if (showHouseDTO.getDistrictCode() != null && !showHouseDTO.getDistrictCode().equals("")){
            houseInfo.setDistrictCode(showHouseDTO.getDistrictCode());
        }
        //处理租赁方式
        if(showHouseDTO.getLeasing() != null && !showHouseDTO.getLeasing().equals("")){
            houseInfo.setLeasingId(Integer.parseInt(showHouseDTO.getLeasing()));
        }
        //处理朝向
        if (showHouseDTO.getOrientation()!= null && !showHouseDTO.getOrientation().equals("")){
            houseInfo.setOrientationId(Integer.parseInt(showHouseDTO.getOrientation()));
        }
        //处理户型
        if (showHouseDTO.getTypeRooms()!=null && !showHouseDTO.getTypeRooms().equals("")){
            houseInfo.setTypeRooms(Integer.parseInt(showHouseDTO.getTypeRooms()));
        }
        //处理面积
        houseInfo.setHouseAreaMin(Integer.parseInt(showHouseDTO.getHouseAreaMin()));
        houseInfo.setHouseAreaMax(Integer.parseInt(showHouseDTO.getHouseAreaMax()));
        //处理租金
        houseInfo.setHousePriceMin(Integer.parseInt(showHouseDTO.getHousePriceMin()));
        houseInfo.setHousePriceMax(Integer.parseInt(showHouseDTO.getHousePriceMax()));
        //处理特色
        if (showHouseDTO.getTeSe().length != 0)
        {
            for (int i = 0; i <showHouseDTO.getTeSe().length;i++){
                if( showHouseDTO.getTeSe()[i].equals("1")){
                    houseInfo.setRenovationId(4);
                }
                if (showHouseDTO.getTeSe()[i].equals("2")){
                    houseInfo.setHouseRentTypeId(2);
                }
                if (showHouseDTO.getTeSe()[i].equals("3")){
                    houseInfo.setInspectionId(1);
                }
                if (showHouseDTO.getTeSe()[i].equals("4")){
                    houseInfo.setSex("男女不限");
                }
                if (showHouseDTO.getTeSe()[i].equals("5")){
                    houseInfo.setHouseElevator("有电梯");
                }
                if (showHouseDTO.getTeSe()[i].equals("6")){
                    houseInfo.setHousePark("有车位");
                }
            }
        }
        //处理页码
        Page page = new Page();
        int start = showHouseDTO.getLimit()*(showHouseDTO.getPage()-1) ;
        page.setStart(start);
        page.setLimit(showHouseDTO.getLimit());
        //处理tab
        Tab tab = new Tab();
        tab.setTabIndex(showHouseDTO.getTabIndex());
        tab.setTabValue(showHouseDTO.getTabValue());
        //获取查询总数
        Integer count = houseInfoService.queryByShowMessageByDistrictCount(houseInfo);
        List<Object> list = new ArrayList<>();
        list.add(count);
        if (count > 0){
            //获取查询值
            List<HouseInfo> houseInfoList = houseInfoService.queryByShowMessageByDistrict(houseInfo,page,tab);
            list.add(houseInfoList);
        }
        return list;
    }


    /**
     * 审核房源界面
     * @param name
     * @param page
     * @return
     */

    @RequestMapping("/{name}/examiningHouseInfo")
    @ResponseBody
    public String examiningHouseInfo(@PathVariable("name") String name, Page page){
        HouseInfoDTO houseInfoDTO = new HouseInfoDTO();
        //date转String格式
        // 创建时间和修改时间
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // 最早入住时间
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        //设置初始查询值
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        //记录查询的总数
        int count = houseInfoService.queryExamCount(houseInfoDTO);
        page.setTotalRecord(count);
        List<HouseInfo> houseInfoList = houseInfoService.queryExam(houseInfoDTO,page);
        //修改时间显示格式
        for (HouseInfo houseInfo: houseInfoList) {
            //处理创建时间
            String createDateString = simpleDateFormat1.format(houseInfo.getCreateDate());
            houseInfo.setCreateDateString(createDateString);
            //处理修改时间
            if (houseInfo.getUpdateDate()!=null && !houseInfo.getUpdateDate().equals(""))
            {
                String updateDateString = simpleDateFormat1.format(houseInfo.getUpdateDate());
                houseInfo.setUpdateDateString(updateDateString);
            }
            //处理最早入住时间
            String checkTimeString = simpleDateFormat2.format(houseInfo.getHouseCheckTime());
            houseInfo.setHouseCheckTimeString(checkTimeString);

        }
        //获取租金包含内容  获取房屋设施
        for (HouseInfo houseInfo:houseInfoList){
            //租金包含内容
            List<RentContent> rentContentList = houseInfoService.queryRentContent(houseInfo.getHouseId());
            String contentMsg = "";
            for (RentContent rentContent : rentContentList) {
                contentMsg = contentMsg + rentContent.getContentName()+"    ";
            }
            houseInfo.setRentContentString(contentMsg);
            //房源包含设施
            List<Facility> facilityList = houseInfoService.queryFacility(houseInfo.getHouseId());
            String facilityMsg= "";
            for (Facility facility:facilityList){
                facilityMsg = facilityMsg + facility.getFacilityName() + "    ";
            }
            houseInfo.setHouseFacilityString(facilityMsg);
        }


        Gson gson = new Gson();
        return gson.toJson(new PojoToJson("0","",String.valueOf(count),houseInfoList));

    }


    /**
     * 房源审核成功
     * @param name
     * @param houseId
     * @return
     */
    @RequestMapping("/{name}/checkSuccess/{houseId}")
    @ResponseBody
    public Map<String,Integer> checkSuccess(@PathVariable("name")String name,@PathVariable("houseId")Integer houseId){
        HouseInfo houseInfo = new HouseInfo();
        houseInfo.setHouseId(houseId);
        houseInfo.setExamName(name);
        houseInfo.setExamDate(new Date());
        houseInfo.setCheckStatusId(2);
        houseInfo.setHouseStatusId(2);
        houseInfoService.checkSuccess(houseInfo);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }


    @RequestMapping("/houseDetail/{houseId}")
    public String houseDetail(@PathVariable("houseId") Integer houseId,Model model){
        //查询房屋信息
        HouseInfo houseInfo = houseInfoService.queryHouseInfoByHouseId(houseId);
        //处理房源上架时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        houseInfo.setCreateDateString(simpleDateFormat.format(houseInfo.getCreateDate()));
        //处理最早入住时间
        houseInfo.setHouseCheckTimeString(simpleDateFormat.format(houseInfo.getHouseCheckTime()));
        //查询房源图片
        List<HouseImg> houseImgList = houseInfoService.queryShowImg(houseId);
        //查询房源包含内容
        List<Facility> facilityList = houseInfoService.queryFacility(houseId);
        //查询租金包含内容
        List<RentContent> rentContentList = houseInfoService.queryRentContent(houseId);
        String contentMsg = "";
        for (RentContent rentContent : rentContentList) {
            contentMsg = contentMsg + rentContent.getContentName()+"    ";
        }
        houseInfo.setRentContentString(contentMsg);

        model.addAttribute("houseInfo",houseInfo);
        model.addAttribute("houseImg",houseImgList);
        model.addAttribute("facility",facilityList);

        return "user/queryHouse/houseDetail";
    }







}
