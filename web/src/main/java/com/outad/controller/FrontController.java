package com.outad.controller;

import com.outad.dao.model.Product;
import com.outad.dao.model.SystemConfig;
import com.outad.service.ProductService;
import com.outad.service.SystemConfigService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-04 09:40
 */
@Controller
public class FrontController {

    @Autowired
    private ProductService productService;

    @Autowired
    private SystemConfigService systemConfigService;

    @RequestMapping(value = "/")
    String index(Model model){
        Map map = new HashMap();
        Product topleftProduct = null;
        SystemConfig topleft = systemConfigService.queryByGroupAndKey("indexSet","topleft");
        if (topleft!=null && !StringUtils.isEmpty(topleft.getValue())){
            topleftProduct = productService.queryById(Long.parseLong(topleft.getValue()));
        }

        Product toprightProduct = null;
        SystemConfig topright = systemConfigService.queryByGroupAndKey("indexSet","topright");
        if (topright != null && !StringUtils.isEmpty(topright.getValue())){
            toprightProduct = productService.queryById(Long.parseLong(topright.getValue()));
        }

        Product upfirstProduct = null;
        SystemConfig upfirst = systemConfigService.queryByGroupAndKey("indexSet","upfirst");
        if (upfirst != null && !StringUtils.isEmpty(upfirst.getValue())){
            upfirstProduct = productService.queryById(Long.parseLong(upfirst.getValue()));
        }

        Product upsecondProduct = null;
        SystemConfig upsecond = systemConfigService.queryByGroupAndKey("indexSet","upsecond");
        if (upsecond != null && !StringUtils.isEmpty(upsecond.getValue())){
            upsecondProduct = productService.queryById(Long.parseLong(upsecond.getValue()));
        }

        Product upthirdProduct = null;
        SystemConfig upthird = systemConfigService.queryByGroupAndKey("indexSet","upthird");
        if (upthird != null && !StringUtils.isEmpty(upthird.getValue())){
            upthirdProduct = productService.queryById(Long.parseLong(upthird.getValue()));
        }

        if (topleftProduct ==null){
            model.addAttribute("topleftProduct",new Product());
        }else {
            model.addAttribute("topleftProduct",topleftProduct);
        }

        if (topleftProduct ==null){
            model.addAttribute("toprightProduct",new Product());
        }else {
            model.addAttribute("toprightProduct",toprightProduct);
        }

        if (topleftProduct ==null){
            model.addAttribute("upfirstProduct",new Product());
        }else {
            model.addAttribute("upfirstProduct",upfirstProduct);
        }

        if (topleftProduct ==null){
            model.addAttribute("upsecondProduct",new Product());
        }else {
            model.addAttribute("upsecondProduct",upsecondProduct);
        }

        if (topleftProduct ==null){
            model.addAttribute("upthirdProduct",new Product());
        }else {
            model.addAttribute("upthirdProduct",upthirdProduct);
        }
        return "/front/home";
    }

    @RequestMapping(value = "/list")
    String list(Model model){
        return "/front/list";
    }

    @RequestMapping(value = "/detail")
    String detail(Model model,Long id){
        Product product = productService.queryById(id);
        model.addAttribute("product",product);
        return "/front/detail";
    }
}
