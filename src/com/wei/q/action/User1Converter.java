package com.wei.q.action;

import com.wei.q.domain.User1;
import org.apache.struts2.util.StrutsTypeConverter;

import java.util.Map;

public class User1Converter extends StrutsTypeConverter {
    @Override
    public Object convertFromString(Map map, String[] strings, Class aClass) {
        User1 user1 = new User1();
        String[] user1Values = strings[0].split(",");
        user1.setUsername(user1Values[0]);
        user1.setPassword(user1Values[1]);

        return user1;
    }

    @Override
    public String convertToString(Map map, Object o) {
        return null;
    }
}
