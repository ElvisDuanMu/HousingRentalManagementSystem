package com.dlu.controller;

import com.dlu.dto.AdministratorLoginDTO;
import com.dlu.pojo.Administrator;
import com.dlu.pojo.HouseSettings;
import com.dlu.pojo.Province;
import com.dlu.service.AdministratorService;
import com.dlu.service.HouseSettingsService;
import com.dlu.service.RegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/administrator")
public class AdministratorController {

    @Autowired
    private AdministratorService administratorService;
    @Autowired
    private HouseSettingsService houseSettingsService;
    @Autowired
    private RegionService regionService;

    /**
     * 跳转管理员登陆界面
     * @return
     */
    @RequestMapping("toLogin")
    public String toLogin(){
        return "administrator/login";
    }

    /**
     * 管理员登录
     * @param httpSession
     * @param administrator
     * @param administratorLoginDTO
     * @return
     */
    @RequestMapping("login")
    public String login(HttpSession httpSession, Administrator administrator, AdministratorLoginDTO administratorLoginDTO,
                        Model model){
        administrator =  administratorService.login(administrator);
        if (administrator!=null){
            if(administrator.getAdministratorName().equals(administratorLoginDTO.getAdministratorName())&&
                    administrator.getAdministratorPassword().equals(administratorLoginDTO.getAdministratorPassword())){
                //登陆成功
                httpSession.setAttribute("AdUserName",administrator.getAdministratorName());
                return "redirect:/administrator/index/" + administrator.getAdministratorName();
            }
            else{
                //账号或密码不正确
                model.addAttribute("msg","1");
                return "administrator/login";
            }
        }
        else{
            //没有此用户
            model.addAttribute("msg","2");
            return "administrator/login";
        }

    }

    /**
     * 管理员进入登陆页面
     */
    @RequestMapping("/index/{name}")
    public String index(@PathVariable("name") String name){
        return "administrator/index";
    }


    /**
     * 跳转到房屋设置页面
     */
    @RequestMapping("/{name}/toHouseSettings")
    public String toHouseSettings(@PathVariable("name") String name,Model model){
        //查询所有类型名称
        List<HouseSettings> HSTypeName = houseSettingsService.queryAllTypeName();
        model.addAttribute("HSTypeName",HSTypeName);
        //查询所有管理员名称
        List<Administrator> administratorsList = administratorService.queryAllAdministratorName();
        model.addAttribute("AdName",administratorsList);
        return "administrator/houseSettings/houseSettings";
    }


    /**
     * 跳转到城市设置页面
     * @return
     */
    @RequestMapping("/{name}/toRegionSettings")
    public String toCityTest(Model model){
        //查询所有的省
        List<Province> provinceList = regionService.queryAllProvince();
        model.addAttribute("province",provinceList);
        return "administrator/RegionSettings/RegionSettings";
    }

    /**
     * 跳转增加房间设置界面
     * @param name
     * @return
     */
    @RequestMapping("/{name}/toAddNewSetting")
    public String toAddNewSetting(@PathVariable("name") String name,Model model){
        //查询所有类型名称
        List<HouseSettings> HSTypeName = houseSettingsService.queryAllTypeName();
        model.addAttribute("HSTypeName",HSTypeName);
        return "administrator/houseSettings/addNewSetting";
    }

    /**
     * 跳转到增加房间设施界面
     */
    @RequestMapping("/{name}/toAddFacility")
    public String toAddFacility(){

        return "administrator/houseSettings/addNewFacility";
    }

    /**
     * 跳转到房间设施界面
     */
    @RequestMapping("/{name}/toFacilitySetting")
    public String toFacilitySetting(){

        return "administrator/houseSettings/facilitySettings";
    }

    /**
     * 跳转到房源信息界面
     * @return
     */
    @RequestMapping("/{name}/toHouseInfo")
    public String toHouseInfo(){

        return "administrator/houseInfo/houseInfo";
    }

    /**
     * 跳转到审核房源界面
     * @return
     */

    @RequestMapping("/{name}/toExaminingHouse")
    public String toExaminingHouse(){
        return "administrator/houseInfo/examiningHouse";
    }



}
