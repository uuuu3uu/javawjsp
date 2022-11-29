package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/database/LogOut")
public class LogOut extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JusorokDAO dao = new JusorokDAO();
		
		dao.logOut();
		
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("sName");
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('"+name+"로그아웃되었습니다');");
		out.print("location.href='"+request.getContextPath()+"/study/1120_Database/login.jsp';");
		out.print("</script>");
	}
}
