package com.project.one.model.dao.ListFeed;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.ListfeedVO;
import com.project.one.model.dto.TestVO;

@Repository
public class ListFeedDAOImpl implements ListFeedDAO{
	@Inject
	SqlSession sqlSession;

	@Override
	public String listFeedInsert(ListfeedVO lfv) {
		String aa ; 
		try{
			sqlSession.insert("listFeed.listFeedInsert",lfv);
			aa="true";
		}catch (Exception e) {
			aa="false";
		}
		return aa;
	}

	@Override
	public List<ListfeedVO> listFeedSearch(int lf_uploader) {
		return sqlSession.selectList("listFeed.listFeedSearch",lf_uploader);
	}

	@Override
	public List<ListfeedVO> followfeed(Integer[] follow) {
		TestVO plv = new TestVO();
		plv.setSqlll(follow);
		
		return sqlSession.selectList("listFeed.followListFeed", plv);
	}


}