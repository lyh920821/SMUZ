package com.project.one.model.dao.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.admin.AdminMusicVo;

@Repository
public class AdminMusicDaoImpl implements AdminMusicDao{
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<AdminMusicVo> table() {
		List<AdminMusicVo> table = sqlSession.selectList("Adminmusic.adminview");
		return table;
	}

	@Override
	public void mdel(int ms_id) {
		sqlSession.delete("Adminmusic.admindel",ms_id);
	}
}
