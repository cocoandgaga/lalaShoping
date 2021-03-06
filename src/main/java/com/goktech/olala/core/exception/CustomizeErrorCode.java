package com.goktech.olala.core.exception;

public enum CustomizeErrorCode implements ICustomizeErrorCode{
    INFO_NOT_COMPLETE(2003,"收货信息填写不全"),
    PWD_NOT_THE_SAME(2008,"密码不一致"),
    GOODS_NOT_FOUNT(2001 ,"你要找的商品可能已删除或不存在..."),
    DELETE_FAIL(2001,"删除失败"),
    UPDATE_FAILED(2002,"更新失败，您要更新的问题可能已经删除"),
    PASSWORD_NULL(2003,"密码不能为空"),
    NO_LOGIN(2004,"当前操作需要登陆，请登陆!"),
    CHANGE_WRONG(2005,"改变上下架失败"),
    COMMENT_NOT_FOUND(2005,"当前评论已被删除"),
    TYPE_NOT_FOUND(2006,""),
    WRONG_PASSWORD(2007,"原密码不正确"),
    SYS_ERROR(5005,"服务器发生错误"),
    NOTIFICATION_NOT_FOUND(2008,"通知未找到"),
    READ_NOTIFICATION_FAIL(2009,"读取通知失败");
    private Integer code;
    private String message;

    CustomizeErrorCode(Integer code,String message) {
        this.code=code;
        this.message=message;
    }


    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public Integer getCode() {
        return code;
    }
}
