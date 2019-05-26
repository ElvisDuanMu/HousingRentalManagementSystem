package com.dlu.mapper;

import com.dlu.pojo.Application;
import com.dlu.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ApplicationMapper {
    void addApplication(Application application);

    int queryCount(@Param("name") String name);

    List<Application> query(@Param("name")String name, @Param("page") Page page);

    int queryOtherCount(@Param("name") String name);

    List<Application> queryOther(@Param("name") String name,@Param("page") Page page);

    int acceptApplication(Application application);

    int queryIsExist(@Param("houseId") Integer houseId,@Param("username") String username);

    int queryOtherApplicationCount(@Param("houseId") Integer houseId, @Param("partBLoginName") String partBLoginName);

    List<Integer> queryOtherApplicationId(@Param("houseId") Integer houseId, @Param("partBLoginName") String partBLoginName);

    void updateOtherApplicationStatus(Application application);

    int queryFinishCount(String name);

    List<Application> queryFinish(@Param("name") String name,@Param("page") Page page);

    void undoApplication(Integer id);
}
