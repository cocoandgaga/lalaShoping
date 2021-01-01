
package com.goktech.olala.core.service.impl;

import com.goktech.olala.server.dao.customer.CtmConsigneeMapper;
import com.goktech.olala.server.dao.customer.CtmCustomerInfoMapper;
import com.goktech.olala.server.pojo.customer.CtmConsignee;
import com.goktech.olala.server.pojo.customer.CtmCustomerInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PersonInfoService {

    @Autowired
    CtmCustomerInfoMapper ctmCustomerInfoMapper;
    @Autowired
    CtmConsigneeMapper ctmConsigneeMapper;

    //列出登录的用户信息
    public CtmCustomerInfo listCtmAllInfo(CtmLogin login_user) {
        CtmCustomerInfo ctmCustomerInfo = ctmCustomerInfoMapper.selectByCustomerId(login_user.getCustomerId());
        if (ctmCustomerInfo!=null){
            return ctmCustomerInfo;
        }else{
            return null;
        }
    }

    //列出该用户所有地址信息
    public List<CtmConsignee> listAddresses(String customerId) {

        List<CtmConsignee> ctmConsignees = ctmConsigneeMapper.selectByCustomerId(customerId);
        if (ctmConsignees.size()>0){
            return ctmConsignees;
        }else{
            return null;
        }
    }

    @Transactional
    //删除地址信息
    public void deleteAddressInfo(Integer customerAddrId) {
         ctmConsigneeMapper.deleteByPrimaryKey(customerAddrId);
    }


    //根据当前的地址号列出地址
    public CtmConsignee listAddressesByAddressId(Integer customerAddrId) {
        CtmConsignee ctmConsignee = ctmConsigneeMapper.selectByPrimaryKey(customerAddrId);
        if (ctmConsignee!=null){
            return ctmConsignee;
        }else {
            return null;
        }
    }



    public void updateCtmInfo(CtmCustomerInfo customerInfo) {
        ctmCustomerInfoMapper.insertInfo(customerInfo);
    }

    public void updateAddressIsDefault(CtmConsignee ctmConsignee) {
        ctmConsigneeMapper.updateDefault(ctmConsignee);
    }

    public int creatAddressInfo(CtmConsignee ctmConsignee) {
        int key = ctmConsigneeMapper.insert(ctmConsignee);
        return key;
    }
}

