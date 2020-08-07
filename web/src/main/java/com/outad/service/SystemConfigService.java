package com.outad.service;

import com.outad.common.utility.PageResult;
import com.outad.dao.mapper.SystemConfigMapper;
import com.outad.dao.model.Product;
import com.outad.dao.model.SystemConfig;
import com.outad.dao.model.query.ProductQuery;
import com.outad.dao.model.query.SystemConfigQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-06 13:51
 */
@Service
public class SystemConfigService {

    @Autowired
    private SystemConfigMapper systemConfigMapper;

    public SystemConfig queryById(Long id){
        SystemConfig systemConfig = systemConfigMapper.selectById(id);
        return systemConfig;
    }

    public SystemConfig queryByGroupAndKey(String group,String key){
        SystemConfig systemConfig = systemConfigMapper.selectByGroupAndKey(group,key);
        return systemConfig;
    }

    public List<SystemConfig> queryGroupList(String group){
        return systemConfigMapper.selectByGroup(group);
    }

    public PageResult<SystemConfig> queryPageList(SystemConfigQuery query){
        PageResult<SystemConfig> pageResult = new PageResult<>();
        int count = systemConfigMapper.selectPageCount(query);
        List<SystemConfig> list = new ArrayList<>();
        if (count > 0){
            list = systemConfigMapper.selectPageList(query);
        }
        pageResult.setData(list);
        pageResult.setiTotalDisplayRecords(count);
        pageResult.setiTotalRecords(count);
        pageResult.setPageNo(query.getCurrentPage());
        pageResult.setiDisplayLength(query.getPageSize());
        return pageResult;
    }

    public boolean remove(Long id){
        if (systemConfigMapper.remove(id)>0){
            return true;
        }
        return false;
    }

    public boolean add(SystemConfig systemConfig){
        if (systemConfigMapper.insert(systemConfig)>0){
            return true;
        }
        return false;
    }
}
