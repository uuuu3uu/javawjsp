package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class guDeleteCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")=="" ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		GuestDAO dao = new GuestDAO();
		
		if(idx != 0) {
			int res = dao.setGuDelete(idx);
		// 1 : 정상처리
			if(res == 1) {
				request.setAttribute("msg", "guDeleteOk");
			}
			else {
				request.setAttribute("msg", "guDeleteNo");	
			}
			request.setAttribute("url", request.getContextPath()+"/guList.gu");
		}

	}

}
