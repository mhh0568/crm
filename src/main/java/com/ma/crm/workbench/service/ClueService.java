package com.ma.crm.workbench.service;

import com.ma.crm.settings.bean.User;
import com.ma.crm.workbench.bean.*;

import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.service
 * @Description: java接口作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/21 21:45
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface ClueService {
    void saveClue(Clue clue);

    List<Map<String,Object>> queryClue(Clue clue);

    Map<String,String> queryClueById(String id);

    void updateClue(Clue clue);

    void deleteClueById(String idstr);

    Clue queryClueDetail(String id);

    void saveClueRemark(ClueRemark clueRemark);

    void updateClueRemark(ClueRemark clueRemark, User user);

    void deleteClueRemark(String id);

    void deleteClueActivityRelation(ClueActivityRelation clueActivityRelation);

    List<Activity> queryActivityById(String clueId,String name);

    List<Activity> queryBindActivity(ClueActivityRelation clueActivityRelation);

    void addBindRelation(ClueActivityRelation clueActivityRelation, String activityIds);

    void saveConvertClue(Tran tran, String isCreateTransaction, String id,User user);
}
