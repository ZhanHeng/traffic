package com.traffic.service;

import com.traffic.dao.NewsAndNoticeDao;
import com.traffic.enums.DataEnum;
import com.traffic.exception.DataAccessException;
import com.traffic.model.NewsAndNotice;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 新闻类Service
 * Created by ZhanHeng on 2016/11/11.
 */
@Transactional
@Service
public class NewsAndNoticeServiceImpl implements NewsAndNoticeService{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private NewsAndNoticeDao newsAndNoticeDao;
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public NewsAndNotice findById(String id) {
        return newsAndNoticeDao.findById(id);
    }
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public List<NewsAndNotice> findAll() {
        return newsAndNoticeDao.findAll();
    }

    public void save(NewsAndNotice newsAndNotice) throws DataAccessException{
         try {
             newsAndNoticeDao.save(newsAndNotice);
          }catch (Exception e){
              logger.error(e.getMessage(),e);
             throw new DataAccessException(e.getMessage());
          }
    }
    public void update(NewsAndNotice newsAndNotice) throws DataAccessException {
        try {
            if (newsAndNotice!=null){
                newsAndNoticeDao.update(newsAndNotice);
            }else{
                throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            throw new DataAccessException(e.getMessage());
        }
    }

    public void delete(NewsAndNotice newsAndNotice) throws DataAccessException {
         try {
              if (newsAndNotice!=null){
                  newsAndNoticeDao.delete(newsAndNotice);
              }else{
                  throw new DataAccessException(DataEnum.DATA_ERROR.getStateInfo());
              }
          }catch (Exception e){
              logger.error(e.getMessage(),e);
             throw new DataAccessException(e.getMessage());
          }
    }
}
