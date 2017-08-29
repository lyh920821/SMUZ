package com.project.one.model.dao.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.admin.AdminMemberVo;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<AdminMemberVo> table() {
		List<AdminMemberVo> table = sqlSession.selectList("Adminmember.view"); 
		return table;
	}

	@Override
	public List<AdminMemberVo> artist(int sm_rating) {
		List<AdminMemberVo> artist = sqlSession.selectList("Adminmember.artist",sm_rating);
		return artist;
	}

	@Override
	public void memberupdata(AdminMemberVo vo) {
		sqlSession.update("Adminmember.update",vo);
	}

	@Override
	public void memberRemove(int sm_seq) {
		sqlSession.delete("Adminmember.del",sm_seq);
	}
	
}
