package com.dlu.controller;

import com.dlu.dto.AdministratorLoginDTO;
import com.dlu.dto.QueryMoneyDTO;
import com.dlu.dto.QueryUserDTO;
import com.dlu.pojo.*;
import com.dlu.service.AdministratorService;
import com.dlu.service.HouseSettingsService;
import com.dlu.service.RegionService;
import com.dlu.service.UserService;
import com.google.gson.Gson;
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
    @Autowired
    private UserService userService;


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
    public String toRegionSettings(Model model){
        //查询所有的省
        List<Province> provinceList = regionService.queryAllProvince();
        model.addAttribute("province",provinceList);
        return "administrator/regionSettings/regionSettings";
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
    public String toHouseInfo(Model model){
        //查询所有的省
        List<Province> provinceList = regionService.queryAllProvince();
        model.addAttribute("province",provinceList);
        //查询所有的房源状态
        List<HouseStatus> houseStatusList = houseSettingsService.queryAllHouseStatus();
        model.addAttribute("houseStatus",houseStatusList);
        //查询所有的审核状态
        List<CheckStatus> checkStatusList = houseSettingsService.queryAllCheckStatus();
        model.addAttribute("checkStatus",checkStatusList);
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

    /**
     * 跳转到故障信息页面
     * @return
     */
    @RequestMapping("/{name}/toQueryBreakdown")
    public String toQueryBreakdown(){
        return "administrator/breakdown/queryBreakdown";
    }

    /**
     * 跳转到审核故障信息页面
     * @return
     */
    @RequestMapping("/{name}/toCheckBreakdown")
    public String toCheckBreakdown(){
        return "administrator/breakdown/checkBreakdown";
    }

    /**
     * 跳转到租金管理界面
     * @param model
     * @return
     */
    @RequestMapping("/{name}/toQueryMoney")
    public String toQueryMoney(Model model){
        //查询所有的省
        List<Province> provinceList = regionService.queryAllProvince();
        model.addAttribute("province",provinceList);
        return "administrator/money/money";
    }

    /**
     * 跳转到数据分析界面
     * @return
     */
    @RequestMapping("/{name}/toAnalysis")
    public String toAnalysis(Model model){
        //查询所有的省
        List<Province> provinceList = regionService.queryAllProvince();
        model.addAttribute("province",provinceList);
        return "administrator/analysis/analysis";
    }

    /**
     * 跳转到用户管理界面
     * @return
     */
    @RequestMapping("/{name}/toUser")
    public String toUser(){
        return "administrator/user/userMsg";
    }

    /**
     * 查询用户列表
     * @param queryUserDTO
     * @param page
     * @return
     */
    @RequestMapping("queryUser")
    @ResponseBody
    public String queryUser(QueryUserDTO queryUserDTO,Page page){
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        int count = userService.queryUserCount(queryUserDTO);
        List<User> list = userService.queryUser(queryUserDTO,page);
        Gson gson = new Gson();
        return gson.toJson(new PojoToJson("0","",String.valueOf(count),list));
    }

    /**
     * 管理员取消封停
     * @param id
     * @return
     */
    @RequestMapping("/cancel/{id}")
    @ResponseBody
    public Map<String,Integer> cancel(@PathVariable("id") Integer id){
        Map<String,Integer> map = new HashMap<>();
        User user = new User();
        user.setUserId(id);
        user.setUserStatus("激活");
        userService.updateStatus(user);
        map.put("code",200);
        return map;
    }

    /**
     * 管理员封停账号
     * @param id
     * @return
     */
    @RequestMapping("/ban/{id}")
    @ResponseBody
    public Map<String,Integer> ban(@PathVariable("id") Integer id){
        Map<String,Integer> map = new HashMap<>();
        User user = new User();
        user.setUserId(id);
        user.setUserStatus("封停");
        userService.updateStatus(user);
        map.put("code",200);
        return map;
    }


}
