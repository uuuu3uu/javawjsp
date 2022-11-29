<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_LoginDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid = cookies[i].getValue();
				pageContext.setAttribute("mid", mid);
				cookies[i].setMaxAge(0); // 쿠키의 ㅇ만료시간을 0으로 설정되어 쿠키를 제거
				response.addCookie(cookies[i]);
				break;
			}
		}
	}
%>
<script>
	alert("${mid}쿠키 아이디 삭제완료!")
	location.href = "t2_LoginMember.jsp ,mid"
</script>