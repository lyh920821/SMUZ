package com.project.one.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserColorExtract {
	
	int list_color_G = 0;
	
	float usr_color_G = 0.0f;
	
	float m_color_G = 0.0f;
	
	String usrcnt = "";
	
	public void listColor(int g_color){
		this.list_color_G = g_color;
	}
	
	public void MusicColor(HashMap<String, Object> map){
		ArrayList<Integer> gcolor = (ArrayList<Integer>) map.get("GColorData");
		
		
		for(int i = 0 ; i < gcolor.size(); i++){
			m_color_G = (float) (m_color_G+((m_color_G-gcolor.get(i))/(i+1))*(-0.6));

		}
	}
	
	public void userColor(String cnt,int usrG){
		String[] cntrgb = cnt.split("/");
		
		float b = ((list_color_G*2)+(m_color_G*8))/10;

		int usrrcnt =  Integer.parseInt(cntrgb[0]);
		int usrgcnt =  Integer.parseInt(cntrgb[1])+1;
		int usrbcnt =  Integer.parseInt(cntrgb[2]);
		
		usr_color_G = (float) (usr_color_G + ((usr_color_G - b)/(usrgcnt)*(-0.6)));
		
		usrcnt = usrrcnt + "/" + usrgcnt + "/" + usrbcnt;
	}
	
}
