package com.project.one.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.one.model.dao.admin.AdminMemberDao;
import com.project.one.model.dto.admin.AdminMemberVo;


@Service
public class AdminMemberServicesImpl implements AdminMemberServices {
	
	@Inject
	AdminMemberDao Memberdao;

	@Override
	public List<AdminMemberVo> table() {
		List<AdminMemberVo> table = Memberdao.table();
		return table;
	}

	@Override
	public List<AdminMemberVo> artist(int sm_rating) {
		List<AdminMemberVo> artist = Memberdao.artist(sm_rating);
		return artist;
	}

	@Override
	public void memberupdata(AdminMemberVo vo) {
		Memberdao.memberupdata(vo);
		
	}

	@Override
	public void memberRemove(int sm_seq) {
		Memberdao.memberRemove(sm_seq);
		
	}

}
