package com.ma.crm;

import com.ma.crm.base.utils.DateTimeUtil;
import com.ma.crm.base.utils.MD5Util;
import com.ma.crm.base.utils.UUIDUtil;
import org.junit.Test;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/16 19:27
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */

public class TestCrm {
    @Test
    public void test01(){
        String uuid = UUIDUtil.getUUID();
        System.out.println(uuid);
    }


    @Test
    public void test02(){
        String zs = MD5Util.getMD5("ls");
        System.out.println(zs);
    }

    @Test
    public void test03(){
        String sysTime = DateTimeUtil.getSysTime();//>0  表示过期  <0表示未过期
        System.out.println(sysTime.compareTo("2089-12-12"));
    }
}
