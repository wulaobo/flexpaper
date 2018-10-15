package com.web.action;

import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;

@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User> {
    User user = new User();

    @Autowired
    private IUserService userService;

    //属性驱动,接收从页面输入的验证码
    private String validatecode;
    public void setValidatecode(String validatecode) {
        this.validatecode = validatecode;
    }

    //用户登录
    public String login() {
        //从session域中取出验证码的值
        String key = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
        //校验验证码是否输入正确
        if(StringUtils.isNotBlank(validatecode) && validatecode.equals(key)){
            //从数据库中查询用户
            User u = userService.login(user);
            if(u!=null){
                //用户不为空,保存在session域中
                ActionContext.getContext().getSession().put("loginUser",u);
                return "zhuye";
            }else{
                //用户为空
                this.addActionError("用户名或密码错误");
                return "login";
            }
        }else{
            this.addActionError("验证码错误");
        }
        return "login";
    }

    public String findPassword() throws IOException {
        String f = "密码为: ";
        String username = ServletActionContext.getRequest().getParameter("username");
        String validate = ServletActionContext.getRequest().getParameter("validate");

        //从session域中取出验证码的值
        String key = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
        if(StringUtils.isNotBlank(validate)&&validate.equals(key)){
            String password = userService.findPasswordByUsername(username);
            f = f+password;
        }else{
            f="验证码输入错误";
        }
        ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
        ServletActionContext.getResponse().getWriter().print(f);
        return NONE;
    }

    //修改用户
    public String updateUser() throws IOException {
//        System.out.println("hehe");
//        return "hehe";
        //从session域中取出当前用户
        String f = "1";
        User user = (User) ActionContext.getContext().getSession().get("loginUser");
            String username = ServletActionContext.getRequest().getParameter("username");
            String password = ServletActionContext.getRequest().getParameter("password");
            user.setUsername(username);
            user.setPassword(password);

            try {
                userService.updateUser(username, password, user.getId());
                System.out.println(user);
            } catch (Exception e) {
                f = "0";
                e.printStackTrace();
            }

            ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
            ServletActionContext.getResponse().getWriter().print(f);

            return NONE;

    }

    //用户注销
    public String logout() {
        ServletActionContext.getRequest().getSession().invalidate();
        return "qiantai";
    }

    @Override
    public User getModel() {
        return user;
    }
}
