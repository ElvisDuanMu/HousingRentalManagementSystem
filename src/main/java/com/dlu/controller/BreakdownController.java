package com.dlu.controller;

import com.dlu.dto.BreakdownDTO;
import com.dlu.pojo.Breakdown;
import com.dlu.pojo.Page;
import com.dlu.pojo.PojoToJson;
import com.dlu.service.BreakdownService;
import com.google.gson.Gson;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/breakdown")
@Controller
public class BreakdownController {


    @Autowired
    private BreakdownService breakdownService;

    /**
     * 添加新的报障信息
     * @param breakdown
     * @return
     */
    @RequestMapping("/addBreakdown")
    @ResponseBody
    public Map<String,Integer> addBreakdown(@RequestBody Breakdown breakdown){
        breakdown.setStatus("等待审核");
        breakdown.setCreateDate(new Date());
        breakdownService.addBreakdown(breakdown);
        Map<String,Integer> map= new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 查询房源报障信息
     * @param id
     * @param page
     * @return
     */
    @RequestMapping("/queryBreakdown/{id}")
    @ResponseBody
    public String queryBreakdown(@PathVariable("id") Integer id , Page page){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int count = breakdownService.queryBreakDownByIdCount(id);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<Breakdown> breakdownList = breakdownService.queryBreakDownById(id,page);
        if (breakdownList.size() != 0){
            for (Breakdown b :breakdownList) {
                b.setCreateDateString(simpleDateFormat.format(b.getCreateDate()));
                if (b.getSolveDate() != null){
                    b.setSolveDateString(simpleDateFormat.format(b.getSolveDate()));
                }
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),breakdownList));
    }

    /**
     * 查询处理报障信息
     * @param partALoginName
     * @param page
     * @return
     */
    @RequestMapping("/queryManageBreakdown/{partALoginName}")
    @ResponseBody
    public String queryManageBreakdown(@PathVariable("partALoginName") String partALoginName , Page page){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int count = breakdownService.queryBreakDownByPartALoginNameCount(partALoginName);
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<Breakdown> breakdownList = breakdownService.queryBreakDownByPartALoginName(partALoginName,page);
        if (breakdownList.size() != 0){
            for (Breakdown b :breakdownList) {
                b.setCreateDateString(simpleDateFormat.format(b.getCreateDate()));
                if (b.getSolveDate() != null){
                    b.setSolveDateString(simpleDateFormat.format(b.getSolveDate()));
                }
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),breakdownList));
    }

    /**
     * 甲方确认
     * @param id
     * @return
     */
    @RequestMapping("/partAConfirm/{id}")
    @ResponseBody
    public Map<String,Integer> partAConfirm(@PathVariable("id")Integer id){
        Breakdown breakdown = new Breakdown();
        breakdown.setStatus("处理中");
        breakdown.setId(id);
        breakdownService.updateMsg(breakdown);
        Map<String,Integer> map= new HashMap<>();
        map.put("code",200);
        return map;

    }

    /**
     * 乙方确认
     * @param id
     * @return
     */
    @RequestMapping("/partBConfirm/{id}")
    @ResponseBody
    public Map<String,Integer> partBConfirm(@PathVariable("id")Integer id){
        Breakdown breakdown = new Breakdown();
        breakdown.setStatus("已完成");
        breakdown.setId(id);
        breakdown.setSolveDate(new Date());
        breakdownService.updateMsg(breakdown);
        Map<String,Integer> map= new HashMap<>();
        map.put("code",200);
        return map;

    }


    /**
     * 管理员查看待审核的保障信息
     * @param breakdownDTO
     * @param page
     * @return
     */
    @RequestMapping("/queryCheckBreakdown")
    @ResponseBody
    public String queryCheckBreakdown(BreakdownDTO breakdownDTO,Page page){
        breakdownDTO.setStatus("等待审核");
        int count = breakdownService.queryListCount(breakdownDTO);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<Breakdown> breakdownList = breakdownService.queryList(breakdownDTO,page);
        if (breakdownList.size() != 0){
            for (Breakdown b :breakdownList) {
                b.setCreateDateString(simpleDateFormat.format(b.getCreateDate()));
                if (b.getSolveDate() != null){
                    b.setSolveDateString(simpleDateFormat.format(b.getSolveDate()));
                }
                if (b.getCheckDate() != null){
                    b.setCheckDateString(simpleDateFormat.format(b.getCheckDate()));
                }
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),breakdownList));
    }



    /**
     * 管理员查看保障信息
     * @param breakdownDTO
     * @param page
     * @return
     */
    @RequestMapping("/queryBreakdown")
    @ResponseBody
    public String queryBreakdown(BreakdownDTO breakdownDTO,Page page){
        int count = breakdownService.queryListCount(breakdownDTO);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //设置页码
        int start = page.getLimit()*(page.getPage()-1) ;
        page.setStart(start);
        page.setTotalRecord(count);
        List<Breakdown> breakdownList = breakdownService.queryList(breakdownDTO,page);
        if (breakdownList.size() != 0){
            for (Breakdown b :breakdownList) {
                b.setCreateDateString(simpleDateFormat.format(b.getCreateDate()));
                if (b.getSolveDate() != null){
                    b.setSolveDateString(simpleDateFormat.format(b.getSolveDate()));
                }
                if (b.getCheckDate() != null){
                    b.setCheckDateString(simpleDateFormat.format(b.getCheckDate()));
                }
            }
        }
        Gson gson = new Gson();
        return  gson.toJson(new PojoToJson("0","",String.valueOf(count),breakdownList));
    }


    /**
     * 管理员通过报障
     * @param id
     * @return
     */
    @RequestMapping("/acceptBreakdown/{id}/{name}")
    @ResponseBody
    public Map<String,Integer> acceptConfirm(@PathVariable("id") Integer id,@PathVariable("name") String name){
        Breakdown breakdown = new Breakdown();
        breakdown.setId(id);
        breakdown.setCheckName(name);
        breakdown.setStatus("等待甲方确认");
        breakdown.setCheckDate(new Date());
        //通过报障
        breakdownService.updateMsg(breakdown);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }


    /**
     * 管理员未通过报障
     * @param id
     * @return
     */
    @RequestMapping("/rejectBreakdown/{id}/{name}")
    @ResponseBody
    public Map<String,Integer> rejectBreakdown(@PathVariable("id") Integer id,@PathVariable("name") String name){
        Breakdown breakdown = new Breakdown();
        breakdown.setId(id);
        breakdown.setCheckName(name);
        breakdown.setStatus("审核未通过");
        breakdown.setCheckDate(new Date());
        //通过报障
        breakdownService.updateMsg(breakdown);
        Map<String,Integer> map = new HashMap<>();
        map.put("code",200);
        return map;
    }

    /**
     * 修改报障信息
     * @param breakdown
     * @return
     */
    @RequestMapping("/updateBreakdown")
    @ResponseBody
    public Map<String,Integer> updateBreakdown(@RequestBody Breakdown breakdown){

        breakdown.setStatus("等待审核");
        breakdown.setCreateDate(new Date());
        breakdownService.updateMsg(breakdown);
        Map<String,Integer> map= new HashMap<>();
        map.put("code",200);
        return map;
    }

}
