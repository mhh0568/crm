package com.ma.crm.settings.service;

import com.ma.crm.base.bean.DictionaryType;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.settings.mapper
 * @Description: java接口作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/21 19:37
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface DictionaryService {
    List<DictionaryType> queryDictionary();
}
