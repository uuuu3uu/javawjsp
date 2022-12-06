<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>upLoad3.jps</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
   <script>
    'use strict';
    let cnt = 1;
    
    function fileBoxAppend() {
			cnt++;
			let fileBox = "";
			fileBox += '<div id="fBox'+cnt+'">';
			fileBox += '<input type="file" name="fName'+cnt+'" id="file'+cnt+'" class="form-control-file border mb-2" style="float:left;width:85%"/>';
	    fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control ml-2 mb-2" style="width:10%"/>';
			fileBox += '</div>';
			$("#fileBoxAppend").append(fileBox);	
		}
    
    function deleteBox(cnt) {
    	$("#fBox"+cnt).remove();
    }
    
    function fCheck() {
    	let fName1 = $("#file1").val();
    
    	let ext = fName1.substring(fName1.lastIndexOf(".")+1); // 확장자 발췌
    	let uExt1 = ext.toUpperCase();
    	let maxSize = 1024 * 1024 * 10; // 업로드 가능한 최대파일의 용량은 10MByte로 한다
    	
    	if(fName1.trim() == "") {
    		alert("업로드할 파일을 선택하세요.");
    		return false;
    	}
    	
    	let fileSize1 = document.getElementById("file1").files[0].size;
    	if(uExt1 != "JPG" && uExt1 != "GIF" && uExt1 != "PNG" && uExt1 != "ZIP" && uExt1 != "HWP" && uExt1 != "PPT" && uExt1 != "PPTX") {
    		alert("업로드가 가능한 파일은 'JPG/GIF/PNG/ZIP/HWP/PPT/PPTX'입니다");
    		// return false;
    	}
    	else if(fileSize1 > maxSize) {
    		alert("업로드할 파일의 최대용량은 10MByte 입니다");
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
	<h2>파일 업로드 테스트3(멀티파일처리)</h2>
	<p>cos라이브러리를 이용한 파일 업로드</p>
	<hr/>
	<form name="myform" method="post" action="${ctp}/upLoad2Ok.st" enctype="multipart/form-data"> <!-- url방식이 아닌 멀티파드 방식...-->
		<div>
			<input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm mb-2"/> 
			<input type="file" name="fName1" id="file1" class="form-control-file border mb-2" style="width:85%"/>
		</div>
		<div id="fileBoxAppend"></div>
		<input type="button" value="전송" onclick="fCheck()" class="btn btn-primary form-control"/>
		<input type="hidden" name="upLoadFlag" value="3"/>
	</form>
	<hr/><br/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>