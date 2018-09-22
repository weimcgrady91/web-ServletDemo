package com.wei.q.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
    private String account;
    private String password;
    private String tip;

    @Override
    public String execute() throws Exception {
        ActionContext context = ActionContext.getContext();
        if("root".equals(account) &&"123".equals(password)){
            context.getSession().put("user",getAccount());
            context.put("tip",getText("succTip"));
            return SUCCESS;
        }
        context.put("tip",getText("failTip"));
        return LOGIN;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
