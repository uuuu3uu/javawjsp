package study.j1117;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j1117/Test1Ok")
public class Test1Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String job = request.getParameter("job");
		String address = request.getParameter("address");
		
		PrintWriter out = response.getWriter();
		
		/*
		out.print("<p>성명 : " + name + "</p>");
		out.print("<p>성별 : </p>" + gender + "</p>");
		out.print("<p>나이 : </p>" + age + "</p>");
		out.print("<p>직업 : </p>" + job + "</p>");
		out.print("<p>주소 : </p>" + address + "</p>");
		out.print("<p><a href='"+request.getContextPath()+"/study/1117/jspaction/test1.jsp'>돌아가기</a></p>");		
		*/
		
		// 정산처리된 Data를 vo에 넣어준다
		Test1VO vo = new Test1VO();
		
		vo.setName(name);
		vo.setGender(gender);
		vo.setAge(age);
		vo.setJob(job);
		vo.setAddress(address);
		
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/study/1117/jspaction/test1Ok.jsp").forward(request, response);
		
		
	}

}
