package com.outad.service;

import com.outad.common.utility.PageResult;
import com.outad.dao.mapper.ProductMapper;
import com.outad.dao.model.Product;
import com.outad.dao.model.query.ProductQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-06 13:40
 */
@Service
public class ProductService {
    @Autowired
    private ProductMapper productMapper;

    public Product queryById(Long id){
        Product product = productMapper.selectById(id);
        return product;
    }

    public PageResult<Product> queryPageListProduct(ProductQuery query){
        PageResult<Product> pageResult = new PageResult<>();
        int count = productMapper.selectPageCount(query);
        List<Product> list = new ArrayList<>();
        if (count > 0){
            list = productMapper.selectPageList(query);
        }
        pageResult.setData(list);
        pageResult.setiTotalDisplayRecords(count);
        pageResult.setiTotalRecords(count);
        pageResult.setPageNo(query.getCurrentPage());
        pageResult.setiDisplayLength(query.getPageSize());
        return pageResult;
    }

    public Boolean addProduct(Product product){
        if (productMapper.insert(product)>0){
            return true;
        }
        return false;
    }

    public Boolean updateProduct(Product product){
        if (productMapper.update(product)>0){
            return true;
        }
        return false;
    }

    public Boolean remove(Long id){
        if (productMapper.remove(id)>0){
            return true;
        }
        return false;
    }
}
