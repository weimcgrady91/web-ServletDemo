package com.wei.q.listener;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class ApplicationConstants {
    public static Map<String,HttpSession> SESSION_MAP = new HashMap<>();
    public static int CURRENT_LOGIN_COUNT =0;
    public static int TOTAL_HISTORY_COUNT = 0;
    public static Date START_DATE = new Date();
    public static Date MAX_ONLINE_COUNT_DATE = new Date();
    public static int MAX_ONLINE_COUNT = 0;
}
