/*
package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.resp.RespPermissionVo;
import com.goktech.olala.core.resp.RespUserVo;
import com.goktech.olala.core.service.ISysUserService;
import com.goktech.olala.server.dao.sys.SysUserDao;
import com.goktech.olala.server.pojo.sys.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service("sysUserService")*/
/*
package com.goktech.olala.core.service.impl;

import com.goktech.olala.core.resp.RespRoleVo;
import com.goktech.olala.core.service.ISysRoleService;
import com.goktech.olala.server.dao.sys.SysRoleDao;
import com.goktech.olala.server.pojo.sys.SysRole;
import com.goktech.olala.server.pojo.sys.SysUserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

@Service("sysRoleService")
public class SysRoleServiceIml implements ISysRoleService {

    @Autowired
    SysRoleDao sysRoleDao;

    @Override
    public SysRole findOne(String roleId) {
        return null;
    }

    @Override
    public void store(SysRole role) {

    }

    @Override
    public void store(SysUserRole userRole) {

    }

    @Override
    public SysRole findOneByName(String name) {
        return null;
    }

    @Override
    public List<RespRoleVo> getRoles(String userId) {
        return null;
    }
}
*//*


public class SysUserServiceImpl implements ISysUserService {

    @Autowired
    SysUserDao sysUserDao;

    @Override
    public SysUser querySysUserInfoById(Long userId) {
        return sysUserDao.selectByPrimaryKey(userId);
    }

    @Override
    public SysUser querySysUserInfoByExample(SysUser sysUser) {
        return sysUserDao.selectByExample(sysUser);
    }

    @Override
    public RespUserVo findOneByUsername(String userName) {
        return null;
    }

    @Override
    public RespPermissionVo findOne(String permissionId) {
        return null;
    }

    @Override
    public List<RespPermissionVo> getPermissionByRole(String roleId) {
        return null;
    }

    @Override
    public List<RespPermissionVo> getPermissionByUser(String userId) {
        return null;
    }

    @Override
    public void store(RespPermissionVo permission) {

    }

    @Override
    public RespPermissionVo findOneByName(String name) {
        return null;
    }
}
*/
