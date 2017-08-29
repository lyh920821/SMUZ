package com.project.one.model.dao.admin;

import java.util.List;

import com.project.one.model.dto.admin.AdminMusicVo;

public interface AdminMusicDao {
	public List<AdminMusicVo> table();
	public void mdel(int ms_id);
}
