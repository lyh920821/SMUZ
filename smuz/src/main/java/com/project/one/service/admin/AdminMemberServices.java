package com.project.one.service.admin;

import java.util.List;

import com.project.one.model.dto.admin.AdminMemberVo;

public interface AdminMemberServices {
	public List<AdminMemberVo> table();
	public List<AdminMemberVo> artist(int sm_rating);
	public void memberupdata(AdminMemberVo vo);
	public void memberRemove(int sm_seq);
}
