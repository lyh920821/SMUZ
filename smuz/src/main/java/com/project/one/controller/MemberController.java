package com.project.one.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.one.model.dto.MemberVO;
import com.project.one.service.Member.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	@ResponseBody
	public String memberLogin(@RequestBody Map<String,Object> data,MemberVO vo,HttpServletRequest request){
		String id = (String)data.get("sid");
		String password = (String)data.get("spass");
		int loginCheck = memberService.memberLogin(id, password);
		String loginInfo;
		if(loginCheck==1){
			loginInfo="1";
			vo=memberService.memberList(id, password);
			if(vo.getSm_rating()==999999){
				loginInfo="9";
			}
			request.getSession().setAttribute("loginsession", vo);
			
		}else{ loginInfo="0"; }
		
		return loginInfo;
	}
	
	
	@RequestMapping(value="check.do", method=RequestMethod.POST)
	@ResponseBody
	public String memeberCheck(@RequestBody String check){
		int a = memberService.memeberCheck(check);
		return Integer.toString(a);
	}
	
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	@ResponseBody
	public String memberInsert(@RequestBody Map<String,Object> data,MemberVO vo){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
		String id = (String)data.get("sid");
		String password = (String)data.get("spass");
		String name = (String)data.get("sname");
		String birthday = (String)data.get("sbirth");
		String sex = (String)data.get("ssex");
		String musicData = "";
		List<String> m = (List<String>)data.get("smusicdata");
		for(int i = 0; i < m.size(); i++){
			if(i==m.size()-1){
				musicData += m.get(i);
				break;
			}
			musicData += m.get(i)+"/";
		}
		String[] age = birthday.split("/");
		int year = Integer.parseInt(sdfYear.format(date));
		int yeara = Integer.parseInt(age[0]);
		
		vo.setSm_id(id);
		vo.setSm_password(password);
		vo.setSm_name(name);
		vo.setSm_birth(birthday);
		vo.setSm_sex(sex);
		vo.setSm_sorting(musicData);
		vo.setSm_date(sdf.format(date));
		vo.setSm_age(year-yeara+1);
		
		
		return memberService.member_insert(vo);
	}
}
