package com.project.one.model.dao.Music;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.MusicVO;
import com.project.one.model.dto.TestVO;

@Repository
public class MusicDAOImpl implements MusicDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<MusicVO> musicList(Integer[] arrtest) {
		TestVO plv = new TestVO();
		plv.setSqlll(arrtest);
		return sqlSession.selectList("music.musicListSEQ", plv);
	}

	@Override
	public MusicVO musicSet(int ms_id) {
		return sqlSession.selectOne("music.musicmusic", ms_id);
	}

	@Override
	public void musicUpdate(MusicVO vo) {
		sqlSession.update("music.update",vo);
		
	}

	@Override
	public Map<String, Object> recommendMusicList(Map<String, Object> mp) {
		HashMap<String, Integer> hm = new HashMap();
		hm=(HashMap)mp.get("RCOLOR");
		List<MusicVO> r = sqlSession.selectList("music.recommendListR",hm);
		hm=(HashMap)mp.get("GCOLOR");
		List<MusicVO> g = sqlSession.selectList("music.recommendListR",hm);
		hm=(HashMap)mp.get("BCOLOR");
		List<MusicVO> b = sqlSession.selectList("music.recommendListR",hm);
		Map<String, Object> resultMap = new HashMap();
		resultMap.put("colorR", r);
		resultMap.put("colorG", g);
		resultMap.put("colorB", b);
		/*Iterator it = i.iterator();
		while(it.hasNext()){
			MusicVO v = (MusicVO)it.next();
			System.out.println(v.getMs_name());
			System.out.println(v.getMs_singer());
			System.out.println();
		}*/
		
		/*System.out.println(mp.get("RCOLOR"));
		System.out.println(mp.get("GCOLOR"));
		System.out.println(mp.get("BCOLOR"));*/
		return resultMap;
	}


}
