<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 신청 현황</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="${cPath}/resources/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
</head>
<body class="sb-nav-fixed">
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../includes/sidebar.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container">
					<h3 class="mt-4">근태 신청 현황</h3>
					<hr>
					<div class="text-center">
						<table class="table">
							<tr class="fs-6">
								<th scope="col">순번</th>
								<th scope="col">팀</th>
								<th scope="col">직급</th>
								<th scope="col">이름</th>
								<th scope="col">근무시작날짜</th>
								<th scope="col">근무종료날짜</th>
								<th scope="col">근무타입</th>
								<th scope="col">사유</th>
								<th scope="col">결재진행현황</th>
							</tr>
							<tbody class="fs-6">
								<c:choose>
									<c:when
										test="${workTypeList == null && workTypeList.length == 0}">
										<tr>
											<td colspan="9">근태 신청이 없습니다.</td>
										</tr>
									</c:when>
									<c:when test="${workTypeList != null}">
										<c:forEach var="emp" items="${workTypeList}"
											varStatus="status">
											<tr>
												<td scope="row">${status.count}</td>
												<td>${emp.emp_department}</td>
												<td>${emp.emp_rank}</td>
												<td>${emp.emp_name}</td>
												<td>${emp.work_date_start}</td>
												<td>${emp.work_date_end}</td>
												<td>${emp.work_type}</td>
												<td>${emp.work_content}</td>
												<td>${emp.final_approver}</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
						<div>
							<form action="">
								<c:if test="${prev}">
									<input type="submit" value="[이전]" class="btn btn-light"
										onclick="prev(this.form)">
									<input type="hidden" name="num" value="${startPageNum - 1}">
								</c:if>
							</form>
							<form action="">
								<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
									<span> <c:if test="${select != num}">
											<input type="submit" name="num" value="${num}"
												class="btn btn-light" onclick="pageAll(this.form)">
											<input type="hidden" value="${num }">
										</c:if> <c:if test="${select == num}">
											<b>${num}</b>
										</c:if>
									</span>
								</c:forEach>
							</form>
							<form action="">
								<c:if test="${next}">
									<input type="submit" value="[다음]" class="btn btn-light"
										onclick="next(this.form)">
									<input type="hidden" name="num" value="${endPageNum + 1}">
								</c:if>
							</form>
						</div>
						<form action="">
							<input type="submit" class="btn btn-dark float-end"
								value="메인" onclick="mainPage(this.form)">
						</form>
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
	obj.action = "${cPath}/worktypectr/workTypeStatus.do";
	obj.method = "get";
	obj.submit();
}
function prev(obj) {
	obj.action = "${cPath}/worktypectr/workTypeStatus.do";
	obj.method = "get";
	obj.submit();
}
function next(obj) {
	obj.action = "${cPath}/worktypectr/workTypeStatus.do";
	obj.method = "get";
	obj.submit();
}
</script>
</body>
</html>