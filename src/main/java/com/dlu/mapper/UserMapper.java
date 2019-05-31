package com.dlu.mapper;

import com.dlu.dto.QueryUserDTO;
import com.dlu.dto.UserDTO;
import com.dlu.pojo.Page;
import com.dlu.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    List<User> queryByNamePwd(UserDTO userDTO);

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

    void updatePassword(@Param("userLoginName") String userLoginName, @Param("password") String password);


    void updateImg(@Param("username") String username, @Param("relLocation") String relLocation);

    int queryUserCount(QueryUserDTO queryUserDTO);

    List<User> queryUser(@Param("queryUserDTO") QueryUserDTO queryUserDTO, @Param("page") Page page);

    void updateStatus(User user);
}