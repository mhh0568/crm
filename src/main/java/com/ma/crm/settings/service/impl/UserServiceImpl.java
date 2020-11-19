package com.ma.crm.settings.service.impl;

import com.ma.crm.base.constants.CrmExceptionEnum;
import com.ma.crm.base.exception.CrmException;
import com.ma.crm.base.utils.MD5Util;
import com.ma.crm.settings.bean.User;
import com.ma.crm.settings.mapper.UserMapper;
import com.ma.crm.settings.service.UserService;
import com.ma.crm.base.utils.DateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.settings.service.impl
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/16 19:09
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User queryUser(User user) {
        String ip = user.getAllowIps();

        String pwd = MD5Util.getMD5(user.getLoginPwd());//MD5加密后的密码
        user.setLoginPwd(pwd);
        user.setAllowIps("");

        user = userMapper.selectOne(user);
        if(user==null){
            //用户名或密码错误
            throw new CrmException(CrmExceptionEnum.LOGIN_ACCOUNT_ERROR);
        }else{
            if (DateTimeUtil.getSysTime().compareTo(user.getExpireTime())>0){
            //账号过期
                throw new CrmException(CrmExceptionEnum.LOGIN_ACCOUNT_EXPIRE);
            }
            if ("0".equals(user.getLockState())){
            //账号不可用
                throw new CrmException(CrmExceptionEnum.LOGIN_ACCOUNT_LOCKED);
            }
            if (!"".equals(user.getAllowIps())){
                if (!user.getAllowIps().contains(ip)){
                    //该机器ip地址不可用
                    throw new CrmException(CrmExceptionEnum.LOGIN_ACCOUNT_IP);
                }
            }

        }


        return user;
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }
}
