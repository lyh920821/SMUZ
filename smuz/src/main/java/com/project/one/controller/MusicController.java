package com.project.one.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.one.model.dto.ListfeedVO;
import com.project.one.model.dto.MemberVO;
import com.project.one.model.dto.MusicVO;
import com.project.one.model.dto.MusicfeedVO;
import com.project.one.model.dto.PlaylistVO;
import com.project.one.service.ListFeed.ListFeedService;
import com.project.one.service.Member.MemberService;
import com.project.one.service.Music.MusicService;
import com.project.one.service.MusicFeed.MusicFeedService;
import com.project.one.service.PlayList.PlayListService;

@Controller
@RequestMapping("music")
public class MusicController {
	
	
	@Inject
	MemberService memberService;
	@Inject
	PlayListService playList;
	@Inject
	MusicFeedService musicFeedService;
	@Inject
	MusicService musicService;
	@Inject
	ListFeedService listFeedService;
	
	@RequestMapping(value="listFeed.do", method=RequestMethod.POST)
	@ResponseBody
	public String listFeedInsert(@RequestBody Map<String,Object> data,ListfeedVO lfv, MemberVO mvo, HttpServletRequest request){
		
		MemberVO memberSession = (MemberVO)request.getSession().getAttribute("loginsession");
		List<ListfeedVO> lfl = listFeedService.listFeedSearch(memberSession.getSm_seq());
		lfv.setLf_uploader(memberSession.getSm_seq());
		Date date = new Date();
		SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
		lfv.setLf_date(today.format(date));
		
		MusicVO music_data = null; 
		
		String lf_title = (String)data.get("lf_title");
		String lf_list = (String)data.get("lf_list");
		String lf_hashtag = (String)data.get("lf_hashtag");

		
		//수정 사항
		/*String[] music_list = lf_list.split("/");
		
		HashMap<String, Object> map = new HashMap();
		
		ArrayList<Integer> r_color = new ArrayList();
		ArrayList<Integer> g_color = new ArrayList();
		ArrayList<Integer> b_color = new ArrayList();
		MusicVO vo = null;
		
		for(int i = 0; i<music_list.length; i++){
			vo = musicService.musicSet(Integer.parseInt(music_list[i]));
			System.out.println(vo.getMs_color_R());
			r_color.add(vo.getMs_color_R());
			g_color.add(vo.getMs_color_G());
			b_color.add(vo.getMs_color_B());
		}
		
		map.put("r_color", r_color);
		map.put("GColorData", g_color);
		map.put("b_color", b_color);
		map.put("user_cnt",memberSession.getSm_rgb_cnt());
		
		UserColorExtract_2 uce_2 = new UserColorExtract_2();
		HashMap<String, Object> umap = uce_2.count(map);
			
		ListColorExtract lce = new ListColorExtract();
		lce.listCount(map,Integer.parseInt(umap.get("r_color_code").toString()),Integer.parseInt(umap.get("b_color_code").toString()));
		lce.hashCount(lf_hashtag);
		
		System.out.println("r_color_code"+umap.get("r_color_code"));
		System.out.println("g_data"+lce.G_data_code);
		
		int list_r_color = (Integer) umap.get("r_color_code");
		int list_g_color = lce.G_data_code;
		int list_b_color = (Integer) umap.get("b_color_code");
		
		
		UserColorExtract_2 uce_3 = new UserColorExtract_2();
		
		HashMap<String, Object> map2 = new HashMap();
		
		ArrayList<Integer> rr_color = new ArrayList<Integer>();
		ArrayList<Integer> bb_color = new ArrayList<Integer>();
		ArrayList<Integer> gg_color = new ArrayList<Integer>();
		String r = "";
		for(int i = 0; i<lfl.size(); i++){
			r += lfl.get(i).getLf_list()+"/";
		}
		String[] rg = r.split("/");
		for(int i = 0; i<rg.length; i++){
			music_data = musicService.musicSet(Integer.parseInt(rg[i]));
			rr_color.add(music_data.getMs_color_R());
			bb_color.add(music_data.getMs_color_B());
			gg_color.add(music_data.getMs_color_G());
		}
		map2.put("r_color", rr_color);
		map2.put("GColorData", gg_color);
		map2.put("b_color", bb_color);
		map2.put("user_cnt",memberSession.getSm_rgb_cnt());
		
		UserColorExtract uce = new UserColorExtract();
		uce.listColor(lce.G_data_code);
		uce.MusicColor(map2);
		uce.userColor(uce_3.count(map2).get("user_cnt").toString(), memberSession.getSm_user_g());
	
		HashMap<String, Object> umap2 = uce_3.count(map2);
		
		mvo.setSm_seq(memberSession.getSm_seq());
		mvo.setSm_user_r(Integer.parseInt(umap2.get("r_color_code").toString()));
		mvo.setSm_user_b(Integer.parseInt(umap2.get("b_color_code").toString()));
		mvo.setSm_user_g((int)uce.usr_color_G);	
		mvo.setSm_rgb_cnt(uce.usrcnt);
		
		memberService.memberUpdate(mvo);
		
		lfv.setLf_color_R(Integer.parseInt(umap.get("r_color_code").toString()));
		lfv.setLf_color_G(lce.G_data_code);
		lfv.setLf_color_B(Integer.parseInt(umap.get("b_color_code").toString()));
		*/
		//수정 사항 종료
		
		lfv.setLf_title(lf_title);
		lfv.setLf_list(lf_list);
		lfv.setLf_hashtag(lf_hashtag);
		
		return listFeedService.listFeedInsert(lfv);
	}

