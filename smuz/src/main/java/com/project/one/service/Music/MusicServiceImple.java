package com.project.one.service.Music;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.one.model.dao.Music.MusicDAO;
import com.project.one.model.dto.MusicVO;

@Service
public class MusicServiceImple implements MusicService {
	@Inject
	MusicDAO musicDao;

	@Override
	public List<MusicVO> musicList(Integer[] sqltest) {
		return musicDao.musicList(sqltest);
	}

	@Override
	public MusicVO musicSet(int ms_id) {
		return musicDao.musicSet(ms_id);
	}

	@Override
	public void musicUpdate(MusicVO vo) {
		musicDao.musicUpdate(vo);
		
	}

	@Override
	public Map<String, Object> recommendMusicList(Map<String, Object> mp) {
		return musicDao.recommendMusicList(mp);
	}

}
