package com.project.one.service.admin;

import java.util.List;

import com.project.one.model.dto.admin.AdminListfeedVO;

public interface AdminListServices {
	public List<AdminListfeedVO> llist();
	public void ldel(int lf_id);
}
