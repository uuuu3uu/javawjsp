package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command = null;
		String viewPage = "/WEB-INF/board";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		// 세션이 끈겼다면 작업의 진행을 중시시키고 홈으로 전송시켜준다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level >= 4) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		
		else if(com.equals("/boList")) {
			command = new BoListCommand();
			command.execute(request, response);
			viewPage += "/boList.jsp";
		}
		else if(com.equals("/boInput")) {
			command = new BoInputCommand();
			command.execute(request, response);
			viewPage += "/boInput.jsp";
		}
		else if(com.equals("/boInputOk")) {
			command = new BoInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/boContent")) {
			command = new BoContentCommand();
			command.execute(request, response);
			viewPage += "/boContent.jsp";
		}
		else if(com.equals("/boGood")) {
			command = new BoGoodCommand();
			command.execute(request, response);
			return;  // 돌아가는게 없다 -> 비동기식으로 됨
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
