package com.ma.crm.workbench.mapper;

import com.ma.crm.workbench.bean.Activity;
import com.ma.crm.workbench.bean.ActivityQueryVo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.mapper
 * @Description: java接口作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/17 17:05
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface ActivityMapper extends Mapper<Activity> {
    List<Map<String, String>> queryAllActivity(ActivityQueryVo queryVo);

    Activity queryActivityDetailById(@Param("id") String id);
}
