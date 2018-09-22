package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;

import java.util.Date;

public class LoginAction3 extends ActionSupport {
    private String name;
    private int age;
    private Date birth;

    @Override
    public void validate() {
        System.out.println("LoginAction3进入validation 进行校验");
        if(!name.equals("root")){
            addFieldError("name","用户名错误");
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    @Override
    public String execute() throws Exception {
        if ("root".equals(name))
            return SUCCESS;
        else {
            return INPUT;
        }
    }
}
