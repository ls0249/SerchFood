package com.sung.sf.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MapController {
	
	@RequestMapping(value="/map_view.sf", method=RequestMethod.GET)
	public ModelAndView mapvieww(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav =new ModelAndView();
		mav.setViewName("mapview");
		return mav;
		
	}

	@RequestMapping(value="/map_view.sf", method=RequestMethod.POST)
	public ModelAndView mapview(HttpServletRequest request, HttpServletResponse response) {
		
		
		String searchcheck = request.getParameter("check");
		System.out.println(searchcheck);
		
		ModelAndView mav = new ModelAndView();
		String clientId = "JsRivo1hBqek9J_l3Tw3";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "fZwfZXART3";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(searchcheck, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer buffer = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            	buffer.append(inputLine);
            }
            br.close();
            System.out.println(buffer.toString());
            HashMap<String, Object> rs = new ObjectMapper().readValue(buffer.toString(), HashMap.class) ;//각각의 카테고리가 문자화 되어 있지 않다
            System.out.println("!!!"+rs);//
            JSONObject jobj = new JSONObject();
            jobj.putAll(rs);//문자화 되어있다
            //JSONArray jarray = (JSONArray)jobj.get("items");
            System.out.println("@@@"+jobj);
          
            
           

            mav.addObject("food", jobj);
        	mav.setViewName("mapview");
            
        } catch (Exception e) {
            System.out.println(e);
        }
		return mav;
	}
}
