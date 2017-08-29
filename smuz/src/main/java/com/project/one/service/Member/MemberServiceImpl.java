package com.project.one.service.Member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.one.model.dao.Member.MemberDAO;
import com.project.one.model.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO memberDao;
	
	@Override
	public String member_insert(MemberVO vo){
		return memberDao.member_insert(vo);
	}

	@Override
	public int memeberCheck(String check) {
		return memberDao.memeberCheck(check);
	}

	@Override
	public int memberLogin(String id, String pass) {
		return memberDao.memberLogin(id, pass);
	}

	@Override
	public MemberVO memberList(String id, String pass) {
		return memberDao.memberList(id, pass);
	}

	@Override
	public MemberVO memberSEQ(int seq) {
		return memberDao.memberSEQ(seq);
	}

	@Override
	public void memberUpdate(MemberVO vo) {
		memberDao.memberUpdate(vo);
		
	}


}
