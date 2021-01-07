
package com.goktech.olala.client.controller.customer;

import com.goktech.olala.core.exception.CustomizeErrorCode;
import com.goktech.olala.core.exception.ResultDTO;
import com.goktech.olala.core.service.CtmLoginService;
import com.goktech.olala.core.service.impl.PersonInfoService;
import com.goktech.olala.server.pojo.customer.CtmConsignee;
import com.goktech.olala.server.pojo.customer.CtmCustomerInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class PersonInfoController {


    @Autowired
    PersonInfoService personInfoService;
    @Autowired
    CtmLoginService ctmLoginService;

    //查询用户个人信息
    @GetMapping("/queryCustomerInfo/{id}")
    public String queryCustomerInfo(HttpServletRequest request, Model model,@PathVariable(value = "id")String id) {
        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        if (login_user != null) {
            CtmCustomerInfo ctmInfo = personInfoService.listCtmAllInfo(login_user);
            List<CtmConsignee> ctmAddresses = personInfoService.listAddresses(ctmInfo.getCustomerId());
            if (ctmAddresses!=null) {
                model.addAttribute("ctmAddresses", ctmAddresses);

            }
            String birthday = ctmInfo.getBirthday();
            String[] split = birthday.split("\\.");
            String year = split[0];
            String month = split[1];
            String day = split[2];
            model.addAttribute("year", year);
            model.addAttribute("month", month);
            model.addAttribute("day", day);
            model.addAttribute("ctmInfo", ctmInfo);
            if (id.equals("1")) {
                return "business/person/information";
            }
            else if (id.equals("2")) {
                return "business/person/safety";
            }
        }
        return "business/home/login";
    }

    @GetMapping("/queryCustomerConsignee")
    public String queryCustomerConsignee(Model model,HttpServletRequest request) {
                CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");

        if (login_user != null) {
            CtmCustomerInfo ctmCustomerInfo = personInfoService.listCtmAllInfo(login_user);
            List<CtmConsignee> ctmAddresses = personInfoService.listAddresses(login_user.getCustomerId());

            model.addAttribute("ctmAddresses", ctmAddresses);
            model.addAttribute("ctmCustomerInfo", ctmCustomerInfo);
            return "business/person/address";
        } else {
            return "business/home/login";
        }
    }

    @GetMapping("/deleteConsignee/{customerAddrId}")
    public String deleteConsignee(@PathVariable Integer customerAddrId,
                                  HttpServletRequest request) {
         CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");

        if (login_user != null) {
            personInfoService.deleteAddressInfo(customerAddrId);
        }
        return "redirect:/queryCustomerConsignee";
    }

    @GetMapping("/updateConsignee/{customerAddrId}")
    public String updateConsignee(@PathVariable Integer customerAddrId,
                                  HttpServletRequest request,Model model){
        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        if (login_user!=null){
        CtmConsignee ctmConsignee = personInfoService.listAddressesByAddressId(customerAddrId);
        model.addAttribute("ctmConsignee",ctmConsignee);
        return "business/person/editaddr";
        }else {
            return "business/home/login";
        }
    }



    @PostMapping("/updateConsignee")
    @ResponseBody
    public Object updateConsignee(HttpServletRequest request, Model model,
                                  @RequestParam(value = "customerAddrId",required = false)Integer customerAddrId,
                                  @RequestParam(value = "recvName",required = false)String recvName,
                                  @RequestParam(value = "mobile",required = false)String mobile,
                                  @RequestParam(value = "province",required = false)String province,
                                  @RequestParam(value = "city",required = false)String city,
                                  @RequestParam(value = "district",required = false)String district,
                                  @RequestParam(value = "address",required = false)String address) {

        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");

        if (login_user != null)  {
            if (address == null || address.equals("")||
                    recvName== null || recvName.equals("")||
                    district == null || district.equals("")||
                    mobile == null || mobile.equals("")||
                    city == null || city.equals("")||
                    province == null || province.equals("")) {
                    return ResultDTO.errorOf(CustomizeErrorCode.INFO_NOT_COMPLETE);
            }
            CtmConsignee ctmConsignee=new CtmConsignee();
            ctmConsignee.setCustomerId(login_user.getCustomerId());
            ctmConsignee.setRecvName(recvName);
            ctmConsignee.setMobile(mobile);
            ctmConsignee.setProvince(province);
            ctmConsignee.setCity(city);
            ctmConsignee.setDistrict(district);
            ctmConsignee.setAddress(address);
            ctmConsignee.setIsDefault(false);
            ctmConsignee.setModifiedTime(new Date(System.currentTimeMillis()));

            personInfoService.createOrUpdateAddressInfo(ctmConsignee,customerAddrId);
            return ResultDTO.okOf();
        } else {
            return ResultDTO.errorOf(CustomizeErrorCode.NO_LOGIN);
        }

    }



    @PostMapping("/updateConsigneeDefault")
    @ResponseBody
    public Object updateConsigneeDefault(HttpServletRequest request,
                                  @RequestParam("customerAddrId")Integer customerAddrId) {

        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        if (login_user != null) {
            String customerId = login_user.getCustomerId();
            List<CtmConsignee> ctmConsignees = personInfoService.listAddresses(customerId);
            request.getSession().setAttribute("login_user",login_user);
            for (int i = 0; i < ctmConsignees.size(); i++) {
                CtmConsignee ctmConsignee = ctmConsignees.get(i);
                ctmConsignee.setIsDefault(false);
                personInfoService.updateAddressIsDefault(ctmConsignee);
            }
            CtmConsignee ctmConsignee=new CtmConsignee();
            ctmConsignee.setCustomerAddrId(customerAddrId);
            ctmConsignee.setIsDefault(true);
             personInfoService.updateAddressIsDefault(ctmConsignee);
             return ResultDTO.okOf();
        } else {
            return ResultDTO.errorOf(CustomizeErrorCode.NO_LOGIN);
        }

    }


    @PostMapping("/updateCustomerInfo")
    @ResponseBody
    public Object updateCustomerInfo(@RequestParam(value = "customerId", required = false) String customerId,
                                     @RequestParam(value = "customerName", required = false) String customerName,
                                     @RequestParam(value = "realName", required = false) String realName,
                                     @RequestParam(value = "email", required = false) String email,
                                     @RequestParam(value = "gender", required = false) Boolean gender,
                                     @RequestParam(value = "mobile", required = false) String mobile,
                                     @RequestParam(value = "birthday", required = false) String birthday,
                                     HttpServletRequest request, Model model) {

        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        if (login_user != null) {
            CtmCustomerInfo customerInfo = new CtmCustomerInfo();
            customerInfo.setCustomerId(customerId);

            customerInfo.setCustomerName(customerName);
            customerInfo.setRealName(realName);
            customerInfo.setEmail(email);
            customerInfo.setGender(gender);
            customerInfo.setMobile(mobile);
            customerInfo.setBirthday(birthday);
            Date nowTime = new Date(System.currentTimeMillis());
            customerInfo.setModifiedTime(nowTime);
            model.addAttribute("customerName", customerName);
            login_user.setLoginName(customerName);
            ctmLoginService.updateLoginName(login_user);
            model.addAttribute("realName", realName);
            model.addAttribute("email", email);
            model.addAttribute("gender", gender);
            model.addAttribute("mobile", mobile);
            model.addAttribute("birthday", birthday);

            if (customerName == null|| customerName.equals("")||
                    realName == null || realName.equals("")||
                    email == null || email.equals("")||
                    gender == null || gender.equals("")||mobile == null ||
                    mobile.equals("")||birthday == null || birthday.equals("")) {
                return ResultDTO.errorOf(CustomizeErrorCode.INFO_NOT_COMPLETE);
            }

            personInfoService.updateCtmInfo(customerInfo);
            request.getSession().setAttribute("login_user",login_user);
            return ResultDTO.okOf();
        }else {
            return ResultDTO.errorOf(CustomizeErrorCode.NO_LOGIN);
        }
    }

}

