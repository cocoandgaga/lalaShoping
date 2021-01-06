package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmCustomerInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;

import java.util.List;

public interface CtmCustomerInfoMapper {

    int deleteByPrimaryKey(String customerInfId);

    int insert(CtmCustomerInfo record);

    CtmCustomerInfo selectByPrimaryKey(String customerInfId);

    List<CtmCustomerInfo> selectAll();

    int updateByPrimaryKey(CtmCustomerInfo record);

    CtmCustomerInfo selectByCustomerId(String customerId);

    int insertInfo(CtmCustomerInfo customerInfo);

}