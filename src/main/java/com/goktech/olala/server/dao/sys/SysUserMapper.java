package com.goktech.olala.server.dao.sys;

import com.goktech.olala.server.pojo.sys.SysUser;
import java.util.List;

public interface SysUserMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(SysUser record);

    SysUser selectByPrimaryKey(Long userId);

    SysUser selectByMobile(String mobile);

    List<SysUser> selectAll();

    int updateByPrimaryKey(SysUser record);
}