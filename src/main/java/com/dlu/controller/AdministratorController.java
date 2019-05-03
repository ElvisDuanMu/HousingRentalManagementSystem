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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/administrator")
public class AdministratorController {

    @Autowired
    private AdministratorService administratorService;
    @Autowired
    private HouseSettingsService houseSettingsService;
    @Autowired
    private RegionService regionService;


    @RequestMapping("loginChecking")
    @ResponseBody
    public Map<String,Integer> loginChecking(@RequestBody AdministratorLoginDTO administratorLoginDTO, HttpSession httpSession){
        Administrator administrator =  administratorService.login(administratorLoginDTO);
        Map<String,Integer> map = new HashMap<>();
        if (administrator!=null){
            if(administrator.getAdministratorName().equals(administratorLoginDTO.getAdministratorName())&&
                    administrator.getAdministratorPassword().equals(administratorLoginDTO.getAdministratorPassword())){
                //登陆成功
                httpSession.setAttribute("AdUserName",administrator.getAdministratorName());
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

    /**
     * 跳转到合同信息界面
     * @return
     */
    @RequestMapping("/{name}/toContractMsg")
    public String toContractMsg(){
        return "administrator/contract/queryContract";
    }

    /**
     * 跳转到审核合同信息界面
     * @return
     */
    @RequestMapping("/{name}/toCheckContract")
    public String toCheckContract(){
        return "administrator/contract/examiningContract";
    }

    /**
     * 跳转到现场确认合同信息界面
     * @return
     */
    @RequestMapping("/{name}/toSiteConfirmationContract")
    public String toSiteConfirmationContract(){
        return "administrator/contract/siteConfirmation";
    }


    /**
     * 管理员退出
     * @param httpSession
     * @return
     */
    @RequestMapping("/quit")
    public String quit(HttpSession httpSession){
        httpSession.removeAttribute("AdUsername");
        httpSession.invalidate();
        return "redirect:/administrator/toIndex";
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
     * 跳转到正在租赁页面
     * @return
     */
    @RequestMapping("{name}/toHouseTransferMsg")
    public String toHouseTransferMsg(Model model){
        //查询所有的省
        List<Province> provinceList = regionService.queryAllProvince();
        model.addAttribute("province",provinceList);
        return "administrator/houseTransfer/houseTransferMsg";
    }


}
