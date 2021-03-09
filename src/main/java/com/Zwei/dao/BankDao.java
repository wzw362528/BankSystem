package com.Zwei.dao;

import com.Zwei.domain.AdminBean;
import com.Zwei.domain.LogBean;
import com.Zwei.domain.UserBean;
import org.apache.ibatis.annotations.Select;
import org.junit.Test;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;
@Repository
public interface BankDao {


    @Select("select * from t_user")
   public  List<UserBean> findAll();

    /**
     * 查找用户
     * @throwsFileNotFoundException
     */

    UserBean findUser(String username)throws IOException;
    /**
     * 添加用户
     * @throwsFileNotFoundException
     * @throws IOException
     */
    boolean insertUser(UserBean userBean);
    /**
     *
     * 退出时保存数据
     * @throws IOException
     */
    void updateMoney(UserBean userBean) throws IOException;

    /**
     *数据库表t_log中插入用户的操作记录
     * @param logBean
     */
    void insertLog(LogBean logBean);

    /**
     * 查询明细
     * @param userBean
     */
    List<LogBean> Detail(UserBean userBean);

    /**
     * 查找管理员
     * @param admin_name
     * @return
     */
    AdminBean findAdmin(String admin_name);

    /**
     * 冻结用户
     * @param  user_name
     */
    void freezeUser(String user_name);

    /**
     * 解冻
     * @param  user_name
     */
    void UnfreezeUser(String user_name);
}
