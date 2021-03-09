package com.Zwei.service;

import com.Zwei.dao.BankDao;
import com.Zwei.domain.AdminBean;
import com.Zwei.domain.LogBean;
import com.Zwei.domain.UserBean;
import com.Zwei.util.MD5;
import jdk.nashorn.internal.ir.CallNode;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author: Zwei
 * @create: 2020-09-28 16:23
 **/
@Service("managerImpl")
public class ManagerImpl implements Manager{

    @Autowired
    private BankDao bankDao;
    /**
     * 用户注册
     * @param userBean
     * @return
     * @throws IOException
     */
    public boolean register(UserBean userBean) throws IOException {
        return bankDao.insertUser(userBean);
    }

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     * @throws IOException
     */
    public UserBean login(String username, String password) throws IOException {
        return bankDao.findUser(username);
    }

    /**
     * 查看用户是否存在
     * @param username
     * @return
     * @throws IOException
     */
    public UserBean findUser(String username ) throws IOException {
        return bankDao.findUser(username);
    }

    /**
     * 查询用户余额
     * @param userBean
     * @return
     * @throws IOException
     */
    public double getBalance(UserBean userBean) throws IOException{
        return bankDao.findUser(userBean.getUsername()).getBalance();
    }

    /**
     * 存款
     * @param money
     * @return
     * @throws IOException
     */
    public String deposit(double money,HttpSession session) throws IOException {
        UserBean user = (UserBean) session.getAttribute("user");
        String res=null;
        if(money<0) {
            res="请输入正确的金额";
            return res;
        }else {
            //加上用户存入的金额
            user.setBalance(user.getBalance()+money);
            //数据库更新数据
            bankDao.updateMoney(user);
            bankDao.insertLog(new LogBean("存款",user.getUserId(),money));
        }
        res="存款成功，您的余额为："+user.getBalance()+"￥";
        return res;
    }

    /**
     * 取款
     * @param money
     * @return
     * @throws IOException
     */
    public String withdrawals(double money,HttpSession session) throws IOException {
        UserBean user = (UserBean) session.getAttribute("user");
        String res=null;
        if(money<0) {
            res="请输入正确的金额";
            return res;
        }else {
            if(user.getBalance()<money) {
                res="您的余额不足,取款失败";
                return res;
            }else {
                //取出余额后重新设置用户余额
                user.setBalance(user.getBalance()-money);
                //数据库更新余额
                bankDao.updateMoney(user);
                //完成取钱操作后进行记录
                bankDao.insertLog(new LogBean("取款",user.getUserId(),money));
            }
        }
        res="取款成功,您的余额为："+user.getBalance()+"￥";
        return res;
    }

    /**
     * 转账
     * @param username
     * @param transferMoney
     * @return
     * @throws IOException
     */
    public String transfer(String username, double transferMoney, HttpSession session) throws IOException {
        UserBean userBean = (UserBean) session.getAttribute("user");
        //定义要返回的字符串
        String res=null;
        //获取被转账人的账户信息
        UserBean user = bankDao.findUser(username);
        //判断是否为空
        if (user==null){
            res = "用户不存在";
            return  res;
        }else{
            //用户存在
            if (userBean.getBalance()>=transferMoney){
                //封装属性，被转账人余额增加
                user.setBalance(user.getBalance()+transferMoney);
                //数据库数据更新
                bankDao.updateMoney(user);
                //转账者钱减少
                userBean.setBalance(userBean.getBalance()-transferMoney);
                bankDao.updateMoney(userBean);
                bankDao.insertLog(new LogBean("转账",userBean.getUserId(),transferMoney));
            }else{
                res = "账户余额不足";
                return res;
            }
                res = "转账成功,您的余额为:"+userBean.getBalance()+"￥";
                return  res;
    }
    }

    /**
     * 流水明细查询
     * @param  userBean
     * @return
     */
    public List<LogBean> SearchDetail(UserBean userBean ) {
        return bankDao.Detail(userBean);
    }

    /**
     * 管理员登录
     * @param    adminBean
     * @return
     */
    public AdminBean login(AdminBean adminBean) {
        return bankDao.findAdmin(adminBean.getAdmin_name());
    }


    /**
     * 冻结用户
     * @param user_name
     * @return
     */

    public String FreezeUsers(String user_name) throws IOException {
        //通过用户名获取要冻结的用户信息
        UserBean user = bankDao.findUser(user_name);
        //获取用户状态信息
        int flag = user.getUser_flag();
        //定义一个返回值变量
        String res=null;
        if (flag==1){
            bankDao.freezeUser(user_name);
            res=user.getUsername()+":已成功冻结";
            return res;
        }else{
            //flag为0则改为1，进行解冻操作
            bankDao.UnfreezeUser(user_name);
            res=user.getUsername()+":已成功解除冻结";
            return res;
        }
    }
}