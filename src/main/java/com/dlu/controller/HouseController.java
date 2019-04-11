package com.dlu.controller;

import com.dlu.dto.FacilityDTO;
import com.dlu.dto.HouseInfoDTO;
import com.dlu.pojo.*;
import com.dlu.service.HouseInfoService;
import com.dlu.service.UserService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
            String createDateString = simpleDateFormat1.format(houseInfo.getCreateDate());
            houseInfo.setCreateDateString(createDateString);
            if (houseInfo.getUpdateDate()!=null && !houseInfo.getUpdateDate().equals(""))
            {
                String updateDateString = simpleDateFormat1.format(houseInfo.getUpdateDate());
                houseInfo.setUpdateDateString(updateDateString);
            }
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



}
