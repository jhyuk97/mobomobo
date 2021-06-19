package mobomobo.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminPageInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		
		if("user".equals(session.getAttribute("grade"))) {
			
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			
			out.print("<script>location.replace('/mobo/errorpage2'); </script>");
			
			out.flush();
			out.close();
			
			return false;
			
		}if(session.getAttribute("login") == null) {
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			
			out.print("<script>location.replace('/mobo/errorpage2'); </script>");
			
			out.flush();
			out.close();
			
			return false;
			
		}
		
		return true;
	}
	
}
