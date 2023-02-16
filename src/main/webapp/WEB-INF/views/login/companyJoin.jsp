<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">
.conClass{
	width: 500px;
}
.idCheck{
	font-size: 1px;
	color: black;
	border: 1px solid black;
	width: 80px;
	height: 30px;           
}
.idErrorValue, .pwErrorValue,
.pwChkErrorValue,,.numberErrorValue
{
	color: red;
	font-size: 15px;
	margin-top: 5px;
}
</style>
</head>
<body>
	<div class="container mt-5 conClass">
		<div class="text-center">
			<a href="#"><img src="${cPath}/resources/images/MainImage01.png" alt=""
				width="100" height="100"></a>
		</div>
		<h2 class="text-center">사원 등록</h2>
		<form action="${cPath}/loginctr/joinSuccess.do" method="post" class="row g-3 validation-form">
			<div class="col-12">
				<div class="d-flex justify-content-between ">
					<label for="id" class="mt-2 ">아이디</label>
					<input 	type="button"
					 		class="btn btn-outline-primary idCheck mb-1"
					 		value="중복체크">
					<input type="hidden" class="idHidden" value="N">
				</div>
				<input type="text" class="form-control jsId" id="emp_id" name="emp_id"
					placeholder="알파벳 숫자 조합, 8~10자 생성가능">
				<div class="idErrorValue"></div>
			</div>
			<div class="col-12">
				<label for="pwd" class="form-label">비밀번호</label> <input
					type="password" class="form-control jsPw" id="emp_pwd" name="emp_pwd"
					placeholder="알파벳 숫자 조합, 8~10자 생성가능">
				<div class="pwErrorValue"></div>
			</div>
			<div class="col-12">
				<label for="pwdChk" class="form-label">비밀번호 확인</label> <input
					type="password" class="form-control jsPwChk" id=""
					disabled>
				<div class="pwChkErrorValue"></div>
			</div>
			<div class="col-12">
				<label for="name" class="form-label">이름</label> <input type="text"
					class="form-control jsName" id="emp_name" name="emp_name">
			</div>
			<div class="col-12 d-flex justify-content-between">
				<label for="birth" class="form-label">생년월일</label> <input
					type="date" class="birth" name="emp_birth" id="emp_birth">
			</div>
			<div class="col-12">
				<label for="gender" class="form-label">성별</label> <select
					name="emp_gender" class="form-select">
					<option disabled>성별 선택</option>
					<option value="men">남자</option>
					<option value="women">여자</option>
				</select>
			</div>
			<div class="col-12">
				<label for="gender" class="form-label">팀</label> <select
					name="emp_department" class="form-select">
					<option disabled>팀 선택</option>
					<option value="인사">인사팀</option>
					<option value="개발">개발팀</option>
					<option value="테스터">테스터팀</option>
					<option value="디자인">디자인팀</option>
				</select>
			</div>
			<div class="col-12">
				<label for="rank" class="form-label">팀</label> <select
					name="emp_rank" class="form-select">
					<option disabled>직급 선택</option>
					<option value="부장">부장</option>
					<option value="차장">차장</option>
					<option value="과장">과장</option>
					<option value="대리">대리</option>
					<option value="주임">주임</option>
					<option value="사원">사원</option>
				</select>
			</div>
            <div class="col-12 p-0 d-flex justify-content-center">
                <input class="btn btn-primary  m-0 ms-2 addEmp" type="submit" value="가입완료">
            	<input 	type="submit"
							class="btn btn-primary m-0 ms-2"
							value="로그인화면 이동"
							onclick="loginPage(this.form)"
							>
            </div>
		</form>
	</div>
<script src="https://code.jquery.com/jquery-3.6.3.js" 
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
	crossorigin="anonymous"></script>
<script type="text/javascript">


</script>
<script type="text/javascript" defer="defer">

const id = document.querySelector('.jsId')
const pw = document.querySelector('.jsPw')
const pwChk = document.querySelector('.jsPwChk')
const nameChk = document.querySelector('.jsName')
const email = document.querySelector('.jsEmail')
const birth = document.querySelector('.birth')

const idCheck = document.querySelector('.idCheck')
const idHidden = document.querySelector('.idHidden')

const idError = document.querySelector('.idErrorValue')
const pwError = document.querySelector('.pwErrorValue')
const pwChkError = document.querySelector('.pwChkErrorValue')
const emailError = document.querySelector('.emailErrorValue')
const addEmp = document.querySelector('.addEmp')


const id_Chk = /^[0-9a-zA-Z]{8,10}$/
const pw_Chk = /^[0-9a-zA-Z]{8,10}$/

const birthVal = birth.value;

$(function() {

	$('.idCheck').click(function() {
		
		if($('.jsId').val() != ''){
			
			let emp_idVal = $('#emp_id').val();
			let idHiddenVal = $('.idHidden').attr("value", "N");
			
			const id_Chk = /^[0-9a-zA-Z]{8,10}$/
			if(id_Chk.test(emp_idVal)){

				var id = {emp_id : emp_idVal}
			
				$.ajax({
					type : 'post',
			    	url : '${cPath}/loginctr/idCheck.do',
			    	contentType : "application/json",
			    	data :  JSON.stringify(id),
					success : function(result) {
						
						if(result == 0){
							alert('사용가능한 아이디입니다.')
							$('.idHidden').attr("value", "Y");
						}else
							alert('이미 사용중인 아이디입니다.')
		                
					},//success
		           	error: function(a,b,c) {
		           			console.log(a,b,c);
		            		alert('서버요청실패');
		           	}//error
					
				})//ajax
			
			}else{
				 alert('양식에 맞춰 작성하세요.');
			}
		}else {
	        alert('아이디를 입력하세요.');
	        $('.jsId').focus();
	    }
	})
})

id.addEventListener('keyup',()=>{
    if(!id_Chk.test(id.value)){
        idError.innerHTML= '양식에 맞춰 작성하세요.'
    }else{
        idError.innerHTML = ''
    }
})

pw.addEventListener('keyup',()=>{
    if(!pw_Chk.test(pw.value)){
        pwError.innerHTML = '양식에 맞춰 작성하세요.'
    }else{
        pwError.innerHTML= ''
        pwChk.disabled = false
    }   
})

if(pwChk.value==''){
   pwChkError.innerHTML = '비밀번호를 입력하세요'
}

pwChk.addEventListener('keyup',()=>{
    if(!(pw.value==pwChk.value)){
        pwChkError.innerHTML = '비밀번호가 틀립니다.'
    }else{
        pwChkError.innerHTML = ''
    }
})



addEmp.addEventListener('click',(e)=>{
	
	var count = 0
	
    if(id_Chk.test(id.value)){
        count++
		if(idHidden.value == "Y"){
			count++
	        if(pw_Chk.test(pw.value)){
	        	count++
		       	if(birthVal == null && birthVal == ""){
					alert('생년월일을 확인하세요.')
					e.preventDefault()
				}else{
					if(count==3){
				        alert('사원등록이 완료되었습니다.')
				        document.getElementById('rank').disabled = false;
				        }
				}
		    }else{
		        alert('비밀번호를 확인하세요.')
		        e.preventDefault()
		    }
		}else{
		   alert('아이디 중복체크를 해주세요.')
			e.preventDefault()
		} 
    }else{
        alert('아이디를 확인하세요.')
        e.preventDefault()
    }
})

function loginPage(obj) {
	obj.action = "${cPath}/loginctr/login.do";
	obj.method = "get";
	obj.submit();
}
</script>
</body>
</html>