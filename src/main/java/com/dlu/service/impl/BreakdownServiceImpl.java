package com.dlu.service.impl;

import com.dlu.dto.BreakdownDTO;
import com.dlu.mapper.BreakdownMapper;
import com.dlu.pojo.Breakdown;
import com.dlu.pojo.Page;
import com.dlu.service.BreakdownService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("breakdownService")
public class BreakdownServiceImpl implements BreakdownService {

    @Autowired
    private BreakdownMapper breakdownMapper;

    @Override
    public void addBreakdown(Breakdown breakdown) {
        breakdownMapper.addBreakdown(breakdown);
    }

    @Override
    public int queryBreakDownByIdCount(Integer id) {
        return breakdownMapper.queryBreakDownByIdCount(id);
    }

    @Override
    public List<Breakdown> queryBreakDownById(Integer id, Page page) {
        return breakdownMapper.queryBreakDownById(id,page);
    }

    @Override
    public int queryBreakDownByPartALoginNameCount(String partALoginName) {
        return breakdownMapper.queryBreakDownByPartALoginNameCount(partALoginName);
    }

    @Override
    public List<Breakdown> queryBreakDownByPartALoginName(String partALoginName, Page page) {
        return breakdownMapper.queryBreakDownByPartALoginName(partALoginName,page);
    }

    @Override
    public void updateMsg(Breakdown breakdown) {
        breakdownMapper.updateMsg(breakdown);
    }

    @Override
    public int queryListCount(BreakdownDTO breakdownDTO) {
        return breakdownMapper.queryListCount(breakdownDTO);
    }

    @Override
    public List<Breakdown> queryList(BreakdownDTO breakdownDTO, Page page) {
        return breakdownMapper.queryList(breakdownDTO,page);
    }
}
