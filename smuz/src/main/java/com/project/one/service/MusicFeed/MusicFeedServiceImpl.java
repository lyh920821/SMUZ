package com.project.one.service.MusicFeed;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.one.model.dao.MusicFeed.MusicFeedDAO;
import com.project.one.model.dto.CommentVO;
import com.project.one.model.dto.MusicfeedVO;

@Service
public class MusicFeedServiceImpl implements MusicFeedService {
	@Inject
	MusicFeedDAO musicfeedDAO;

	@Override
	public List<CommentVO> comment(int bbid){
		return musicfeedDAO.comment(bbid);
	}

	@Override
	public void MusicFeedInsert(MusicfeedVO mfv) {
		musicfeedDAO.MusicFeedInsert(mfv);
	}
	@Override
	public List<MusicfeedVO> listMusicFeed(int seq) {
		return musicfeedDAO.listMusicFeed(seq);
	}

	@Override
	public List<MusicfeedVO> followfeed(Integer[] follow) {
		return musicfeedDAO.followfeed(follow);
	}
}
