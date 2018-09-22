package com.wei.q.listener;

import com.wei.q.domain.PersonInfo;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.HashMap;
import java.util.Map;

public class LoginSessionListener implements HttpSessionAttributeListener {
    private Map<String, HttpSession> maps = new HashMap<>();

    @Override
    public void attributeAdded(HttpSessionBindingEvent httpSessionBindingEvent) {
        System.out.println("LoginSessionListener: attributeAdded");
        String name = httpSessionBindingEvent.getName();
        System.out.println(name);
        System.out.println(httpSessionBindingEvent.getValue());
        if (name.equals("personInfo")) {
            PersonInfo personInfo = (PersonInfo) httpSessionBindingEvent.getValue();
            if (maps.get(personInfo.getAccount()) != null) {
                HttpSession otherSession = maps.get(personInfo.getAccount());
                PersonInfo oldPersonInfo = (PersonInfo) otherSession.getAttribute("personInfo");
                System.out.println("账号" + oldPersonInfo.getAccount() + "在" + oldPersonInfo.getIp()
                        + "已经登录,该登录将被迫下线");
                otherSession.removeAttribute("personInfo");
                otherSession.setAttribute("msg", "您的账号已经在其他机器上登录,您被迫下线.");
            }
            maps.put(personInfo.getAccount(), httpSessionBindingEvent.getSession());
            System.out.println("账号" + personInfo.getAccount() + "在" + personInfo.getIp() + "登录");
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent httpSessionBindingEvent) {
        System.out.println("LoginSessionListener: attributeRemoved");
        String name = httpSessionBindingEvent.getName();
        if (name.equals("personInfo")) {
            PersonInfo personInfo = (PersonInfo) httpSessionBindingEvent.getValue();
            maps.remove(personInfo.getAccount());
            System.out.println("账号" + personInfo.getAccount() + "注销.");
        }
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent httpSessionBindingEvent) {
        System.out.println("LoginSessionListener: attributeReplaced");
        String name = httpSessionBindingEvent.getName();
        if (name.equals("personInfo")) {
            PersonInfo oldPersonInfo = (PersonInfo) httpSessionBindingEvent.getValue();
            maps.remove(oldPersonInfo.getAccount());
            PersonInfo newPersonInfo = (PersonInfo) httpSessionBindingEvent.getSession().getAttribute("personInfo");
            if (maps.get(newPersonInfo.getAccount()) != null) {
                HttpSession session = maps.get(newPersonInfo.getAccount());
                session.removeAttribute("personInfo");
                session.setAttribute("msg","您的账号已经在其他机器上登录,您被迫下线.");
            }
            maps.put(newPersonInfo.getAccount(),httpSessionBindingEvent.getSession());

        }
    }
}
