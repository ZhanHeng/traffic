package com.traffic.service;

import com.alibaba.druid.support.logging.Log;
import com.traffic.dao.UserDao;
import com.traffic.dto.Execution;
import com.traffic.enums.DataEnum;
import com.traffic.enums.LoginEnum;
import com.traffic.exception.DataAccessException;
import com.traffic.model.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.List;

/**
 * Created by lenovo on 2016/11/11.
 */
@Service
public class UserServiceImpl implements UserService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    //MD5盐值字符串,用来混淆md5
    private final String slat = "zn)*~ADFiouxcioa#!$sfasm^&^^.^^!)SCAdnc#(*$!*$!~#~(wefaA&BDs^XPSDFAQOa)*~ADFioufdj";

    @Autowired
    private UserDao userDao;

    private String getMD5(String psw) {
        String base = psw + "/" + slat;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }

    public List<UserInfo> findAll() {
        return userDao.findAll();
    }

    @Transactional
    public int add(UserInfo userInfo) throws DataAccessException {
        try {
            int result = userDao.add(userInfo);
            if (result <= 0) {
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            } else {
                return result;
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new DataAccessException(e.getMessage());
        }
    }

    public void update(UserInfo userInfo) throws DataAccessException {
        try {
            if (userInfo != null) {
                userDao.update(userInfo);
            } else {
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new DataAccessException(e.getMessage());
        }
    }

    public void delete(UserInfo userInfo) throws DataAccessException {
        try {
            if (userInfo != null) {
                userDao.delete(userInfo);
            } else {
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new DataAccessException(e.getMessage());
        }
    }
    @Transactional
    public Execution validate(UserInfo userInfo) throws DataAccessException {
        try {
            if(userInfo==null){
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            }else{
                String md5 = getMD5(userInfo.getPassWord());
                List<UserInfo> list = userDao.findByNameAndPassword(userInfo.getUserName(),md5);
                if(list!=null){ //验证成功
                     UserInfo user = list.get(0);
                     return new Execution(LoginEnum.SUCCESS,user);
                }else{//验证失败
                     return new Execution(LoginEnum.LOGIN_ERROR);
                }
            }
        } catch (DataAccessException e) {
            logger.error(e.getMessage(), e);
            throw e;
        }catch (Exception e){
            throw new DataAccessException(e.getMessage());
        }
    }
}
