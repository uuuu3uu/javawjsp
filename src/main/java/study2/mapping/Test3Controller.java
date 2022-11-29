package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
/* @WebServlet("/mapping/Test3") */
@WebServlet("*.do")  // 확장자 패턴~!!! Test1.do / Test2.do / Test3.do 모두 같은... 파일명 관계없음. 확장자가 do여야하 한다
public class Test3Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuffer url = request.getRequestURL();
		System.out.println("url : " + url);
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);  // 도메인을 생략한 uri로 작업한다
		
		String com = uri.substring(uri.lastIndexOf("/"));    // 마지막 뒤만(/kbs.do , / mbc.do 가져오는 과정
		System.out.println("com : " + com);
		
		String com2 = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));     // mbc만 가져오는 과정 ("/부터", ".까지")
		System.out.println("com2 : " + com2);
		
//		PrintWriter out = response.getWriter();
		
		String viewPage = "/WEB-INF/study2/mapping";
		
		// 컨트롤러 사용의 예
		if(com2.equals("/Test3_1")) {  // 이름이 뭘 붙어도 상관은 없당
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test3_1.jsp");
			viewPage += "/test3_1.jsp";
		}
		else if(com2.equals("/Test3_2")) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test3_2.jsp");
			viewPage += "/test3_2.jsp";
		}
		else if(com2.equals("/Test3_3")) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test3_3.jsp");
			viewPage += "/test3_3.jsp";
		}
		
		else if(com2.equals("/Test4") || com2.equals("/test4")) {   // 대소문자 상관없다
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test3_3.jsp");
			viewPage += "/test4.jsp";
		}
		
		else if(com2.equals("/Test4Ok")) {
			int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
			int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
			String opt = request.getParameter("opt")==null ? "" : request.getParameter("opt");
			
			Test4Calc t4 = new Test4Calc();
			int res = t4.getcalc(su1, su2, opt);
			
			request.setAttribute("su1", su1);
			request.setAttribute("su2", su2);
			request.setAttribute("opt", opt);
			request.setAttribute("res", res);
			
			viewPage += "/test4Ok.jsp";
		}
		else {
//			out.print("<script>");
//			out.print("alert('잘못된 경로입니다');");
////			out.print("location.href='location.href='/WEB-INF/study2/mapping/test3.jsp';"); // location.href='/WEB-INF/study2/mapping/test3.jsp': 이런식으로 안됨 컨트롤러로 해야함
//			out.print("location.href='"+request.getContextPath()+"/mapping/Test3';");
//			out.print("</script>");
////			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test3.jsp");
////			dispatcher.forward(request, response);		
			viewPage += "/test3.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);		
		
	}
}
