package com.atguigu.gulimall.member.dao;

import com.atguigu.gulimall.member.entity.MemberEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员
 * 
 * @author hly
 * @email sunlightcs@gmail.com
 * @date 2020-11-08 21:38:49
 */
@Mapper
public interface MemberDao extends BaseMapper<MemberEntity> {
	
}
