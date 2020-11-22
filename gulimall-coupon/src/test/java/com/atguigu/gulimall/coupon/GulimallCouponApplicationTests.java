package com.atguigu.gulimall.coupon;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.context.config.annotation.RefreshScope;

@SpringBootTest
@RefreshScope
class GulimallCouponApplicationTests {
    @Value("${coupon.username}")
    String username;

    @Value("${coupon.age}")
    String age;
    @Test
    void contextLoads() {
        System.out.println(username+":"+age);
    }

}
