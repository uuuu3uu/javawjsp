package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.ajax.UserDAO;
import study2.ajax.UserVO;

public class UserDelCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		UserDAO dao = new UserDAO();
		
		String res = dao.setUserDel(mid);		//안지워질때도 있어서 변수로 받는다....
		
		response.getWriter().write(res);	// 가끔 가다 400에러 날때가 있어서 res 스트링으로

	}

}
