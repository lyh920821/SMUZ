package com.project.one.model.dao.PlayList;

import com.project.one.model.dto.MusicVO;
import com.project.one.model.dto.PlaylistVO;

public interface PlayListDAO {
	public PlaylistVO playlist(int seq);
	public MusicVO listInsert(String musicNumber,int seq,int musicid);
}
