package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		// 세션이 끊겼다면 작업의 진행을 중지시키고 홈으로 전송시켜준다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		if(level >= 4) {			// 우리회원이 아님
			RequestDispatcher dispathcer = request.getRequestDispatcher("/");
			dispathcer.forward(request, response);
		}	// 모든 컨트롤러에 넣어준다
		
		
		
		if(com.equals("/pass")) {
			viewPage += "/password/pass.jsp";
		}
		else if(com.equals("/passOk1")) {
			command = new PassOkCommand();
			command.execute(request, response);
			viewPage += "/password/pass.jsp";
		}
		else if(com.equals("/passOk2")) {
			command = new PassOk2Command();
			command.execute(request, response);
			viewPage += "/password/passOk2.jsp";
		}
		else if(com.equals("/ajax1")) {
			viewPage += "/ajax/ajax1.jsp";
		}
		else if(com.equals("/userList")) {
			command = new UserListCommand();
			command.execute(request, response);
			viewPage += "/ajax/userList.jsp";
		}
		else if(com.equals("/userSearch")) {
			command = new UserSearchCommand();		// 가서 일만 죽어라 한 꼴로 만든것..
			command.execute(request, response);
			return;
		}
		else if(com.equals("/userDel")) {
			command = new UserDelCommand();		
			command.execute(request, response);
			return;
		}
		else if(com.equals("/upLoad1")) {
			viewPage += "/pdstest/upLoad1.jsp";
		}
		else if(com.equals("/upLoad1Ok")) {
			command = new UpLoad1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/upLoad2")) {
			viewPage += "/pdstest/upLoad2.jsp";
		}
		else if(com.equals("/upLoad2Ok")) {
			command = new UpLoad2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/upLoad3")) {
			viewPage += "/pdstest/upLoad3.jsp";
		}
		else if(com.equals("/upLoad2Ok")) {
			command = new UpLoad2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/upLoad4")) {
			viewPage += "/pdstest/upLoad4.jsp";
		}
		else if(com.equals("/downLoad")) {
			command = new DownLoadCommand();
			command.execute(request, response);
			viewPage += "/pdstest/downLoad.jsp";
		}
		else if(com.equals("/fileDelete")) {
			command = new FileDeleteCommand();
			command.execute(request, response);
			return;
		}
		
		
		
		RequestDispatcher dispathcer = request.getRequestDispatcher(viewPage);
		dispathcer.forward(request, response);
		
	}
}
