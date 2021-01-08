package com.goktech.olala.client.controller.sys;

import com.goktech.olala.core.service.SysUserService;
import com.goktech.olala.server.pojo.sys.SysUser;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class SysUserController{
   @Autowired
   private SysUserService sysUserService;
   //进行登录操作
    @RequestMapping(value="/login.do",method = RequestMethod.POST)
    public String login(HttpServletRequest request) {
        String userName =request.getParameter("userName");
        String pwd=request.getParameter("pwd");
        //查询系统用户信息
        SysUser sysUser=sysUserService.selectByMobile(userName);
        //登录失败
        if(!sysUser.getPassword().equals(pwd)){
            return "backstage/login";
        }
        //登录成功
        else{
            sysUserService.updateByPrimaryKey(sysUser);
            //利用Session存储用户登录信息
            request.getSession().setAttribute("admin_user",sysUser);
           return "backstage/index";
       }

   }
   //进行系统用户注册操作
    @RequestMapping(value="/register.do",method = RequestMethod.POST)
    public String register(HttpServletRequest request)throws Exception {
        //提取信息
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String userName=request.getParameter("userName");
        //新建实体类对象
        SysUser sysUser = new SysUser();
        //给对象部分属性赋值并插入到数据库
        sysUser.setMobile(mobile);
        sysUser.setUserName(userName);
        Date date=new Date();
        sysUser.setCreateTime(date);
        sysUser.setStatus((byte) 1);
        sysUser.setCreateBy("admin");
        sysUser.setPassword(password);
        sysUserService.insert(sysUser);
        return "backstage/login";

    }

}
