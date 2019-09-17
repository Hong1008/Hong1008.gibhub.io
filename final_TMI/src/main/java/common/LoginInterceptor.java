package common;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import service.ProjectService;
import service.ProjectServiceImp;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		Enumeration param = request.getParameterNames();
        String strParam = "";
        while(param.hasMoreElements()) {
            String name = (String)param.nextElement();
            String value = request.getParameter(name);
            strParam += name + "=" + value + "&";
        }
		if(session.getAttribute("id") == null) {
			session.setAttribute("returnUri", uri + "?" + strParam);
            response.sendRedirect("/tmi/isGuest");
            return false;
        }else if(session.getAttribute("projectHomeList") == null) {
			response.sendRedirect("/tmi/home");
			return false;
		}
        return true;
	}
}
