package com.atguigu.gulimall.coupon.dao;

import com.atguigu.gulimall.coupon.entity.CouponEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 优惠券信息
 * 
 * @author hly
 * @email sunlightcs@gmail.com
 * @date 2020-11-08 21:27:28
 */
@Mapper
public interface CouponDao extends BaseMapper<CouponEntity> {
	
}
