package com.wei.q.listener;

import javax.servlet.http.*;
import java.util.Date;

public class MySessionListener implements HttpSessionAttributeListener, HttpSessionListener {
    @Override
    public void attributeAdded(HttpSessionBindingEvent se) {
        if (se.getName().equals("personInfo")) {
            ApplicationConstants.CURRENT_LOGIN_COUNT++;
            HttpSession session = se.getSession();
            for (HttpSession sess : ApplicationConstants.SESSION_MAP.values()) {
                if (se.getValue().equals(sess.getAttribute("personInfo"))
                        && session.getId() != sess.getId()) {
                    sess.invalidate();
                }
            }
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent se) {
        if (se.getName().equals("personInfo")) {
            ApplicationConstants.CURRENT_LOGIN_COUNT--;
        }
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent se) {
        if (se.getName().equals("personInfo")) {
            HttpSession session = se.getSession();
            for (HttpSession sess : ApplicationConstants.SESSION_MAP.values()) {
                if (se.getValue().equals(sess.getAttribute("personInfo"))
                        && session.getId() != sess.getId()) {
                    sess.invalidate();
                }
            }
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        ApplicationConstants.SESSION_MAP.remove(session.getId());
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        ApplicationConstants.SESSION_MAP.put(session.getId(), session);
        ApplicationConstants.TOTAL_HISTORY_COUNT++;
        if (ApplicationConstants.SESSION_MAP.size() > ApplicationConstants.MAX_ONLINE_COUNT) {
            ApplicationConstants.MAX_ONLINE_COUNT = ApplicationConstants.SESSION_MAP.size();
            ApplicationConstants.MAX_ONLINE_COUNT_DATE = new Date();
        }
    }
}
