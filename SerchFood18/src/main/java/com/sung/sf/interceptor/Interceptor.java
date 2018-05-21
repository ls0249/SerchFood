package com.sung.sf.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			if(request.getSession().getAttribute("userid") == null) { //getAtribute는 key를 가지고 꺼낸다 세션이 유지가 되지 않았을때.
				response.sendRedirect("/inter_f.bo");
				return false;
			}
		}	catch (Exception e) {
			e.printStackTrace();
		}
		    return true;
		
	}
}
