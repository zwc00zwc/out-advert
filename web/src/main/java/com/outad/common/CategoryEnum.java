package com.outad.common;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-07 14:35
 */
public enum CategoryEnum {

    A("outdoor-bigscreen", "户外大屏"),
    B("lift", "电梯广告"),
    C("railway", "高铁机场"),
    D("bus", "公交广告"),
    E("outdoor-billboard", "户外广告牌"),
    F("other", "其他媒体")
    ;

    private String key;
    private String value;

    private CategoryEnum(String k,String v){
        this.key = k;
        this.value = v;
    }

    public static Map<String,String> getAll() {
        Map map = new HashMap();
        map.put(CategoryEnum.A.key,CategoryEnum.A.value);
        map.put(CategoryEnum.B.key,CategoryEnum.B.value);
        map.put(CategoryEnum.C.key,CategoryEnum.C.value);
        map.put(CategoryEnum.D.key,CategoryEnum.D.value);
        map.put(CategoryEnum.E.key,CategoryEnum.E.value);
        map.put(CategoryEnum.F.key,CategoryEnum.F.value);
        return map;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
