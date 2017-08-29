package com.project.one.controller;

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


public class MusicColorExtract {

	String title_1=null;
	String title_2=null;
	String title_3=null;

	float hex_1 = 0.000000f;
	float hex_2 = 0.000000f;
	float hex_3 = 0.000000f;

	public void count(String hashtag, int r, int g, int b, int r_cnt, int g_cnt, int b_cnt){

		String taging = hashtag.replaceAll("\\s","");
		String [] hastaging = taging.split("#");

		JSONObject object_1 = null;
		JSONParser parser = new JSONParser();
		String result = null;

		int cnt_1 = r_cnt;
		int cnt_2 = g_cnt;
		int cnt_3 = b_cnt;

		hex_1 = r;
		hex_2 = g;
		hex_3 = b;

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

			float set = 0.0f;

			for(int i = 1; i < hastaging.length; i++){
				System.out.println(hastaging[i]);
				Iterator it_1 = array_1.iterator();
				float[] data_set_1 = new float[i];
				int count_1 = 0;
				while(it_1.hasNext()){
					object_1 = (JSONObject)it_1.next();
					if(object_1.get("value").toString().equals(hastaging[i])){
						count_1++;
						cnt_1++;
					}
					System.out.println(title_1);
				}

				Iterator it_2 = array_2.iterator();
				float[] data_set_2 = new float[i];
				int count_2 = 0;
				while(it_2.hasNext()){
					object_1 = (JSONObject)it_2.next();
					if(object_1.get("value").toString().equals(hastaging[i])){
						title_2 = object_1.get("value").toString();
						data_set_2[count_2] = Integer.parseInt(object_1.get("G").toString())*10;

						hex_2 = (float) (hex_2+((hex_2-data_set_2[count_2])/(cnt_2+1)));
						System.out.println("g : "+hex_2);
						count_2++;
						cnt_2++;
					}
				}

				Iterator it_3 = array_3.iterator();
				float[] data_set_3 = new float[i];
				int count_3 = 0;
				while(it_3.hasNext()){
					object_1 = (JSONObject)it_3.next();
					if(object_1.get("value").toString().equals(hastaging[i])){						
						count_3++;
						cnt_3++;
					}
				}
			}



			HashMap<String, Object> map = new HashMap();

			ArrayList<Object> title = new ArrayList();
			title.add(title_2);

			ArrayList<Object> color = new ArrayList();
			color.add(((int)hex_2));

			ArrayList<Object> cntc = new ArrayList();
			cntc.add(cnt_1);
			cntc.add(cnt_2);
			cntc.add(cnt_3);

			map.put("select", title);
			map.put("color", color);
			map.put("cnt", cntc);

			this.resultL(map);
		}catch (Exception e) {
			e.printStackTrace();
		}

	}

	ArrayList<Object> titleMap = null;
	ArrayList<Object> colorMap = null;
	ArrayList<Object> cntMap = null;
	String[] key = null;
	String[] color = null;
	String code = "#";
	String rgbcode = "";
	String counting = "";

	void resultL(HashMap<String, Object> map){

		titleMap = (ArrayList<Object>) map.get("select");
		colorMap = (ArrayList<Object>) map.get("color");
		cntMap = (ArrayList<Object>)map.get("cnt");

		key = new String[titleMap.size()];
		color = new String[colorMap.size()];

		for(int i = 0; i < titleMap.size(); i++){
			key[i] = (String) titleMap.get(i);
			color[i] = Integer.toHexString(Integer.parseInt(colorMap.get(i).toString()));
			if(color[i].equals("0")){color[i] = "00";}
			code += color[i];
			rgbcode += colorMap.get(i).toString()+",";
		}
		for(int i = 0; i < cntMap.size(); i++){
			counting +=cntMap.get(i).toString()+",";
		}

	}

}
