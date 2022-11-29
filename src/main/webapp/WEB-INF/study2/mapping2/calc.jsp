<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>calc.jsp 계산기 </title>
  <jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="${ctp}/mapping2/CalcOk.calc">
    <h2>자료 전송 연습</h2>
	  <div>
	    첫번째수 : <input type="text" name="su1" value="100" class="form-control m-3"/>
	  </div>
	  <div>
	    연산자 :
	    <select name="opt" class="form-control m-3">
	      <option value="+" selected>더하기</option>
	      <option value="-">빼기</option>
	      <option value="*">곱하기</option>
	      <option value="/">나누기</option>
	      <option value="%">나머지</option>
	    </select>
	  </div>
	  <div>
	    두번째수 : <input type="text" name="su2" value="200" class="form-control m-3"/>
	  </div>
	  <div>
	    <input type="submit" value="전송" class="btn btn-success form-control"/>
	  </div>
  </form>
  <hr/>
  <p>
  	<a href="${ctp}/mapping2/JuList.calc" class="btn btn-success">회원리스트</a>
  </p>
</div>
<p><br/></p>
</body>
</html>