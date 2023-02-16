<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script 
	src="https://code.jquery.com/jquery-3.6.3.js" 
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<style type="text/css">
 	.form{
        width: 500px;
        height: 500px;
      }
      ul, li{
        margin: 0;
        padding: 0;
        list-style: none;
      }
      li{
        display: inline-block;
      }
      .div-class{
        width: 500px;
        height: 300px;
      }
      .ul-class{
        width: 500px;
        height: 200px;
      }
      .li-a{
        font-size: 15px;
        text-decoration: none;
        color: rgb(129, 121, 121);
      }
      .chk{
        width: 20px;
        margin: 0;
        padding: 0;
        height: 20px ;
      }
      .btn-a{
        text-decoration: none;
        color: white;
      }
      .icon-size{
      	width : 50px;
      	height : 50px;
      }
</style>	
	
</head>
<body>
	<div class="div-class text-center m-auto mt-5">
		<img class="mb-4" src="${cPath}/resources/images/MainImage01.png" alt="" width="100" height="100">
		<h2>근태관리 프로그램</h2>
		<form action="#" method="get">
			<div class="form-floating">
				<input type="text" class="form-control" name="emp_id" id="emp_id" >
				<label for="floatingId">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" name="emp_pwd" id="emp_pwd">
				<label for="floatingPassword">비밀번호</label>
			</div>
			<div class="d-flex justify-content-between">
				<div class="mt-2 p-0 m-0">
					<input type="checkbox" class="form-check-input" id="saveId" name="save_check" value="Y">
					<label class="form-check-label fs-6"
							for="save_check">아이디 저장하기</label>
				</div>
				<ul class="mt-2">
					<li><a href="${cPath }/loginctr/idSearch.do" class="color-black li-a idSearch">아이디 찾기</a></li>
					<li><a href="${cPath }/loginctr/pwSearch.do" class="color-black li-a pwSearch">비밀번호 찾기</a></li>
					<li><a href="${cPath }/loginctr/agree.do" class="color-black li-a">회원가입</a></li>
				</ul>
			</div>
				<br>
				<input type="button" class="w-100 btn btn-lg btn-primary mt-2 loginBtn" value="로그인">
			<div class="py-3 icon-line divclass d-inline-block div-class">
	              <ul class="ul-class d-flex justify-content-center">
	                <li><a id="naverIdLogin_loginButton" href="javascript:void(0)"><img src="${cPath}/resources/images/naver.png" class="icon-size" alt=""></a></li>
	                <li><a href="javascript:kakaoLogin()"><img src="${cPath}/resources/images/kakao.png" class="icon-size" alt=""></a></li>
	                <li><a class="btn btn-outline-light"><img src="${cPath}/resources/images/google.png" class="icon-size" alt=""></a></li>
	              </ul>
	        </div>
        </form>
	</div>
	<!-- 카카오톡 로그인 API -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.js"></script>
	<!-- 네이버 로그인 API -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>
	<!-- 카카오톡 로그인 API -->
    window.Kakao.init("cd53f7d56d621047da8d273a3011f4b1");
    
     function kakaoLogin(){
        window.Kakao.Auth.login({

            scope : 'profile_nickname, account_email, gender, age_range, birthday',
            success : function(authObj){
            	
                window.Kakao.API.request({
                    url : '/v2/user/me',
                    success : res => {
                        const Kakao_account = res.Kakao_account;
                    }
            });
            }
        });
     }
     
 	<!-- 네이버 로그인 API -->
 	var naverLogin = new naver.LoginWithNaverId(
 			{
 				clientId: "YislmfV3orQ2ba8nQ9R3", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
 				callbackUrl: "http://localhost:8989/MyPortfolio/company/companyLogin.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
 				isPopup: false,
 				callbackHandle: true
 			}
 		);	
 	naverLogin.init();
 	window.addEventListener('load', function () {
 		naverLogin.getLoginStatus(function (status) {
 			if (status) {
 				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
 	    		
 				console.log(naverLogin.user); 
 	    		
 	            if( email == undefined || email == null) {
 					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
 					naverLogin.reprompt();
 					return;
 				}
 			} else {
 				console.log("callback 처리에 실패하였습니다.");
 			}
 		});
 	});
 	var testPopUp;
 	function openPopUp() {
 	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
 	}
 	function closePopUp(){
 	    testPopUp.close();
 	}
 	function naverLogout() {
 		openPopUp();
 		setTimeout(function() {
 			closePopUp();
 			}, 1000);
 	}
</script>	

<script type="text/javascript">
$(function() {
	 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    console.log("아이디 : " + key);
    $("#emp_id").val(key); 
    
	$('.loginBtn').click(function() {
		
		let emp_idVal = $('#emp_id').val();
		let emp_pwdVal = $('#emp_pwd').val();
		
		let saveIdVal = $('#saveId').is(':checked');
		console.log("체크여부 : " + saveIdVal);
		
		var login = {
					emp_id : emp_idVal,
					emp_pwd : emp_pwdVal,
					saveId : saveIdVal
					}
		
		$.ajax({
			type : "post",
			url : "${cPath}/loginctr/loginSuccess.do",
			contentType : "application/json",
			data : JSON.stringify(login),
			success : function() {
				 location.href = "${cPath}/mainctr/main.do";
				 if(saveIdVal){
					 setCookie("key", $("#emp_id").val(), 7); // 7일 동안 쿠키 보관
				 }
			},
			error : function() {
				//비정상 처리시 수행
				alert('아이디 또는 비밀번호가 틀립니다.');
			}
		})
	})
	
	//쿠키저장
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	
	//쿠키삭제
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	//쿠키불러오기
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}

})
</script>
</body>
</html>