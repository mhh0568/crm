package com.ma.crm.workbench.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ma.crm.base.bean.MessageVo;
import com.ma.crm.base.bean.PaginationVo;
import com.ma.crm.base.constants.CrmConstants;
import com.ma.crm.base.exception.CrmException;
import com.ma.crm.settings.bean.User;
import com.ma.crm.workbench.bean.Customer;
import com.ma.crm.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.controller
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/20 18:18
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    //添加顾客
    @RequestMapping("/workbench/customer/saveCustomer")
    public @ResponseBody MessageVo saveCustomer(Customer customer, HttpSession session){
        User user= (User) session.getAttribute(CrmConstants.LOGIN_USER);
        customer.setCreateBy(user.getName());
        customer.setEditBy(user.getName());
        MessageVo messageVo = new MessageVo();
        try{
            customerService.saveCustomer(customer);
            messageVo.setSuccess(true);
            messageVo.setMess("顾客添加成功");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    @RequestMapping("/workbench/customer/queryCustomer")
    public @ResponseBody PaginationVo queryCustomer(@RequestParam(defaultValue = "1") int pageNo,
                              @RequestParam(defaultValue = "2") int pageSize,
                              Customer customer){

        PageHelper.startPage(pageNo,pageSize);
        List<Customer> customers = customerService.queryCustomer(customer);
        PageInfo<Customer> pageInfo = new PageInfo<>(customers);
        PaginationVo paginationVo = new PaginationVo(pageInfo);

        return paginationVo;

    }

    //根据id查询顾客
    @RequestMapping("/workbench/customer/queryCustomerById")
    public @ResponseBody Customer queryCustomerById(String id){
        return customerService.queryCustomerById(id);
    }

    @RequestMapping("/workbench/customer/updateCustomerById")
    public @ResponseBody MessageVo updateCustomerById(Customer customer ,HttpSession session){
        User user= (User) session.getAttribute(CrmConstants.LOGIN_USER);
        customer.setEditBy(user.getName());
        MessageVo messageVo=new MessageVo();
        try{
            customerService.updateCustomerById(customer);
            messageVo.setSuccess(true);
            messageVo.setMess("客户信息修改成功");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

    //删除客户信息-
    @RequestMapping("/workbench/customer/deleteCustomer")
    public @ResponseBody MessageVo deleteCustomer(String idstr){
        MessageVo messageVo=new MessageVo();
        try{
            customerService.deleteCustomer(idstr);
            messageVo.setSuccess(true);
            messageVo.setMess("客户信息删除成功");
        }catch (CrmException e){
            messageVo.setSuccess(false);
            messageVo.setMess(e.getMessage());
        }
        return messageVo;
    }

}
