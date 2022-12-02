<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>boContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	function goodCheck() {
			$.ajax({
				type : "post",
				url	 : "${ctp}/boGood.bo",
				data : {idx : ${vo.idx}},  //문자열일때는 data : {idx : '${vo.idx}'}
				success : function(res) {
					location.reload();
				},
				error : function() {
					alert("전송오류 안나겠지만!");
				}
			});	
		}
  	
  	function goodCheckPlus() {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/boGoodPlusMinus.bo",
    		data  : {
    			idx : ${vo.idx},
    			goodCnt : 1
    		},
    		success:function() {
    			location.reload();
    		}
    	});
    }
    
    function goodCheckMinus() {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/boGoodPlusMinus.bo",
    		data  : {
    			idx : ${vo.idx},
    			goodCnt : -1
    		},
    		success:function() {
    			location.reload();
    		}
    	});
    }
    
  	// 게시글 삭제처리
  	function boDelCheck() {
    	let ans = confirm("현 게시글을 삭제하시겠습니까?");
    	if(ans) location.href = "${ctp}/boDeleteOk.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&mid=${vo.mid}";
    }
  	
		// 댓글달기
		function replyCheck() {
    	let content = $("#content").val();
    	if(content.trim() == "") {
    		alert("댓글을 입력하세요");
    		$("#content").focus();
    		return false;
    	}
    	let query = {
    			boardIdx  : ${vo.idx},
    			mid				: '${sMid}',
    			nickName  : '${sNickName}',
    			content   : content,
    			hostIp    : '${pageContext.request.remoteAddr}'
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/boReplyInput.bo",
    		data : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("댓글이 입력되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("댓글 입력 실패~~~");
    			}
    		},
  			error  : function() {
  				alert("전송 오류!!");
  			}
    	});
    }
		
		// 댓글 삭제
		function replyDelCheck(idx) {
			let ans = confirm("현재 댓글을 삭제하시겠습니까?");
			if(!ans) return false;
		
			$.ajax({
				type  : "post",
				url		: "${ctp}/boReplyDeleteOk.bo",
				data  : {idx : idx},
				success : function(res) {
					if(res == "1") {
						alert("댓글이 삭제되었습니다");
						location.reload();
					}
					else {
						alert("댓글 삭제 실패");
					}
				},
				error : function() {
					alert("전송오류")
				}
			});
		}

  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class=text-center>글 내 용 보 기</h2>
	<br/>
	<table class="table table-borderless">
		<tr>
			<td class="text-right">hostIp : ${vo.hostIp}</td>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<th>글쓴이</th>
			<td>${vo.nickName}</td>
			<th>글쓴날짜</th>
			<%-- <td>${fn:substring(vo.wDate,0,19)}</td> --%>
			<td>${fn:substring(vo.wDate,0,fn:length(vo.wDate)-2)}</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">${vo.title}</td>
		</tr>
		<tr>
			<th>전자메일</th>
			<td>${vo.email}</td>
			<th>조회수</th>
			<td>${vo.readNum}</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td>${vo.homePage}</td>
			<th>좋아요</th>
			<td><a href="javascript:goodCheck()"> <!-- content에 들어와있기 때문에 idx값 안넘겨줘도 된다❤ -->
				<c:if test="${sSw == '1'}">🤍</c:if>
				<c:if test="${sSw != '1'}">❤️</c:if>
				</a>
				${vo.good} ,
				<a href="javascript:goodCheckPlus()">👍</a>
        <a href="javascript:goodCheckMinus()">👎</a>
			</td> 
			<!-- <td>👍 👎</td> -->
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3" style="height:220px">${fn:replace(vo.content, newLine, "<br/>")}</td>
		</tr>
		<tr>
			<td colspan="4" class="text-center">	<!-- 물음표 뒤에 변수를 보내준다. // ${pag}값을 pag라는 이름의 변수를 boList.bo로 보내주고 &  -->	
				<c:if test="${flag == 'search'}"><input type="button" value="돌아가기" onclick="location.href='${ctp}/boSearch.bo?search=${search}&searchString=${searchString}&pageSize=${pageSize}&pag=${pag}';" class="btn btn-secondary"/></c:if>
        <c:if test="${flag != 'search'}">
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/boList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary"/>
				<!-- 나와 관리자만.. -->
					<c:if test="${sMid == vo.mid || sLevel == 0}"> <!-- 올린 글이 나하고 같거나 관리자레벨 -->
						<input type="button" value="수정하기" onclick="location.href='${ctp}/boUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-info"/>
						<input type="button" value="삭제하기" onclick="boDelCheck()" class="btn btn-danger"/>
					</c:if>
				</c:if>
			</td>
		</tr>		
	</table>
	
	<c:if test="${flag != 'search'}">
		<!-- 이전글/다음글 처리 -->
		<table class="table table-borderless">
			<tr>
				<td>
					👈<a href="${ctp}/boContent.bo?idx=${preVo.preIdx}&pag=${pag}&pageSize=${pageSize}">이전글 : ${preVo.preTitle}</a><br/>
					👉<a href="${ctp}/boContent.bo?idx=${nextVo.nextIdx}&pag=${pag}&pageSize=${pageSize}">다음글 : ${nextVo.nextTitle}</a>
				</td>
			</tr>
		</table>
	</c:if>
</div>
<br/>
<!-- 댓글리스트 보여주기 -->
<div class="container">
	<table class="table table-hover text-center">
		<tr>
			<th>작성자</th>
			<th>댓글내용</th>
			<th>작성일자</th>
			<th>접속IP</th>
		</tr>
		<c:forEach var="replyVo" items="${replyVos}">
			<tr>
				<td>${replyVo.nickName}
					<c:if test="${sMid == replyVo.mid || sLevel == 0}">
						(<a href="javascript:replyDelCheck(${replyVo.idx})" title="삭제하기">x</a>)
					</c:if>
				</td>
				<td>${replyVo.content}</td>
				<td>${replyVo.wDate}</td>
				<td>${replyVo.hostIp}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 댓글 입력창 -->
	<form name="replyForm" method="post" action="${ctp}/boRlyInput.bo}">
		<table class="table text-center">
			<tr>
				<td style="width:85%" class="text-left">
					글내용 : 
					<textarea rows="4" name="content" id="content" class="form-control"></textarea>				
				</td>
				<td style="width:15%">
					<br/>
					<p>작성 : ${sNickName}</p>
	        <p>
	        	<input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info btn-sm"/>
	        </p>
				</td>
			</tr>
		</table>
		<%-- <input type="hidden" name="boardIdx" value="${vo.idx}"/>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
		<input type="hidden" name="mid" value="${sMid}"/>
		<input type="hidden" name="nickName" value="${sNickName}"/> --%>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>