<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>title</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	function userSearch(mid){
  		$.ajax({
  			type : "post",
  			url  : "${ctp}/userSearch.st",			//꼭 디렉토리파일로 보내지 않아도 되는걸 보여주는 어쩌구..
				data : {mid: mid},
				success:function(res) {			// 값을 넘기고 돌아오는 부분
					let str = res.split("/");
					$("#mid").val(str[1]);
					$("#name").val(str[2]);
					$("#age").val(str[3]);
					$("#address").val(str[4]);		
				},
				error : function() {
					alert("전송 실패")
				}
  		});
  	}
  
	  function userDel(mid){
			$.ajax({
				type : "post",
				url  : "${ctp}/userDel.st",			//꼭 디렉토리파일로 보내지 않아도 되는걸 보여주는 어쩌구..
					data : {mid: mid},
					success:function(res) {			// 값을 넘기고 돌아오는 부분
						if(res == "1") {
							alert("삭제완료!!");
							location.reload();		
						}
					},
					error : function() {
						alert("전송 실패")
					}
			});
		}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<h2>AJax연습</h2>
	<hr/>
	<form>
		<table class="table table-bordered">
			<tr>
				<td colspan="2" class="text-center"><h3>User '가입/수정' 하기 폼</h3></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid" id="mid" class="form-control"/></td>
			</tr>
			<tr>
				<td>성명</td>
				<td><input type="text" name="name" id="name" class="form-control"/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" id="age" class="form-control"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" id="address" class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="유저등록" onclick="userInput()" class="btn btn-info"/>
					<input type="reset" value="다시입력" class="btn btn-info"/>
					<input type="button" value="User수정" onclick="userUpdate()" class="btn btn-info"/>
					<input type="button" value="전체보기" onclick="location.href='${ctp}/userList.st';" class="btn btn-info"/>
				</td>
			</tr>
		</table>
	</form>
	<hr/>
	<h3>전체 리스트</h3>
	<br/>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th><th>아이디</th><th>성명</th><th>나이</th><th>주소</th><th>비고</th>
		</tr>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.mid}</td>
				<td>${vo.name}</td>
				<td>${vo.age}</td>
				<td>${vo.address}</td>
				<td>
					<a href="javascript:userSearch('${vo.mid}')" class="btn btn-success">개별조회</a>
					<a href="javascript:userDel('${vo.mid}')" class="btn btn-danger">삭제</a>
				</td>
			</tr>
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>  
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>