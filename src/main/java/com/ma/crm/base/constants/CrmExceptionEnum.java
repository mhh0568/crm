package com.ma.crm.base.constants;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.base.constants
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/16 19:53
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */

public enum  CrmExceptionEnum {

    LOGIN_ACCOUNT_ERROR("001","用户名或密码错误"),
    LOGIN_ACCOUNT_EXPIRE("001","账户已失效"),
    LOGIN_ACCOUNT_LOCKED("001","账号已被锁定"),
    LOGIN_ACCOUNT_IP("001","不被允许的ip地址"),

    ACTIVITY_SAVE_ERROR("002","创建市场活动失败"),
    ACTIVITY_UPDATE_ERROR("002","修改市场活动失败"),
    ACTIVITY_DELETE_ERROR("002","删除市场活动失败"),

    ACTIVITYREMARK_UPDATE_ERROR("003","更新市场活动备注失败"),
    ACTIVITYREMARK_DELETE_ERROR("003","删除市场活动备注失败"),
    ACTIVITYREMARK_INSERT_ERROR("003","添加市场活动备注失败"),

    CUSTOMER_INSERT_ERROR("004","客户添加失败"),
    CUSTOMER_UPDATE_ERROR("004","客户修改失败"),
    CUSTOMER_DELETE_ERROR("004","客户删除失败"),

    CLUE_INSERT_ERROR("005","线索添加失败"),
    CLUE_UPDATE_ERROR("005","线索修改失败"),
    CLUE_DELETE_ERROR("005","线索删除失败"),

    CLUEREMARK_INSERT_ERROR("006","线索备注添加失败"),
    CLUEREMARK_UPDATE_ERROR("006","线索备注修改失败"),
    CLUEREMARK_DELETE_ERROR("006","线索备注删除失败"),

    CLUEACTIVITY_DELETE_ERROR("007","线索市场活动关联删除失败"),
    CLUEACTIVITY_INSERT_ERROR("007","线索市场活动关联添加失败"),

    CLUECONVERT_ERROR("008","线索转换失败");



    private String code;//001 用户  002 市场活动 003 市场活动备注  004顾客
    private String message;

    CrmExceptionEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }}
