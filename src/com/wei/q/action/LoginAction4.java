package com.wei.q.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction4 extends ActionSupport {
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String execute() throws Exception {
        if("root".equals(username)){
            ActionContext context = ActionContext.getContext();
            context.getSession().put("user","root");
            return SUCCESS;
        }
        return INPUT;
    }
}
