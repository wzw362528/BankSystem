package com.Zwei.controller;

import com.Zwei.dao.BankDao;
import com.Zwei.domain.AdminBean;
import com.Zwei.domain.LogBean;
import com.Zwei.domain.UserBean;
import com.Zwei.service.Manager;
import com.Zwei.service.ManagerImpl;
import com.Zwei.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author: Zwei
 * @create: 2020-09-28 16:20
 **/
@Controller
@RequestMapping("bank")
public class CentralController {

    @Autowired
    private Manager manager;

    @Autowired
    private BankDao bankDao;

    @RequestMapping("find")
    public String loadLogin() throws IOException {
        return "menu";
    }

    /**
     * 用户登录
     *      登录成功，跳转至主页menu.jsp
     *      登录失败，跳转至failLogin.jsp
     *      用户被冻结：Freeze.jsp
     * @return menu
     */
    @RequestMapping("login")
    public String login(String username, String password, HttpSession session) throws IOException {
        UserBean userBean = manager.login(username, password);
        session.setAttribute("user", userBean);

        if (userBean!=null){
            if (userBean.getUser_flag()==1){
                return "menu";
            }else{
                return "Freeze";
            }
        }else{
            return "failLogin";
        }
    }

    /**
     * 用户注册
     *       注册成功，跳转至login.jsp
     *       注册失败，跳转至register.jsp 重定向
     * @return
     */
    @RequestMapping("register")
    public String register(@RequestParam("username") String username, @RequestParam("password") String password) throws IOException {
        //查看用户是否存在
        UserBean user = manager.findUser(username);
        if (user!=null){
            //用户已存在，重定向回注册页面
            return "register";
        }else{
            //user为空时，将输入的username，password封装进user
            //密码加密
            String md5Password=MD5.getMD5(password);
            //封装属性
            UserBean userBean=new UserBean();
            userBean.setUsername(username);
            userBean.setPassword(md5Password);
            boolean flag = manager.register(userBean);
            if(flag){
                //注册成功跳转至登录界面
                return "login";
            }else{
                //注册失败，重定向
                return "register";
            }
        }
    }

    /**
     * 余额查询
     *      跳转至querymoney.jsp
     * @return
     */
    @RequestMapping("query")
    public String queryMoney(HttpServletRequest req,HttpSession session) throws IOException {
        UserBean user = (UserBean) session.getAttribute("user");
        double balance=manager.getBalance(user);
        String res="您的余额为:"+balance+"￥";
        req.setAttribute("res",res);
        return "querymoney";
    }
    /**
     *  存钱页面 deposit.jsp
     *  失败则重定向回
     */
    @RequestMapping("deposit")
    public String deposit(@RequestParam("balance") String balance,HttpServletRequest req,HttpSession session) throws IOException {
        String res = manager.deposit(Double.parseDouble(balance),session);
        req.setAttribute("res",res);
        return "deposit";
    }

    /**
     * 取钱页面 withdrawals.jsp
     * @return
     */
    @RequestMapping("withdrawals")
    public String withdrawals(@RequestParam("balance") String balance,HttpServletRequest req,HttpSession session) throws IOException {
        String res = manager.withdrawals(Double.parseDouble(balance),session);
        req.setAttribute("res",res);
        return  "withdrawals";
    }

    /**
     * 转账页面transfer。jsp
     * @return
     */
    @RequestMapping("transfer")
    public String transfer( @RequestParam("username")String username,@RequestParam("balance") String balance, HttpServletRequest req,HttpSession session) throws IOException {
        //获取表单参数
        String res = manager.transfer(username,Double.parseDouble(balance),session);
        //将字符串返回值打印在页面上
        req.setAttribute("res",res);
        return  "transfer";
    }

    /**
     * 操作明细页面 Findms.jsp
     * @return
     */
    @RequestMapping("findMsg")
    public String findMsg(HttpServletRequest req,HttpSession session){
        UserBean user = (UserBean) session.getAttribute("user");

        List<LogBean> logBeans = manager.SearchDetail(user);

        req.setAttribute("logs",logBeans);

        return "Findmsg";
    }

    /**
     * 管理员登录
     *      登录成功，跳转至freezeUser.jsp
     *      登录失败，跳转至failLogin.jsp
     * @return
     */
    @RequestMapping("adminLogin")
    public String adminLogin(@RequestParam("admin_name") String admin_name,HttpSession session){
        //先查询t_admin是否存在该管理员
        AdminBean adminBean = bankDao.findAdmin(admin_name);
        if (adminBean==null){
            //管理员不存在，则跳转至登录失败页面
            return "failLogin";
        }else{
            //管理员存在
            //将管理员对象放入session域对象中
            session.setAttribute("admin",adminBean);
            //进行登录操作
            manager.login(adminBean);
            //跳转至冻结用户页面
            return "freezeUser";
        }
    }

    /**
     * 管理员冻结用户操作
     * 冻结或解冻操作完成后，重定向回freezeUser
     */
    @RequestMapping("freezeUser")
    public String freezeUser(@RequestParam("username") String username ,HttpServletRequest req) throws IOException {
        //获取冻结操作后的字符串
        String res = manager.FreezeUsers(username);
        //字符串显示在页面上
        req.setAttribute("res",res);
        return "freezeUser";
    }
}