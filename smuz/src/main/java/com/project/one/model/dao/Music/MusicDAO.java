package com.project.one.model.dao.Music;

import java.util.List;
import java.util.Map;

import com.project.one.model.dto.MusicVO;

public interface MusicDAO {
	public List<MusicVO> musicList(Integer[] sqltest);
	public MusicVO musicSet(int ms_id);
	public void musicUpdate(MusicVO vo);
	public Map<String, Object> recommendMusicList(Map<String, Object> mp);
}
