package com.project.one.service.PlayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.one.model.dao.PlayList.PlayListDAO;
import com.project.one.model.dto.MusicVO;
import com.project.one.model.dto.PlaylistVO;

@Service
public class PlayListServiceImpl implements PlayListService{
	
	@Inject
	PlayListDAO playlist;
	
	@Override
	public PlaylistVO playlist(int seq) {
		return playlist.playlist(seq);
	}

	@Override
	public MusicVO listInsert(String musicNumber,int seq,int musicid) {
		return playlist.listInsert(musicNumber, seq,musicid);
	}
	
}
