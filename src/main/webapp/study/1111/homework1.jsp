<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>

<style>
	.error_next_box {
		display: block;
		margin: 9px 0 -2px;
		font-size: 12px;
		line-height: 14px;
		color: red;		0
	}
</style>
<body>
<p><br/></p>
<div class="container">
	<h2>네이버 회원가입</h2>
	<div><input type ="text" name ="mid" class="form-control" plcaceholder="아이디"/></div>
	<span class="error_next_box">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</span>
	
</div>
<p><br/></p>
</body>
</html>