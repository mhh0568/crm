package com.ma.crm.base.exception;

import com.ma.crm.base.constants.CrmExceptionEnum;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.base.exception
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/16 19:52
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */

public class CrmException extends RuntimeException{
    private CrmExceptionEnum crmExceptionEnum;

    public CrmException(CrmExceptionEnum crmExceptionEnum) {
        super(crmExceptionEnum.getMessage());//将异常信息放到堆栈中
        this.crmExceptionEnum = crmExceptionEnum;
    }

    public CrmExceptionEnum getCrmExceptionEnum() {
        return crmExceptionEnum;
    }

    public void setCrmExceptionEnum(CrmExceptionEnum crmExceptionEnum) {
        this.crmExceptionEnum = crmExceptionEnum;
    }
}
