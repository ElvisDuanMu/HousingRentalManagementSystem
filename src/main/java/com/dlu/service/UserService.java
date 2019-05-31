package com.dlu.service;


import com.dlu.dto.QueryUserDTO;
import com.dlu.dto.UserDTO;
import com.dlu.pojo.Page;
import com.dlu.pojo.User;

import java.util.List;

public interface UserService {
    User login(UserDTO userDTO);

    String queryImgByName(String userLoginName);

    int queryLoginName(String userLoginName);

    int queryEmail(String email);

    void addNewUser(User user);

    User queryViewMessage(String name);

    int queryQQ(User user);

    int queryWechat(User user);

    int queryPhone(User user);

    void updateMsg(User user);

    int queryEmailCount(User user);

    String queryPassword(String userLoginName);

    void updatePassword(String userLoginName, String password);

    void updateImg(String username, String relLocation);

    int queryUserCount(QueryUserDTO queryUserDTO);

    List<User> queryUser(QueryUserDTO queryUserDTO, Page page);



    void updateStatus(User user);
}
