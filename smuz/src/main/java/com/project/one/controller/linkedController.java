package com.project.one.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
@RequestMapping("linked")
public class linkedController {
	
	@Inject
	MemberService memberService;
	@Inject
	PlayListService playList;
	@Inject
	MusicService musicService;
	@Inject
	MusicFeedService musicFeedService;
	@Inject
	ListFeedService listFeedService;
	
	@RequestMapping(value="popup.do")
	public String listSearch(){
		return "mypage/listPopup";
	}
	
	@RequestMapping(value="music_search.do")
	public String musicSearch(){
		return "mypage/musicPopup";
	}
	
	@RequestMapping(value="loding.do")
	public ModelAndView loding(ModelAndView mv, HttpServletRequest request){
		MemberVO vo = (MemberVO)request.getSession().getAttribute("loginsession");
		mv.addObject("name",vo.getSm_name());
		mv.setViewName("loding");
		return mv;
	}
	
	@RequestMapping(value="feed.do")
	public ModelAndView feed(ModelAndView mv,HttpServletRequest request){
		mv = header(mv,request,memberService,playList,musicService);
		MemberVO memberSession = (MemberVO)request.getSession().getAttribute("loginsession");
		
		String[] follow = memberSession.getSm_follow().split("/");
		Integer[] sqltest = new Integer[follow.length];
		List<MemberVO> followName = new ArrayList<MemberVO>();
		for(int i = 0; i<follow.length; i++){
			sqltest[i] =  Integer.parseInt(follow[i]);
			followName.add(memberService.memberSEQ(sqltest[i])); 
		}
		
		List<MusicfeedVO> lim = musicFeedService.followfeed(sqltest);
		List<ListfeedVO> lil = listFeedService.followfeed(sqltest);
		mv.addObject("MusicFeed",lim);
		mv.addObject("ListFeed",lil);
		mv.addObject("followMember",followName);
		
		mv.setViewName("feed");
		return mv;
	}
	
	@RequestMapping(value="mypage.do")
	public ModelAndView mypage(ModelAndView mv,HttpServletRequest request){
		mv = header(mv,request,memberService,playList,musicService);
		
		MemberVO memberSession = (MemberVO)request.getSession().getAttribute("loginsession");
        List<MusicfeedVO> mfv = musicFeedService.listMusicFeed(memberSession.getSm_seq());
        
        mv.addObject("MusicFeed",mfv);
		mv.setViewName("mypage/sub1");
		return mv;
	}
	@RequestMapping(value="mylist.do")
	public ModelAndView mylist(ModelAndView mv,HttpServletRequest request){
		mv = header(mv,request,memberService,playList,musicService);
		
		MemberVO memberSession = (MemberVO)request.getSession().getAttribute("loginsession");
		List<ListfeedVO> lfv = listFeedService.listFeedSearch(memberSession.getSm_seq());
		
		mv.addObject("ListFeed",lfv);
		mv.setViewName("mypage/sub2");
		return mv;
	}
	@RequestMapping(value="follow.do")
	public ModelAndView follow(ModelAndView mv,HttpServletRequest request){
		mv = header(mv,request,memberService,playList,musicService);
		
		mv.setViewName("mypage/sub3");
		return mv;
	}
	@RequestMapping(value="userInfo.do")
	public ModelAndView userInfo(ModelAndView mv,HttpServletRequest request){
		mv = header(mv,request,memberService,playList,musicService);
		
		mv.setViewName("mypage/sub4");
		return mv;
	}
	
	@RequestMapping(value="recommend.do")
	public ModelAndView recommend(ModelAndView mv,HttpServletRequest request){
		mv = header(mv,request,memberService,playList,musicService);
		
		MemberVO memberSession = (MemberVO)request.getSession().getAttribute("loginsession");
		Map<String, Object> mp = new HashMap();
		Integer[] color = {memberSession.getSm_user_r(),memberSession.getSm_user_g(),memberSession.getSm_user_b()};
		String[] type = {"RCOLOR","GCOLOR","BCOLOR"};
		for(int i=0;i<color.length;i++){
			
			HashMap<String, Integer> ii = new HashMap();
			ii.put("row", color[i]-5);
			ii.put("high", color[i]+5);
			mp.put(type[i], ii);
		}
		
		Map<String, Object> resultMap =  musicService.recommendMusicList(mp);
		
		mv.addObject("colorR",resultMap.get("colorR"));
		mv.addObject("colorG",resultMap.get("colorG"));
		mv.addObject("colorB",resultMap.get("colorB"));
		
		
		mv.setViewName("recommend");
		return mv;
	}
	
	
	public static ModelAndView header(ModelAndView mv,HttpServletRequest request
			,MemberService memberService
			,PlayListService playList
			,MusicService musicService){
		
		MemberVO memberSession = (MemberVO)request.getSession().getAttribute("loginsession");
		if(memberSession!=null){
			String[] followlist=null;
			if(memberSession.getSm_follow()!=null){
				followlist = memberSession.getSm_follow().split("/");
				for(int i =0;i<followlist.length;i++){
					MemberVO follow = memberService.memberSEQ(Integer.parseInt(followlist[i]));
					followlist[i]=follow.getSm_name();
				}
			}
			int playlistID = memberSession.getSm_seq();
			PlaylistVO pvo = playList.playlist(playlistID);
			List<MusicVO> list = null;
			List<MusicVO> playli = new ArrayList();
			
			if(pvo.getPl_list()!=null){
				
				String sqlinin = pvo.getPl_list().replaceAll("/", ",");
				 
				String[] test = pvo.getPl_list().split("/");
				Integer[] sqltest = new Integer[test.length];
				for(int i = 0; i<test.length; i++){
					sqltest[i] =  Integer.parseInt(test[i]);
				}
				list = musicService.musicList(sqltest);
				Iterator<MusicVO> vovo = null;
				for(int a=0;a<sqltest.length;a++){
					vovo = list.iterator();	
					while(vovo.hasNext()){
						MusicVO aa = vovo.next();
						if(sqltest[a]==aa.getMs_id()){
							playli.add(aa);
							
						}
					}
				}
				
			}
			
			mv.addObject("music",playli);
			mv.addObject("follow",followlist);
			}
		return mv;
	}
	
	
	
}
