<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionGroup.jsp -->
<%
	Enumeration names = session.getAttributeNames();
	
	while(names.hasMoreElements()) {   //hasMoreElements() : 읽어올 요소가 남아있는지 확인. 있으면 true, 없으면 false.
		String name = (String)names.nextElement();
		out.println("세션명 : " + name + "<br/>");
	}
%>
<p>
	<a href="t3_SessionMain.jsp" class="btn btn-warning">돌아가기</a>
</p>