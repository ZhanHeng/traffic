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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZhanHeng on 2016/11/12.
 */
@Transactional
@Service
public class TagServiceImpl implements TagService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TagDao tagDao ;
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public Tag findById(String id) {
        return tagDao.findById(id);
    }
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public List<Tag> findAll() {
        return tagDao.findAll();
    }

    public Execution add(Tag tag) throws DataAccessException {
        try {
            if (tag!=null){
                List<Tag> list =  tagDao.findByName(tag.getTagName());
                if(list!=null&&!list.isEmpty()){ //此名称已存在
                    return new Execution(LoginEnum.REPEAT_NAME);
                }else{
                    tagDao.save(tag);   //添加到数据库
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
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public List<Tag> findByLevel(int level) throws DataAccessException{
        try {
            List<Tag> tagList = tagDao.findByLevel(level);
            return tagList;
        } catch (Exception e){
            logger.error(e.getMessage() , e );
            throw new DataAccessException(e.getMessage());
        }
    }
}
