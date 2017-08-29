package com.project.one.controller.admin;

import java.io.BufferedReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.ibatis.io.Resources;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import ch.qos.logback.core.boolex.Matcher;

public class AdminGenreCountExtract {

	public JSONArray counting(String[] go){
		JSONObject object_1 = null;
		JSONParser parser = new JSONParser();
		String result = null;
		JSONObject cnt_obj = null;
		JSONArray cnt_array = new JSONArray();
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
			String title_1;
			
			int cnt = 0;
			System.out.println(go.length);
			cnt_obj = new JSONObject();
			
				while(it_1.hasNext()){
					object_1 = (JSONObject) it_1.next();
					title_1 = object_1.get("value").toString();
					for(int i = 0; i<go.length; i++){
						if(title_1.matches(go[i])){
							cnt++;
							
						}
					}
					cnt_obj.put("y", cnt);
					cnt_obj.put("x", title_1);
					cnt_array.add(cnt_obj);
					System.out.println(title_1+":"+cnt);
					cnt_obj = new JSONObject();
					cnt = 0;
				}
				
				 
								
			

		}catch (Exception e) {

		}
		return cnt_array;
	}

}
