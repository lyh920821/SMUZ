package com.project.one.model.dao.ListFeed;

import java.util.List;

import com.project.one.model.dto.ListfeedVO;

public interface ListFeedDAO {
   public String listFeedInsert(ListfeedVO lfv);
   public List<ListfeedVO> listFeedSearch(int lf_uploader);
   public List<ListfeedVO> followfeed(Integer[] follow);
}