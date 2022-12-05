package study2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownLoadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일의 정보를 가져온다
		String realPath = request.getServletContext().getRealPath("data/pdstest");
		

		String[] files = new File(realPath).list();
		
		for(String file : files) {		// 향상된 for문
			System.out.println("file : " + file);
		}
		
		request.setAttribute("files", files);
	}

}
