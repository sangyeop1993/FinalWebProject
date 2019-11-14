package com.kosateam2.chicken.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kosateam2.chicken.dto.ChickenMember;
import com.kosateam2.chicken.dto.ChickenMemberAndOrder;

@Component
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ChickenMember getMember(String mid) {
		ChickenMember member = sqlSessionTemplate.selectOne("member.selectMember", mid);
		return member;
	}

	public int insert(ChickenMember member) {
		int rows = sqlSessionTemplate.insert("member.insert", member);
		return rows;
	}

	public ChickenMember selectMember(String mid) {
		ChickenMember member = sqlSessionTemplate.selectOne("member.selectMember",mid);
		return member;
	}

	public int delete(String mid) {
		int rows = sqlSessionTemplate.delete("member.deleteMember",mid);
		return rows;
	}

}
