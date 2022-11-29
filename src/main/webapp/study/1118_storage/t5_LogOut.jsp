<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t5_LogOut.jsp -->

<%
	String mid = (String)session.getAttribute("sMid");
	session.invalidate();  // :설정된 세션의 값들을 모두 사라지도록한다.
%>

<script>

	alert("<%=mid%>님 로그아웃 되었습니다");
	location.href = "t5_Login.jsp";
</script>