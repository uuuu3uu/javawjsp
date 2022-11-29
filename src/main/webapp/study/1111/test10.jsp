<!-- 지시자(디렉티브) -->
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>test10.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>값 전송하기(get)방식</h2>	
	<form name="myfrom" method="post" action="../../test10OK">
		성명: <input type ="text" name ="name" value="Hong kil Doing" class="form-control"/>
		나이: <input type ="text" name ="age" value="25" class="form-control"/>
		<input type="submit" value="전송" class="btn btn-success mt-3"/>
 	</form>
</div>
<p><br/></p>
</body>
</html>