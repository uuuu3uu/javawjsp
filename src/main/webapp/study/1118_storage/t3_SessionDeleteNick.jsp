<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionDeleteNick.jsp -->
<%
	session.removeAttribute("sNickName");

%>
<script>
	alert("${sName}님 닉네임 세션이 지워졌습니다 ");
	location.href = "t3_SessionMain.jsp";
</script>