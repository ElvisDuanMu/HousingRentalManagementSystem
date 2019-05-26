package com.dlu.service.impl;

import com.dlu.mapper.ApplicationMapper;
import com.dlu.pojo.Application;
import com.dlu.pojo.Page;
import com.dlu.service.ApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("applicationService")
public class ApplicationServiceImpl implements ApplicationService {
    @Autowired
    private ApplicationMapper applicationMapper;

    @Override
    public void addApplication(Application application) {


        applicationMapper.addApplication(application);
    }

    @Override
    public int queryCount(String name) {
        return applicationMapper.queryCount(name);
    }

    @Override
    public List<Application> query(String name, Page page) {
        return applicationMapper.query(name,page);
    }

    @Override
    public int queryOtherCount(String name) {
        return applicationMapper.queryOtherCount(name);
    }

    @Override
    public List<Application> queryOther(String name, Page page) {
        return applicationMapper.queryOther(name,page);
    }

    @Override
    public int acceptApplication(Application application) {

        return applicationMapper.acceptApplication(application);
    }

    @Override
    public int queryIsExist(Integer houseId, String username) {
        return applicationMapper.queryIsExist(houseId,username);
    }

    @Override
    public int queryOtherApplicationCount(Integer houseId, String partBLoginName) {
        return applicationMapper.queryOtherApplicationCount(houseId,partBLoginName);
    }

    @Override
    public List<Integer> queryOtherApplicationId(Integer houseId, String partBLoginName) {
        return applicationMapper.queryOtherApplicationId(houseId,partBLoginName);
    }

    @Override
    public void updateOtherApplicationStatus(Application application) {
        applicationMapper.updateOtherApplicationStatus(application);
    }

    @Override
    public int queryFinishCount(String name) {
        return applicationMapper.queryFinishCount(name);
    }

    @Override
    public List<Application> queryFinish(String name, Page page) {
        return applicationMapper.queryFinish(name,page);
    }

    @Override
    public void undoApplication(Integer id) {
         applicationMapper.undoApplication(id);
    }
}
