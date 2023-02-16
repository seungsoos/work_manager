<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 페이지</title>
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
					<h3 class="mt-4">업무일지 확인</h3>
					<table class="table">
						<tr>
							<td colspan="5">
								<div>
									<a href="${cPath}/workdiaryctr/workDiaryWrite.do"
										class="btn btn-dark float-end">글작성</a>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">팀</th>
							<th scope="col">제목</th>
							<th scope="col">직책/작성자</th>
							<th scope="col">작성일</th>
						</tr>
						<tbody>
							<c:choose>
								<c:when test="${boardList eq null }">
									<td colspan="5">등록된 글이 없습니다.</td>
								</c:when>
								<c:when test="${boardList ne null }">
									<c:forEach var="board" items="${boardList}" varStatus="status">
										<tr>
											<td scope="row">${status.count}</td>
											<td>${board.emp_department}</td>
											<td><a
												href="${cPath}/workdiaryctr/workDiaryView.do?boardList=${board.articleNo}">
													${board.diary_title}</a></td>
											<td>${board.emp_rank}/${board.emp_name}</td>
											<td>${board.diary_date}</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
					<div class="d-flex justify-content-between">
						<div></div>
						<div class="d-flex">
							<form action="">
								<c:if test="${prev}">
									<input type="submit" value="[이전]" class="btn btn-light"
										onclick="prev(this.form)">
									<input type="hidden" name="num" value="${startPageNum - 1}">
								</c:if>
							</form>
							<form action="">
								<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
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
						</div>
						<div>
							<form action="">
								<input type="submit" class="btn btn-dark" value="메인"
									onclick="mainPage(this.form)">
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
	obj.action = "${cPath}/workdiaryctr/workDiary.do";
	obj.method = "post";
	obj.submit();
}
function prev(obj) {
	obj.action = "${cPath}/workdiaryctr/workDiary.do";
	obj.method = "post";
	obj.submit();
}
function next(obj) {
	obj.action = "${cPath}/workdiaryctr/workDiary.do";
	obj.method = "post";
	obj.submit();
}
</script>
</body>
</html>