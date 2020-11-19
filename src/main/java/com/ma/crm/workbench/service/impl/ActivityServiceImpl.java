package com.ma.crm.workbench.service.impl;

import com.ma.crm.base.constants.CrmExceptionEnum;
import com.ma.crm.base.exception.CrmException;
import com.ma.crm.base.utils.DateTimeUtil;
import com.ma.crm.base.utils.UUIDUtil;
import com.ma.crm.workbench.bean.Activity;
import com.ma.crm.workbench.bean.ActivityQueryVo;
import com.ma.crm.workbench.mapper.ActivityMapper;
import com.ma.crm.workbench.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.service.impl
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/17 17:04
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActivityMapper activityMapper;

    @Override
    public List<Map<String, String>> queryAllActivity(ActivityQueryVo queryVo) {
        return activityMapper.queryAllActivity(queryVo);
    }

    @Override
    public void saveActivity(Activity activity) {
        activity.setId(UUIDUtil.getUUID());
        activity.setCreateTime(DateTimeUtil.getSysTime());
        activity.setEditTime(DateTimeUtil.getSysTime());

        int count = activityMapper.insertSelective(activity);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.ACTIVITY_SAVE_ERROR);
        }


    }

    @Override
    public Activity queryActivityById(String id) {

        return activityMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateActivity(Activity activity) {
        activity.setEditTime(DateTimeUtil.getSysTime());
        int count = activityMapper.updateByPrimaryKeySelective(activity);
        if (count == 0) {
            throw new CrmException(CrmExceptionEnum.ACTIVITY_UPDATE_ERROR);
        }
    }

    @Override
    public void deleteActivity(String idstr) {
        String[] ids = idstr.split(",");
        for (String id : ids) {
            int count = activityMapper.deleteByPrimaryKey(id);
            if(count==0){
                //删除失败
                throw new CrmException(CrmExceptionEnum.ACTIVITY_DELETE_ERROR);
            }
        }

    }
}
