package com.outad.controller;

import com.outad.dao.model.Product;
import com.outad.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-04 09:40
 */
@Controller
public class FrontController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/")
    String index(Model model){
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
