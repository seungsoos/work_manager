<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일지 작성 페이지</title>
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
					<h1 class="mt-4">글작성</h1>
					<hr>
					<form method="post"
						action="${cPath}/workdiaryctr/workDiaryWriteSave.do">
						<div class="mb-3">
							<label for="title" class="form-label">글제목</label> <input
								type="text" class="form-control" name="diary_title"
								id="diary_title">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">글내용</label>
							<textarea rows="5" id="diary_content" cols="30"
								name="diary_content" maxlength="4000" class="form-control"
								name="content"></textarea>
						</div>
						<div class="d-flex justify-content-end">
							<input type="submit" class="btn btn-dark" value="저장">
							<input type="button" class="btn btn-dark ms-2" value="목록"
								onclick="backToList(this.form)">
						</div>
					</form>
				</div>
			</main>
			<jsp:include page="../includes/footer.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript">
function backToList(obj) {
	obj.action = "${cPath}/workdiaryctr/workDiary.do?num=1";
	obj.method = "post";
	obj.submit();
}
</script>
</body>
</html>