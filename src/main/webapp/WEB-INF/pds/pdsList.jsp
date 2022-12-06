<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
				<td>${vo.title}</td>
				<td>${vo.nickName}</td>
				<td>${vo.fDate}</td>
				<td>${vo.part}</td>
				<td>
					<c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
					<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
					<c:forEach var="fName" items="${fNames}" varStatus="st">
						<a href="${ctp}/data/pds/${fSNames[st.index]}">${fName}</a><br/>
					</c:forEach>
				</td>
				<td>${vo.downNum}</td>
				<td>
          <a href="#" onclick="modalView('${vo.title}','${vo.nickName}','${vo.mid}','${vo.part}','${vo.fName}','${vo.fSName}','${vo.fSize}','${vo.downNum}')" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">모달창</a>
          /전체다운<br/>						<!-- '${vo.idx}' 얘도 작은 따옴표로 해줘야한다. 일단은 타입을 맞춰줘야 하기 때문에  -->
          <a href="javascript:pdsDelCheck('${vo.idx}','${vo.fSName}')" class="btn bnt-danger btn-sm">삭제1</a>
				</td>
			</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
		</c:forEach>
		<tr>
			<td colspan="8" class="m-0 p-0"></td>
		</tr>
	</table>
</div>

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
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>