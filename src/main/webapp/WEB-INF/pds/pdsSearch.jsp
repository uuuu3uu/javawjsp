<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>pdsSearch.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
	  function pageCheck() {
			let pageSize = document.getElementById("pageSize").value;
			location.href = "${ctp}/pdsList.pds?pageSize="+pageSize+"&pag=${pag}";
		}
	
		function searchCheck() {
				let searchString = $("#searchString").val();
				
				if(searchString.trim() == "") {
					alert("찾고자 하는 검색어를 입력하세요! search");
					searchForm.searchString.focus();
				}
				else {
					searchForm.submit();
				}
		}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">자 료 실 검 색 리 스 트</h2>
	 <div class="text-center">
    (<font color="blue">${searchTitle}</font>(으)로 <font color="red">${searchString}</font>(을)를 검색한 결과 <font color="blue"><b>${searchCount}</b></font>건이 검색되었습니다.)
  </div>
	<hr/>
	<table class="table table-borderless">
		<tr>
			<td class="text-left p-0">
				<c:if test="${sLevel != 1}"><a href="${ctp}/pdsInput.pds" class="btn btn-success btn-sm">자료올리기</a></c:if>
			</td>
			<td class="text-right p-0">
				<select name="pageSize" id="pageSize" onchange="pageCheck()">
					<option value="5"  ${pageSize==5  ? 'selected' : ''}>5건</option>
					<option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
					<option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
					<option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
				</select>
			</td>
		</tr>
	</table>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>자료제목</th>
			<th>올린이</th>
			<th>올린날짜</th>
			<th>분류</th>
			<th>파일명(크기)</th>
			<th>다운수</th>
			<th>비고</th>
		</tr>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td>${curScrStartNo}</td>
				<td>
          <a href="${ctp}/pdsContent.pds?idx=${vo.idx}&pag=${pag}&part=${part}">${vo.title}</a>
    	    <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
        </td>
				<td>${vo.nickName}</td>
				<td>
					<c:if test="${vo.hour_diff > 24}">${fn:substring(vo.fDate,0,10)}</c:if>
          <c:if test="${vo.hour_diff < 24}">		<!-- 24시간이 지나지 않았지만 현재시간~자정까찌는 '날짜:시간', 나머지는 '시간'만 출력 -->
    	      ${vo.day_diff > 0 ? fn:substring(vo.fDate,0,16) : fn:substring(vo.fDate,11,19)}
    	    </c:if>
				</td>
				<td>${vo.part}</td>
				<td>
					<c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
					<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
					<c:forEach var="fName" items="${fNames}" varStatus="st">
						<a href="${ctp}/data/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}</a><br/>
					</c:forEach>
					(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,###" />KByte)
				</td>
				<td>${vo.downNum}</td>
				<td>
          <a href="#" onclick="modalView('${vo.title}','${vo.nickName}','${vo.mid}','${vo.part}','${vo.fName}','${vo.fSName}','${vo.fSize}','${vo.downNum}')" class="badge badge-primary" data-toggle="modal" data-target="#myModal">모달창</a><br/>
          <a href="${ctp}/pdsTotalDown.pds?idx=${vo.idx}" class="badge badge-info">전체다운</a><br/>					<!-- '${vo.idx}' 얘도 작은 따옴표로 해줘야한다. 일단은 타입을 맞춰줘야 하기 때문에  -->
          <a href="javascript:pdsDelCheck('${vo.idx}','${vo.fSName}')" class="badge badge-danger">삭제1</a>
          <a href="#" onclick="pdsDelCheckModal('${vo.idx}','${vo.fSName}')" data-toggle="modal" data-target="#myPwdModal" class="badge badge-danger">삭제2</a>
				</td>
			</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
		</c:forEach>
		<tr>
			<td colspan="8" class="m-0 p-0"></td>
		</tr>
	</table>
</div>
<div class="text-center"><a href="${ctp}/pdsList.pds?pag=${pag}&pageSize=${pageSize}" class="btn btn-secondary">돌아가기</a></div>

<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>