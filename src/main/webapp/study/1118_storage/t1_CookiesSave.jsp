<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesSave.jsp (서블릿코드 쓰겠다) -->  
<%
	String mid = "hkd1234";
	Cookie cookieMid = new Cookie("cMid", mid);  // cMid : 우리끼리 약속..
	cookieMid.setMaxAge(60*60*24); // 쿠키의 만료시간 : 단위 '초', 1일(60*60*24) 
	
	String pwd = "1234";
	Cookie cookiePwd = new Cookie("cPwd", mid);
	cookiePwd.setMaxAge(60*60*24);
	
	String job = "학생";
	Cookie cookieJob = new Cookie("cJob", mid);
	cookieJob.setMaxAge(60*60*24);
	
	// 쿠키를 클라이언트에 저장하기(즉, 사용자 컴퓨터에 저장된다.)
  response.addCookie(cookieMid);			// 지정된 1일이 지나면 사라진다.
  response.addCookie(cookiePwd);		
  response.addCookie(cookieJob);			
%>
<script>
	alert("쿠키에 저장완료!")
	location.href = "t1_CookiesMain.jsp"
</script>
