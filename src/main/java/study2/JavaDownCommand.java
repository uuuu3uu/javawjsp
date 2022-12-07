package study2;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JavaDownCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pdstest/");
		
		String fName = request.getParameter("file");
		
		File file = new File(realPath + fName);
		
		/* 프로토콜 형식에 맞도록 헤더에 정보를 제공해 준다 */
		// mimeType : 파일형식 (예: 텍스트파일? 바이너리? .. 등등) -> 2진 바이너리 형식으로 전송해야한다
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");	// 2진 바이너리형식
		}
		
		// 사용하는 브라우저에 대한 정보 : 만약에 인터넷익스플로어(IE)인 경우는 'euc-kr', 나머지 'utp-8'로 전송한다
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {   //user-agent: 사용자 브라우저가 어떻게 되니 , MISE: 마이크로소프트... 가 아니면
			downLoadName = new String(fName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(fName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 헤더 정보를 첨부하여 클라이언트에 전송할 준비를 마친다
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		// java에 의해서 실제로 파일을 다운(업)로 처리시켜준다(FileInputStream/FileOutputStream/ServletOutputStream)
			FileInputStream fis = new FileInputStream(file);
			// FileOutputStream fos = new FileOutputStream(nFile);
			ServletOutputStream sos = response.getOutputStream();
			
			// 전송할 객체를 생성 후 실제로 파일을 객체에 담아서 처리해준다.
			byte[] b = new byte[2048];
			int data = 0;
			
			while((data = fis.read(b, 0, b.length)) != -1) {
				sos.write(b, 0, data);
			}
			sos.flush(); 
			// 여기까지 수행하면 파일 다운로드 처리 완료
			
			sos.close();
			fis.close();
	}

}
