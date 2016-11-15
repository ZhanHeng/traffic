package com.traffic.service;

import com.traffic.dao.UserDao;
import com.traffic.dto.Execution;
import com.traffic.model.UserInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * 用户测试类
 * Created by ZhanHeng on 2016/11/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class UserServiceImplTest {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userService;

    @Test
    public void add() throws Exception {
        UserInfo userInfo = new UserInfo("admin","123456");
        userService.add(userInfo);
    }

    @Test
    public void update() throws Exception {
        List<UserInfo> list = userService.findByName("admin");
        if (list!=null){
            UserInfo userInfo = list.get(0);
            userInfo.setPassWord("root");
            userService.update(userInfo);
        }
    }

    @Test
    public void delete() throws Exception {
        String uname = "admin";
        String password = "123456";
        UserInfo user = new UserInfo(uname,password);
    }

    @Test
    public void validate() throws Exception {
        String uname = "admin";
        String password = "123456";
        UserInfo user = new UserInfo(uname,password);
        Execution execution = userService.validateUser(user);
    }

}