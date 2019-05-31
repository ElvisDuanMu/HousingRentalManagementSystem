package com.dlu.service.impl;

import com.dlu.dto.QueryUserDTO;
import com.dlu.dto.UserDTO;
import com.dlu.mapper.UserMapper;
import com.dlu.pojo.Page;
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
    public User login(UserDTO userDTO) {
        List<User> userList = userMapper.queryByNamePwd(userDTO);
        if ( userList != null && userList.size() == 1){
            return userList.get(0);
        }
        else
            return null;
    }

    @Override
    public String queryImgByName(String userLoginName) {
        return userMapper.queryImgByName(userLoginName);
    }

    @Override
    public int queryLoginName(String userLoginName) {
        return userMapper.queryLoginName(userLoginName);
    }

    @Override
    public int queryEmail(String email) {
        return userMapper.queryEmail(email);
    }

    @Override
    public void addNewUser(User user) {
        userMapper.addNewUser(user);
    }

    @Override
    public User queryViewMessage(String name) {
        return userMapper.queryViewMessage(name);
    }

    @Override
    public int queryQQ(User user) {
        return userMapper.queryQQ(user);
    }

    @Override
    public int queryWechat(User user) {
        return userMapper.queryWechat(user);
    }

    @Override
    public int queryPhone(User user) {
        return userMapper.queryPhone(user);
    }

    @Override
    public void updateMsg(User user) {
        userMapper.updateMsg(user);
    }

    @Override
    public int queryEmailCount(User user) {
        return userMapper.queryEmailCount(user);
    }

    @Override
    public String queryPassword(String userLoginName) {
        return userMapper.queryPassword(userLoginName);
    }

    @Override
    public void updatePassword(String userLoginName, String password) {
        userMapper.updatePassword(userLoginName,password);
    }

    @Override
    public void updateImg(String username, String relLocation) {
        userMapper.updateImg(username,relLocation);
    }

    @Override
    public int queryUserCount(QueryUserDTO queryUserDTO) {
        return userMapper.queryUserCount(queryUserDTO);

    }

    @Override
    public List<User> queryUser(QueryUserDTO queryUserDTO, Page page) {
        return userMapper.queryUser(queryUserDTO,page);

    }

    @Override
    public void updateStatus(User user) {
        userMapper.updateStatus(user);
    }

}
