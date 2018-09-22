package com.wei.q.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Date;

public class MyContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ApplicationConstants.START_DATE = new Date();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ApplicationConstants.START_DATE = null;
        ApplicationConstants.MAX_ONLINE_COUNT_DATE = null;
    }
}
