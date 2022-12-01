package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoListCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDAO dao = new BoardDAO();
			
			// 페이징처리 중비 시작
			int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));	
			int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
			int totRecCnt = dao.totRecCnt(); 
			int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
			int startIndexNo = (pag - 1) * pageSize;
			int curScrStartNo = totRecCnt - startIndexNo;
		
			// 블록 페이징 처리(3단계)
			int blockSize = 3;
			int curBlock = (pag - 1) / blockSize;
			int lastBlock = (totPage - 1) / blockSize;
			
			ArrayList<BoardVO> vos = dao.getBoList(startIndexNo, pageSize); // 관리자 0번 넘긴다.. 페이징처리
			
			request.setAttribute("vos", vos);
			request.setAttribute("pag", pag);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("totPage", totPage);
			request.setAttribute("curScrStartNo", curScrStartNo);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("curBlock", curBlock);
			request.setAttribute("lastBlock", lastBlock);

	}

}
