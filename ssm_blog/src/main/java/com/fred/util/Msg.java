package com.fred.util;

import java.util.HashMap;
import java.util.Map;

/**
 * @auther fred
 * @create 2020-08-27 15:04
 */
public class Msg {
    private int code;
    private String msg;
    private Map<String,Object> map = new HashMap<>();

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        return result;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        return result;
    }

    public Msg add(String key,Object value){
        this.getMap().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public Msg setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

}
