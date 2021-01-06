package com.goktech.olala.client.controller.customer;

import com.goktech.olala.core.exception.CustomizeErrorCode;
import com.goktech.olala.core.exception.ResultDTO;
import com.goktech.olala.core.service.CtmCustomerInfoService;
import com.goktech.olala.core.service.CtmLoginService;
import com.goktech.olala.server.pojo.customer.CtmCustomerInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

@Controller
@RequestMapping(value = "/cntApi")
public class AccountController{
    @Autowired
    private CtmLoginService ctmLoginService;

    @Autowired
    private CtmCustomerInfoService ctmCustomerInfoService;

    //登录操作的controller
    @RequestMapping(value = "/login.do")
    public String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String userName = request.getParameter("userName");
        String pwd = request.getParameter("pwd");
        //查询用户信息
        CtmLogin ctmLogin = ctmLoginService.selectByEmail(userName);
        //登录失败
        if(!ctmLogin.getPassword().equals(pwd)){
            request.setAttribute("pwdError",true);
            return "home/login";
        }
        //登录成功
        else{
            ctmLogin.setUserStatus(true);
            ctmLoginService.updateByCustomerId(ctmLogin);
            //利用Session存储用户登录信息
            request.getSession().setAttribute("login_user",ctmLogin);
            return "redirect:/index";
        }

    }

    @PostMapping("/updatepassword.do")
    @ResponseBody
    public Object updatepassword(@RequestParam("old_password") String old_password,
                                 @RequestParam("new_password") String new_password,
                                 @RequestParam("confirm_password") String confirm_password,
                                 HttpServletRequest request){
        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        if (ctmLoginService.selectByCustomId(login_user.getCustomerId()).getPassword().equals(old_password)){
            if (new_password.equals(confirm_password)){
                login_user.setPassword(new_password);
                ctmCustomerInfoService.updatePwd(login_user);
                return ResultDTO.okOf();
            }else{
                return ResultDTO.errorOf(CustomizeErrorCode.PWD_NOT_THE_SAME);
            }
        }else {
            return ResultDTO.errorOf(CustomizeErrorCode.WRONG_PASSWORD);
        }

    }

    //注册操作的controller
    @RequestMapping(value = "/register.do")
    public String register(HttpServletRequest request) throws Exception {
        //获取customerId、customerInfId
        Random r = new Random();
        StringBuilder rs = new StringBuilder();
        StringBuilder rs1 = new StringBuilder();
        for (int i = 0; i < 12; i++) {
            rs.append(r.nextInt(10));
            rs1.append(r.nextInt(10));
        }
        String customerId = rs.toString();
        String customerInfId = rs1.toString();

        //提取信息并注册
        try{
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String passwordRepeat = request.getParameter("passwordRepeat");
            //密码不一致
            if(!passwordRepeat.equals(password)){
                request.setAttribute("error","密码不一致,重新输入！");
                return "home/register";
            }
            //注册成功
            else{
                //新建两个实体类对象
                CtmLogin ctmLogin = new CtmLogin();
                CtmCustomerInfo ctmCustomerInfo = new CtmCustomerInfo();

                //给两个对象部分属性赋值并插入到数据库
                ctmLogin.setCustomerId(customerId);
                ctmLogin.setEmail(email);
                ctmLogin.setPassword(password);
                ctmLogin.setUserStatus(false);
                ctmLoginService.insert(ctmLogin);

                ctmCustomerInfo.setCustomerInfId(customerInfId);
                ctmCustomerInfo.setCustomerId(customerId);
                ctmCustomerInfo.setEmail(email);
                ctmCustomerInfoService.insert(ctmCustomerInfo);
                return "redirect:/business/home/login.jsp";
            }

        }
        catch (Exception e){
            e.printStackTrace();
            return "home/register";
        }

    }

    @RequestMapping(value = "/loginOut.do")
    public String loginOut(HttpServletRequest request) throws Exception {
        CtmLogin ctmLogin = (CtmLogin) request.getSession().getAttribute("login_user");
        ctmLogin.setUserStatus(false);
        ctmLoginService.updateByCustomerId(ctmLogin);
        request.getSession().removeAttribute("login_user");

        return "redirect:/business/home/index.jsp";
    }
}