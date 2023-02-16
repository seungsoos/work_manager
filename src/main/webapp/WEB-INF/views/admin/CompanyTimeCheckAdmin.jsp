<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무시간수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script 
	src="https://code.jquery.com/jquery-3.6.3.js" 
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<link href="${cPath}/resources/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<style type="text/css">
	.test{
		width: 100px;
	}
</style>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../includes/sidebar.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container">
					<h3 class="mt-4">근무시간수정</h3>
					<hr>
					<div class="text-center">
						<form action="${cPath}/adminctr/timeCheckMonthAdmin.do"
							class="d-flex w-25 float-end" method="post">
							<select class="form-select" required aria-label="select example"
								name="select" id="select">
								<option>월별 근무현황 조회</option>
								<option value="2023-01%">1월</option>
								<option value="2023-02%">2월</option>
								<option value="2023-03%">3월</option>
								<option value="2023-03%">4월</option>
								<option value="2023-03%">5월</option>
								<option value="2023-03%">6월</option>
								<option value="2023-03%">7월</option>
								<option value="2023-03%">8월</option>
								<option value="2023-03%">9월</option>
								<option value="2023-03%">10월</option>
								<option value="2023-03%">11월</option>
								<option value="2023-03%">12월</option>
							</select> <input type="submit" class="btn btn-dark ms-3 monthBtn"
								value="선택"> <input type="hidden" name="emp_id"
								value="${emp_id}" id="emp_id"> <input type="hidden"
								name="num" value="1">
						</form>
						<table class="table">
							<tr>
								<th scope="col">순번</th>
								<th scope="col">날짜</th>
								<th scope="col">근무시작</th>
								<th scope="col">근무종료</th>
								<th scope="col">근무시간</th>
								<th scope="col">야간근무시작</th>
								<th scope="col">야간근무종료</th>
								<th scope="col">야간근무시간</th>
								<th scope="col">비고</th>
							</tr>
							<tbody id="tbody">
								<c:choose>
									<c:when test="${list eq null}">
										<tr>
											<td colspan="9">근무시간을 선택해주세요.</td>
										</tr>
									</c:when>
									<c:otherwise>
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
												<td><a
													href="${cPath}/adminctr/timeUpdateAdmin.do?emp_id=${emp.emp_id}&work_date=${emp.work_date}">수정</a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<c:choose>
							<c:when test="${list eq null}">
							</c:when>
							<c:otherwise>
								<form action="#">
									<c:if test="${prev}">
										<input type="submit" value="[이전]" class="btn btn-light"
											onclick="prev(this.form)">
										<input type="hidden" name="num" value="${startPageNum - 1}">
										<input type="hidden" name="emp_id" value="${emp_id}">
									</c:if>
								</form>
								<form action="#">
									<c:forEach begin="${startPageNum}" end="${endPageNum}"
										var="num">
										<span> <c:if test="${check != num}">
												<input type="submit" value="${num}" class="btn btn-light"
													onclick="pageMonth(this.form)">
												<input type="hidden" name="num" value="${num}">
												<input type="hidden" name="select" value="${select}">
												<input type="hidden" name="emp_id" value="${emp_id}">
											</c:if> <c:if test="${check == num}">
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
									<input type="hidden" name="emp_id" value="${emp_id}">
								</form>

							</c:otherwise>
						</c:choose>
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
function pageMonth(obj) {
	obj.action = "${cPath}/adminctr/timeCheckMonthAdmin.do";
	obj.method = "get";
	obj.submit();
}
function prev(obj) {
	obj.action = "${cPath}/adminctr/timeCheckMonthAdmin.do";
	obj.method = "post";
	obj.submit();
}
function next(obj) {
	obj.action = "${cPath}/adminctr/timeCheckMonthAdmin.do";
	obj.method = "post";
	obj.submit();
}

</script>
</body>
</html>