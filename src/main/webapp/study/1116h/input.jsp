<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container text-center">
	<form name="myform" method="post" action="<%=request.getContextPath()%>/j1116h/Home">
  	<div class="border m-4 p-4">
	    <div><h2 class="text-center">input상품등록</h2></div>
	    <hr/>
	    <p>
	      품명 : <input type="text" name="product" id="product" placeholder="품명을 입력하세요" autofocus required class="form-control" />
	    </p>
	    <p>
	      단가 : <input type="number" name="price" id="price" placeholder="가격을 입력하세요" class="form-control" />
	    </p>
	    <p>
	      수량 : <input type="number" name="pcs" id="pcs" placeholder="수량을 입력하세요" required class="form-control" />
	    </p>
	  	<div class="row text-center">
	  	  <div class="col"><input type="submit" value="전송" class="btn btn-success form-control"/></div>
	  	  <div class="col"><input type="reset" value="다시입력" class="btn btn-warning form-control"/></div>
	  	</div>
  	</div>
  </form>
</div>