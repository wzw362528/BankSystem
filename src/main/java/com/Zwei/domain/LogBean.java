package com.Zwei.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.sql.Date;

/**
 * 用lombok插件和注解省去了构造方法和set/get方法的书写
 * @author: Zwei
 * @create: 2020-09-28 14:39
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component("logBean")
public class LogBean {
    private int id;
    private String operated;//操作明细
    private int userId;
    private double balance;
    private Date times;//操作时间

    public LogBean(String operated, int userId, double transferMoney) {
        this.operated = operated;
        this.userId = userId;
        this.balance = transferMoney;
    }


}