package com.ma.crm.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.base.controller
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/16 21:34
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
public class ViewController {
    @RequestMapping({"/toView/{view}","/toView/{modalview}/{view}"})
    public String toView(@PathVariable(name = "modalview",required = false) String modalview ,
                         @PathVariable(name = "view") String view){
        if(modalview==null){
            return view;
        }else{
            return modalview+ File.separator+view;
        }


    }
}
