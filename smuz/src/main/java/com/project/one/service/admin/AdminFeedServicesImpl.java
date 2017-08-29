package com.project.one.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.one.model.dao.admin.AdminFeedDao;
import com.project.one.model.dto.admin.AdminMusicfeedVO;

@Service
public class AdminFeedServicesImpl implements AdminFeedServices {
	@Inject
	AdminFeedDao feedDao;

	@Override
	public List<AdminMusicfeedVO> flist() {
		List<AdminMusicfeedVO> flist = feedDao.flist();
		return flist;
	}

	@Override
	public void fdel(int mf_id) {
		feedDao.fdel(mf_id);
	}
}
