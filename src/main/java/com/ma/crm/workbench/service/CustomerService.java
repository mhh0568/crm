package com.ma.crm.workbench.service;

import com.ma.crm.workbench.bean.Customer;

import java.util.List;


/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.service
 * @Description: java接口作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/20 18:19
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */

public interface CustomerService {
    void saveCustomer(Customer customer);

    List<Customer> queryCustomer(Customer customer);

    Customer queryCustomerById(String id);

    void updateCustomerById(Customer customer);

    void deleteCustomer(String idstr);
}