	@RequestMapping(value="playinsert.do", method=RequestMethod.POST)
	@ResponseBody
	public MusicVO playListInsert(@RequestBody String idnumber, MemberVO mvo, HttpServletRequest request){

		MemberVO memberSession = (MemberVO)request.getSession().getAttribute("loginsession");
		PlaylistVO pvo = playList.playlist(memberSession.getSm_seq());
		if(pvo.getPl_list()!=null){
			pvo.setPl_list(idnumber+"/"+pvo.getPl_list());
		}else{
			pvo.setPl_list(idnumber);
		}
		
		MusicVO musicColor = musicService.musicSet(Integer.parseInt(idnumber));
		
		String[] plist = pvo.getPl_list().split("/");
		
		ArrayList<Integer> r_color_list = new ArrayList<Integer>();
		ArrayList<Integer> b_color_list = new ArrayList<Integer>();
		/*r_color_list.add(musicColor.getMs_color_R());
		b_color_list.add(musicColor.getMs_color_B());*/
		for(int i = 0; i < plist.length; i++){
			MusicVO music_ca = musicService.musicSet(Integer.parseInt(plist[i]));
			r_color_list.add(music_ca.getMs_color_R());
			b_color_list.add(music_ca.getMs_color_B());
		}
		
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("r_color", r_color_list);
		map.put("b_color", b_color_list);
		map.put("user_cnt", memberSession.getSm_rgb_cnt());
		
		UserColorExtract_2 uce2 = new UserColorExtract_2();
		HashMap<String, Object> data = uce2.count(map);
		
		System.out.println(data.get("r_color_code"));
		System.out.println(data.get("r_color_cnt"));
		System.out.println(data.get("b_color_code"));
		System.out.println(data.get("b_color_cnt"));
		
		
		mvo.setSm_seq(memberSession.getSm_seq());
		mvo.setSm_user_r(Integer.parseInt(data.get("r_color_code").toString()));
		mvo.setSm_user_b(Integer.parseInt(data.get("b_color_code").toString()));
		mvo.setSm_rgb_cnt(data.get("user_cnt").toString());
		memberService.memberUpdate(mvo);
		
		return playList.listInsert(pvo.getPl_list(), memberSession.getSm_seq(),Integer.parseInt(idnumber));
	}

	@RequestMapping(value="musicfeed.do", method=RequestMethod.POST)
	public String MusicFeedInsert(@ModelAttribute MusicfeedVO mfv,HttpServletRequest request){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		MemberVO memberSession = (MemberVO)request.getSession().getAttribute("loginsession");
		MusicVO musicData = musicService.musicSet(mfv.getMf_file());

		mfv.setMf_date(sdf.format(date));
		mfv.setMf_like_cnt(0);
		mfv.setMf_user(memberSession.getSm_seq());
		MusicColorExtract mce = new MusicColorExtract();
		String[] cnt = musicData.getMs_RGB_CNT().split(",");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		mce.count(mfv.getMf_tag(), musicData.getMs_color_R(), musicData.getMs_color_G(), musicData.getMs_color_B(), Integer.parseInt(cnt[0]), Integer.parseInt(cnt[1]), Integer.parseInt(cnt[2]));
		System.out.println(mfv.getMf_tag());
		System.out.println(mfv.getMf_file());
		System.out.println(mce.hex_1);
		System.out.println(mce.hex_2);
		System.out.println(mce.hex_3);
		System.out.println(mce.counting);
		
		musicData.setMs_color_R((int) mce.hex_1);
		musicData.setMs_color_G((int) mce.hex_2);
		musicData.setMs_color_B((int) mce.hex_3);
		musicData.setMs_RGB_CNT(mce.counting);
		musicData.setMs_id(mfv.getMf_file());

		musicService.musicUpdate(musicData);

		musicFeedService.MusicFeedInsert(mfv);

		return "redirect:/linked/mypage.do";
	}



}
