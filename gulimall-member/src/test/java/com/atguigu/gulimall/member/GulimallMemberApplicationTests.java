package com.atguigu.gulimall.member;

import com.atguigu.common.utils.R;
import com.atguigu.gulimall.member.feign.CouponFeignService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class GulimallMemberApplicationTests {
    @Autowired
    CouponFeignService couponFeignService;

    @Test
    void testFeign(){
        R membercoupons = couponFeignService.membercoupons();
        System.out.println(membercoupons);
    }

    @Test
    void contextLoads() {
    }

}
