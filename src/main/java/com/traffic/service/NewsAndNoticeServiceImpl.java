package com.traffic.service;

import com.traffic.dao.NewsAndNoticeDao;
import com.traffic.exception.DataAccessException;
import com.traffic.model.NewsAndNotice;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZhanHeng on 2016/11/11.
 */
@Service
public class NewsAndNoticeServiceImpl implements NewsAndNoticeService{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private NewsAndNoticeDao newsAndNoticeDao;

    public NewsAndNotice findById(String id) {
        return newsAndNoticeDao.findById(id);
    }

    public List<NewsAndNotice> findAll() {
        return newsAndNoticeDao.findAll();
    }

    @Transactional
    public Integer save(NewsAndNotice newsAndNotice) throws DataAccessException{
         try {
            int result = newsAndNoticeDao.save(newsAndNotice);
             if(result<=0){
                 throw new DataAccessException("空数据异常");
             }else{
                 return result;
             }
          }catch (Exception e){
              logger.error(e.getMessage(),e);
             throw new DataAccessException(e.getMessage());
          }
    }
    @Transactional
    public void update(NewsAndNotice newsAndNotice) throws DataAccessException {
        try {
            if (newsAndNotice!=null){
                newsAndNoticeDao.update(newsAndNotice);
            }else{
                throw new DataAccessException("空数据异常");
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            throw new DataAccessException(e.getMessage());
        }
    }
    @Transactional
    public void delete(NewsAndNotice newsAndNotice) throws DataAccessException {
         try {
              if (newsAndNotice!=null){
                  newsAndNoticeDao.delete(newsAndNotice);
              }else{
                  throw new DataAccessException("空数据异常");
              }
          }catch (Exception e){
              logger.error(e.getMessage(),e);
             throw new DataAccessException(e.getMessage());
          }
    }

    public List<NewsAndNotice> findByCategoryId(String categoryId) {
        return newsAndNoticeDao.findByCategoryId(categoryId);
    }
}
