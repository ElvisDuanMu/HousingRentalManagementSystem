package com.dlu.service;


import com.dlu.pojo.Administrator;

import java.util.List;

public interface AdministratorService {
    Administrator login(Administrator administrator);

    List<Administrator> queryAllAdministratorName();
}
