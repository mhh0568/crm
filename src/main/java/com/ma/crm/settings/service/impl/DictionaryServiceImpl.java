package com.ma.crm.settings.service.impl;

import com.ma.crm.base.bean.DictionaryType;
import com.ma.crm.base.bean.DictionaryValue;
import com.ma.crm.settings.mapper.DictionaryTypeMapper;
import com.ma.crm.settings.mapper.DictionaryValueMapper;
import com.ma.crm.settings.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.settings.service.impl
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/21 19:38
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    private DictionaryTypeMapper dictionaryTypeMapper;

    @Autowired
    private DictionaryValueMapper dictionaryValueMapper;

    @Override
    public List<DictionaryType> queryDictionary() {
        //查询所有字典类型
        List<DictionaryType> dictionaryTypes = dictionaryTypeMapper.selectAll();
        //遍历字典类型 查询对应字段的字典值
        for (DictionaryType dictionaryType : dictionaryTypes) {
            Example example=new Example(DictionaryValue.class);
            //设置升序排列
            example.setOrderByClause("orderNo asc");
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("typeCode",dictionaryType.getCode());
            //与字典类型对应的字典值
            List<DictionaryValue> dictionaryValues = dictionaryValueMapper.selectByExample(example);
            //将字典值添加到对应的字典类型中
            dictionaryType.setDictionaryValues(dictionaryValues);
        }
        return dictionaryTypes;
    }
}
