<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>upLoad4.jps드래그로 왕창 넣기..</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
   <script>
    'use strict';
    function fCheck() {
    	let fName = $("#fName").val();
    	let maxSize = 1024 * 1024 * 20; // 업로드 가능한 최대파일의 용량은 10MByte로 한다
    	
    	if(fName.trim() == "") {
    		alert("업로드할 파일을 선택하세요.");
    		return false;
    	}
    	
    	let fileLength = document.getElementById("fName").files.length; // 선택한 파일의 갯수
    	let fileSize = 0; // 누적하셈
     	for(let i=0; i<fileLength; i++) {
     		fName = document.getElementById("fName").files[i].name; // 이름을 가져왔다
    		let ext = fName.substring(fName.lastIndexOf(".")+1); // 확장자 발췌
        let uExt = ext.toUpperCase();//대문자로 
        
        if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "ZIP" && uExt != "HWP" && uExt != "PPT" && uExt != "PPTX") {
	    		alert("업로드가 가능한 파일은 'JPG/GIF/PNG/ZIP/HWP/PPT/PPTX'입니다");
	    		return false;
        } 
				fileSize += document.getElementById("fName").files[i].size;   // 증가하면서 누적된다..
    	}
    	
    	if(fileSize > maxSize) {
    		alert("업로드할 파일의 최대용량은 10MByte입니다")
    	}
    	else {
    		myform.submit();
    	}
    	
        
    	
 
    	
    	/*
    	let fileSize1 = document.getElementById("file1").files[0].size; // 이거에 따라 달라진다고...
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
    	*/
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2>파일 업로드 테스트4(멀티파일처리3)</h2>
	<p>cos라이브러리를 이용한 파일 업로드</p>
	<p><font color="blue">여러개의 파일을 선택할 경우는 'Ctrl+클릭/Shift+클릭' 하세요</font></p>
	<hr/>
	<form name="myform" method="post" action="${ctp}/upLoad2Ok.st" enctype="multipart/form-data">
    <div>
	    <input type="file" name="fName" id="fName" class="form-control-file border mb-2" multiple />
    </div>
    <input type="button" value="전송" onclick="fCheck()" class="btn btn-primary form-control"/>
    <input type="hidden" name="upLoadFlag" value="4"/>
  </form>
	<hr/><br/>
	<input type="button" value="다움로드폼으로" onclick="location='${ctp}/downLoad.st';" class="btn btn-info form-control"/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>