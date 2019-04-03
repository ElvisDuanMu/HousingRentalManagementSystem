package com.dlu.service.impl;

import com.dlu.mapper.AdministratorMapper;
import com.dlu.pojo.Administrator;
import com.dlu.service.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("administratorService")
public class AdministratorServiceImpl implements AdministratorService {

    @Autowired
    private AdministratorMapper administratorMapper;

    /**
     * 管理员登陆
     * @param administrator
     * @return
     */
    @Override
    public Administrator login(Administrator administrator) {
        List<Administrator> administratorList = administratorMapper.queryByNamePwd(administrator);
        if ( administratorList != null && administratorList.size() == 1){
            return administratorList.get(0);
        }
        else
            return null;
    }

    @Override
    public List<Administrator> queryAllAdministratorName() {

        return administratorMapper.queryAllAdministratorName();
    }
}
