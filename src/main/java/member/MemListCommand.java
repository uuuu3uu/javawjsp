package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemListCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int level = (int) session.getAttribute("sLevel");
		
		MemberDAO dao = new MemberDAO();
		
		
		// 1. 페이지 만들어
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		// 2. 한페이지 분량 정하기
		int pageSize = 3;
		// 3. 총 레코드 건수
		int totRecCnt = dao.totRecCnt(); 
		
		// 4. 총 페이지 건수 
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
		// 5. 현재 페이지 시작 인덱스 번호
		int startIndexNo = (pag - 1) * pageSize;
		// 6. 현재 화면에 보여주는 시작 번호 		
		int curScrStrtNo = totRecCnt - startIndexNo;
		
		System.out.println("totRecCnt : "  + totRecCnt);
		System.out.println("pageSize : "  + pageSize);
		System.out.println("totPage : "  + totPage);
		
		// 블록 크기
		int blockSize = 3;
		
		// 현재 페이지 블록 번호 (예: 1페이지는 0블록, 3페이지는 0블록, 5페이지는 1블록)
		int curBlock = (pag - 1) / blockSize;
		
		// 마지막 블록 
		int lastBlock = (totPage - 1) / blockSize;
		
		ArrayList<MemberVO> vos = dao.getMemList(level,startIndexNo, pageSize); // 관리자 0번 넘긴다.. 페이징처리
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		//request.setAttribute("pageSize", pageSize);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStrtNo", curScrStrtNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
	}

}
