package com.project.one.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.one.model.dto.admin.AdminListfeedVO;
import com.project.one.model.dto.admin.AdminMemberVo;
import com.project.one.model.dto.admin.AdminMusicVo;
import com.project.one.model.dto.admin.AdminMusicfeedVO;
import com.project.one.service.admin.AdminFeedServices;
import com.project.one.service.admin.AdminListServices;
import com.project.one.service.admin.AdminMemberServices;
import com.project.one.service.admin.AdminMusicServices;



@Controller
@RequestMapping(value="AdminMember")
public class AdminMemberController {
	
	@Inject
	AdminMemberServices adminMemberServices;
	
	@Inject
	AdminMusicServices adminMusicServices;
	
	@Inject
	AdminFeedServices adminFeedServices;
	
	@Inject
	AdminListServices adminListServices;
	
	/* ȸ�� ������ �ҷ�����*/
	@RequestMapping(value="Adminview.do")
	public ModelAndView Adminviewdata(ModelAndView mv){
		List<AdminMemberVo> member = adminMemberServices.table();
		List<AdminMusicVo> music = adminMusicServices.table();
		List<AdminListfeedVO> list = adminListServices.llist();
		List<AdminMusicfeedVO> feed = adminFeedServices.flist();
		List<AdminMemberVo> artist = adminMemberServices.artist(2);
		
		int all_cnt = list.size()+feed.size();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date today = new Date();
		
		String date = format.format(today);
		String a = "";
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		List<String> genreList = new ArrayList();
		
		for(int i = 0; i < music.size(); i++){
			AdminGenreExtract genre = new AdminGenreExtract();
			int rcolor = music.get(i).getMs_color_R();
			String ms_RGB_CNT = music.get(i).getMs_RGB_CNT();
			System.out.println(genre.extract(rcolor, ms_RGB_CNT));
			genreList.add(genre.extract(rcolor, ms_RGB_CNT));
		}
		
		map.put("mus", music);
		map.put("genre", genreList);
		
		mv.addObject("date",date);
		mv.addObject("artist",artist.size());
		mv.addObject("feed",all_cnt);
		mv.addObject("member",member);
		mv.addObject("memberCount",member.size());
		mv.addObject("music",map);
		mv.addObject("musicCount",music.size());
		mv.setViewName("/page/Adminhome");
		
		return mv;
	}
	
	@RequestMapping(value="Adminmember.do")
	public ModelAndView Adminmember(ModelAndView mv){
		
		List<AdminMemberVo> member = adminMemberServices.table();
		
		mv.addObject("member",member);
		mv.addObject("memberCount",member.size());
		mv.setViewName("/page/management/data");
		return mv;
	}
	
	@RequestMapping(value="Adminartist.do")
	public ModelAndView Adminartist(ModelAndView mv){
		
		List<AdminMemberVo> member = adminMemberServices.artist(2);
		
		mv.addObject("artist",member);
		mv.addObject("artistCount",member.size());
		mv.setViewName("/page/management/artist");
		
		return mv;
	}
	
	@RequestMapping(value="Adminmusic.do")
	public ModelAndView Adminmusic(ModelAndView mv){
		List<AdminMusicVo> music = adminMusicServices.table();
		
		mv.addObject("music",music);
		mv.addObject("musicCount",music.size());
		mv.setViewName("/page/management/music");
		
		return mv;
	}
	
