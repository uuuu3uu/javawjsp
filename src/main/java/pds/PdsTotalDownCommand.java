package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		PdsDAO dao = new PdsDAO();
		PdsVO vo =  dao.getIdxSearch(idx);
		
		String[] fNames = vo.getfName().split("/"); // 올린 파일
		String[] fSNames = vo.getfSName().split("/");	// 서버에 저장된 파일
		
		// 파일 압축에 필요한 객체들을 선언한다
		//(server에서... 놀고있음)
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null;   //zip으로 묶어주는객체
		ServletOutputStream sos = null; // 클라이언트에 전송하기 위해 필요함
		
		// 기존꺼 덮어씌어지지 않게 temp폴더 이용
		String realPath = request.getServletContext().getRealPath("/data/pds/");
		String zipPath = request.getServletContext().getRealPath("/data/pds/temp/");
		String zipName = vo.getTitle() + ".zip";  //zip파일로 만들려고
		
		fos = new FileOutputStream(zipPath + zipName);
		zos = new ZipOutputStream(fos);
		
		byte[] b = new byte[2048];
		int data = 0;
		
		for(int i=0; i<fNames.length; i++) {
			File file = new File(realPath + fSNames[i]); 		// 서버에 저장된 파일의 0번째를 .
			/*
			 * File copyAndRename = new File(realPath + fNames[i]); // 이름 바꾸는 작업(원래 파일이름으로)
			 * 
			 * file.renameTo(copyAndRename); //File copyAndRename를 File file 로 // a renameTo(b) : b파일을 a파일로 이름 바꿔서 복사처리한다
			 			
			fis = new FileInputStream(copyAndRename);
			*/
			fis = new FileInputStream(file);
			
			zos.putNextEntry(new ZipEntry(fNames[i]));	// output 이용해서 zip으로 넣는다
			
			 while((data = fis.read(b, 0, b.length)) != -1) {		// 0번째 방에서부터 
				 zos.write(b, 0, data);
				 
			 }
			 zos.flush();
			 zos.closeEntry();
			 fis.close();
		}
		zos.close(); // server에서 zip 끝남
		
		// 서버에서 압축작업이 완료되면, 압축파일을 클라이언트로 전송하고, 서버에 압축되어 있는 파일을 삭제한다
		// 전송프로토콜인 http헤더에 필요한 정보를 알려준다.
		String mimeType = request.getServletContext().getMimeType(zipName.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");	// 2진 바이너리형식
		}
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {   //user-agent: 사용자 브라우저가 어떻게 되니 , MISE: 마이크로소프트... 가 아니면
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
		}
		// 헤더정보를 가지고 서버의 zip파일을 클라이언트에 전송처리한다
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		// java로 실제파일을 클라이언트로 다운 처리 시켜준다
		fis = new FileInputStream(zipPath + zipName);
		sos = response.getOutputStream();
		
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		
		sos.close();
		fis.close();
		// 이곳까지가 클라이언트로 전송완료됨..
		
		// 서버에 존재하는 zip파일 삭제처리
		new File(zipPath + zipName).delete();
		
		// 다운로드 횟수 증가처리
		dao.setPdsDownNum(idx);
		
	}

}
