package com.outad.dao.mapper;

import com.outad.dao.model.SystemConfig;
import com.outad.dao.model.query.SystemConfigQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-04 11:16
 */
public interface SystemConfigMapper {
    int insert(SystemConfig systemConfig);

    SystemConfig selectById(@Param("id")Long id);

    List<SystemConfig> selectByGroup(@Param("configGroup") String configGroup);

    int selectPageCount(@Param("query")SystemConfigQuery query);

    List<SystemConfig> selectPageList(@Param("query")SystemConfigQuery query);

    int remove(@Param("id")Long id);

    SystemConfig selectByGroupAndKey(@Param("group")String group,@Param("key")String key);
}
