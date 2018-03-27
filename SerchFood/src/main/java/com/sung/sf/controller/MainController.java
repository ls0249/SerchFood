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

	// 음식 검색
	@RequestMapping(value = "/main.sf", method = RequestMethod.GET)
	public ModelAndView Main(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		System.out.println("여긴오냐?");
		
		mav.setViewName("main");

		return mav;
	}

	@RequestMapping(value = "/main.sf", method = RequestMethod.POST)
	public ModelAndView mainActionform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String searchCategory = request.getParameter("category");
		System.out.println(searchCategory);
		
		ModelAndView mav = new ModelAndView();
		String clientId = "JsRivo1hBqek9J_l3Tw3";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "fZwfZXART3";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(searchCategory, "UTF-8");
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
            HashMap<String, Object> rs = new ObjectMapper().readValue(buffer.toString(), HashMap.class) ;

            JSONObject jobj = new JSONObject();
            jobj.putAll(rs);
            JSONArray jarray = (JSONArray)jobj.get("items");
            System.out.println("@@@"+jarray);

            mav.addObject("food", jarray);
    		mav.setViewName("searchView");
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return mav;
		/*boolean searchMenu = searchDao.search(searchCategory);
		//왜 안돼
		if (searchMenu) {			//검색값이 DB에 있다면
			
			ModelAndView mav = new ModelAndView();

			List<SearchDto> list = searchDao.searchList(searchCategory);
			mav.addObject("search_list", list);
			mav.setViewName("searchView");

			return mav;
			//return new ModelAndView("redirect:search_list.sf");
			
		} else {					//검색값이  DB에 없다면
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script language='javascript'>");
            out.println("alert('잘못된 검색입니다!');");
            out.println("</script>");
            out.flush();
            
			return new ModelAndView("main");
		}*/

	}
	
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
	
/*	//네이버 검색
	@RequestMapping(value = "/blog.sf", method = RequestMethod.GET)
	public ModelAndView naver(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("시작");
		String clientId = "JsRivo1hBqek9J_l3Tw3";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "fZwfZXART3";//애플리케이션 클라이언트 시크릿값";
        int display = 2;

        try {
            String text = URLEncoder.encode("충주 맛집", "utf-8");
            String apiURL = "https://openapi.naver.com/v1/search/local?query=" + text + "&display=" + display + "&";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            sb = new StringBuilder();
            String line;
 
            while ((line = br.readLine()) != null) {
                //sb.append(line + "\n");
            	sb.append(line);
            }
            br.close();
            con.disconnect();
            
            String data = sb.toString();
            String[] array;
            array = data.split("\"");
            String[] title = new String[display];
            String[] link = new String[display];
            String[] category = new String[display];
            String[] description = new String[display];
            String[] telephone = new String[display];
            String[] address = new String[display];
            String[] mapx = new String[display];
            String[] mapy = new String[display];
            int k = 0;
            for (int i = 0; i < array.length; i++) {
                if (array[i].equals("title"))
                    title[k] = array[i + 2];
                if (array[i].equals("link"))
                    link[k] = array[i + 2];
                if (array[i].equals("category"))
                    category[k] = array[i + 2];
                if (array[i].equals("description"))
                    description[k] = array[i + 2];
                if (array[i].equals("telephone"))
                    telephone[k] = array[i + 2];
                if (array[i].equals("address"))
                    address[k] = array[i + 2];
                if (array[i].equals("mapx"))
                    mapx[k] = array[i + 2];
                if (array[i].equals("mapy")) {
                    mapy[k] = array[i + 2];
                    k++;
                }
            }
            System.out.println(sb);
            System.out.println("----------------------------");
            System.out.println("첫번째 타이틀 : " + title[0]);
            System.out.println("두번째 타이틀 : " + title[1]);
        } catch (Exception e) {
            System.out.println(e);
        }
        
		ModelAndView mav = new ModelAndView();
		System.out.println("넘겨주세요~"+sb);
		mav.addObject("items", sb);
		mav.setViewName("searchView");

		return mav;
	}*/

	/*@RequestMapping(value = "/blog.sf", method = RequestMethod.GET)
	public ModelAndView naver(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String clientId = "JsRivo1hBqek9J_l3Tw3";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "fZwfZXART3";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode("개봉맛집", "UTF-8");
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
            HashMap<String, Object> rs = new ObjectMapper().readValue(buffer.toString(), HashMap.class) ;

            JSONObject jobj = new JSONObject();
            jobj.putAll(rs);
            JSONArray jarray = (JSONArray)jobj.get("items");
            System.out.println("@@@"+jarray);

            mav.addObject("items", jarray);
    		mav.setViewName("searchView");
            
        } catch (Exception e) {
            System.out.println(e);
        }
    
		return mav;
	}*/
	
}