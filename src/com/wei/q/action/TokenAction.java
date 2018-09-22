package com.wei.q.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.omg.PortableInterceptor.ACTIVE;

import java.util.ArrayList;
import java.util.List;

public class TokenAction extends ActionSupport {
    public static final List<String> NAMES = new ArrayList<String>();
    private String name;

    @Override
    public String execute() throws Exception {
        NAMES.add(name);
        ActionContext.getContext().getSession().put("names",NAMES);
        ActionContext.getContext().getSession().put("title","hahah");
        System.out.println(NAMES);
        return super.execute();
    }

    public static List<String> getNAMES() {
        return NAMES;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
