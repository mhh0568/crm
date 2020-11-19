package com.ma.crm.settings.service;

import com.ma.crm.settings.bean.User;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.settings.service
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/16 19:09
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */

public interface UserService {
    User queryUser(User user);

    //查询所有user信息
    List<User> queryAllUser();
}
