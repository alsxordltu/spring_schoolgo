package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionCheckInterceptor extends HandlerInterceptorAdapter{
	
	private static Logger logger = LoggerFactory.getLogger(SessionCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 테스트를 위해 잠시 중지함 - andy
		
		HttpSession session = request.getSession();
		logger.trace("session 체크");
		if(session.getAttribute("userId")!= null){
			return true;
			
		}
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		
		
		return false;
	}
}
