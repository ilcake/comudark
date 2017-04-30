package good.love.music.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");

		session.setAttribute("fromPage", request.getHeader("referer"));

		if (loginId != null) {
			session.getAttribute("fromPage");
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}

		return super.preHandle(request, response, handler);
	}

}
