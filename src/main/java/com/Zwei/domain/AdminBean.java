package com.Zwei.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * @author: Zwei
 * @create: 2020-09-28 14:39
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component("adminBean")
public class AdminBean {
    private int admin_Id;
    private String admin_name;
    private String admin_password;
}