package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MappingInterface {		 // request로 주고 response로 받겠따  Calc컨트롤러가 보낸 그대로를 받는다. -> SerialException, IOException 보낸다
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;		// public 누구나 사용가능해야한다 / void넘겨주는거 없다
}
