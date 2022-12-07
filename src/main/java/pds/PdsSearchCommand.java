package pds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsSearchCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString") == null ? "" : request.getParameter("searchString");
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		
		int day_diff = request.getParameter("day_diff") == null ? 0 : Integer.parseInt(request.getParameter("day_diff"));
		int hour_diff = request.getParameter("hour_diff") == null ? 0 : Integer.parseInt(request.getParameter("hour_diff"));
		
		PdsDAO dao = new PdsDAO();
		
		ArrayList<PdsVO> vos = dao.getPdsContentSearch(search, searchString);
		
		String searchTitle = "";
		if(search.equals("title")) searchTitle = "글제목";
		else if(search.equals("nickName")) searchTitle = "닉네임";
		else searchTitle = "글내용";
		
		request.setAttribute("vos", vos);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		request.setAttribute("curScrStartNo", vos.size());
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("day_diff", day_diff);
		request.setAttribute("hour_diff", hour_diff);
	}

}
