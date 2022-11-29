package study.j1116;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1116/Test2/4")
public class Test2_4 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String hakbun = request.getParameter("hakbun")==null ? "" : request.getParameter("hakbun");
		int kor = request.getParameter("kor")==null ? 0 : Integer.parseInt(request.getParameter("kor"));
		int eng = request.getParameter("eng")==null ? 0 : Integer.parseInt(request.getParameter("eng"));
		int mat = request.getParameter("mat")==null ? 0 : Integer.parseInt(request.getParameter("mat"));
		int soc = request.getParameter("soc")==null ? 0 : Integer.parseInt(request.getParameter("soc"));
		int sci = request.getParameter("sci")==null ? 0 : Integer.parseInt(request.getParameter("sci"));
		
		int tot = kor + eng + mat + soc + sci;
		double avg = tot / 5.0;
		int intAvg = (int)(avg / 10.0);
		String grade;
		
		switch (intAvg) {
			case 10:
			case 9:
				grade = "A";
				break;
			case 8:
				grade = "B";
				break;
			case 7:
				grade = "C";
				break;
			case 6:
				grade = "D";
				break;
			default:
				grade = "F";
		}
		
		// VO에 값 저장하기
		Test2VO vo = new Test2VO(name,hakbun,kor,eng,mat,soc,sci,tot,avg,grade);
		System.out.println("vo : " + vo);

		
		// 서버에서 get방식으로의 전송방법
		// response.sendRedirect(request.getContextPath()+"/study/1116/test2Ok3.jsp?hakbun="+hakbun+"&name="+name+"&kor="+kor+"&eng="+eng+"&mat="+mat+"&soc="+soc+"&sci="+sci+"&tot="+tot+"&avg="+avg+"&grade="+grade);
//		name = URLEncoder.encode(name);
//		vo.setName(name);
//		response.sendRedirect(request.getContextPath()+"/study/1116/test2Ok3.jsp?vo="+strVo); // 간단하게 값 넘기기....
		
		// 저장소(request)를 활용한 forwarding
		// 타입 변수 = 값; 인 일반적인 공식?을 무시한다
		request.setAttribute("vo", vo);  //request.setAttribute(객체를 담아갈 변수(얘가 헤더를 통해서 test2Ok4.jsp로 넘어간당) , 처리가 끝난 객체변수)
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/1116/test2Ok4.jsp");
//		dispatcher.forward(request, response); 
		// 위에 주석 2줄을 밑에처럼 변환 가능~~!
//		request.getRequestDispatcher("/study/1116/test2Ok4.jsp").forward(request, response);
		
		// 더 줄여본다 
		String viewPage = "/study/1116/test2Ok4_2.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);		// 프론트컨트롤러....
		
	}
}
