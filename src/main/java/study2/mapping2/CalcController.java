package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.calc") // *.calc calc가 뒤에 붙은에는 다 불러준다  적용된다
public class CalcController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MappingInterface command = null;
		
		String viewPage = "/WEB-INF/study2/mapping2";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf(".")); // uri 잘라주세요 uri의 마지막에서 /  , uri의 마지막에서 .  
		
		if(com.equals("/Calc")) {
			viewPage += "/calc.jsp";
		}
		else if(com.equals("/CalcOk")) {
			command = new CalcOkCommand(); // MappingInterface !!command!!  = null; 를 임플리먼트..한다
			command.excute(request, response);
			viewPage += "/calcOk.jsp";
		}
		
		else if(com.equals("/JuList")) {
			command = new JuListCommand(); // MappingInterface !!command!!  = null; 를 임플리먼트..한다
			command.excute(request, response);
			viewPage += "/juList.jsp"; 
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
