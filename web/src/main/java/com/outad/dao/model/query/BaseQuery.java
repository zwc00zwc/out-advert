package com.outad.dao.model.query;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-06 10:53
 */
public class BaseQuery {
    /**
     * 当前页码
     */
    private int currentPage = 1;
    /**
     * 查询起始行
     */
    private int startRow;

    /**
     * 每页显示的条数
     */
    private int pageSize;

    /**
     *
     */
    private Integer iDisplayStart = 0;

    /**
     *
     */
    private Integer iDisplayLength = 10;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getStartRow() {
        return iDisplayStart;
    }

    public int getPageSize() {
        return iDisplayLength;
    }

    public Integer getiDisplayStart() {
        return iDisplayStart;
    }

    public void setiDisplayStart(Integer iDisplayStart) {
        this.iDisplayStart = iDisplayStart;
    }

    public Integer getiDisplayLength() {
        return iDisplayLength;
    }

    public void setiDisplayLength(Integer iDisplayLength) {
        this.iDisplayLength = iDisplayLength;
    }
}
