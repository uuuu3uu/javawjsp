package study.j1111;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class Test12 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		System.out.println("취미 : " + hobbys);
		if(hobbys != null) {
			for(String hobby : hobbys) {
				System.out.print(hobby + " / " );
			}
		}
		else {
			System.out.println("취미가 선택되어 있지 않아용");
		}
		
		// 웹에 내용을 출력하기 위해서는 PrintWriter객체를 통해서 처리한다.
		//PrintWriter(타입) 변수명 = response.getWriter();
		PrintWriter out = response.getWriter();
		
		out.println("안녕.. 이곳은 서블릿이야~");
		out.println("성명 : " + name + "<br/>");
		out.println("나이 : " + age + "<br/>");
		out.println("성별 : " + gender + "<br/>");
		out.println("취미 :" + hobbys + "<br/>");
		if(hobbys != null) {
			for(String hobby : hobbys) {
				out.println(hobby + " / ");
			}
		}
		else {
//			out.println("취미가 선택되어 있지 않아용");
			out.println("<script>");
			out.println("alert('취미는 하나이상 선택하셔야 합니다.');");
//			out.println("location.back();");		// 입력된 값을 다시 가져온다 
			out.println("location.href='/javawjsp/study/1111/test12.jsp'"); // 초기 자료값을 가져온다.
			out.println("</script>");
		}
			
		out.println("");
//		out.println("<p><a href='/javawjsp/study/1111/test12.jsp'>돌아가기</a></p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/1111/test12.jsp'>돌아가기</a></p>");
	}
}
