package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;
import com.wei.q.domain.User1;

import java.util.List;
import java.util.Map;

public class LoginAction2 extends ActionSupport {
    public String username;
    public String password;
    public List<User1> user1List;
    public List user2List;
    public Map<String,User1> user1Map;
    public Map user2Map;
    public User1 user1;


    public User1 getUser1() {
        return user1;
    }

    public void setUser1(User1 user1) {
        this.user1 = user1;
    }

    @Override
    public String execute() throws Exception {
        System.out.println("username="+username);
        System.out.println("password="+password);
        System.out.println("list1");
        for(User1 user1: user1List) {
            System.out.println("user1.username="+user1.username+",user1.password="+user1.password);
        }
        System.out.println("list2");
        for(Object object: user2List) {
            User1 user1 = (User1) object;
            System.out.println("user1.username="+user1.username+",user1.password="+user1.password);
        }
        System.out.println("map1");
        for (Map.Entry<String, User1> entry : user1Map.entrySet()) {
            System.out.println(entry.getKey() + ":" + entry.getValue());
        }
        System.out.println("map2");
        for (Object entry: user2Map.entrySet()) {
            Map.Entry<String,User1> entry1 = (Map.Entry<String, User1>) entry;
            System.out.println(entry1.getKey() + ":" + entry1.getValue());
        }
        System.out.println("user1");
        System.out.println(user1);
        return super.execute();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<User1> getUser1List() {
        return user1List;
    }

    public void setUser1List(List<User1> user1List) {
        this.user1List = user1List;
    }

    public List getUser2List() {
        return user2List;
    }

    public void setUser2List(List user2List) {
        this.user2List = user2List;
    }

    public Map<String, User1> getUser1Map() {
        return user1Map;
    }

    public void setUser1Map(Map<String, User1> user1Map) {
        this.user1Map = user1Map;
    }

    public Map getUser2Map() {
        return user2Map;
    }

    public void setUser2Map(Map user2Map) {
        this.user2Map = user2Map;
    }
}
