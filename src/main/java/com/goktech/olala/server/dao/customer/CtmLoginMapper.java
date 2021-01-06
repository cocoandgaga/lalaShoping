package com.goktech.olala.server.dao.customer;

import com.goktech.olala.server.pojo.customer.CtmLogin;
import java.util.List;

public interface CtmLoginMapper {
    int insert(CtmLogin record);

    List<CtmLogin> selectAll();

    void updateLoginName(CtmLogin login);

    int updateByCustomerId(CtmLogin ctmLogin);

    List<CtmLogin> selectByEmail(String email);


    CtmLogin selectPwdById(String customerId);

    void updatePwd(CtmLogin login_user);
}