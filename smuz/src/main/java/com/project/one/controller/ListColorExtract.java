package com.project.one.controller;

import java.io.BufferedReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import org.apache.ibatis.io.Resources;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class ListColorExtract {

	float R_data_color = 0;
	float G_data_color = 0;
	float B_data_color = 0;
	
	public void listCount(HashMap<String, Object> dataMap, int r_color, int b_color){

		ArrayList<Integer> G_color = (ArrayList<Integer>)dataMap.get("GColorData");
		
		this.R_data_color = r_color;
		this.B_data_color = b_color;
		
		for(int i = 0; i < G_color.size(); i++){			
			G_data_color = (float) (G_data_color+((G_data_color-G_color.get(i))/(G_color.size()+1))*(-0.6));
		}

	}

	String title_1 = null;
	String title_2 = null;
	String title_3 = null;

	float hex_1 = 0.0f;
	float hex_2 = 0.0f;
	float hex_3 = 0.0f;

	int cnt_1 = 0;
	int cnt_2 = 0;
	int cnt_3 = 0;

	public void hashCount(String hashData){

		String taging = hashData.replaceAll("\\s","");
		String[] hashTag = taging.split("#");

		JSONObject object_1 = null;
		JSONParser parser = new JSONParser();
		String result = null;
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
			JSONArray array_2 = (JSONArray)object_2.get("Gcolor");
			JSONArray array_3 = (JSONArray)object_2.get("Bcolor");

			for(int i = 0; i<hashTag.length; i++){

				Iterator it_1 = array_1.iterator();
				int[] data_set_1 = new int[i];
				int count_1 = 0;
				while(it_1.hasNext()){
					object_1 = (JSONObject)it_1.next();
					if(object_1.get("value").toString().equals(hashTag[i])){
						title_1 = object_1.get("value").toString();
						data_set_1[count_1] =Integer.parseInt(object_1.get("R").toString())*10;

						hex_1 = (float) (hex_1+((hex_1-data_set_1[count_1])/(cnt_1+1))*(-0.6));
						
						count_1++;
						cnt_1++;
					}
				}


				Iterator it_2 = array_2.iterator();
				int[] data_set_2 = new int[i];
				int count_2 = 0;
				while(it_2.hasNext()){
					object_1 = (JSONObject)it_2.next();
					if(object_1.get("value").toString().equals(hashTag[i])){
						title_2 = object_1.get("value").toString();
						data_set_2[count_2] = Integer.parseInt(object_1.get("G").toString())*25;
						
						hex_2 = (float) (hex_2+((hex_2-data_set_2[count_2])/(cnt_2+1))*(-0.6));
						count_2++;
						cnt_2++;
					}
				}

				Iterator it_3 = array_3.iterator();
				int[] data_set_3 = new int[i];
				int count_3 = 0;
				while(it_3.hasNext()){
					object_1 = (JSONObject)it_3.next();
					if(object_1.get("value").toString().equals(hashTag[i])){
						title_3 = object_1.get("value").toString();
						data_set_3[count_3] = Integer.parseInt(object_1.get("B").toString())*85;
						
						hex_3 = (float) (hex_3+((hex_3-data_set_3[count_3])/(cnt_3+1))*(-0.6));
						count_3++;
						cnt_3++;
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		this.colorCount();
	}
	
	int R_data_code =0;
	int G_data_code =0;
	int B_data_code =0;
	
	public void colorCount(){
		R_data_code = (int)(((R_data_color*4)+((int)hex_1*6))/2);
		G_data_code = (int)(((G_data_color*4)+((int)hex_2*6))/2);
		B_data_code = (int)(((B_data_color*4)+((int)hex_3*6))/2);
	}


}
