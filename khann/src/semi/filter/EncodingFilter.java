package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
//모든 요청을 utf-8로 복원합니다. 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns="/*")
public class EncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		req.setCharacterEncoding("UTF-8");
		
		//chain은 사용자의 요청과 관련된 모든 도구들의 연결정보
		// - doFilter 명령을 내리면 가던길 가라는 뜻
		// - request는 원래의 요청 정보(HttpServletRequest의 상위버전)
		// - response는 원래의 응답 정보(HttpServletResponse의 상위버전)
		chain.doFilter(request, response);
	}

}
