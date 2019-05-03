package com.dlu.controller;

import com.dlu.dto.UserDTO;
import com.dlu.pojo.*;
import com.dlu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private ApplicationService applicationService;



    /**
     * 用户登录检查
     * @param userDTO
     * @param httpSession
     * @return
     */
    @RequestMapping("loginChecking")
    @ResponseBody
    public Map<String,Integer> loginChecking(@RequestBody UserDTO userDTO,HttpSession httpSession){
        User user =  userService.login(userDTO);
        Map<String,Integer> map = new HashMap<>();
        if (user!=null){
            if(user.getUserLoginName().equals(userDTO.getUserLoginName())&&
                    user.getUserPassword().equals(userDTO.getUserPassword())){
                //登陆成功
                httpSession.setAttribute("Username",user.getUserLoginName());
                map.put("code",200);
                return map;
            }
            else{
                //账号或密码不正确
                map.put("code",400);
                return map;
            }
        }
        else{
            //没有此用户
            map.put("code",404);
            return map;
        }
    }

    /**
     * 用户退出
     * @param httpSession
     * @return
     */
    @RequestMapping("/logout")
    @ResponseBody
    public Map<String,Integer> logout(HttpSession httpSession){
        httpSession.removeAttribute("Username");
        httpSession.invalidate();
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
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


    /**
     * 跳转到找房界面
     * @param provinceCode
     * @param cityCode
     * @return
     */
    @RequestMapping("/{provinceCode}/{cityCode}/queryHouse")
    public String queryHouse(@PathVariable("provinceCode") String provinceCode, @PathVariable("cityCode") String cityCode
            , Model model  ){
        String provinceName = regionService.queryProvinceNameByProvinceCode(provinceCode);
        String cityName = regionService.queryCityNameByCityCode(cityCode);
        //查询地区
        List<District> districtList = regionService.queryDistrictByCity(cityCode);
        //查询朝向
        List<Orientation> orientationList = houseSettingsService.queryAllOrientation();
        model.addAttribute("provinceName",provinceName);
        model.addAttribute("cityName",cityName);
        model.addAttribute("provinceCode",provinceCode);
        model.addAttribute("cityCode",cityCode);
        model.addAttribute("district",districtList);
        model.addAttribute("orientation",orientationList);
        return "user/queryHouse/queryHouse";
    }

    /**
     * 跳转到选择城市界面
     * @return
     */

    @RequestMapping("/chooseCity")
    public String chooseCity(){
        return "user/queryHouse/chooseCity";
    }


    /**
     * 跳转到我的房源信息界面
     * @param houseId
     * @param username
     * @param createName
     * @return
     */
    @RequestMapping("/toHouseInfo/{username}/{createName}/{houseId}")
    public String toHouseInfo(@PathVariable("houseId") Integer houseId,@PathVariable("username") String username,@PathVariable("createName") String createName){
        //查询是否已经申请过
        int exist = applicationService.queryIsExist(houseId,username);
        if (exist == 0) {
            Application application = new Application(houseId, createName, username, "已发送申请", new Date());
            applicationService.addApplication(application);
        }
        return "redirect:/user/application/" + username;
    }

    /**
     * 跳转到房源信息界面
     * @return
     */
    @RequestMapping("/application/{name}")
    public String application(){
        return "user/house/application";
    }


    /**
     * 退出跳转到主界面
     * @return
     */
    @RequestMapping("/quit")
    public String quit(HttpSession httpSession){
        httpSession.removeAttribute("Username");
        httpSession.invalidate();
        return "redirect:/user/toIndex";
    }


    /**
     * 跳转到主页面
     * @return
     */
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "index";
    }

    /**
     * 跳转到合同页面
     * @return
     */
    @RequestMapping("/contract/{name}")
    public String contract(){
        return "user/contract/contractMsg";
    }


    /**
     * 跳转到收入支出界面
     * @return
     */
    @RequestMapping("/money/{name}")
    public String money(){
        return "user/money/moneyMsg";
    }


    /**
     * 跳转到房源信息界面
     * @return
     */
    @RequestMapping("/houseInfo/{name}")
    public String houseInfo(){
        return "user/house/houseInfo";
    }


}
