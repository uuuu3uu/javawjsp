<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>calendar1.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <style>
  	#td1,#td8,#td15,#td22,#td29,#td36 {color:red}
  	#td7,#td14,#td21,#td28,#td35 {color:blue}
  	
  	.today {
  		background-color: pink;
  		color: #fff;
  		font-weight: bolder;
  	}
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<div class="text-center">
		<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy-1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="이전년도">◁</button> 
		<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy}&mm=${mm-1}';" class="btn btn-secondary btn-sm" title="이전월">◀</button> 
		<font size="5">${yy}년 ${mm+1}월</font>
		<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy}&mm=${mm+1}';" class="btn btn-secondary btn-sm" title="다음월">▶</button> 
		<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy+1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="다음년도">▷</button> 
		&nbsp;&nbsp;
		<button type="button" onclick="location.href='${ctp}/calendar1.st';" class="btn btn-secondary btn-sm" title="오늘날짜"><i class="fa fa-home"></i></button> 
	</div>
	<br/>
	<div class="text-center">
		<table class="table table-bordered" style="height:450px">
			<tr class="text-center" style="background-color:#eee">
				<th style="width:13%; color:red; vartical-align:middle">일</th>
				<th style="width:13%; vartical-align:middle">월</th>
				<th style="width:13%; vartical-align:middle">화</th>
				<th style="width:13%; vartical-align:middle">수</th>
				<th style="width:13%; vartical-align:middle">목</th>
				<th style="width:13%; vartical-align:middle">금</th>
				<th style="width:13%; color:blue; vartical-align:middle">토</th>
			</tr>
			<tr>
				<!-- 시작일 이전을 공백처리한다(오늘이 목요일 이전에면 startWeek가 5이기에, 1~4칸을 공백처리 -->
				<c:set var="gap" value="1"/>
				<c:forEach begin="1" end="${startWeek -1}">
					<td>&nbsp;</td>
					<c:set var="gap" value="${gap+1}"/>
				</c:forEach>
				
				<!-- 해당월에 대한 날짜를 마지막일자까지 반복 출력한다(단, gap이 7이되면 줄바꿈한다)  -->
				<%-- <c:set var="cnt" value="${gap}"/> --%>
				<c:forEach begin="1" end="${lastDay}" varStatus="st">
					<c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}"/>
					<td id="td${gap}" ${todaySw==1 ? 'class=today' : ''}>
						${st.count}
					</td>
					<c:if test="${gap % 7 == 0}"></tr><tr></c:if> <!-- 한주가 꽉 차면 줄바꾸기 한다 -->
					<c:set var="gap" value="${gap + 1}"/>
					<c:set var="cnt" value="${cnt + 1}"/>
				</c:forEach>
			</tr>
		</table>
	
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>