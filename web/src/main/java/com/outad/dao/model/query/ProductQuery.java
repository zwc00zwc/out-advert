package com.outad.dao.model.query;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-06 10:55
 */
public class ProductQuery extends BaseQuery {
    private String name;

    private Long area;

    private String category;

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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
