package com.project.one.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLinkedController {
	
	@RequestMapping(value="adminHome.do")
	public String Admain(){
		return "redirect:AdminMember/Adminview.do";
	}
	
	@RequestMapping(value="sub1-1.do")
	public String countUser(){
		/*pages/chart/user*/
		return "redirect:AdminMember/Adminusrdata.do";
	}
	
	@RequestMapping(value="sub1-2.do")
	public String countMuz(){
		return "redirect:AdminMember/Adminmudata.do";
	}
	
	@RequestMapping(value="sub2-1.do")
	public String user(){
		return "redirect:AdminMember/Adminmember.do";
	}
	
	@RequestMapping(value="sub2-2.do")
	public String artist(){
		return "redirect:AdminMember/Adminartist.do";
	}
	
	@RequestMapping(value="sub3.do")
	public String music(){
		return "redirect:AdminMember/Adminmusic.do";
	}
	
	@RequestMapping(value="sub4-1.do")
	public String list(){
		return "redirect:AdminMember/Adminmufeed.do";
	}
	
	@RequestMapping(value="sub4-2.do")
	public String feed(){
		return "redirect:AdminMember/Adminfeed.do";
	}
	
	@RequestMapping(value="sub5-1.do")
	public String content(){
		return "pages/recommendation/Adminfeed";
	}
	
}
