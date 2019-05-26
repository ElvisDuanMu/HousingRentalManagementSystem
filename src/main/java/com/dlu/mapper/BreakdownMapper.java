package com.dlu.mapper;


import com.dlu.dto.BreakdownDTO;
import com.dlu.pojo.Breakdown;
import com.dlu.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BreakdownMapper {


    void addBreakdown(Breakdown breakdown);

    int queryBreakDownByIdCount(Integer id);

    List<Breakdown> queryBreakDownById(@Param("id") Integer id, @Param("page") Page page);

    int queryBreakDownByPartALoginNameCount(String partALoginName);

    List<Breakdown> queryBreakDownByPartALoginName(@Param("partALoginName") String partALoginName, @Param("page") Page page);

    void updateMsg(Breakdown breakdown);

    int queryListCount(BreakdownDTO breakdownDTO);

    List<Breakdown> queryList(@Param("breakdownDTO") BreakdownDTO breakdownDTO, @Param("page") Page page);
}