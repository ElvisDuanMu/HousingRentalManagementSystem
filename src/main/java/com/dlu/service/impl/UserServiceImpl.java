package com.dlu.service.impl;

import com.dlu.mapper.UserMapper;
import com.dlu.pojo.User;
import com.dlu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        List<User> userList = userMapper.queryByNamePwd(user);
        if ( userList != null && userList.size() == 1){
            return userList.get(0);
        }
        else
            return null;
    }
}
