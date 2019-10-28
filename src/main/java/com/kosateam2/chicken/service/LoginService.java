package com.kosateam2.chicken.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosateam2.chicken.dao.MemberDao;
import com.kosateam2.chicken.dto.ChickenMember;

@Service
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	@Autowired
	private MemberDao memberDao;
	
	public ChickenMember logincheck(String mid, String mpassword) {
		ChickenMember member = memberDao.getMember(mid);
		return member;
	}

	public void join(ChickenMember member) {
		memberDao.insert(member);
	}
}
