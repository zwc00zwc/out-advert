package com.outad.handler;

import com.outad.common.utility.ResultDo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-10 13:15
 */
@ControllerAdvice
public class GlobalExceptionHandle {

    private Logger logger = LoggerFactory.getLogger(GlobalExceptionHandle.class);

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public <T> ResultDo<T> handle(HttpServletRequest request, Exception e) {
        logger.error("请求网关处理异常,request={}",request.getParameterMap().toString(),e);
        ResultDo responseResult = new ResultDo();
        responseResult.setSuccess(false);
        responseResult.setErrorDesc("服务器内部错误");
        return responseResult;
    }
}
