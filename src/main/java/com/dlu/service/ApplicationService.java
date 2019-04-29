package com.dlu.service;

import com.dlu.pojo.Application;
import com.dlu.pojo.Page;

import java.util.List;

public interface ApplicationService {
    void addApplication(Application application);

    int queryCount(String name);

    List<Application> query(String name, Page page);

    int queryOtherCount(String name);

    List<Application> queryOther(String name, Page page);

    int acceptApplication(Application application);

    int queryIsExist(Integer houseId, String username);

    int queryOtherApplicationCount(Integer houseId, String partBLoginName);

    List<Integer> queryOtherApplicationId(Integer houseId, String partBLoginName);

    void updateOtherApplicationStatus(Application application);

    int queryFinishCount(String name);

    List<Application> queryFinish(String name, Page page);
}
