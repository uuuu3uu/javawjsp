<%@page import="study.database.JusorokVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="study.database.JusorokDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
  <title>jstl4h.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
    <h2>Welcome to My Homepage!</h2>
    <hr/>
<%             
               //0         1         2
                             //01234567890123456789012345678
    String atom = "Welcome to My Homepage!";
    pageContext.setAttribute("atom", atom);
    pageContext.setAttribute("atom2", atom);
%>
 
  5-3. atom변수에 기억되어 있는 문자를 입력받아 그 문자가 두번째로 기억되어 있는 위치 값을 출력하시오.
        단, 두번째 기억 값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.(substring 사용)<br/>
  <br/>
  
  <form name="myform">
  	<div><input type="text" name="input" class="form-control mb-2"/></div>
  	<div><input type="submit" value="출력하기" class="btn btn-primary form-control"/></div>
    <c:set var="input" value="${param.input}"/> <!-- 변수명 input 값 : 입력 -->
    <c:set var="cnt" value="0"/>
    	<c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
    		<c:if test="${fn:substring(atom,i,i+1) == input}"> <!-- <var 값이 input으로 들어왔기 때문에 input을 넣어준다  // atom 값을 하나로 자르는 과정 -->
      		<c:set var="cnt" value="${cnt + 1}"/> <!--  누적  -->
          	<c:if test="${cnt == 1}">
            	<c:set var="input1" value="${i}"/>
           	</c:if>
            <c:if test="${cnt == 2}">
              <c:set var="input2" value="${i}"/>
            </c:if>
         </c:if>
    	 </c:forEach>
      <c:choose>
      	<c:when test="${input2 != null}">입력한 값의 두번째 문자위치 :<font color="red"><b> å${input2}</b></font></c:when>
      	<c:when test="${input1 != null}">입력한 값의 첫번째 문자위치 :<font color="red"><b> ${input1} / 두번째 값 없음</b></font></c:when>
      	<c:otherwise>입력한 값은 atom변수에서 찾을 수 없습니다</c:otherwise>
      </c:choose>
  </form>
  <p>
  6-2. atom변수에 기억되어 있는 문자를 입력받아 그 문자가 두번째로 기억되어 있는 위치 값을 출력하시오.
        단, 두번째 기억 값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.(substring before after사용해서)
  </p>
  
  <form name="myform2">
  	<div><input type="text" name="input2" class="form-control mb-2"/></div>
   	<div><input type="submit" value="출력하기" class="btn btn-primary form-control"/></div>
  		<c:set var="input2" value="${fn:split(atom, '${param.input2'})"/>
  		<c:set var="cnt2" value="0"/>
  		<c:forEach var="atom" items="${input2}" varStatus="st" >
  		
  		</c:forEach>
  </form>
  <br/>  
</div>
</body>
</html>
