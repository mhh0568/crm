package com.ma.crm.workbench.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ma.crm.base.bean.MessageVo;
import com.ma.crm.base.bean.PaginationVo;
import com.ma.crm.base.constants.CrmConstants;
import com.ma.crm.base.exception.CrmException;
import com.ma.crm.settings.bean.User;
import com.ma.crm.workbench.bean.*;
import com.ma.crm.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.controller
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/21 21:43
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
public class ClueController {

    @Autowired
    private ClueService clueService;

    //添加线索信息
    @RequestMapping("/workbench/clue/saveClue")
    public @ResponseBody MessageVo saveClue(Clue clue, HttpSession session){
        User user = (User) session.getAttribute(CrmConstants.LOGIN_USER);
        clue.setCreateBy(user.getName());
        MessageVo messageVo=new MessageVo();
        try{
            clueService.saveClue(clue);
            messageVo.setSuccess(true);
            messageVo.setMess("线索添加成功！");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    @RequestMapping("/workbench/clue/queryClue")
    public @ResponseBody PaginationVo queryClue(@RequestParam(defaultValue = "1") int page,
                          @RequestParam(defaultValue = "2") int pageSize,
                          Clue clue){
        PageHelper.startPage(page,pageSize);
        List<Map<String, Object>> clues = clueService.queryClue(clue);
        PageInfo<Map<String, Object>> pageInfo=new PageInfo<>(clues);
        PaginationVo paginationVo=new PaginationVo(pageInfo);
        return paginationVo;
    }

    @RequestMapping("/workbench/clue/queryClueById")
    //不加@ResponseBody前台控制台会报：GET http://localhost:8080/crm/workbench/clue/queryClueById?id= 404 (Not Found)
    //无法返回查询到的数据
    public @ResponseBody Map<String, String> queryClueById(String id){
        Map<String, String> clue = clueService.queryClueById(id);
        return clue;
    }

    //修改线索信息
    @RequestMapping("/workbench/clue/updateClue")
    public @ResponseBody MessageVo updateClue(Clue clue,HttpSession session){
        User user = (User) session.getAttribute(CrmConstants.LOGIN_USER);
        clue.setEditBy(user.getName());
        MessageVo messageVo=new MessageVo();
        try{
            clueService.updateClue(clue);
            messageVo.setSuccess(true);
            messageVo.setMess("线索信息修改成功");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    @RequestMapping("/workbench/clue/deleteClue")
    public @ResponseBody MessageVo deleteClueById(String idstr){
        MessageVo messageVo=new MessageVo();
        try{
            clueService.deleteClueById(idstr);
            messageVo.setSuccess(true);
            messageVo.setMess("线索删除成功");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    //查询线索信息 及其相关信息
    @RequestMapping("/workbench/cluedetail/queryClueDetail")
    public String queryClueDetail(String id, HttpServletRequest request){
        Clue clue = clueService.queryClueDetail(id);
        request.setAttribute("clue",clue);
        return "/clue/detail";
    }

    //添加备注
    @RequestMapping("/workbench/clue/saveClueRemark")
    @ResponseBody
    public MessageVo saveClueRemark(ClueRemark clueRemark,HttpSession session){
        User user = (User) session.getAttribute(CrmConstants.LOGIN_USER);
        clueRemark.setCreateBy(user.getName());
        MessageVo messageVo = new MessageVo();
        try{
            clueService.saveClueRemark(clueRemark);
            messageVo.setSuccess(true);
            messageVo.setMess("线索备注添加成功！");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    //修改备注
    @RequestMapping("/workbench/clue/updateClueRemark")
    public @ResponseBody MessageVo updateClueRemark(ClueRemark clueRemark,HttpSession session){
        User user= (User) session.getAttribute(CrmConstants.LOGIN_USER);
        MessageVo messageVo=new MessageVo();
        try{
            clueService.updateClueRemark(clueRemark,user);
            messageVo.setSuccess(true);
            messageVo.setMess("线索备注修改成功！");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    //删除线索备注信息
    @RequestMapping("/workbench/clue/deleteClueRemark")
    @ResponseBody
    public MessageVo deleteClueRemark(String id){
        MessageVo messageVo=new MessageVo();
        try{
            clueService.deleteClueRemark(id);
            messageVo.setSuccess(true);
            messageVo.setMess("线索备注删除成功！");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    //解除关联关系
    @RequestMapping("/workbench/clue/unbindClueActivityRelation")
    @ResponseBody
    public MessageVo unbindClueActivityRelation(ClueActivityRelation clueActivityRelation){

        MessageVo messageVo=new MessageVo();
        try{
            clueService.deleteClueActivityRelation(clueActivityRelation);
            messageVo.setSuccess(true);
            messageVo.setMess("线索市场活动关联解除成功！");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    //查询没有关联的市场活动 可以根据name进行模糊查询
    @RequestMapping("/workbench/clue/queryActivity")
    @ResponseBody
    public List<Activity> queryActivity(String clueId,String name){
        List<Activity> activities=clueService.queryActivityById(clueId,name);
        return activities;
    }
    //绑定线索和市场活动
    @RequestMapping("workbench/clue/bindClueActivity")
    public @ResponseBody MessageVo bindClueActivity(ClueActivityRelation clueActivityRelation,String activityIds){
        MessageVo messageVo=new MessageVo();
        try{
            clueService.addBindRelation(clueActivityRelation,activityIds);
            messageVo.setSuccess(true);
            messageVo.setMess("线索与市场活动的关联关系关联成功！");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }


    //查询所有与该线索关联的市场信息
    @RequestMapping("/workbench/clue/queryBindActivity")
    @ResponseBody
    public List<Activity> queryBindActivity(ClueActivityRelation clueActivityRelation){
        List<Activity> activities = clueService.queryBindActivity(clueActivityRelation);
        return activities;
    }

    //转发视图
    @RequestMapping("/workbench/clue/toView")
    public String toView(Clue clue,HttpServletRequest request){
        request.setAttribute("clue",clue);
        return "forward:/toView/clue/convert";
    }

    @RequestMapping("/workbench/clue/convertClue")
    //注意：前台表单数据通过get方式提交 ，如果action属性中有参数会被直接覆盖，会丢失数据，没有参数会直接拼接  而post方式 是将参数放到请求体中不会丢失数据
    public String convertClue(Tran tran,String isCreateTransaction,String clueId,HttpSession session){
        User user = (User) session.getAttribute(CrmConstants.LOGIN_USER);
        clueService.saveConvertClue(tran,isCreateTransaction,clueId,user);
        if("1".equals(isCreateTransaction)){
            return "transaction/index";
        }else{
            return "customer/index";
        }

    }



}
