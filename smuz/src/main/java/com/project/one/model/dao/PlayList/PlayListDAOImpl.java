package com.project.one.model.dao.PlayList;

import java.util.HashMap;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.project.one.model.dto.MusicVO;
import com.project.one.model.dto.PlaylistVO;


@Repository
public class PlayListDAOImpl implements PlayListDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public PlaylistVO playlist(int seq) {
		return sqlSession.selectOne("playList.playListSEQ", seq);
	}

	@Override
	public MusicVO listInsert(String musicNumber, int seq, int musicid) {
		HashMap<String, Object> hm = new HashMap();
		hm.put("musicNumber", musicNumber);
		hm.put("seq", seq);
		MusicVO type;
		try{
			sqlSession.update("playList.ListInsert", hm);
			type = sqlSession.selectOne("music.musicmusic",musicid);
		}catch (Exception e) {
			type = null;
		}
		return type;
	}


}
