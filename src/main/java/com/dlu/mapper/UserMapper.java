package com.dlu.mapper;

import com.dlu.dto.UserDTO;
import com.dlu.pojo.User;

import java.util.List;

public interface UserMapper {

    List<User> queryByNamePwd(UserDTO userDTO);
}