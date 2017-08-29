package com.project.one.service.Member;

import java.util.List;

import com.project.one.model.dto.MemberVO;

public interface MemberService {
	public String member_insert(MemberVO vo);
	public int memeberCheck(String check);
	public int memberLogin(String id,String pass);
	public MemberVO memberList(String id,String pass);
	public MemberVO memberSEQ(int seq);
	public void memberUpdate(MemberVO vo);
}
