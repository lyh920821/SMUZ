package com.project.one.model.dao.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.admin.AdminMusicfeedVO;

@Repository
public class AdminFeedDaoImpl implements AdminFeedDao {
	@Inject
	SqlSession sqlSession;

	@Override
	public List<AdminMusicfeedVO> flist() {
		List<AdminMusicfeedVO> flist = sqlSession.selectList("AdminFeed.select");
		return flist;
	}

	@Override
	public void fdel(int mf_id) {
		sqlSession.delete("AdminFeed.del",mf_id);
	}
}
