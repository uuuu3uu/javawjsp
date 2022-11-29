<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			cookies[i].setMaxAge(0); // 쿠키의 ㅇ만료시간을 0으로 설정되어 쿠키를 제거
			response.addCookie(cookies[i]);
		}
	}
%>
<script>
	alert("쿠키에 삭제완료!")
	location.href = "t1_CookiesMain.jsp"
</script>