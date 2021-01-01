/*
package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.req.CtmInfoReq;
import com.goktech.olala.core.service.ICtmInfoService;
import com.goktech.olala.server.dao.customer.CtmInfoMapper;
import com.goktech.olala.server.dao.customer.CtmLoginMapper;
import com.goktech.olala.server.pojo.customer.CtmInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;
import com.mysql.cj.PreparedQuery;
import net.sf.ehcache.search.expression.Criteria;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service("ctmInfoService")
public class CtmInfoServiceImpl implements ICtmInfoService {

    @Autowired
    CtmInfoMapper ctmInfoMapper;

    @Autowired
    CtmLoginMapper ctmLoginMapper;

*
     * 前台客户登录
     *
     * @param userName
     * @param password
     * @return


    @Override
    public CtmLogin queryCmtInfoForLogin(String userName, String password) {
        if(StringUtils.isBlank(userName) || StringUtils.isBlank(password)){
            return null;
        }
        return ctmLoginMapper.selectByParam(userName, password);
    }

    @Override
    public List<CtmInfo> queryCmtInfoByExample(CtmInfo ctmInfo) {
        return ctmInfoMapper.selectByExample(ctmInfo);
    }

    @Override
    public int saveCmtInfo(CtmInfo ctmInfo) {
        if(null == ctmInfo){
            return 0;
        }
        ctmInfo.setModifiedTime(new Timestamp(new Date().getTime()));
        if(StringUtils.isNotBlank(ctmInfo.getCustomerInfId())){
            return ctmInfoMapper.updateByPrimaryKey(ctmInfo);
        }
        ctmInfo.setRegisterTime(new Timestamp(new Date().getTime()));
        return ctmInfoMapper.insert(ctmInfo);
    }

    @Override
    public int removeById(String customerInfId) {
        if(StringUtils.isBlank(customerInfId)){
            return 0;
        }
        return ctmInfoMapper.deleteByPrimaryKey(customerInfId);
    }

    @Override
    public int updateStatus(String customerId, Integer status) {
        if(StringUtils.isBlank(customerId)){
            return 0;
        }
        CtmInfo ctmInfo = new CtmInfo();
        ctmInfo.setCustomerStatus(status);
        ctmInfo.setCustomerId(customerId);
        return ctmInfoMapper.updateStatus(ctmInfo);
    }


}
*/
