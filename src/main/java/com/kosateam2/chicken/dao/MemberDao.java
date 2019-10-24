package com.kosateam2.chicken.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kosateam2.chicken.dto.ChickenMember;

@Component
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ChickenMember getMember(String mid) {
		ChickenMember member = sqlSessionTemplate.selectOne("member.selectMember", mid);
		return member;
	}

}
