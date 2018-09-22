package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;

public class AppendAction extends ActionSupport {
    private List<String> maleList = new ArrayList<String>(){
        {
            add("Machael");
            add("Scorfield");
        }
    };
    private List<String> femaleList = new ArrayList<String>(){
        {
            add("Janice");
            add("Marray");
        }
    };

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
}
