<!-- 지시자(디렉티브) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>test5.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<%! 	// jsp 변수 선언부 (%!)
		public int hap(int su1, int su2) {
		 return su1 + su2;
		}
	%>
	
	<h2>두 수의 합</h2>
	<%
			int hap = hap(10,20);
			out.println("두 수의 합은 <b>"+hap+"</b>입니다. <br/>");
		%>
</div>
<p><br/></p>
</body>
</html>