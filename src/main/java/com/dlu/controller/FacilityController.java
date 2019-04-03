package com.dlu.controller;


import com.dlu.dto.FacilityDTO;
import com.dlu.pojo.Facility;
import com.dlu.pojo.Page;
import com.dlu.pojo.PojoToJson;
import com.dlu.pojo.UploadMsg;
import com.dlu.service.FacilityService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/facilitySettings")
public class FacilityController {
    private static String uploadPath = "D:\\imgSources\\facilityImg"+ File.separator;

    @Autowired
    private FacilityService facilityService;


    @RequestMapping("/uploadImg")
    @ResponseBody
    public UploadMsg uploadImg(@RequestParam("file")MultipartFile multipartFile, FacilityDTO facilityDTO) throws IOException {
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
            String relLocation = "\\imgSources\\facilityImg\\" + newFileName;
            Facility facility = new Facility(facilityDTO.getFacilityName(),newFileName,location,relLocation);
            facilityService.insertFacility(facility);
        }

        return new UploadMsg(0,"0", map );
    }

    @RequestMapping("/{name}/queryFacilities")
    @ResponseBody
    public String queryFacilities(@PathVariable("name") String name, Page page){
        //设置初始查询值
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        //查询总数
        int count = facilityService.queryCount();
        page.setTotalRecord(count);
        //查询所有设施信息
        List<Facility> facilityList = facilityService.query(page);
        Gson gson = new Gson();
        return gson.toJson(new PojoToJson("0","",String.valueOf(count),facilityList));



    }

}
