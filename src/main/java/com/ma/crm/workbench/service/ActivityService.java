package com.ma.crm.workbench.service;

import com.ma.crm.workbench.bean.Activity;
import com.ma.crm.workbench.bean.ActivityQueryVo;

import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.service
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/17 17:03
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */

public interface ActivityService {
    List<Map<String,String>> queryAllActivity(ActivityQueryVo queryVo);

    void saveActivity(Activity activity);

    Activity queryActivityById(String id);

    void updateActivity(Activity activity);

    void deleteActivity(String idstr);
}
