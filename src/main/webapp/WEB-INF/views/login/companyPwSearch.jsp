<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>
<link 
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
	crossorigin="anonymous">
<style type="text/css">
.btnLogin{
	width: 180px;
	height: 50px;
} 
.btnIdSearch{
	width: 150px;
	height: 50px;
}

.content{
	margin: auto;
}
</style>
</head>
<body>
	<div class="container text-center m-auto mt-5 ">
		<div class="w-50 content">
				<h2>PW 찾기</h2>
				<form action="${cPath}/loginctr/pwResult.do" method="post">
					<div class="form-floating">
						<input type="text" class="form-control id01" name="emp_id" value="">
						<label for="floatingId">아이디</label>	
					</div>
					<div class="form-floating mt-3">
						<input type="text" class="form-control number" name="emp_number" value="">
						<label for="floatingId">사원번호</label>	
					</div>
					<div class="form-floating mt-3">
						<input type="text" class="form-control department" name="emp_department" value="">
						<label for="floatingPassword">팀</label>
					</div>
					<div class="form-floating mt-3">
						<input type="text" class="form-control rank" name="emp_rank" value="">
						<label for="floatingPassword">직급</label>
					</div>
					<div class="form-floating mt-3">
						<input type="text" class="form-control name" name="emp_name" value="">
						<label for="floatingPassword">이름</label>
					</div>
					<br>
					<div class="d-flex justify-content-center mt-3">
						<input 	type="button" 
								class="btn btn-lg btn-primary btnLogin" 
								value="로그인화면 이동"
								onclick="pwSearch(this.form)"
								>
						<input 	type="submit" 
								class="btn btn-lg btn-primary btnPwSh ms-3" 
								value="PW찾기"
								>
		        	</div>
		        </form>
		</div>        
	</div>
<script type="text/javascript">
	function pwSearch(obj) {
		
		obj.action = "${cPath}/loginctr/login.do";
		obj.method = "get";
		obj.submit();
	}

	const id = document.querySelector('.id01')
	const number = document.querySelector('.number')
	const department = document.querySelector('.department')
	const name = document.querySelector('.name')
	const rank = document.querySelector('.rank')
	const btnPwSh = document.querySelector('.btnPwSh')

	btnPwSh.addEventListener('click',(e)=>{

	    if(id.value != null && id.value != ""){
			if(number.value != null && number.value != ""){
		    	if(department.value != null && department.value != ""){
			       	if(rank.value != null && rank.value != ""){
			        	if(name.value != null && name.value != ""){
			        	
					    }else{
					        alert('이름을 확인하세요.')
					    	e.preventDefault()
					    }
				    }else{
					    alert('직급을 확인하세요.')
				        e.preventDefault()
				    }
			    }else{
				    alert('팀을 확인하세요.')
			        e.preventDefault()
			    }
		    }else{
			     alert('사원번호를 확인하세요.')
			     e.preventDefault()
			 }
		 }else{
		     alert('아이디를 확인하세요.')
		     e.preventDefault()
		 }
	})

</script>
</body>
</html>