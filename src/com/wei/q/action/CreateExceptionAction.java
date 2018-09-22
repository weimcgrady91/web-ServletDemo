package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;
import com.wei.q.exception.MyException;

public class CreateExceptionAction extends ActionSupport {
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String execute() throws Exception {
        if(getUsername().equals("user")){
            throw new MyException("自定义异常");
        }
        return SUCCESS;
    }
}
