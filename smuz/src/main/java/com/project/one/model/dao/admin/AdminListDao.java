package com.project.one.model.dao.admin;

import java.util.List;

import com.project.one.model.dto.admin.AdminListfeedVO;

public interface AdminListDao {
	public List<AdminListfeedVO> llist();
	public void ldel(int lf_id);
}
