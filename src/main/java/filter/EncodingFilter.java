package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
@WebFilter("/*")  // 필터의 권한 주기
//임플리먼트 필터는 서블릿껄로 걸어준다.
public class EncodingFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");  // jsp에서 필요하기 때문에 없어도 됨.
		response.setContentType("text/html; charset=utf-8");
		
//		System.out.println("이곳은 필터통과 전");
		chain.doFilter(request, response);
//		System.out.println("이곳은 필터통과 후");
	}				

}
