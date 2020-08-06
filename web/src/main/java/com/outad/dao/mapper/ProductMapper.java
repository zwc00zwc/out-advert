package com.outad.dao.mapper;

import com.outad.dao.model.Product;
import com.outad.dao.model.query.ProductQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-04 11:16
 */
public interface ProductMapper {
    int insert(Product product);

    Product queryById(@Param("id")Long id);

    int queryPageCount(@Param("query")ProductQuery query);

    List<Product> queryPageList(@Param("query")ProductQuery query);

    int remove(@Param("id")Long id);
}
