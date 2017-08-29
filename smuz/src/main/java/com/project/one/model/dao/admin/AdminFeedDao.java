package com.project.one.model.dao.admin;

import java.util.List;

import com.project.one.model.dto.admin.AdminMusicfeedVO;

public interface AdminFeedDao {
	public List<AdminMusicfeedVO> flist();
	public void fdel(int mf_id);
}
