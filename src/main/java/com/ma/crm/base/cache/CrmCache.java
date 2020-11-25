package com.ma.crm.base.cache;

import com.ma.crm.base.bean.DictionaryType;
import com.ma.crm.settings.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.base.cache
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/21 19:13
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Component
public class CrmCache {

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private ServletContext servletContext;

    //服务器启动后初始化执行方法
    @PostConstruct
    public void dictionaryCache(){
        //调取业务层方法查询字典信息
        List<DictionaryType> dictionaryTypes = dictionaryService.queryDictionary();
        //将查到的字典信息放到ServletContext域中
        servletContext.setAttribute("dictionaryTypes",dictionaryTypes);
    }
}
