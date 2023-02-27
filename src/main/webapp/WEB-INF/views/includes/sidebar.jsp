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
<body>
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark"
			id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<c:if test="${employeeLogin.emp_id eq 'admin'}">
						<div class="sb-sidenav-menu-heading">관리자 기능</div>
						<a class="nav-link"
							href="${cPath}/adminctr/employeeAdmin.do?num=1">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 사원관리
						</a>
					</c:if>
					<div class="sb-sidenav-menu-heading">근무</div>
					<a class="nav-link" href="${cPath}/mainctr/workDiary.do?num=1">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 근무일지
					</a>
					<div class="sb-sidenav-menu-heading">근태</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseLayouts" aria-expanded="false"
						aria-controls="collapseLayouts">
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> 근태신청
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayouts"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="${cPath}/worktypectr/workType.do">근태신청</a>
							<a class="nav-link"
								href="${cPath}/worktypectr/workTypeStatus.do?num=1">근태신청현황</a>
						</nav>
					</div>
					<a class="nav-link collapsed"
						href="${cPath}/worktypeapproverctr/approver.do">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i>
						</div> 근태결재
					</a> <a class="nav-link collapsed"
						href="${cPath}/calendarctr/calendar.do">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i>
						</div> 근태일정확인
					</a>
					<div class="sb-sidenav-menu-heading">근무시간조회</div>
					<a class="nav-link"
						href="${cPath}/mainctr/timeCheck.do?emp_id=${employeeLogin.emp_id}&emp_name=${employeeLogin.emp_name}">
						<div class="sb-nav-link-icon">
							<i class="fas fa-chart-area"></i>
						</div> 나의근무시간조회
					</a>
				</div>
			</div>
			<div class="sb-sidenav-footer">
				<div class="small">Logged in as:</div>
				${employeeLogin.emp_department}<br>
				${employeeLogin.emp_rank}/${employeeLogin.emp_name}님
			</div>
		</nav>
	</div>
</body>
</html>