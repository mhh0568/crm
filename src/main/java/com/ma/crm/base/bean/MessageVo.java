package com.ma.crm.base.bean;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.base.bean
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/18 11:16
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */

public class MessageVo {
    private boolean isSuccess;
    private String mess;



    @Override
    public String toString() {
        return "Messgae{" +
                "isSuccess=" + isSuccess +
                ", mess='" + mess + '\'' +
                '}';
    }

    public boolean isSuccess() {
        return isSuccess;
    }

    public void setSuccess(boolean success) {
        isSuccess = success;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
}
