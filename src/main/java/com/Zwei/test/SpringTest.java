package com.Zwei.test;

import com.Zwei.service.ManagerImpl;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author: Zwei
 * @create: 2020-09-28 21:02
 **/
public class SpringTest {

    @Test
    public  void test(){
        ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        ManagerImpl managerImpl =(ManagerImpl) ioc.getBean("managerImpl");
        System.out.println(managerImpl);
    }
}