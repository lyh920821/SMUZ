package com.project.one.service.ListFeed;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.one.model.dao.ListFeed.ListFeedDAO;
import com.project.one.model.dto.ListfeedVO;

@Service
public class ListFeedServiceImpl implements ListFeedService {
	@Inject
	ListFeedDAO listFeedDao;

	@Override
	public String listFeedInsert(ListfeedVO lfv) {
		return listFeedDao.listFeedInsert(lfv);
	}

	@Override
	public List<ListfeedVO> listFeedSearch(int lf_uploader) {
		return listFeedDao.listFeedSearch(lf_uploader);
	}

	@Override
	public List<ListfeedVO> followfeed(Integer[] follow) {
		return listFeedDao.followfeed(follow);
	}

	

}