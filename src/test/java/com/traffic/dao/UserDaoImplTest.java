package com.traffic.dao;

import com.traffic.model.UserInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.*;

/**
 * Created by lenovo on 2016/11/16.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class UserDaoImplTest {
    @Autowired
    private UserDao userDao;
    @Test
    public void findById() throws Exception {

    }

    @Test
    public void add() throws Exception {
        UserInfo userInfo = new UserInfo("zh","123456");
        userDao.add(userInfo);
    }

}