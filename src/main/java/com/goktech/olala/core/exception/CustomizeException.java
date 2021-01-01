package com.goktech.olala.core.exception;

public class CustomizeException extends RuntimeException{

    public Integer code;
    private String message;

    public CustomizeException(ICustomizeErrorCode errorCode) {
        this.code=errorCode.getCode();
        this.message = errorCode.getMessage();
    }

    public Integer getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
