package study2.mapping2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.JusorokDAO;
import study.database.JusorokVO;

public class JuListCommand implements MappingInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JusorokDAO dao = new JusorokDAO();  // 데이터베이스에서 찾아오기
		
		ArrayList<JusorokVO> vos = dao.getMemberList();
		
		request.setAttribute("vos", vos);  // vos 저장소에 담아둡니덩

	}

}
