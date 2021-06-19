package mobomobo.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class MovieRecomInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			
			out.print("<script>alert('로그인 후 접속 가능한 페이지 입니다.'); location.replace('/mobo/main'); </script>");
			
			out.flush();
			out.close();
			
			return false;
		}
		
		return true;
	
	}
	
}
