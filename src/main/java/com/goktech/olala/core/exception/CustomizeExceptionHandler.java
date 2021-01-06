package com.goktech.olala.core.exception;

import com.alibaba.fastjson.JSON;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
//全局异常处理
//全局数据绑定
//全局数据预处理
//可对controller中被 @RequestMapping注解的方法加一些逻辑处理。最常用的就是异常处理
@ControllerAdvice
public class CustomizeExceptionHandler {
    @ExceptionHandler(Exception.class)
    ModelAndView handleControllerException(Throwable e, Model model, HttpServletResponse response) {
        String contentType = response.getContentType();
        if ("application/json".equals(contentType)) {
            ResultDTO resultDTO=null;
            if (e instanceof CustomizeException) {
                //赋值code、message的封装
                resultDTO = ResultDTO.errorOf((CustomizeException) e);
            } else {
                resultDTO = ResultDTO.errorOf(CustomizeErrorCode.SYS_ERROR);
            }
            try {
                response.setContentType("application/json");
                response.setStatus(200);
                response.setCharacterEncoding("utf-8");
                PrintWriter writer = response.getWriter();
                writer.write(JSON.toJSONString(resultDTO));
                writer.close();
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
            return null;
        }
        ModelAndView modelAndView = new ModelAndView("error");
        if (e instanceof CustomizeException) {
           modelAndView.addObject("message", e.getMessage());
        } else {
            modelAndView.addObject("message", CustomizeErrorCode.SYS_ERROR.getMessage());
        }
        return modelAndView;//定义的页面

    }
}
