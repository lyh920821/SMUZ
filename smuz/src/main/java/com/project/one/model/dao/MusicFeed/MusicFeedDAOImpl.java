package com.project.one.model.dao.MusicFeed;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.project.one.model.dto.CommentVO;
import com.project.one.model.dto.MusicfeedVO;
import com.project.one.model.dto.TestVO;

@Repository
public class MusicFeedDAOImpl implements MusicFeedDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public List<CommentVO> comment(int bbid) {
		return sqlSession.selectList("musicFeed.comment",bbid);
	}

	@Override
	public void MusicFeedInsert(MusicfeedVO mfv) {
		sqlSession.insert("musicFeed.musicFeedInsert",mfv);
	}
	
	@Override
	public List<MusicfeedVO> listMusicFeed(int seq) {
		return sqlSession.selectList("musicFeed.musicFeedList",seq);
	}

	@Override
	public List<MusicfeedVO> followfeed(Integer[] follow) {
		TestVO plv = new TestVO();
		plv.setSqlll(follow);
		
		return sqlSession.selectList("musicFeed.followMusicFeed", plv);
	}
}
