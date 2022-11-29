package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIP = request.getParameter("hostIP")==null ? "" : request.getParameter("hostIP");
		
		// 성명에는 태그사용 금지
		name = name.replace("<", "&lt;");
		name = name.replace(">", "&gt;");
		
		GuestDAO dao = new GuestDAO();
		GuestVO vo = new GuestVO();

		vo.setName(name); 
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIP(hostIP);
		
		int res = dao.setGuInput(vo);
		
		// 1 : 정상처리
		if(res == 1) {
			request.setAttribute("msg", "guInputOk");
			request.setAttribute("url", request.getContextPath()+"/guList.gu");
		}
		else {
			request.setAttribute("msg", "guInputNo");
			request.setAttribute("url", request.getContextPath()+"/guInput.gu");
			
		}
		
	}

}
