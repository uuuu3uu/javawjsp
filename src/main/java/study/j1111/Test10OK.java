package study.j1111;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/test10OK")
public class Test10OK extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 처리 
		request.setCharacterEncoding("utf-8");			// request : 요청
		response.setCharacterEncoding("utf-8");  // 
		response.setContentType("text/html; charset=utf-8");   // response : 반응..
		
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		System.out.println("성명 :" + name);
		System.out.println("나이 :" + age);
	}
	
}
