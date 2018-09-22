package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;
import com.wei.q.domain.User1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PrintJsonAction extends ActionSupport {
    private Map<String, List<User1>> userMap = new HashMap<>();

    @Override
    public String execute() throws Exception {
        User1 user1 = new User1();
        user1.setUsername("weiqun1");
        user1.setPassword("password1");
        User1 user2 = new User1();
        user2.setUsername("weiqun2");
        user2.setPassword("password2");
        List<User1> list = new ArrayList<>();
        list.add(user1);
        list.add(user2);
        userMap.put("users",list);
        return super.execute();
    }
    public Map<String,List<User1>> getDataMap() {
        return userMap;
    }
}
