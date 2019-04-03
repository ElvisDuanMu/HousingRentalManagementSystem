package com.dlu.mapper;

import com.dlu.pojo.Administrator;

import java.util.List;

public interface AdministratorMapper {

    /**
     * 查询管理员的帐号与密码
     * @param administrator
     * @return
     */
    List<Administrator> queryByNamePwd(Administrator administrator);

    /**
     * 查询所有管理员名称
     * @return
     */
    List<Administrator> queryAllAdministratorName();
}