package com.outad.dao.model.query;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-06 10:55
 */
public class ProductQuery extends BaseQuery {
    private String name;

    private Long area;

    private Long category;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getArea() {
        return area;
    }

    public void setArea(Long area) {
        this.area = area;
    }

    public Long getCategory() {
        return category;
    }

    public void setCategory(Long category) {
        this.category = category;
    }
}
