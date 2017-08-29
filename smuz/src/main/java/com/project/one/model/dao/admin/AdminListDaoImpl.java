package com.project.one.model.dao.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.admin.AdminListfeedVO;

@Repository
public class AdminListDaoImpl implements AdminListDao {
	@Inject
	SqlSession sqlSession;

	@Override
	public List<AdminListfeedVO> llist() {
		List<AdminListfeedVO> llist = sqlSession.selectList("AdminList.select");
		return llist;
	}

	@Override
	public void ldel(int lf_id) {
		sqlSession.delete("AdminList.del",lf_id);
		
	}
}
