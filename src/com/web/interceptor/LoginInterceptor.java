package com.web.interceptor;

import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

//自定义拦截器
public class LoginInterceptor extends MethodFilterInterceptor {
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        User u = (User) ActionContext.getContext().getSession().get("loginUser");
        if(u == null){
            return "login";
        }
        return actionInvocation.invoke();
    }
}
