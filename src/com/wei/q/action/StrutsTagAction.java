package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;

public class StrutsTagAction extends ActionSupport {
    private List<String> names = new ArrayList<String>(){
        {
            add("weiqun1");
            add("weiqun2");
        }
    };
    private List<String> names2 = new ArrayList<String>(){
        {
            add("weiqun3");
            add("weiqun4");
        }
    };
    private List<String> names3 = new ArrayList<String>(){
        {
            add("1");
            add("2");
            add("3");
            add("4");
            add("5");
            add("6");
        }
    };

    public List<String> getNames3() {
        return names3;
    }

    public void setNames3(List<String> names3) {
        this.names3 = names3;
    }

    public List<String> getNames2() {
        return names2;
    }

    public void setNames2(List<String> names2) {
        this.names2 = names2;
    }

    private String tip;
    private int age=20;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public List<String> getNames() {
        return names;
    }

    public void setNames(List<String> names) {
        this.names = names;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    @Override
    public String execute() throws Exception {
        return super.execute();
    }
}
