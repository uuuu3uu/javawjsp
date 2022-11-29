<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>test1.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<!-- 로그인 창에서 '아이디/비밀번호/성명'을 입력 후 서버로 전송 후,
		 관리자 인증이 되면 인증성공창에서 입력된 '아이디/비밀번호/성명'을 모두 출력하시오 -->
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="<%=request.getContextPath()%>/j1114_Test2">
		<div><h2>로 그 인</h2></div>
		<p>
			아이디 : <input type="text" name="mid" id="mid" autofocus required class="form-control"/>
		</p>
		<p>
			비밀번호 : <input type="password" name="pwd" id="pwd" class="form-control"/>
		</p>
		<p> <!-- 1 -->
			이름 : <input type="text" name="name" id="name" required class="form-control"/>
		</p>
		
		<p>
			<input type="submit" value="전송" class="btn btn-success"/>
		</p>
		<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr() %>"/>
	</form>
</div>
<p><br/></p>
</body>
</html>