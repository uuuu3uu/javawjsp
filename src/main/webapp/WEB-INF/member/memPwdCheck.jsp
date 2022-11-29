<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>memPwdCheck.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  'use strict';
  	function fCheck() {
			
	  	let pwd = document.getElementById("pwd").value;
	  		
	    if(pwd.trim() == "") {
	    	alert("비밀번호를 입력하세요");
	    	document.getElementById("pwd").focus();
	    }   	
	    else {
	    	myform.submit();
	    }
		}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="${ctp}/memPwdCheckOk.mem" class="was-validated">
		<h2 class="valid-feedback">비밀번호 확인</h2>
		<br/>
		<table class="table table-bordered">
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" id="pwd" autofocus required class="form-control"/>
					<div class="invalid-feedback">기존 비밀번호를 입력하세요</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="확인" onclick="fCheck()" class="btn btn-success"/> &nbsp;
        	<input type="reset" value="다시입력" class="btn btn-success"/> &nbsp;
        	<input type="button" value="돌아가기" onclick="location.href='${ctp}/memMain.mem';" class="btn btn-success"/>
      	</td>
			</tr>
		</table>
		<input type="hidden" name="mid" value="${sMid}"/>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>