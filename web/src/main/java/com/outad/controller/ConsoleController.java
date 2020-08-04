package com.outad.controller;

import com.outad.common.utility.Md5Manager;
import com.outad.common.utility.ResultDo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-04 09:37
 */
@Controller
@RequestMapping(value = "/console")
public class ConsoleController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(ConsoleController.class);

    @RequestMapping(value = "/login")
    String login(){
        return "login";
    }

    @ResponseBody
    @RequestMapping(value = "/logined")
    ResultDo logined(String username, String password){
        ResultDo resultDo = new ResultDo();
        String resultStr = username + "_" + password;
        String token = Md5Manager.md5(resultStr);
        resultDo.setResult(token);
        return resultDo;
    }

    @RequestMapping(value = "/index")
    String index(Model model, String token){
        if (!isLogined()){
            return "redirect:/console/login";
        }
        return "index";
    }

    @RequestMapping(value = "/welcome")
    String welcome(){
        return "welcome";
    }

    @RequestMapping(value = "/advertList")
    String advertList(){
        return "advertList";
    }

    @RequestMapping(value = "/areaList")
    String areaList(){
        return "areaList";
    }

    @RequestMapping(value = "/banner")
    String banner(){
        return "banner";
    }


}
