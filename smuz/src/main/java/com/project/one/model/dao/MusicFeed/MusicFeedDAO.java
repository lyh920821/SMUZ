package com.project.one.model.dao.MusicFeed;

import java.util.List;

import com.project.one.model.dto.CommentVO;
import com.project.one.model.dto.MusicfeedVO;

public interface MusicFeedDAO {
	
	public List<CommentVO> comment(int bbid);
	public void MusicFeedInsert(MusicfeedVO mfv);
	public List<MusicfeedVO> listMusicFeed(int seq);
	public List<MusicfeedVO> followfeed(Integer[] follow);
}
