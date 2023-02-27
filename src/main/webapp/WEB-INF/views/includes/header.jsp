<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="${cPath}/mainctr/main.do">근태관리 프로그램</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><span class="nav-link active">총사원 :
						${workTypeMap.totalEmployee}명</span></li>
				<li class="nav-item"><span class="nav-link active">출근 :
						${workTypeMap.goToWork}명</span></li>
				<li class="nav-item"><span class="nav-link active">야근 :
						${workTypeMap.nightShift}명</span></li>
				<li class="nav-item"><span class="nav-link active">퇴근 :
						${workTypeMap.leaveWork}명</span></li>
				<li class="nav-item"><span class="nav-link active">휴가 :
						${workTypeMap.vacation}명</span></li>
				<li class="nav-item"><span class="nav-link active">외근 :
						${workTypeMap.out_work}명</span></li>
				<li class="nav-item"><span class="nav-link active">출장 :
						${workTypeMap.business_work}명</span></li>
				<li class="nav-item"><span class="nav-link active">재택근무
						: ${workTypeMap.home_work}명</span></li>
			</ul>
		</div>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<c:choose>
						<c:when test="${employeeLogin.emp_id eq null }">
							<li><a class="dropdown-item" href="${cPath}/loginctr/login.do">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="dropdown-item" href="${cPath}/mainctr/updateInformation.do">개인정보수정</a></li>
							<li><a class="dropdown-item" href="${cPath}/mainctr/logout.do">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</li>
		</ul>
	</nav>
</body>
</html>