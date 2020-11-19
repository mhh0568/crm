package com.ma.crm.base.bean;

import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.base.bean
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/17 20:11
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */

public class PaginationVo {
    private List<?> list;
    private int pageNo;
    private int pageSize;
    private int pages;
    private long totalCount;
    private PageInfo<?> pageInfo;

    public PaginationVo(PageInfo<?> pageInfo) {
        this.pageInfo = pageInfo;
        list=pageInfo.getList();
        pageNo=pageInfo.getPageNum();
        pageSize=pageInfo.getPageSize();
        pages=pageInfo.getPages();
        totalCount=pageInfo.getTotal();
    }

    @Override
    public String toString() {
        return "PaginationVo{" +
                "list=" + list +
                ", pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                ", pages=" + pages +
                ", totalCount=" + totalCount +
                ", pageInfo=" + pageInfo +
                '}';
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }

    public PageInfo<?> getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo<?> pageInfo) {
        this.pageInfo = pageInfo;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }
}
