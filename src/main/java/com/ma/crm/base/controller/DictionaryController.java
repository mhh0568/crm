package com.ma.crm.base.controller;

import com.ma.crm.base.bean.DictionaryType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.base.controller
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/21 19:32
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@RestController//该类中的方法返回都是对象类型
public class DictionaryController {

    @RequestMapping("/dictionaryCache")
    public List<DictionaryType>  dictionaryCache(HttpSession session){
        ServletContext servletContext = session.getServletContext();
        List<DictionaryType> dictionaryTypes = (List<DictionaryType>) servletContext.getAttribute("dictionaryTypes");
        return dictionaryTypes;
    }


}
