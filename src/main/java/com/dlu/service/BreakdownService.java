package com.dlu.service;


import com.dlu.dto.BreakdownDTO;
import com.dlu.pojo.Breakdown;
import com.dlu.pojo.Page;

import java.util.List;

public interface BreakdownService {
    void addBreakdown(Breakdown breakdown);

    int queryBreakDownByIdCount(Integer id);

    List<Breakdown> queryBreakDownById(Integer id, Page page);

    int queryBreakDownByPartALoginNameCount(String partALoginName);

    List<Breakdown> queryBreakDownByPartALoginName(String partALoginName, Page page);

    void updateMsg(Breakdown breakdown);

    int queryListCount(BreakdownDTO breakdownDTO);

    List<Breakdown> queryList(BreakdownDTO breakdownDTO, Page page);
}
