package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;

public class ResultTypeAction extends ActionSupport {
    private String tip;

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

    public String plainText() {
        tip="结果为: plaintText 类型";
        return SUCCESS;
    }

    public String redirect() {
        tip="结果为: redirect 类型";
        return "success1";
    }

    public String redirectAction() {
        return "success2";
    }

    public String actionAttribute() {
        tip="listBook";
        return "success3";
    }
}
