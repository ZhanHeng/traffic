package com.traffic.service;

import com.traffic.dto.Page;
import com.traffic.model.NewsAndNotice;

import java.util.List;

/**
 * page的Service
 * Created by ZhanHeng on 2016/11/16.
 */
public interface PageService {

    List<NewsAndNotice> findNewsList(NewsAndNotice news, Page page ,String tagPath);
    List<NewsAndNotice> findNewsListFront(Page page ,String tagPath);


}
