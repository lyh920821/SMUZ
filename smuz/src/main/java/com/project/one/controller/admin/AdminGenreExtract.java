package com.project.one.controller.admin;

import java.io.BufferedReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.Iterator;

import org.apache.ibatis.io.Resources;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class AdminGenreExtract {
	
	String sba = "";
	
	public String extract(int rcolor, String ms_RGB_CNT){
		JSONObject object_1 = null;
		JSONParser parser = new JSONParser();
		String result = null;				
		String [] cntR = null; 
		if(ms_RGB_CNT.split(",") != null){
			cntR = ms_RGB_CNT.split(",");
		}
		try{
			Charset charset = Charset.forName("UTF-8");
			Resources.setCharset(charset);
			Reader read = Resources.getResourceAsReader("/json/RGB.json");
			BufferedReader reader = new BufferedReader(read);
			StringBuilder sb = new StringBuilder();
			String line = null;
			while((line = reader.readLine())!=null){
				sb.append(line+"\n");
			}
			result = sb.toString();
			Object obj = parser.parse(result);
			JSONObject object_2 = (JSONObject)obj;
			JSONArray array_1 = (JSONArray)object_2.get("Rcolor");
			Iterator it_1 = array_1.iterator();
			int a = 0;

			while(it_1.hasNext()){
				object_1 = (JSONObject) it_1.next();
				a = Integer.parseInt(object_1.get("R").toString());
				int cnt = Integer.parseInt(cntR[0]);
				
				/*if(((a+1) >= ((float)((float)rcolor/25)*6) && a <= ((float)((float)rcolor/25)*6))){
					sba = object_1.get("value").toString();
				}*/
				
				/*if((a+1)>=(((float)rcolor/cnt)*6) && a <= (((float)rcolor/cnt)*6)){
					sba = object_1.get("value").toString();
				}else if((a+1)>=(((float)rcolor/cnt)) && a <= (((float)rcolor/cnt))){
					sba = object_1.get("value").toString();
				}*/
				
				if(((a+1)*25)>=((rcolor)) && ((a)*25)<=((rcolor))){
					sba = object_1.get("value").toString();
				}
				
			}

		}catch (Exception e) {

		}
		return sba;
	}
	
}
