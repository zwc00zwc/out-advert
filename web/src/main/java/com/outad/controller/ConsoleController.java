package com.outad.controller;

import com.outad.common.CategoryEnum;
import com.outad.common.Constant;
import com.outad.common.upload.AliyunOssManager;
import com.outad.common.utility.Md5Manager;
import com.outad.common.utility.PageResult;
import com.outad.common.utility.ResultDo;
import com.outad.dao.model.Product;
import com.outad.dao.model.SystemConfig;
import com.outad.dao.model.query.ProductQuery;
import com.outad.dao.model.query.SystemConfigQuery;
import com.outad.service.ProductService;
import com.outad.service.SystemConfigService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-04 09:37
 */
@Controller
@RequestMapping(value = "/console")
public class ConsoleController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(ConsoleController.class);

    @Autowired
    private MultipartResolver multipartResolver;

    @Autowired
    private ProductService productService;

    @Autowired
    private SystemConfigService systemConfigService;

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

    @RequestMapping(value = "/productList")
    String productList(Model model){
        List<SystemConfig> area = systemConfigService.queryGroupList(Constant.AREA);
        Map<String,String> category = CategoryEnum.getAll();
        model.addAttribute("area",area);
        model.addAttribute("category",category);
        return "productList";
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxProductList")
    PageResult ajaxProductList(ProductQuery query){
        PageResult pageResult = new PageResult();
        if (!isLogined()){
            return pageResult;
        }
        pageResult = productService.queryPageListProduct(query);
        return pageResult;
    }

    @RequestMapping(value = "/addProduct")
    String addProduct(Model model,Long id){
        if (!isLogined()){
            return "redirect:/console/login";
        }
        List<SystemConfig> area = systemConfigService.queryGroupList(Constant.AREA);
        Map<String,String> category = CategoryEnum.getAll();
        model.addAttribute("area",area);
        model.addAttribute("category",category);
        return "addProduct";
    }

    @RequestMapping(value = "/editProduct")
    String editProduct(Model model,Long id){
        if (!isLogined()){
            return "redirect:/console/login";
        }
        Product product = productService.queryById(id);
        List<SystemConfig> area = systemConfigService.queryGroupList(Constant.AREA);
        Map<String,String> category = CategoryEnum.getAll();
        model.addAttribute("area",area);
        model.addAttribute("category",category);
        model.addAttribute("product",product);
        return "editProduct";
    }

    @ResponseBody
    @RequestMapping(value = "/saveProduct")
    ResultDo saveProduct(Model model,Product product){
        ResultDo resultDo = new ResultDo();
        if (!isLogined()){
            resultDo.setErrorDesc("未登录");
            return resultDo;
        }
        if (product.getId() == null || product.getId() <1){
            resultDo.setSuccess(productService.addProduct(product));
            return resultDo;
        }
        Product old = productService.queryById(product.getId());
        if (old == null){
            resultDo.setResult(false);
            resultDo.setErrorDesc("数据不存在");
            return resultDo;
        }
        resultDo.setSuccess(productService.updateProduct(product));
        return resultDo;
    }

    @ResponseBody
    @RequestMapping(value = "/removeProduct")
    ResultDo removeProduct(Long id){
        ResultDo resultDo = new ResultDo();
        if (!isLogined()){
            resultDo.setErrorDesc("未登录");
            return resultDo;
        }
        Product old = productService.queryById(id);
        if (old == null){
            resultDo.setResult(false);
            resultDo.setErrorDesc("数据不存在");
            return resultDo;
        }
        resultDo.setSuccess(productService.remove(id));
        return resultDo;
    }

    @RequestMapping(value = "/areaList")
    String areaList(){
        return "areaList";
    }

    @RequestMapping(value = "/addArea")
    String addArea(){
        return "addArea";
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxAreaList")
    PageResult ajaxAreaList(SystemConfigQuery query){
        PageResult pageResult = new PageResult();
        if (!isLogined()){
            return pageResult;
        }

        pageResult = systemConfigService.queryPageList(query);
        return pageResult;
    }

    @ResponseBody
    @RequestMapping(value = "/saveArea")
    ResultDo saveArea(String area){
        ResultDo resultDo = new ResultDo();
        if (!isLogined()){
            resultDo.setErrorDesc("未登录");
            return resultDo;
        }
        if (StringUtils.isEmpty(area)){
            resultDo.setErrorDesc("值为空");
            return resultDo;
        }
        SystemConfig old = systemConfigService.queryByGroupAndKey(Constant.AREA,area);
        if (old != null){
            resultDo.setErrorDesc("数据已存在");
            return resultDo;
        }
        SystemConfig systemConfig = new SystemConfig();
        systemConfig.setConfigGroup(Constant.AREA);
        systemConfig.setKey(area);
        systemConfig.setValue(area);
        if (systemConfigService.add(systemConfig)){
            resultDo.setSuccess(true);
        }
        return resultDo;
    }

    @ResponseBody
    @RequestMapping(value = "/removeArea")
    ResultDo removeArea(Long id){
        ResultDo resultDo = new ResultDo();
        if (!isLogined()){
            resultDo.setErrorDesc("未登录");
            return resultDo;
        }
        SystemConfig old = systemConfigService.queryById(id);
        if (old == null){
            resultDo.setErrorDesc("数据不存在");
            return resultDo;
        }
        if (systemConfigService.remove(id)){
            resultDo.setSuccess(true);
        }
        return resultDo;
    }

    @RequestMapping(value = "/banner")
    String banner(){
        return "banner";
    }

    @ResponseBody
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public ResultDo upload(HttpServletRequest req, HttpServletResponse resp){
        ResultDo resultDo = new ResultDo();
        MultipartHttpServletRequest multipartRequest = null;
        try {
            if(multipartResolver.isMultipart(req)){
                multipartRequest = (MultipartHttpServletRequest) req;
                Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
                for(Map.Entry<String,MultipartFile> en:fileMap.entrySet()){
                    MultipartFile multipartFile = en.getValue();
                    //后缀
                    String fileName = multipartFile.getOriginalFilename();
                    String suffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
                    String result = AliyunOssManager.uploadForeverImg(multipartFile.getInputStream(),suffix);
                    resultDo.setResult(result);
                    return resultDo;
                }
            }else{
                logger.error("无效的上传请求。");
                resultDo.setErrorDesc("无效的上传请求。");
            }
        } catch (IOException e) {
            logger.error("上传文件出现异常。",e);
            resultDo.setErrorDesc("上传文件出现异常。");
        }finally{
            if(multipartRequest != null){
                multipartResolver.cleanupMultipart(multipartRequest);
            }
        }
        return resultDo;
    }

//    @ResponseBody
//    @RequestMapping(value = "/upload",method = RequestMethod.POST)
//    public ResultDo upload(@RequestParam("files") MultipartFile multipartFile){
//        ResultDo resultDo = new ResultDo();
//        try {
//            if (multipartFile!=null){
//                String fileName = multipartFile.getOriginalFilename();
//                String suffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
//                String result = AliyunOssManager.uploadForeverImg(multipartFile.getInputStream(),suffix);
//                resultDo.setResult(result);
//                return resultDo;
//            }else {
//                logger.error("无效的上传请求。");
//                resultDo.setErrorDesc("无效的上传请求。");
//            }
//        } catch (IOException e) {
//            logger.error("上传文件出现异常。",e);
//            resultDo.setErrorDesc("上传文件出现异常。");
//        }
//        return resultDo;
//    }
}
