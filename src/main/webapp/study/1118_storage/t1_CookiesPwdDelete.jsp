<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesPwdDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cPwd")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
	}
%>
<script>
	alert("패스워드 쿠키 삭제완료!")
	location.href = "t1_CookiesMain.jsp"
</script>


<!-- String pwd = "1234";
	Cookie cookiePwd = new Cookie("cPwd", mid);
	cookiePwd.setMaxAge(60*60*24); -->