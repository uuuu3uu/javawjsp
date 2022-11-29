package study.j1116h;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1116h/Home")
public class Home extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String product = request.getParameter("product")==null ? "" : request.getParameter("product");
		int price = (request.getParameter("price")==null ? 0 : Integer.parseInt(request.getParameter("price")));
		int pcs = request.getParameter("pcs")==null ? 0 : Integer.parseInt(request.getParameter("pcs"));
		
		HomeVO vo = new HomeVO(product,price,pcs);
		System.out.println("vo : " + vo);
		request.setAttribute("vo", vo);
		
		String ViewPage = "/study/1116h/homeOk.jsp";
		request.getRequestDispatcher(ViewPage).forward(request, response); // 리퀘스트에 담아라.

	}

}
