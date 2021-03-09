package com.Zwei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

/**
 * 需要提交请求的页面才在此进行跳转
 * @author: Zwei
 * @create: 2020-09-29 15:10
 **/
@Controller
@RequestMapping("pages")
public class pagesController {
    /**
     * 用户点击登录
     * @return
     * @throws IOException
     */
    @RequestMapping("welcome")
    public String loadLogin() throws IOException {
        return "login";
    }

    /**
     * 用户点击去注册超链接，控制跳转到注册页面
     * @return
     * @throws IOException
     */
    @RequestMapping("gotoRegister")
    public String gotoRegister() throws IOException {
        return "register";
    }

    /**
     * 用户点击管理员登录
     * @return
     * @throws IOException
     */
    @RequestMapping("gotoAdmin")
    public String gotoAdmin() throws IOException {
        return "AdminLogin";
    }
    /**
     * 存钱页面跳转
     * @return
     * @throws IOException
     */
    @RequestMapping("gotoDeposit")
    public String gotoDeposit() throws IOException {
        return "deposit";
    }

    /**
     * 取钱页面跳转
     * @return
     * @throws IOException
     */
    @RequestMapping("gotoWithdrawals")
    public String gotoWithdrawals() throws IOException {
        return "withdrawals";
    }

    /**
     * 转账页面跳转
     * @return
     * @throws IOException
     */
    @RequestMapping("gotoTransfer")
    public String gotoTransfer() throws IOException {
        return "transfer";
    }

    /**
     * 冻结解冻页面
     * @return
     * @throws IOException
     */
    @RequestMapping("gotoFreezeUser")
    public String gotoFreezeUser() throws IOException {
        return "freezeUser";
    }
}