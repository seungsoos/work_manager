<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<%
	String str = (String)request.getAttribute("emp_pwd");
	String str1 = str.substring(3, str.length());

	String security = "";
	
	for(int i=0; i<str1.length(); i++){
		security += "*";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">
.btnLogin, .btnIdSearch{
	width: 150px;
	height: 50px;
}

.content{
	margin: auto;
}

.body1{
	border: 1px solid black;
	padding: 10px;
	tex
}
</style>
</head>
<body>
	<div class="container text-center m-auto mt-5">
		<div class="w-50 content mt-3">
			<h2>PW찾기</h2>
			<hr>
			<form action="${cPath}/loginctr/login.do" method="get">
				<c:if test="${emp_pwd != null}">
					<div class="body1">
						<h5 class="mb-3">사원정보가 일치하는 패스워드입니다.</h5>
						<input type="hidden" id="emp_id" name="emp_id" value="${emp_id}">
						<label for="floatingId">패스워드 : ${emp_pwd.substring(0,3)}<%= security %></label>	
					</div>
				</c:if>
				<c:if test="${emp_pwd == null}">
					<div class="body1">
						<h5 class="mb-3">사원정보가 일치하지 않습니다.</h5>
					</div>
				</c:if>	
				<br>
				<div class="d-flex justify-content-center mt-3">
					<input 	type="submit" 
							class="btn btn-lg btn-primary btnLogin" 
							value="로그인하기"
							>
				<c:if test="${emp_pwd != null}">
					<input 	type="button" 
							class="btn btn-lg btn-primary btnLogin ms-3" 
							value="패스워드 변경"
							onclick="pwChange(this.form)"
							>
				</c:if>	
				<c:if test="${emp_pwd == null}">
					<input 	type="button" 
							class="btn btn-lg btn-primary btnLogin ms-3" 
							value="이전화면"
							onclick="pwSearch(this.form)"
							>
				</c:if>	
		       	</div>
		       	<input type="hidden" name="emp_id" value="${emp_id }">
		       	<input type="hidden" name="emp_pwd" value="${emp_pwd }">
		    </form>
		</div>        
	</div>
<script type="text/javascript">
	function pwChange(obj) {
		obj.action = "${cPath}/loginctr/pwChange.do";
		obj.method = "post";
		obj.submit();
	}
	function pwSearch(obj) {
		obj.action = "${cPath}/loginctr/pwSearch.do";
		obj.method = "get";
		obj.submit();
	}
</script>
</body>
</html>