package com.dlu.controller;

import com.dlu.dto.HouseInfoDTO;
import com.dlu.pojo.HouseInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/house")
public class HouseController {

    @RequestMapping("/addNewHouseInfo")
    public String addNewHouseInfo(HouseInfoDTO houseInfoDTO){
        System.out.println(houseInfoDTO.toString());
        return "redirect:/house/toSuc";
    }

    @RequestMapping("/toSuc")
    public String toSuc(){
        return "user/suc";
    }

}
