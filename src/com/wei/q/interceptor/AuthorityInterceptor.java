package com.wei.q.interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import org.omg.PortableInterceptor.ACTIVE;

import java.util.Map;

public class AuthorityInterceptor implements Interceptor {
    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        System.out.println("权限拦截器开始执行");
        ActionContext context = ActionContext.getContext();
        Map session = context.getSession();
        String user = (String) session.get("user");
        if(user!=null && user.equals("root")){
            return actionInvocation.invoke();
        }
        context.put("tip","您还没有登录，请输入用户名root登录到系统中");
        System.out.println("权限拦截器执行结束");
        return Action.LOGIN;
    }
}
