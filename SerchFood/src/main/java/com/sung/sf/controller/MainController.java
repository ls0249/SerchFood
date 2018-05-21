package com.sung.sf.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sung.sf.dao.SearchDao;
import com.sung.sf.dto.SearchDto;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class MainController {

	@Autowired
	private SearchDao searchDao;
	public static StringBuilder sb;

	// 메인 화면
	@RequestMapping(value = "/main.sf")//, method = RequestMethod.GET)
	public ModelAndView Main(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		System.out.println("여긴오냐?");
		
		mav.setViewName("main");

		return mav;
	}

	// 음식 검색
	@RequestMapping(value = "/search_list.sf", method = RequestMethod.GET)
	public ModelAndView mainActionform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String searchCategory = request.getParameter("category");
		System.out.println(searchCategory);
		
		int start = Integer.parseInt(request.getParameter("start"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		ModelAndView mav = new ModelAndView();
		
		String clientId = "JsRivo1hBqek9J_l3Tw3";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "fZwfZXART3";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(searchCategory, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text + "&start=" + start; // json 결과
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
            System.out.println("searchView : " + buffer.toString());
            HashMap<String, Object> rs = new ObjectMapper().readValue(buffer.toString(), HashMap.class);

            int total = (Integer) rs.get("total");
            int endPage = (total + (10-1))/10;
            
            int curBlock = (int)Math.ceil((page-1) / 5)+1;	// 현재 page block
            int blockBegin = (curBlock-1)*5+1;				// page block 시작값
            int blockEnd = blockBegin+5-1;					// page block 마지막값
            if(blockEnd > endPage) blockEnd = endPage;		// page block 마지막값이 총 page 보다 클경우 
            
            request.setAttribute("page", page);
            request.setAttribute("blockBegin", blockBegin);
            request.setAttribute("blockEnd", blockEnd);
            request.setAttribute("endPage", endPage);
            request.setAttribute("category", searchCategory);
            
            
            JSONObject jobj = new JSONObject();
            jobj.putAll(rs);
            //JSONArray jarray = (JSONArray)jobj.get("items");
            System.out.println("searchView json : "+jobj);
            

            mav.addObject("search", jobj);
            mav.setViewName("searchView");

        } catch (Exception e) {
            System.out.println(e);
        }
        return mav;
	}
	
	//식당 보기
		@RequestMapping(value = "/search_detail.sf", method = RequestMethod.GET)
		public ModelAndView search_detail(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

			ModelAndView mav = new ModelAndView();
			
			int start = 1;
			int page = 1;
			
			if(request.getParameter("start") != null && request.getParameter("page") != null) {
				start = Integer.parseInt(request.getParameter("start"));
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			//detail을 보여주기 위해 검색한 parameter category값을 가져온다.
			String result = request.getParameter("category");
			result = result.replaceAll("<b>", "");
			result = result.replaceAll("</b>", "");
			
			//blog를 찾기 위한 parameter 값
			String blogCategory = request.getParameter("blogCategory");
			blogCategory = blogCategory.replaceAll("<b>", "");
			blogCategory = blogCategory.replaceAll("</b>", "");
			//검색어와 검색된 category의 결과를 합쳐 blog를 찾는다.
			//String blogResult = blogCategory.concat(result);
						
			String commendCategory = blogCategory;
			
			System.out.println("@@" + commendCategory);
			
			
			// 해당 지점 detail을 보여주기 위해 가져온 parameter 값
			int mapx = Integer.parseInt(request.getParameter("mapx"));
			int mapy = Integer.parseInt(request.getParameter("mapy"));
			
			System.out.println("detailCategory : " + result + " detailMap : " + mapx + ", " + mapy);
			
			String clientId = "JsRivo1hBqek9J_l3Tw3";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "fZwfZXART3";//애플리케이션 클라이언트 시크릿값";
	        try {
	            String text = URLEncoder.encode(result, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text; //검색 json 결과

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
	            System.out.println("searchDetail : " + buffer.toString());
	            HashMap<String, Object> rs = new ObjectMapper().readValue(buffer.toString(), HashMap.class);
			
	            JSONObject jobj = new JSONObject();
	            jobj.putAll(rs);
	            JSONArray jarray = (JSONArray)jobj.get("items");
	            System.out.println("searchDetail json : "+jarray);
	            
	            request.setAttribute("category", result);
	            request.setAttribute("mapx", mapx);
	            request.setAttribute("mapy", mapy);
	            
	            mav.addObject("searchResult", jarray);
	            
			
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        
	        //화면 중단 주변 식당 추천
	        try {
	            String text = URLEncoder.encode(commendCategory, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text; //검색 json 결과

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
	            System.out.println("menuDetail : " + buffer.toString());
	            HashMap<String, Object> rs = new ObjectMapper().readValue(buffer.toString(), HashMap.class);
			
	            JSONObject jobj = new JSONObject();
	            jobj.putAll(rs);
	            JSONArray jarray = (JSONArray)jobj.get("items");
	            System.out.println("menuDetail json : "+jarray);
	            
	            mav.addObject("menuResult", jarray);
	            
			
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        	        
	        //화면 하단 블로그 리스트
	        try {
	            String blog = URLEncoder.encode(blogCategory, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ blog + "&start=" + start; //검색 json 결과

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
	            System.out.println("blogSearch : " + buffer.toString());
	            HashMap<String, Object> rs = new ObjectMapper().readValue(buffer.toString(), HashMap.class);
			
	            int total = (Integer) rs.get("total");
	            int display = (Integer) rs.get("display");
	            int endPage = (total + (10-1))/10;
	            if(endPage > 10) endPage = 10;
	            
	            int curBlock = (int)Math.ceil((page-1) / 5)+1;
	            int blockBegin = (curBlock-1)*5+1;
	            int blockEnd = blockBegin+5-1;
	            if(blockEnd > endPage) blockEnd = endPage;
	            
	            request.setAttribute("page", page);
	            request.setAttribute("blockBegin", blockBegin);
	            request.setAttribute("blockEnd", blockEnd);
	            request.setAttribute("endPage", endPage);
	            request.setAttribute("display", display);
	            request.setAttribute("blogCategory", blogCategory);
	            
	            JSONObject jobj = new JSONObject();
	            jobj.putAll(rs);
	            JSONArray jarray = (JSONArray)jobj.get("items");

	            mav.addObject("blogResult", jarray);
			
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        mav.setViewName("searchDetail");
	        
			return mav;
		}
	
	//
		//
	//오늘의 메뉴 랜덤 추천
	@RequestMapping(value = "/randomSearch.sf", method = RequestMethod.GET)
	public ModelAndView randomSearch(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		String randomSearch = searchDao.randomSearch();
		System.out.println(randomSearch);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("random_search", randomSearch);
		mav.setViewName("randomSearch");

		return mav;
	}
	
}