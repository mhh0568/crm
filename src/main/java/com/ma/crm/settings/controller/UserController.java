package com.ma.crm.settings.controller;

import com.ma.crm.base.constants.CrmConstants;
import com.ma.crm.base.exception.CrmException;
import com.ma.crm.settings.bean.User;
import com.ma.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.settings.controller
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/16 19:08
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/settings/user/login")
    public String login(User user, Model model, HttpServletRequest request, HttpSession session){
        String ip = request.getRemoteAddr();
        //String host = request.getRemoteHost();
        //System.out.println(ip);
        //System.out.println(host);
        user.setAllowIps(ip);
        try{
            user = userService.queryUser(user);
            session.setAttribute(CrmConstants.LOGIN_USER,user);
        }catch (CrmException e){
            request.setAttribute("mess",e.getMessage());
            return "../../login";
        }
        return "index";

    }
}
