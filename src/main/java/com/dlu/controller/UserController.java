package com.dlu.controller;

import com.dlu.dto.UserDTO;
import com.dlu.pojo.*;
import com.dlu.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private RegionService regionService;
    @Autowired
    private HouseSettingsService houseSettingsService;
    @Autowired
    private FacilityService facilityService;
    @Autowired
    private HouseInfoService houseInfoService;

    /**
     * 跳转到用户登陆界面
     * @return
     */
    @RequestMapping("toLogin")
    public String toLogin(){
        return "user/login";
    }

    /**
     * 用户登录
     * @param httpSession
     * @param user
     * @param userDTO
     * @param model
     * @return
     */
    @RequestMapping("login")
    public String login(HttpSession httpSession, User user, UserDTO userDTO,
                        Model model){
        user =  userService.login(user);
        if (user!=null){
            if(user.getUserLoginName().equals(userDTO.getUserLoginName())&&
                    user.getUserPassword().equals(userDTO.getUserPassword())){
                //登陆成功
                httpSession.setAttribute("Username",user.getUserLoginName());
                return "redirect:/user/index/" + user.getUserLoginName();
            }
            else{
                //账号或密码不正确
                model.addAttribute("msg","1");
                return "user/login";
            }
        }
        else{
            //没有此用户
            model.addAttribute("msg","2");
            return "user/login";
        }
    }


    /**
     * 跳转到用户界面
     * @param name
     * @return
     */
    @RequestMapping("/index/{name}")
    public String index(@PathVariable("name") String name){
        return "user/index";
    }

    /**
     * 跳转到发布房源界面
     * @return
     */
    @RequestMapping("/toPublishing")
    public String toPublishing(Model model){
        //查询所有的省
        List<Province> provinceList = regionService.queryAllProvince();
        model.addAttribute("province",provinceList);
        //查询所有的租金方式
        List<RentType> rentTypeList = houseSettingsService.queryAllRentType();
        model.addAttribute("rentType",rentTypeList);
        //查询所有的朝向
        List<Orientation> orientationList = houseSettingsService.queryAllOrientation();
        model.addAttribute("orientation",orientationList);
        //查询所有装修类型
        List<Renovation> renovationList = houseSettingsService.queryAllRenovation();
        model.addAttribute("renovation",renovationList);
        //查询所有的设施
        List<Facility> facilityList = facilityService.queryAllFacilities();
        model.addAttribute("facility",facilityList);
        //查询所有的租金包含费用
        List<RentContent> rentContentList = houseSettingsService.queryAllRentContent();
        model.addAttribute("rentContent",rentContentList);
        //查询身份
        List<Identity> identityList = houseSettingsService.queryAllIdentity();
        model.addAttribute("identity",identityList);
        return "user/house/publishingHouse";
    }

    /**
     * 跳转到添加房屋图片界面
     */
    @RequestMapping("/toAddHouseImg/{houseId}")
    public String toAddHouseImg(@PathVariable("houseId")Integer houseId,Model model)
    {
        //获取已上传图片数量
        Integer count = houseInfoService.queryHouseFaceImg(houseId);
        model.addAttribute("faceImg1",count);
        Integer count2 = 1 - count;
        model.addAttribute("faceImg2",count2);
        model.addAttribute("houseId",houseId);
        Integer countPT1 = houseInfoService.queryHousePuTongImg(houseId);
        Integer countPT2 = 10 - countPT1;
        model.addAttribute("puTongImg",countPT1);
        model.addAttribute("puTongImg2",countPT2);
        return "user/house/addHouseImg";
    }


    @RequestMapping("/addSuccess")
    public String addSuccess(){
        return "user/house/addSuccess";
    }
}
