package com.Zwei.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * @author: Zwei
 * @create: 2020-09-28 14:38
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component("userBean")
public class UserBean {
    private int userId;//用户在数据库中的编号
    private String username;
    private String password;
    private double balance;//余额
    private int user_flag;//1表示用户可进行操作，0表示用户不可进行操作

    public UserBean(String username, String password) {

    }
}