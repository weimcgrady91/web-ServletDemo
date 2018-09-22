package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;

public class WatiAction extends ActionSupport {
    @Override
    public String execute() throws Exception {
        Thread.sleep(5000);
        return super.execute();
    }
}
