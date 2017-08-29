package com.project.one.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.one.model.dao.admin.AdminListDao;
import com.project.one.model.dto.admin.AdminListfeedVO;

@Service
public class AdminListServicesImpl implements AdminListServices {

	@Inject
	AdminListDao listDao;

	@Override
	public List<AdminListfeedVO> llist() {
		List<AdminListfeedVO> llist = listDao.llist();
		return llist;
	}

	@Override
	public void ldel(int lf_id) {
		listDao.ldel(lf_id);		
	}
	
}
