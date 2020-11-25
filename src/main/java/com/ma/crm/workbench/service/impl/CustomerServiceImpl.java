package com.ma.crm.workbench.service.impl;

import com.ma.crm.base.constants.CrmExceptionEnum;
import com.ma.crm.base.exception.CrmException;
import com.ma.crm.base.utils.DateTimeUtil;
import com.ma.crm.base.utils.UUIDUtil;
import com.ma.crm.workbench.bean.Customer;
import com.ma.crm.workbench.mapper.CustomerMapper;
import com.ma.crm.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.service.impl
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/20 18:19
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    @Override
    public void saveCustomer(Customer customer) {
        customer.setId(UUIDUtil.getUUID());
        customer.setCreateTime(DateTimeUtil.getSysTime());
        customer.setEditTime(DateTimeUtil.getSysTime());
        int count = customerMapper.insertSelective(customer);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.CUSTOMER_INSERT_ERROR);
        }
    }

    @Override
    public List<Customer> queryCustomer(Customer customer) {
        return customerMapper.queryCustomer(customer);
    }

    @Override
    public Customer queryCustomerById(String id) {
        return customerMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateCustomerById(Customer customer) {
        customer.setEditTime(DateTimeUtil.getSysTime());

        //普通方式
        //int count = customerMapper.updateByPrimaryKeySelective(customer);

        //example方式
        Example example=new Example(Customer.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("id",customer.getId());
        int count = customerMapper.updateByExampleSelective(customer, example);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.CUSTOMER_UPDATE_ERROR);
        }


    }

    @Override
    public void deleteCustomer(String idstr) {
        String[] ids = idstr.split(",");
        for (String id : ids) {
            int count = customerMapper.deleteByPrimaryKey(id);
            if(count==0){
                throw new CrmException(CrmExceptionEnum.CUSTOMER_DELETE_ERROR);
            }
        }

    }
}
