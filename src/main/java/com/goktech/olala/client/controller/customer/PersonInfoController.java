
package com.goktech.olala.client.controller.customer;

import com.goktech.olala.core.exception.CustomizeErrorCode;
import com.goktech.olala.core.exception.ResultDTO;
import com.goktech.olala.core.service.impl.PersonInfoService;
import com.goktech.olala.server.dto.CtmCustomerInfoDTO;
import com.goktech.olala.server.pojo.customer.CtmConsignee;
import com.goktech.olala.server.pojo.customer.CtmCustomerInfo;
import com.goktech.olala.server.pojo.customer.CtmLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PersonInfoController {


    @Autowired
    PersonInfoService personInfoService;

    //查询用户个人信息
    @GetMapping("/queryCustomerInfo/{id}")
    public String queryCustomerInfo(HttpServletRequest request, Model model,@PathVariable(value = "id")String id) {
//        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        CtmLogin login_user = new CtmLogin();
        login_user.setCustomerId("1");
        if (login_user != null) {
            CtmCustomerInfo ctmInfo = personInfoService.listCtmAllInfo(login_user);
            List<CtmConsignee> ctmAddresses = personInfoService.listAddresses(ctmInfo.getCustomerId());

            String birthday = ctmInfo.getBirthday();
            String[] split = birthday.split("\\.");
            String year = split[0];
            String month = split[1];
            String day = split[2];

            model.addAttribute("ctmAddresses", ctmAddresses);
            model.addAttribute("ctmInfo", ctmInfo);
            model.addAttribute("year", year);
            model.addAttribute("month", month);
            model.addAttribute("day", day);
            if (id.equals("1"))
                return "/person/information";
            else if (id.equals("2"))
                return "/person/safety";
        }
        return "";
    }

    @GetMapping("/queryCustomerConsignee")
    public String queryCustomerConsignee(Model model) {
        //        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        CtmLogin login_user = new CtmLogin();
        login_user.setCustomerId("1");
        if (login_user != null) {
            CtmCustomerInfo ctmCustomerInfo = personInfoService.listCtmAllInfo(login_user);
            List<CtmConsignee> ctmAddresses = personInfoService.listAddresses(login_user.getCustomerId());

            model.addAttribute("ctmAddresses", ctmAddresses);
            model.addAttribute("ctmCustomerInfo", ctmCustomerInfo);
            return "person/address";
        } else {
            return "";
        }
    }

    @PostMapping("/deleteConsignee")
    @ResponseBody
    public Object deleteConsignee(@RequestParam(value = "customerAddrId") Integer customerAddrId, HttpServletRequest request) {
        //        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        CtmLogin login_user = new CtmLogin();
        login_user.setCustomerId("1");
        if (login_user != null) {
            personInfoService.deleteAddressInfo(customerAddrId);
            return ResultDTO.okOf();
        } else {
            return ResultDTO.errorOf(CustomizeErrorCode.NO_LOGIN);
        }
    }

    @GetMapping("/updateConsignee/{customerAddrId}")
    public String updateConsignee(@PathVariable Integer customerAddrId,
                                  HttpServletRequest request,Model model){
        CtmConsignee ctmConsignee = personInfoService.listAddressesByAddressId(customerAddrId);
        model.addAttribute("ctmConsignee",ctmConsignee);
        return "/person/editaddr";

    }



    @PostMapping("/updateConsignee")
    @ResponseBody
    public Object updateConsignee(HttpServletRequest request, Model model,
                                  @RequestParam(value = "customerId",required = false)String customerId,
                                  @RequestParam(value = "recvName",required = false)String recvName,
                                  @RequestParam(value = "mobile",required = false)String mobile,
                                  @RequestParam(value = "province",required = false)String province,
                                  @RequestParam(value = "city",required = false)String city,
                                  @RequestParam(value = "district",required = false)String district,
                                  @RequestParam(value = "address",required = false)String address) {

        //        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        CtmLogin login_user = new CtmLogin();
        login_user.setCustomerId("1");
        if (login_user != null)  {
            if (address == null || address.equals("")||
                    recvName== null || recvName.equals("")||
                    district == null || district.equals("")||
                    mobile == null || mobile.equals("")||
                    city == null || city.equals("")||
                    province == null || province.equals("")) {
                    return ResultDTO.errorOf(CustomizeErrorCode.INFO_NOT_COMPLETE);
            }else if (customerId == null || customerId.equals("")){
                return ResultDTO.errorOf(CustomizeErrorCode.NO_LOGIN);
            }
            CtmConsignee ctmConsignee=new CtmConsignee();
            ctmConsignee.setCustomerId(customerId);
            ctmConsignee.setRecvName(recvName);
            ctmConsignee.setMobile(mobile);
            ctmConsignee.setProvince(province);
            ctmConsignee.setCity(city);
            ctmConsignee.setDistrict(district);
            ctmConsignee.setAddress(address);
            ctmConsignee.setIsDefault(false);
            ctmConsignee.setModifiedTime(new Date(System.currentTimeMillis()));

            personInfoService.creatAddressInfo(ctmConsignee);
            return ResultDTO.okOf();
        } else {
            return ResultDTO.errorOf(CustomizeErrorCode.NO_LOGIN);
        }

    }



    @PostMapping("/updateConsigneeDefault")
    @ResponseBody
    public Object updateConsignee(HttpServletRequest request,
                                  @RequestParam("customerAddrId")Integer customerAddrId) {

        //        CtmLogin login_user = (CtmLogin) request.getSession().getAttribute("login_user");
        CtmLogin login_user = new CtmLogin();
        login_user.setCustomerId("1");
        if (login_user != null) {
            String customerId = login_user.getCustomerId();
            List<CtmConsignee> ctmConsignees = personInfoService.listAddresses(customerId);
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
        model.addAttribute("realName", realName);
        model.addAttribute("email", email);
        model.addAttribute("gender", gender);
        model.addAttribute("mobile", mobile);
        model.addAttribute("birthday", birthday);

        if (customerName == null || customerName.equals("")) {
            model.addAttribute("error", "昵称不能为空");
            return "person/information";
        }
        if (realName == null || realName.equals("")) {
            model.addAttribute("error", "真实姓名不能为空");
            return "person/information";
        }
        if (email == null || email.equals("")) {
            model.addAttribute("error", "邮箱不能为空");
            return "person/information";
        }

        if (gender == null || gender.equals("")) {
            model.addAttribute("error", "性别不能为空");
            return "person/information";
        }
        if (mobile == null || mobile.equals("")) {
            model.addAttribute("error", "手机号码不能为空");
            return "person/information";
        }
        if (birthday == null || birthday.equals("")) {
            model.addAttribute("error", "生日不能为空");
            return "person/information";
        }

        personInfoService.updateCtmInfo(customerInfo);
        return ResultDTO.okOf();
    }
}

/*




    @GetMapping("/publish/{id}")
    public  String doEdit(@PathVariable(name = "id") Long id,
                          Model model){
        QuestionDTO questionDTO=questionService.getById(id);
        model.addAttribute("title",questionDTO.getTitle());
        model.addAttribute("description",questionDTO.getDescription());
        model.addAttribute("tag",questionDTO.getTag());
        model.addAttribute("id",questionDTO.getId());
        model.addAttribute("tags", TagCache.get());
        return  "publish";
    }

    @GetMapping("/publish")
    public String doPublish(Model model){
        model.addAttribute("tags", TagCache.get());
        return "publish";
    }

*//*



}
*/
