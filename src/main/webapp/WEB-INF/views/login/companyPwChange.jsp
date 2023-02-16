<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
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
.pwErrorValue{
	color: red;
	font-size: 15px;
	margin-top: 5px;
}
.pwChkErrorValue{
	color: red;
	font-size: 15px;
	margin-top: 5px;
}
</style>
</head>
<body>
<div class="container text-center m-auto mt-5">
		<div class="w-50 content mt-3">
			<h2>PW변경</h2>
			<hr>
			<form action="${cPath}/loginctr/pwChangeResult.do" method="post">
				<div class="body1">
					<h5 class="mb-3">비밀번호를 변경해주세요.</h5>
				</div>
					<div class="form-floating">
						<input type="password" class="form-control pw" name="emp_pwd" value="">
						<label for="password">비밀번호</label>	
					</div>
		..			<div class="pwErrorValue"></div>
					<div class="form-floating mt-3">
						<input type="password" class="form-control pwChk" name="emp_pwd2" value="">
						<label for="password">비밀번호 확인</label>	
					</div>
					<div class="pwChkErrorValue"></div>
				<br>
				<span class="fs-6">
				알파벳 및 숫자를 조합하여, 8~10글자내로 변경이 가능합니다.
				</span>
				<div class="d-flex justify-content-center mt-3">
					<input 	type="button" 
							class="btn btn-lg btn-primary btnLogin" 
							value="로그인화면 이동"
							onclick="login(this.form)"
							>
					<input 	type="submit" 
							class="btn btn-lg btn-primary btnPwCh ms-3" 
							value="비밀번호변경"
							>
		       	</div>
		       	<input type="hidden" class="emp_id" name="emp_id" value="${emp_id}">
		       	<input type="hidden" class="emp_pwdBefore" name="emp_pwd" value="${emp_pwd}">
		    </form>
		</div>        
	</div>

<script type="text/javascript">
const pw = document.querySelector('.pw')
const pwChk = document.querySelector('.pwChk')

const emp_pwdBefore = document.querySelector('.emp_pwdBefore')

const pwError = document.querySelector('.pwErrorValue')
const pwChkError = document.querySelector('.pwChkErrorValue')

const btnPwCh = document.querySelector('.btnPwCh')

const pw_Chk = /^[0-9a-zA-Z]{8,10}$/

pw.addEventListener('keyup',()=>{
    if(!pw_Chk.test(pw.value)){
        pwError.innerHTML = '양식에 맞춰 작성하세요.'
    }else{
        pwError.innerHTML= ''
    }   
})

pwChk.addEventListener('keyup',()=>{
    if(!(pw.value==pwChk.value)){
        pwChkError.innerHTML = '비밀번호가 틀립니다.'
    }else{
        pwChkError.innerHTML = ''
    }
})

btnPwCh.addEventListener('click',(e)=>{
	
	if(pw.value != null && pw.value != ""){
		if(pw_Chk.test(pw.value)){
			if(pw.value == pwChk.value){
				if(emp_pwdBefore.value != pw.value){
					alert('비밀번호가 변경되었습니다.')
					
				}else{
					alert('비밀번호가 변경되지 않았습니다.')
					e.preventDefault()
				}
			}else{
				alert('비밀번호가 일치하지않습니다.')
				e.preventDefault()
			}
		}else{
			alert('양식에 맞춰 작성하세요.')
			e.preventDefault()
		}	
	}else{
		alert('비밀번호를 입력하세요.')
		e.preventDefault()
	}
})

	function login(obj) {
		obj.action = "${cPath}/loginctr/login.do";
		obj.method = "post";
		obj.submit();
	}
</script>
</body>
</html>