	@RequestMapping(value="Adminusrdata.do")
	public ModelAndView Adminusrdata(ModelAndView mv){
		List<AdminMemberVo> member = adminMemberServices.table();
		List<AdminListfeedVO> list = adminListServices.llist();
		List<AdminMusicfeedVO> feed = adminFeedServices.flist();
	
		int [] data = new int[member.size()];
		int [] listc = new int[list.size()];
		int [] feedc = new int[feed.size()];
		String[] mon = null;
		String [] lis = null;
		String [] fee = null;
		for(int i = 0; i < member.size(); i++){
			mon = member.get(i).getSm_date().split("-");
			data[i] = Integer.parseInt(mon[1])-1;
		}
		
		for(int i = 0; i < list.size(); i++){
			lis = list.get(i).getLf_date().split("-");
			listc[i] = Integer.parseInt(lis[1])-1;
		}
		
		for(int i = 0; i < feed.size(); i++){
			fee = feed.get(i).getMf_date().split("-");
			feedc[i] = Integer.parseInt(fee[1])-1;
		}

		int [] counter = new int [12];
		int [] feedcounter = new int[12];
		int [] listcounter = new int[12];
		
		
		for(int i = 0; i < data.length; i++){
			counter[data[i]]++;
		}
		for(int i = 0; i < feedc.length; i++){
			feedcounter[feedc[i]]++;
		}
		for(int i = 0; i < listc.length; i++){
			listcounter[listc[i]]++;
		}
		
		
		JSONObject jmonth = new JSONObject();
		JSONObject jfeed = new JSONObject();
		JSONArray jlarray = new JSONArray();
		JSONArray jarray = new JSONArray();
		for(int i = 0; i < counter.length; i++){
				jmonth.put("x",(i+1)+"월");
				jmonth.put("y", counter[i]);
				jarray.add(jmonth);
				jmonth = new JSONObject();
				
				jfeed.put("x",(i+1)+"월");
				jfeed.put("y",feedcounter[i]);
				jfeed.put("z",listcounter[i]);
				jlarray.add(jfeed);
				jfeed = new JSONObject();
		}
		
		mv.addObject("lcnt",jlarray);
		mv.addObject("count",jarray);
		mv.addObject("cnutt", member.size());
		mv.setViewName("page/chart/user");
		return mv;
	}
	
	@RequestMapping(value="Adminmudata.do")
	public ModelAndView Adminmusiccount(ModelAndView mv){
		List<AdminMusicVo> music = adminMusicServices.table();
		int[] mdata = new int[music.size()];
		String mus = null;
		
		String[] go = new String[music.size()];
		
		for(int i = 0; i < music.size(); i++){
			AdminGenreExtract ge = new AdminGenreExtract();
			mus = music.get(i).getMs_date().substring(4,6);
			mdata[i] = Integer.parseInt(mus)-1;
			go[i] = ge.extract(music.get(i).getMs_color_R(), music.get(i).getMs_RGB_CNT());
		}
		
		AdminGenreCountExtract gce = new AdminGenreCountExtract();

		int [] counter = new int [12];		
		for(int i = 0; i < mdata.length; i++){
			counter[mdata[i]]++;
		}
		
		JSONObject mmonth = new JSONObject();
		JSONArray jmarray = new JSONArray();
		JSONArray arrry = gce.counting(go);
		
		for(int i = 0; i < counter.length; i++){
			mmonth.put("y", (i+1)+"월");
			mmonth.put("x", counter[i]);
			jmarray.add(mmonth);
			mmonth = new JSONObject();
		}
		
		mv.addObject("count",music.size());
		mv.addObject("ldata",arrry);
		mv.addObject("mdata",jmarray);
		mv.setViewName("/page/chart/music");
		
		return mv;
	}
	
	@RequestMapping(value="Adminfeed.do")
	public ModelAndView Adminfeed(ModelAndView mv){
		List<AdminMusicfeedVO> feed = adminFeedServices.flist();
		mv.addObject("data",feed);
		mv.addObject("cnt",feed.size());
		mv.setViewName("/page/content/feed");
		return mv;
	}
	
	@RequestMapping(value="Adminmufeed.do")
	public ModelAndView Adminmufeed(ModelAndView mv){
		List<AdminListfeedVO> list = adminListServices.llist();
		mv.addObject("data",list);
		mv.addObject("cnt",list.size());
		mv.setViewName("/page/content/list");
		return mv;
	}
	
