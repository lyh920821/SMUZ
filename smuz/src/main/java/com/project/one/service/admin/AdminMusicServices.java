package com.project.one.service.admin;

import java.util.List;

import com.project.one.model.dto.admin.AdminMusicVo;

public interface AdminMusicServices {
	public List<AdminMusicVo> table();
	public void mdel(int ms_id);
}
