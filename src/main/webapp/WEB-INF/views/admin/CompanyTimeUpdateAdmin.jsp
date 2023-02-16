<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무시간 수정</title>
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
	<h1 class="mt-4">근무시간 수정</h1>
	<hr>
	<form method="get" action="${cPath}/articleBoard/insertArticle.do">
		<input type="hidden" name="emp_id" value="${timeList.emp_id}">
		<div class="mb-3">
			<label for="id" class="form-label">이름</label> <input type="text"
				class="form-control" name="" value="${timeList.emp_name}"
				id="emp_name" disabled="disabled">
		</div>
		<div class="mb-3">
			<label for="title" class="form-label">날짜</label> <input type="text"
				class="form-control" name="work_date" value="${timeList.work_date}"
				id="work_date" disabled="disabled">
		</div>
		<div class="mb-3">
			<label for="title" class="form-label">근무시작</label> <input type="text"
				class="form-control" name="start_time"
				value="${timeList.start_time}" id="start_time" disabled="disabled">
			<label for="title" class="form-label mt-3">근무종료</label> <input
				type="text" class="form-control" name="end_time"
				value="${timeList.end_time}" id="end_time">
		</div>
		<div class="d-flex justify-content-end">
			<input type="button" class="btn btn-dark ms-2" value="수정하기"
				onclick="timeUpdateResult(this.form)"> <input type="button"
				class="btn btn-dark ms-2" value="취소" onclick="backToList(this.form)">
			<input type="button" class="btn btn-dark ms-2" value="메인"
				onclick="mainPage(this.form)">
		</div>
	</form>
</div>
</main>
<jsp:include page="../includes/footer.jsp"></jsp:include>
</div>
</div>

<script type="text/javascript">
	function timeUpdateResult(obj) {
		alert('근무시간이 수정되었습니다.')
		document.getElementById('work_date').disabled = false;
		document.getElementById('start_time').disabled = false;
		obj.action = "${cPath}/adminctr/timeUpdateResultAdmin.do";
		obj.method = "post";
		obj.submit();
	}

	function backToList(obj) {
		obj.action = "${cPath}/adminctr/timeCheckAdmin.do";
		obj.method = "get";
		obj.submit();
	}

	function mainPage(obj) {
		obj.action = "${cPath}/mainctr/main.do";
		obj.method = "get";
		obj.submit();
	}
</script>
</body>


</html>