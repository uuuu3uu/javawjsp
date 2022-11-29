package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		JusorokDAO dao = new JusorokDAO();
		
		System.out.println("mid : " + mid);
		
		JusorokVO vo = dao.loginCheck(mid, pwd);
		
		System.out.println("vo : " + vo);
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(vo.getName() != null) {
			// 회원 인증 후 처리(1. 자주 사용하는 자료를 세션에 담는다 2.방문포인트를 10점씩 부가한다(단, 1일 방문포인트는 최대 50점까지만 허용) 3. 최종방문날짜를 현재 날짜시간으로 변경한다 
			// 1. 세션처리
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sLastdate", vo.getLastDate().substring(0,19));
			
			// 2. 방문포인트 증가하기(10점씩, 1일 50점 까지..)
			// 3. 최종방문일자 업데이트 -> 2,3번 한번에 처리.
			int visitpoint = vo.getPoint() + 10;
			dao.setVistitUpdate(visitpoint, mid);	//아무나 증가할 수없기땜에 아이디도 같이 보낸당
			
			out.print("<script>");
			out.print("alert('"+vo.getName()+"님 로그인 되었습니다');");
			out.print("location.href='"+request.getContextPath()+"/database/MemberMain';");
			out.print("</script>");
			
			//response.sendRedirect(request.getContextPath()+"/database/MemberMain");			// 겟방식이기때문에 절대경로로 
			
			
		}
		else {
			// 회원 인증 실패 시 처리
			out.print("<script>");
			out.print("alert('로그인 실패');");
			out.print("location.href='"+request.getContextPath()+"/study/1120_Database/login.jsp';");
			out.print("</script>");
		}
	}
}
