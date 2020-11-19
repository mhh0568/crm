package com.ma.crm.workbench.controller;

import com.github.pagehelper.Constant;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ma.crm.base.bean.MessageVo;
import com.ma.crm.base.bean.PaginationVo;
import com.ma.crm.base.constants.CrmConstants;
import com.ma.crm.base.exception.CrmException;
import com.ma.crm.settings.bean.User;
import com.ma.crm.settings.service.UserService;
import com.ma.crm.workbench.bean.Activity;
import com.ma.crm.workbench.bean.ActivityQueryVo;
import com.ma.crm.workbench.service.ActivityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.controller
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/17 17:00
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private UserService userService;


    //查询所有信息并分页  注意：该方法只能通过异步查询，否则返回的数据无法正常显示在页面上
    @RequestMapping("/workbench/queryAllActivity")
    public @ResponseBody PaginationVo queryAllActivity(@RequestParam(defaultValue = "1") int pageNo,
                                                       @RequestParam(defaultValue = "2") int pageSize,
                                                       //@RequestParam Map<String,Object> map
                                                       ActivityQueryVo queryVo){
        PageHelper.startPage(pageNo, pageSize);
        List<Map<String, String>> activities = activityService.queryAllActivity(queryVo);
        PageInfo<Map<String, String>> pageInfo=new PageInfo<>(activities);

        PaginationVo paginationVo=new PaginationVo(pageInfo);

        return paginationVo;
    }

    //查询所有user
    @RequestMapping("/workbench/queryAllUser")
    public @ResponseBody List<User> queryActivity(){
        List<User> users = userService.queryAllUser();
        return users;
    }

    /**
     * 向数据库中插入数据
     * 注意返回值 json解析 要注释@ResponseBody
     */

    @RequestMapping("/workbench/activity/saveActivity")
    public @ResponseBody MessageVo saveActivity(Activity activity, HttpSession session){
        User user = (User) session.getAttribute("user");
        //user.getName() 登录用户的用户名
        activity.setCreateBy(user.getName());
        activity.setEditBy(user.getName());
        //像前台传递信息 操作是否成功
        MessageVo messageVo=new MessageVo();
        try {
            activityService.saveActivity(activity);
            messageVo.setSuccess(true);
            messageVo.setMess("添加成功");
        }catch (CrmException e){
            //添加失败
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    /***
     * 通过Id查询activity信息
     * @param id Activity的Id号
     * @return activity对象 前台通过json解析
     */
    @RequestMapping("/workbench/activity/queryActivityById")
    public @ResponseBody Activity queryActivityById(String id){
        Activity activity=activityService.queryActivityById(id);
        return activity;
    }

    /***
     * 修改activity信息
     * @param activity 前台传过来的需要修改的参数
     * @param session 用于获取登陆的用户信息
     * @return messageVo 返回修改操作是否成功
     */
    @RequestMapping("/workbench/activity/updateActivity")
    @ResponseBody
    public MessageVo updateActivity(Activity activity,HttpSession session){
        User user= (User) session.getAttribute(CrmConstants.LOGIN_USER);
        activity.setEditBy(user.getName());
        MessageVo messageVo=new MessageVo();
        try{
            activityService.updateActivity(activity);
            messageVo.setSuccess(true);
            messageVo.setMess("修改成功");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    /***
     * 删除activity的信息
     * @param idstr 由id组成的字符串，以逗号分割
     * @return 删除操作是否成功
     */
    @RequestMapping("/workbench/activity/deleteActivity")
    @ResponseBody
    public MessageVo deleteActivity(String idstr){
        MessageVo messageVo = new MessageVo();
        try {
            activityService.deleteActivity(idstr);
            messageVo.setSuccess(true);
            messageVo.setMess("删除成功");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }
}
