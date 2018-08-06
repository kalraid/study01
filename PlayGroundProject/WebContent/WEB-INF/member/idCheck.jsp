<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/datePicker.js"></script>


<title>중복 아이디 체크</title>
</head>
<body>
	<div id="idCheckForm">	
	    <c:if test="${check}">
	      <h3>사용할수 없는 아이디 입니다</h3>	
			<div class="memberInputText">
			입력하신 ${id }는 사용중 입니다 다른 아이디를 선택해 주세요</div>		
			<form action="idCheck.mvc" name="idCheckForm" 
				method="post" id="idCheckForm">
				<div class="memberInputText">
					<span class="checkFormSpan">아이디 : </span>
					<input type="text" name="id" id="checkId" size="15"/>
					<input type="submit" value="중복확인" />
				</div>
			</form>	
	 </c:if>
	 <c:if test="${not check}">		
		<div class="memberInputText">
		입력하신 ${id }는 사용 할 수 있습니다<br>
		<input type="button" value="${id } 사용하기" id="btnClose" data-id-value="${id }"/>
	</div>	
	</c:if>
	</div>
</body>
</html>