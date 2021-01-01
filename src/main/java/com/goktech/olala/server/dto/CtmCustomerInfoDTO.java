package com.goktech.olala.server.dto;

import lombok.Data;

@Data
public class CtmCustomerInfoDTO {
    private String customerId;
    private String customerName;
    private String realName;
    private String email;
    private Integer gender;
    private String mobile;
    private String birthday;
}
