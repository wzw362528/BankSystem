package com.Zwei.service;

import com.Zwei.domain.AdminBean;
import com.Zwei.domain.LogBean;
import com.Zwei.domain.UserBean;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public interface Manager {
    UserBean findUser(String username )throws IOException;
    double getBalance(UserBean userBean)throws IOException;//查询
    String withdrawals(double money,HttpSession session) throws IOException;//取款
    String deposit(double money,HttpSession session) throws IOException;//存款
    boolean register(UserBean userBean)throws  IOException;//注册
    UserBean login(String username, String password)throws IOException;//登录
    String transfer(String username, double transferMoney, HttpSession session)throws IOException;//转账
    AdminBean login(AdminBean adminBean);//管理员登录
    List<LogBean> SearchDetail(UserBean userBean);//明细
    String FreezeUsers(String user_name)throws IOException;//冻结用户/解冻用户
}
