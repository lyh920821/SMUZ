package com.project.one.controller;

import java.util.ArrayList;
import java.util.HashMap;

public class UserColorExtract_2 {

	public HashMap<String, Object> count(HashMap<String, Object> map){
		HashMap<String, Object> setData = new HashMap<String, Object>();

		ArrayList<Integer> r_color = (ArrayList) map.get("r_color"); 
		ArrayList<Integer> r_list = new ArrayList();
		ArrayList<Integer> r_cnt = new ArrayList();
		for(int index = 0; index < r_color.size(); index++){
			if(!r_list.contains(r_color.get(index))){
				r_list.add(r_color.get(index));
				
				int cnt = 0;

				for(int searchIndex = 0; searchIndex < r_color.size(); searchIndex++){
					if(r_color.get(index) == r_color.get(searchIndex)){
						cnt++;
					}
				}
				r_cnt.add(cnt);

				for(int sourceIndex = 0 ; sourceIndex < r_cnt.size()-1 ; sourceIndex++){
					for(int targetIndex = sourceIndex+1 ; targetIndex < r_cnt.size() ; targetIndex++){
						if(r_cnt.get(sourceIndex) < r_cnt.get(targetIndex)){
							int moveItem = 0;
							moveItem = r_cnt.get(targetIndex);
							r_cnt.set(targetIndex, r_cnt.get(sourceIndex));
							r_cnt.set(sourceIndex, moveItem);

							moveItem = r_color.get(targetIndex);
							r_color.set(targetIndex, r_color.get(sourceIndex));
							r_color.set(sourceIndex, moveItem);
						}
					}
					setData.put("r_color_code", r_list.get(0));
				}
			}
		}

		ArrayList<Integer> b_color = (ArrayList<Integer>) map.get("b_color"); 
		ArrayList<Integer> b_list = new ArrayList();
		ArrayList<Integer> b_cnt = new ArrayList();

		for(int index = 0; index < b_color.size(); index++){
			if(!b_list.contains(b_color.get(index))){
				b_list.add(b_color.get(index));

				int cnt = 0;

				for(int searchIndex = 0; searchIndex < b_color.size(); searchIndex++){
					if(b_color.get(index) == b_color.get(searchIndex)){
						cnt++;
					}
				}
				b_cnt.add(cnt);

				for(int sourceIndex = 0 ; sourceIndex < b_cnt.size()-1 ; sourceIndex++){
					for(int targetIndex = sourceIndex+1 ; targetIndex < b_cnt.size() ; targetIndex++){
						if(b_cnt.get(sourceIndex) < b_cnt.get(targetIndex)){
							int moveItem = 0;
							moveItem = b_cnt.get(targetIndex);
							b_cnt.set(targetIndex, b_cnt.get(sourceIndex));
							b_cnt.set(sourceIndex, moveItem);

							moveItem = b_color.get(targetIndex);
							b_color.set(targetIndex, r_color.get(sourceIndex));
							b_color.set(sourceIndex, moveItem);
						}
					}
					setData.put("b_color_code", b_list.get(0));
				}
				
			}
		}
		
		

		
		String[] cntimg = map.get("user_cnt").toString().split("/");
		
		int use_r_cnt = Integer.parseInt(cntimg[0])+r_cnt.get(0);
		int use_b_cnt = Integer.parseInt(cntimg[2])+b_cnt.get(0);
		
		String user_counter = use_r_cnt+"/"+cntimg[1]+"/"+use_b_cnt;
		setData.put("user_cnt", user_counter);
		
		return setData;		
	}

}