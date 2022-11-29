package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/database/SearchMid")
public class SearchMid extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		JusorokDAO dao = new JusorokDAO();
		
		JusorokVO vo = dao.getMemberSearch(mid); // 검색에서 돌아온 부분
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName() != null) {
			request.setAttribute("vo", vo);		
			RequestDispatcher dispatcjer = request.getRequestDispatcher("/study/1120_Database/memberSearch.jsp");
			dispatcjer.forward(request, response);
			
		}
		else {
			// 회원 인증 실패 시 처리
			out.print("<script>");
			out.print("alert('찾고자하는 아이디가 없습니다');");
			out.print("location.href='"+request.getContextPath()+"/study/1120_Database/member.jsp';");
			out.print("</script>");
		}
		
		
		
	}

}
