package com.dlu.mapper;

import com.dlu.dto.AdministratorLoginDTO;
import com.dlu.pojo.Administrator;

import java.util.List;

public interface AdministratorMapper {

    /**
     * 查询管理员的帐号与密码
     * @param administratorLoginDTO
     * @return
     */
    List<Administrator> queryByNamePwd(AdministratorLoginDTO administratorLoginDTO);

    /**
     * 查询所有管理员名称
     * @return
     */
    List<Administrator> queryAllAdministratorName();
}