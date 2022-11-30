<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>ajax1.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	function idCheck() {
			//let mid = document.getElementById("mid").value;
			//let mid = document.myform.mid.value;
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			
			location.href = "${ctp}/idSearchTest?mid="+mid;	
		}
  	function idCheck2() {			// 비동기식으로 처리
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			
			let query = {
					mid: mid,
					//idx: idx,
					//address: address
			}
			
			$.ajax({
				url  : "${ctp}/idSearchTest2",			// 전송받는 곳의 주소
				type : "get",
				data : query,			// 예: {mid: mid, idx: idx} or 변수 줘서 let query = { ...} query 넣어주던가..
				// contextType : "application/json",     -> 생략가능....
				// charset : "utf-8",						-> 생략가능.. 위에 뭐 설정한거.. 맥은 안될걸
				success : function(res) {			// functhon안에는 자바스크립트??..써야함
					alert("서버에서 아이디 검색을 성공적으로 마치고 돌아왔습니다. 검색된 성명은? " + res);
					$("#demo").html(res);
				},
				error : function() {
					alert("전송실패");
				}
			});
		}
  	
  	function idCheck3() {		// 아이디 하나 검색 후 자료를 왕창 가져오겠다.... 비동기식
		let mid = $("#mid").val();
		
		if(mid.trim() == "") {
			alert("아이디를 입력하세요");
			$("#mid").focus();
			return false;
		}
		
		$.ajax({
			type : "post",
			url  : "${ctp}/idSearchTest3",			// 전송받는 곳의 주소
			data : {mid: mid},		// 예: {mid: mid, idx: idx} or 변수 줘서 let query = { ...} query 넣어주던가..
							// {서버 : 자신}
			success : function(res) {			
				$("#demo").html(res);
				let str = res.split("/");
				$("#tMid").html(str[0]);
				$("#name").html(str[1]);
				$("#nickName").html(str[2]);
				$("#gender").html(str[3]);
				$("#point").html(str[4]);
			},
			error : function() {
				alert("전송실패");
			}
		});
	}
  
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2>AJax연습</h2>
	<hr/>
	<form name="myform">
		아이디 : <input type="text" name="mid" id="mid" /> &nbsp;
		<input type="button" value="아이디일반검색1(동기식)" onclick="idCheck()" class="btn btn-info"/>&nbsp;
		<input type="button" value="아이디검색2(비동기식)" onclick="idCheck2()" class="btn btn-success"/>&nbsp;
		<input type="button" value="아이디검색3(비동기식)" onclick="idCheck3()" class="btn btn-primary"/>&nbsp;
		<br/>
		<div>출력결과 : <span id="demo">${name}</span></div>
		<hr/>
		<div>
			<div>아이디 : <span id="tMid"></span></div>
			<div>이름 : <span id="name"></span></div>
			<div>닉네임 : <span id="nickName"></span></div>
			<div>성별 : <span id="gender"></span></div>
			<div>포인트 : <span id="point"></span></div>
		</div>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>