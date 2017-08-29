package com.project.one.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.one.model.dao.admin.AdminMusicDao;
import com.project.one.model.dto.admin.AdminMusicVo;

@Service
public class AdminMusicServicesImpl implements AdminMusicServices {

	@Inject
	AdminMusicDao musicDao;

	@Override
	public List<AdminMusicVo> table() {
		List<AdminMusicVo> table = musicDao.table();
		return table;
	}

	@Override
	public void mdel(int ms_id) {
		musicDao.mdel(ms_id);
		
	}
}
