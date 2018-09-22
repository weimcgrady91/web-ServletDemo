package com.wei.q.test;

import java.util.HashMap;
import java.util.Map;

public class Driver2 {
    public static void main(String[] args){
        Map<String,Integer> map = new HashMap<>();
        map.put("1",1);
        map.put("1",2);
        System.out.println(map.get("1"));
    }
}
