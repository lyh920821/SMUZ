package com.project.one.service.PlayList;

import com.project.one.model.dto.MusicVO;
import com.project.one.model.dto.PlaylistVO;

public interface PlayListService {
	public PlaylistVO playlist(int seq);
	public MusicVO listInsert(String musicNumber,int seq,int musicid);
}
