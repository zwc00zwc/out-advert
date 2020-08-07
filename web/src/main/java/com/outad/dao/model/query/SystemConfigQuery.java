package com.outad.dao.model.query;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-06 15:43
 */
public class SystemConfigQuery extends BaseQuery {
    private String configGroup;

    private String key;

    public String getConfigGroup() {
        return configGroup;
    }

    public void setConfigGroup(String configGroup) {
        this.configGroup = configGroup;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
