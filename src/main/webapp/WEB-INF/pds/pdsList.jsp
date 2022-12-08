<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>pdsList.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	
  	function partCheck() {
		let part = partForm.part.value;
		location.href = "${ctp}/pdsList.pds?part="+part;
		}
  	
  	function modalView(title,nickName,mid,part,fName,fSName,fSize,downNum) {
			let imgs = fSName.split("/");
			
			$("#myModal").on("show.bs.modal", function(e){
				$(".modal-header #title").html(title);
				$(".modal-header #part").html(part);
				$(".modal-body #nickName").html(nickName);
				$(".modal-body #mid").html(mid);
				$(".modal-body #fName").html(fName);
				$(".modal-body #fSize").html(fSize);
				$(".modal-body #downNum").html(downNum);
				$(".modal-body #fSName").html(fSName);
				$(".modal-body #imgSrc").attr("src",'${ctp}/data/pds/'+imgs[0]); 	//.attr : 속성바꾸기..
			});
		}
  	
  	// 선택한 항목의 자료 삭제하기(prompt창을 통하여 비밀번호를 입력받아서 처리)
  	function pdsDelCheck(idx, fSName) {
			let ans = confirm("선택된 자료파일을 삭제하시겠습니까?");
			if(!ans) return false;
			
			let pwd = prompt("비밀번호를 입력하세요?");
			let query = {
					idx : idx,
					fSName : fSName,
					pwd : pwd
			}
			
			$.ajax({
				type	: "post",
				url		: "${ctp}/pdsDelete.pds",
				data 	: query,
				success : function(res) {
					if(res =="1") {
						alert("삭제되었습니다");
						location.reload();
					}
					else {
						alert("삭제 실패");
					}
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
  	
  	// modal창을 통하여 비밀번호를 확인 후 파일 삭제처리(Ajax)
  	function pdsDelCheckModalOk() {
			let idx = pwdModalForm.idx.value;
			let fSName = pwdModalForm.fSName.value;
			let pwd = pwdModalForm.pwd.value;
  		
			let query = {
					idx : idx,
					fSName : fSName,
					pwd : pwd
			}
			
			$.ajax({
				type	: "post",
				url		: "${ctp}/pdsDelete.pds",
				data 	: query,
				success : function(res) {
					if(res =="1") {
						alert("삭제되었습니다");
						location.reload();
					}
					else {
						alert("삭제 실패");
					}
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
  	
  	// modal창을 통해서 비밀번호 확인 후 삭제처리
  	function pdsDelCheckModal(idx,fSName,part,pag) {
    	$("#myPwdModal").on("show.bs.modal", function(e){
    		$(".modal-body #idx").val(idx);
    		$(".modal-body #fSName").val(fSName);
    	});
    }
  	
  	// 다운로드 횟수 증가
  	function downNumCheck(idx) {
			$.ajax({
				type : "post",
				url	 : "${ctp}/pdsDownNum.pds",
				data : {idx : idx},
				success : function() {
					location.reload();
				},
				error : function() {
					alert("전송오류!");
				}
			});
		}
  	
  	function searchCheck() {
			let searchString = $("#searchString").val();
			
			if(searchString.trim() == "") {
				alert("찾고자 하는 검색어를 입력하세요 list");
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
	<h2 class=text-center>자 료 실 리 스 트(${part})</h2>
	<br/>
	<table class="table table-borderless">
		<tr>
			<td style="width:20%">
				<form name="partForm">
					<select name="part" onchange="partCheck()" class="form-control">
						<option value="전체" ${part == '전체' ? 'selected' : ''}>전체</option>
						<option value="학습" ${part == '학습' ? 'selected' : ''}>학습</option>
						<option value="여행" ${part == '여행' ? 'selected' : ''}>여행</option>
						<option value="음식" ${part == '음식' ? 'selected' : ''}>음식</option>
						<option value="기타" ${part == '기타' ? 'selected' : ''}>기타</option>
					</select>
				</form>
			</td>
			<td class="text-right">
				<a href="${ctp}/pdsInput.pds" class="btn btn-success">자료올리기</a>
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
				<td><%-- ${vo.fDate} --%>
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
					<c:if test="${vo.fSize/1024/1024 < 1}">
          	(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,###" />KByte)
         	</c:if>
          <c:if test="${vo.fSize/1024/1024 >= 1}">
          	(<fmt:formatNumber value="${vo.fSize/1024/1000}" pattern=".00" />MByte)
          </c:if>
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

<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?part=${part}&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?part=${part}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/pdsList.pds?part=${part}&pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= totPage && i != pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?part=${part}&pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?part=${part}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pag < totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?part=${part}&pag=${totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 -->

<!-- The Modal(모달창 클릭 시 자료실의 내용을 모달창에 출력한다) -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><span id="title"></span>(분류:<span id="part"></span>)</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
       	- 올린이 : <span id="nickName"></span>
       	<hr/>
       	- 아이디 : <span id="mid"></span><br/>
       	- 파일명 : <span id="fName"></span><br/>
       	- 파일크기 : <span id="fSize"></span><br/>
       	- 파일다운횟수 : <span id="downnum"></span><br/>
       	<hr/>
       	- 저장파일명 : <span id="nickName"></span><br/>
       	<img id="imgSrc" width="350px"/><br/>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>      
    </div>
  </div>
</div>

<!-- The Modal(폼태그로 비밀번호 처리하기 위한 모달창) (모달창 클릭 시 자료실의 내용을 모달창에 출력한다) -->
<div class="modal fade" id="myPwdModal">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">비밀번호 조회</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
       	<form name="pwdModalForm" class="was-validated">
       		<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" class="form-control mb-2" required/>
       		<input type="button" value="비밀번호 확인 후 전송" onclick="pdsDelCheckModalOk()" class="btn btn-success form-control"/>
       		<input type="hidden" name="idx" id="idx"/>
       		<input type="hidden" name="fSName" id="fSName"/>
       	</form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 검색기 -->
<div class="container text-center">
	<form name="searchForm" method="post" action="${ctp}/pdsSearch.pds">
		<b>검색 : </b>
		<select name="search">
			<option value="title">글제목</option>
			<option value="nickName">글쓴이</option>
			<option value="content">글내용</option>
		</select>
		<input type="text" name="searchString" id="searchString"/>
		<input type="button" value="검색" onclick="searchCheck()" name="seachString" id="searchString" class="btn btn-secondary"/>
		<input type="hidden" name="pag" value="${pag}"/>
    <input type="hidden" name="pageSize" value="${pageSize}"/>
	</form>
</div>
<!-- 검색기 끝 -->

<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>