package com.project.one.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.one.model.dto.CommentVO;
import com.project.one.service.MusicFeed.MusicFeedService;

@Controller
@RequestMapping("comment")
public class CommentController {
	
	@Inject
	MusicFeedService musicFeedService;
	
	@RequestMapping(value="check.do", method=RequestMethod.POST)
	@ResponseBody
	public List<CommentVO> comment(@RequestBody String bbid){
		System.out.println(bbid); 
		List<CommentVO> li = musicFeedService.comment(Integer.parseInt(bbid));
		
		return li;
	}
}
