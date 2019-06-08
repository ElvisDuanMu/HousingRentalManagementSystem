package com.dlu.service.impl;

import com.dlu.dto.AdministratorLoginDTO;
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
     * @param administratorLoginDTO
     * @return
     */
    @Override
    public Administrator login(AdministratorLoginDTO administratorLoginDTO) {
        List<Administrator> administratorList = administratorMapper.queryByNamePwd(administratorLoginDTO);
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

    @Override
    public int check(Administrator administrator) {
        return administratorMapper.check(administrator);
    }

    @Override
    public void add(Administrator administrator) {
        administratorMapper.add(administrator);
    }
}
