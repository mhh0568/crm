package com.ma.crm.settings.mapper;

import com.ma.crm.settings.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.settings.mapper
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/16 19:13
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */

public interface UserMapper extends Mapper<User> {
    List<User> queryAllUser();
}
