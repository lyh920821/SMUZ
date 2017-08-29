package com.project.one.model.dao.Member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public String member_insert(MemberVO vo){
		try{
			sqlSession.insert("member.memberInsert", vo);
			HashMap<String, String> hm = new HashMap();
			hm.put("userid",vo.getSm_id());
			hm.put("userpass",vo.getSm_password());
			MemberVO play = sqlSession.selectOne("member.memberList",hm);
			int FKseq = play.getSm_seq();
			/*playlist table �깮�꽦*/
			sqlSession.insert("member.playList", FKseq);
			return "true";
		}catch (Exception e) {
			return "false";
		}
	}

	@Override
	public int memeberCheck(String check) {
		return sqlSession.selectOne("member.memberCheck",check);
	}

	@Override
	public int memberLogin(String id, String pass) {
		 HashMap<String, String> hm = new HashMap();
		 hm.put("userid",id);
		 hm.put("userpass",pass);
		return sqlSession.selectOne("member.memberLoginCheck",hm);
	}

	@Override
	public MemberVO memberList(String id, String pass) {
		HashMap<String, String> hm = new HashMap();
		hm.put("userid",id);
		hm.put("userpass",pass);
		return sqlSession.selectOne("member.memberList",hm);
	}

	@Override
	public MemberVO memberSEQ(int seq) {
		return sqlSession.selectOne("member.memberSEQ", seq);
	}

	@Override
	public void memberUpdate(MemberVO vo) {
		sqlSession.update("member.memberupdate",vo);
	}

	
	

}
