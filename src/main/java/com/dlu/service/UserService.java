package com.dlu.service;


import com.dlu.dto.UserDTO;
import com.dlu.pojo.User;

public interface UserService {
    User login(UserDTO userDTO);
}
