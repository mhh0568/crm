package com.ma.crm.workbench.mapper;

import com.ma.crm.workbench.bean.Clue;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.mapper
 * @Description: java接口作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/21 21:46
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public interface ClueMapper extends Mapper<Clue> {

    List<Map<String, Object>> queryClue(Clue clue);

    Map<String, String> queryClueById(@Param("id") String id);

    Map<String,String> queryClueDetail(@Param("id") String id);
}
