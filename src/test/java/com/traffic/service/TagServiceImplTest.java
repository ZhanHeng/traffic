package com.traffic.service;

import com.traffic.model.Tag;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * TagService测试类
 * Created by lenovo on 2016/11/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TagServiceImplTest {
    @Autowired
    private TagService tagService;
    @Test
    public void add() throws Exception {
        String name = "组织机构";
        int level = 1 ;
        int pass = 1;
        Tag tag = new Tag(name,level,pass);
        tagService.add(tag);
    }

}