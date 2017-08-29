package com.project.one.service.ListFeed;

import java.util.List;

import com.project.one.model.dto.ListfeedVO;
import com.project.one.model.dto.MusicfeedVO;

public interface ListFeedService {
   public String listFeedInsert(ListfeedVO lfv);
   public List<ListfeedVO> listFeedSearch(int lf_uploader);
   public List<ListfeedVO> followfeed(Integer[] follow);
   
}