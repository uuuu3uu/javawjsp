package study.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/database/MemberList")
public class MemberList extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JusorokDAO dao = new JusorokDAO();
		
		ArrayList<JusorokVO> vos = dao.getMemberList();
		
		request.setAttribute("vos", vos);
		
		RequestDispatcher dispatcjer = request.getRequestDispatcher("/study/1120_Database/memberList.jsp");
		dispatcjer.forward(request, response);
	
	}

}
