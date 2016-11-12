package com.traffic.service;

import com.traffic.dao.TagDao;
import com.traffic.dto.Execution;
import com.traffic.enums.DataEnum;
import com.traffic.enums.LoginEnum;
import com.traffic.exception.DataAccessException;
import com.traffic.model.Tag;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZhanHeng on 2016/11/12.
 */
@Service
public class TagServiceImpl implements TagService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TagDao tagDao ;

    public Tag findById(String id) {
        return tagDao.findById(id);
    }

    public List<Tag> findAll() {
        return tagDao.findAll();
    }

    public Execution add(Tag tag) throws DataAccessException {
        try {
            if (tag!=null){
                    tagDao.save(tag);   //添加到数据库
                    return new Execution(LoginEnum.INSERT_SUCCESS);
            }else{
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new DataAccessException(e.getMessage());
        }
    }

    public void delete(Tag tag) throws DataAccessException {
        try {
            if (tag != null) {
                tagDao.delete(tag);
            } else {
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new DataAccessException(e.getMessage());
        }
    }

    public void update(Tag tag) throws DataAccessException {
        try {
            if (tag != null) {
                tagDao.update(tag);
            } else {
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new DataAccessException(e.getMessage());
        }
    }

    public List<Tag> findByLevel(int level) {
        return null;
    }
}