	@RequestMapping(value="Adminauth.do", method = RequestMethod.GET)
	public ModelAndView Adminmauth(ModelAndView mv,
			@RequestParam(value="auth") int auth,
			@RequestParam(value="uid") int uid
			){
		
		if(auth == 3){
			auth = 999999;
		}else if(auth == 999999){
			auth = 999999;
		}else{
			auth++;
		}
		
		AdminMemberVo vo = new AdminMemberVo();
		vo.setSm_seq(uid);
		vo.setSm_rating(auth);
		
		adminMemberServices.memberupdata(vo);
		
		mv.setViewName("redirect:/sub2-1.do");
		
		return mv;
	}
	
	@RequestMapping(value="Adminauthd.do", method = RequestMethod.GET)
	public ModelAndView Adminmauthd(ModelAndView mv,
			@RequestParam(value="auth") int auth,
			@RequestParam(value="uid") int uid
			){
		
		if(auth == 999999){
			auth = 3;
		}else if(auth == 1){
			auth = 1;
		}else{
			auth--;
		}
		
		AdminMemberVo vo = new AdminMemberVo();
		vo.setSm_seq(uid);
		vo.setSm_rating(auth);
		
		adminMemberServices.memberupdata(vo);
		
		mv.setViewName("redirect:/sub2-1.do");
		
		return mv;
	}
	
	@RequestMapping(value="Adminaauth.do", method = RequestMethod.GET)
	public ModelAndView Adminamauth(ModelAndView mv,
			@RequestParam(value="auth") int auth,
			@RequestParam(value="uid") int uid
			){
		
		if(auth == 3){
			auth = 999999;
		}else if(auth == 999999){
			auth = 999999;
		}else{
			auth++;
		}
		
		AdminMemberVo vo = new AdminMemberVo();
		vo.setSm_seq(uid);
		vo.setSm_rating(auth);
		
		adminMemberServices.memberupdata(vo);
		
		mv.setViewName("redirect:/sub2-2.do");
		
		return mv;
	}
	
	@RequestMapping(value="Adminaauthd.do", method = RequestMethod.GET)
	public ModelAndView Adminamauthd(ModelAndView mv,
			@RequestParam(value="auth") int auth,
			@RequestParam(value="uid") int uid
			){
		
		if(auth == 999999){
			auth = 3;
		}else if(auth == 1){
			auth = 1;
		}else{
			auth--;
		}
		
		AdminMemberVo vo = new AdminMemberVo();
		vo.setSm_seq(uid);
		vo.setSm_rating(auth);
		
		adminMemberServices.memberupdata(vo);
		
		mv.setViewName("redirect:/sub2-2.do");
		
		return mv;
	}
	
	@RequestMapping(value="Adminremove.do", method = RequestMethod.GET)
	public ModelAndView Admindel(ModelAndView mv,
			@RequestParam(value="uid") int uid
			){
	
		adminMemberServices.memberRemove(uid);
		
		mv.setViewName("redirect:/sub2-1.do");
		
		return mv;
	}
	
	@RequestMapping(value="Adminaremove.do", method = RequestMethod.GET)
	public ModelAndView Adminadel(ModelAndView mv,
			@RequestParam(value="uid") int uid
			){
	
		adminMemberServices.memberRemove(uid);
		
		mv.setViewName("redirect:/sub2-2.do");
		
		return mv;
	}
	
	@RequestMapping(value="Adminmremove.do", method = RequestMethod.GET)
	public ModelAndView Adminmdel(ModelAndView mv,
			@RequestParam(value="uid") int uid
			){
		adminMusicServices.mdel(uid);
		mv.setViewName("redirect:/sub3.do");
		return mv;
	}
	
	@RequestMapping(value="Adminfremove.do", method = RequestMethod.GET)
	public ModelAndView Adminfdel(ModelAndView mv,
			@RequestParam(value="uid") int uid){
		adminFeedServices.fdel(uid);
		mv.setViewName("redirect:/sub4-2.do");
		return mv;
	}
	
	@RequestMapping(value="Adminlidel.do", method=RequestMethod.GET)
	public ModelAndView Adminldel(ModelAndView mv,
			@RequestParam(value="uid") int uid){
		
		adminListServices.ldel(uid);
		mv.setViewName("redirect:/sub4-1.do");
		return mv;
	}
	
}
