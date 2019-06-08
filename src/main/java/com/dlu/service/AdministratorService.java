package com.dlu.service;


import com.dlu.dto.AdministratorLoginDTO;
import com.dlu.pojo.Administrator;

import java.util.List;

public interface AdministratorService {
    Administrator login(AdministratorLoginDTO administrator);

    List<Administrator> queryAllAdministratorName();

    int check(Administrator administrator);

    void add(Administrator administrator);
}
