package com.traffic.service;

import com.traffic.dao.PageDao;
import com.traffic.dto.Page;
import com.traffic.model.NewsAndNotice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZhanHeng on 2016/11/16.
 */
@Transactional
@Service
public class PageServiceImpl implements PageService {
    @Autowired
    private PageDao pageDao;

    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public List<NewsAndNotice> findNewsList(NewsAndNotice news, Page page) {
        return pageDao.findPageByProperty(news,page);
    }
}