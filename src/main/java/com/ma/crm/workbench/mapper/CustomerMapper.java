package com.ma.crm.workbench.mapper;

import com.ma.crm.workbench.bean.Customer;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.mapper
 * @Description: java接口作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/20 18:20
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface CustomerMapper extends Mapper<Customer> {
    List<Customer> queryCustomer(Customer customer);
}
