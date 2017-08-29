package com.project.one.service.admin;

import java.util.List;

import com.project.one.model.dto.admin.AdminMusicfeedVO;

public interface AdminFeedServices {
	public List<AdminMusicfeedVO> flist();
	public void fdel(int mf_id);
}
