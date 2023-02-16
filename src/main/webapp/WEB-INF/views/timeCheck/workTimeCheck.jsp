<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="${cPath}/resources/css/styles.css" rel="stylesheet" />
<html>
<head>
<meta charset="UTF-8">
<title>근무시간 확인 페이지</title>
</head>
<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../includes/sidebar.jsp"></jsp:include>
		<div id="layoutSidenav_content">
	<div class="container mt-3">
		<h3 class="mt-4">근무시간 확인</h3>
		<hr>
		<div class="text-center">
			<form action="${cPath}/timecheckctr/timeSelectCheck.do"
				class="d-flex w-25 float-end" method="get">
				<select class="form-select" required aria-label="select example"
					name="select">
					<option>월별 근무현황 조회</option>
					<option value="2023-01%"<c:if test="${select eq '2023-01%'}">selected=selected</c:if>>1월</option>
					<option value="2023-02%"<c:if test="${select eq '2023-02%'}">selected=selected</c:if>>2월</option>
					<option value="2023-03%"<c:if test="${select eq '2023-03%'}">selected=selected</c:if>>3월</option>
					<option value="2023-04%"<c:if test="${select eq '2023-04%'}">selected=selected</c:if>>4월</option>
					<option value="2023-05%"<c:if test="${select eq '2023-05%'}">selected=selected</c:if>>5월</option>
					<option value="2023-06%"<c:if test="${select eq '2023-06%'}">selected=selected</c:if>>6월</option>
					<option value="2023-07%"<c:if test="${select eq '2023-07%'}">selected=selected</c:if>>7월</option>
					<option value="2023-08%"<c:if test="${select eq '2023-08%'}">selected=selected</c:if>>8월</option>
					<option value="2023-09%"<c:if test="${select eq '2023-09%'}">selected=selected</c:if>>9월</option>
					<option value="2023-10%"<c:if test="${select eq '2023-10%'}">selected=selected</c:if>>10월</option>
					<option value="2023-11%"<c:if test="${select eq '2023-11%'}">selected=selected</c:if>>11월</option>
					<option value="2023-12%"<c:if test="${select eq '2023-12%'}">selected=selected</c:if>>12월</option>
				</select>
				<input type="submit" class="btn btn-dark ms-2" value="선택">
				<input type="hidden" name="emp_id" value="${list[0].emp_id}">
				<input type="hidden" name="emp_name" value="${list[0].emp_name}">
				<input type="hidden" name="num" value="1">
			</form>
			<table class="table">
				<tr class="fs-6">
					<th scope="col">순번</th>
					<th scope="col">날짜</th>
					<th scope="col">근무시작</th>
					<th scope="col">근무종료</th>
					<th scope="col">근무시간</th>
					<th scope="col">야간근무시작</th>
					<th scope="col">야간근무종료</th>
					<th scope="col">야간근무시간</th>
				</tr>
				<tbody class="fs-6">
					<c:choose>
						<c:when test="${list eq null}">
							<tr>
								<td colspan="7">근태 기록이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${list ne null}">
							<c:forEach var="emp" items="${list}" varStatus="status">
								<tr>
									<td scope="row">${status.count}</td>
									<td>${emp.work_date}</td>
									<td>${emp.start_time}</td>
									<td>${emp.end_time}</td>
									<td>${emp.total_time}</td>
									<td>${emp.night_start_time}</td>
									<td>${emp.night_end_time}</td>
									<td>${emp.night_total_time}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<form action="#">
				<c:if test="${prev}">
						<input 	type="submit"
								value="[이전]"
								class="btn btn-light"
								onclick="prev(this.form)"
								>
						<input type="hidden" name="num" value="${startPageNum - 1}">
						<input type="hidden" name="emp_id" value="${emp_id}">
						<input type="hidden" name="emp_name" value="${emp_name}">
				</c:if>
			</form>
			<form action="#">
				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
					<span>
					 	<c:if test="${check != num && divide eq '전체'}">
								<input 	type="submit"
										value="${num}"
										class="btn btn-light"
										onclick="pageAll(this.form)"
										>
							<input type="hidden" name="num" value="${num}">
							<input type="hidden" name="emp_id" value="${emp_id}">
							<input type="hidden" name="emp_name" value="${emp_name}">
						</c:if>
						<c:if test="${check == num && divide eq '전체'}">
							<b>${num}</b>
						</c:if>
					 	<c:if test="${check != num && divide eq '월별'}">
								<input 	type="submit"
										value="${num}"
										class="btn btn-light"
										onclick="pageMonth(this.form)"
										>
						<input type="hidden" name="num" value="${num}">
						<input type="hidden" name="select" value="${select}">
						<input type="hidden" name="emp_id" value="${emp_id}">
						<input type="hidden" name="emp_name" value="${emp_name}">
						</c:if>
						<c:if test="${check == num && divide eq '월별'}">
							<b>${num}</b>
						</c:if>
					</span>
				</c:forEach>
			</form>
			<form action="">
				<c:if test="${next}">
					<input 	type="submit"
							value="[다음]"
							class="btn btn-light"
							onclick="next(this.form)"
							>
					<input type="hidden" name="num" value="${endPageNum + 1}">
					<input type="hidden" name="emp_id" value="${emp_id}">
					<input type="hidden" name="emp_name" value="${emp_name}">
				</c:if>
				<input 	type="submit"
						class="btn btn-dark float-end"
						value="메인"
						onclick="mainPage(this.form)"
						>
				<input type="hidden" name="emp_id" value="${emp_id}">
				<input type="hidden" name="emp_name" value="${emp_name}">
			</form>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
</div>	
<script type="text/javascript">
function mainPage(obj) {
	obj.action = "${cPath}/mainctr/main.do";
	obj.method = "get";
	obj.submit();
}
function pageMonth(obj) {
	obj.action = "${cPath}/timecheckctr/timeSelectCheck.do";
	obj.method = "get";
	obj.submit();
}
function pageAll(obj) {
	obj.action = "${cPath}/timecheckctr/timeCheck.do";
	obj.method = "get";
	obj.submit();
}
function prev(obj) {
	obj.action = "${cPath }/timecheckctr/timeCheck.do";
	obj.method = "get";
	obj.submit();
}
function next(obj) {
	obj.action = "${cPath }/timecheckctr/timeCheck.do";
	obj.method = "get";
	obj.submit();
}

</script>
</body>
</html>