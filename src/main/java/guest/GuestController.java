package guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.gu")
public class GuestController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestInterface command = null;
		String viewPage = "/WEB-INF/guest";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/guList")) {
			command = new GuListCommand();				// 생성
			command.execute(request, response);		// 호출
			viewPage += "/guList.jsp";
		}
		else if(com.equals("/guInput")) { // 
			viewPage += "/guInput.jsp";
		}
		else if(com.equals("/guInputOk")) {
			command = new GuInputOkCommand();
			command.execute(request, response);
//			viewPage += "/guList.jsp"; // 이런식으로 보내면 방명록 작성한 데이터베이스가 없어진 채로 리스트화면으로 돌아감.
			viewPage ="/include/message.jsp";
		}
		else if(com.equals("/adminLogin")) { // 
			viewPage += "/adminLogin.jsp";
		}
		else if(com.equals("/adminLoginOk")) {
			command = new AdminLoginOkCommand();
			command.execute(request, response);
			viewPage ="/include/message.jsp";
		}
		else if(com.equals("/adminLogout")) {
			command = new adminLogoutCommand();
			command.execute(request, response);
			viewPage ="/include/message.jsp";
		}
		else if(com.equals("/guDelete")) {
			command = new guDeleteCommand();
			command.execute(request, response);
			viewPage ="/include/message.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
}
