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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.List;

/**
 * Created by lenovo on 2016/11/11.
 */
@Transactional
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
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public List<UserInfo> findByName(String name) throws DataAccessException  {
         try {
             if(name!=null){
                 List<UserInfo> list =userDao.findByName(name);
                 return list;
             }else{
                 throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
             }
          }catch (Exception e){
              logger.error(e.getMessage(),e);
             throw new DataAccessException(e.getMessage());
          }
    }
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public List<UserInfo> findAll() {
        return userDao.findAll();
    }

    public Execution add(UserInfo userInfo) throws DataAccessException {
        try {
            if (userInfo!=null){
                List<UserInfo> list = userDao.findByName(userInfo.getUserName());
                if(list!=null&&!list.isEmpty()){ //用户名已存在
                    return new Execution(LoginEnum.REPEAT_NAME);
                }else{
                    UserInfo user = new UserInfo(userInfo.getUserName(),getMD5(userInfo.getPassWord()).toString());
                    userDao.add(user); //添加到数据库
                    return new Execution(LoginEnum.INSERT_SUCCESS);
                }
            }else{
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new DataAccessException(e.getMessage());
        }
    }

    public void update(UserInfo userInfo) throws DataAccessException {
        try {
            if (userInfo != null) {
                UserInfo user = new UserInfo(userInfo.getUserName(),getMD5(userInfo.getPassWord()).toString());
                userDao.update(user);
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

    public Execution validateUser(UserInfo userInfo) throws DataAccessException {
        try {
            if(userInfo==null){
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            }else{
                String md5 = getMD5(userInfo.getPassWord());
                List<UserInfo> list = userDao.findByNameAndPassword(userInfo.getUserName(),md5);
                if(list!=null&&list.size()>0){ //验证成功
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
