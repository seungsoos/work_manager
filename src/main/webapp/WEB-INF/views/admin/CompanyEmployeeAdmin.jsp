<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="${cPath}/resources/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
</head>
<body class="sb-nav-fixed">
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../includes/sidebar.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container">
					<h3 class="mt-4">사원관리</h3>
					<form action="${cPath}/adminctr/employeeTeamAdmin.do?num=1"
						class="d-flex w-25 float-end" method="post">
						<select class="form-select" required aria-label="select example"
							name="emp_department">
							<option>팀별 조회</option>
							<option value="개발">개발</option>
							<option value="인사">인사</option>
							<option value="디자인">디자인</option>
							<option value="테스터">테스터</option>
						</select> <input type="submit" class="btn btn-dark ms-3" value="선택">
					</form>
					<table class="table">
						<tr>
							<th scope="col">순번</th>
							<th scope="col">팀</th>
							<th scope="col">사원번호</th>
							<th scope="col">직급</th>
							<th scope="col">이름</th>
							<th scope="col">생년월일</th>
							<th scope="col">성별</th>
							<th scope="col">비고</th>
						</tr>
						<tbody>
							<c:choose>
								<c:when test="${emp_id eq 'admin'}">
									<c:forEach var="emp" items="${employeeList}" varStatus="status">
										<tr>
											<td scope="row">${status.count}</td>
											<td>${emp.emp_department}</td>
											<td>${emp.emp_number}</td>
											<td>${emp.emp_rank}</td>
											<td>${emp.emp_name}</td>
											<td>${emp.emp_birth}</td>
											<td>${emp.emp_gender}</td>
											<td><a
												href="${cPath}/adminctr/timeCheckAdmin.do?emp_id=${emp.emp_id}">근무시간수정</a>
												<a
												href="${cPath}/adminctr/employeeDelete.do?emp_id=${emp.emp_id}">삭제</a>
											</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
					<div class="d-flex justify-content-between">
						<div>
						</div>
						<div class="justify-content-center">
							<c:choose>
								<c:when test="${pageNum eq null}">
								</c:when>
								<c:otherwise>
									<form action="">
										<c:if test="${prev}">
											<input type="submit" value="[이전]" class="btn btn-light"
												onclick="prev(this.form)">
											<input type="hidden" name="num" value="${startPageNum - 1}">
										</c:if>
									</form>
									<form action="">
										<c:forEach begin="${startPageNum}" end="${endPageNum}"
											var="num">
											<c:if test="${select != num}">
												<input type="submit" name="num" value="${num}"
													class="btn btn-light" onclick="pageAll(this.form)">
												<input type="hidden" value="${num }">
											</c:if>
											<c:if test="${select == num}">
												<b>${num}</b>
											</c:if>
										</c:forEach>
									</form>
									<form action="">
										<c:if test="${next}">
											<input type="submit" value="[다음]" class="btn btn-light"
												onclick="next(this.form)">
											<input type="hidden" name="num" value="${endPageNum + 1}">
										</c:if>
									</form>
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							<form action="">
								<input type="submit" class="btn btn-dark"
									value="메인" onclick="mainPage(this.form)">
							</form>
						</div>
					</div>
					
				</div>
			</main>
			<jsp:include page="../includes/footer.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript">
function mainPage(obj) {
	obj.action = "${cPath}/mainctr/main.do";
	obj.method = "get";
	obj.submit();
}
function pageAll(obj) {
	obj.action = "${cPath}/adminctr/employeeAdmin.do";
	obj.method = "post";
	obj.submit();
}
function prev(obj) {
	obj.action = "${cPath}/adminctr/employeeAdmin.do";
	obj.method = "post";
	obj.submit();
}
function next(obj) {
	obj.action = "${cPath}/adminctr/employeeAdmin.do";
	obj.method = "post";
	obj.submit();
}
</script>
</body>
</html>