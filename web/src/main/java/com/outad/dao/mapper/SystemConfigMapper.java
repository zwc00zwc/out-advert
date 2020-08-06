package com.outad.dao.mapper;

import com.outad.dao.model.SystemConfig;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-04 11:16
 */
public interface SystemConfigMapper {
    int insert(SystemConfig systemConfig);

    List<SystemConfig> queryByGroup(@Param("group") String group);

    int remove(@Param("id")Long id);
}
