package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dto.MemberDto;
@WebFilter(urlPatterns = {
		 "/cs/write.jsp",
		 "/movie/movie_insert.jsp",
		 "/movie/movie_delete.jsp",
		 "/theater/*",
		 "/show/*"
		
})
public class AdminFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	 
//세션에 있는 userinfo 정보를 꺼낸다 
//있다면 로그인 한것 (통과)
// chain.doFilter(request,response);
//없다면 로그인 페이지로 리다이렉트!!!!
// response.sendRedirect(페이지);
		
		//다운캐스팅 
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		//세션에서 유저정보 가져옴 
		MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
		
		//로그인 여부체크
		
		if(mdto.getGrade().equals("관리자")) {//관리자라면
			chain.doFilter(request, response);//통과
		}
		else {//관리자가 아니라면
			resp.sendError(403);//403(권한 없음) 오류를 송출
		}
		
		
		
	}

}
