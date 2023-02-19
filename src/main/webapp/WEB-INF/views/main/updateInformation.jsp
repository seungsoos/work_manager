<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
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
					<h3 class="mt-4">개인정보수정</h3>
					<hr>
					<div class="text-center">
						<form action="${cPath}/mainctr/main.do" method="post">
							<div class="form-floating">
								<input type="text" class="form-control" id="emp_id"
									name="emp_id" value="${employeeLogin.emp_id }"
									disabled="disabled"> <label for="floatingId">아이디</label>
							</div>
							<div class="form-floating">
								<input type="text" class="form-control number" id="emp_number"
									name="emp_number" value="${employeeLogin.emp_number }"
									disabled="disabled"> <label for="floatingId">사원번호</label>
							</div>
							<div class="form-floating">
								<input type="text" class="form-control rank" name="emp_rank"
									value="${employeeLogin.emp_rank}"> <label
									for="floatingId">직급</label>
							</div>
							<div class="form-floating">
								<input type="text" class="form-control department"
									name="emp_department" value="${employeeLogin.emp_department }">
								<label for="floatingId">부서</label>
							</div>
							<input type="hidden" name="emp_pwd"
								value="${employeeLogin.emp_pwd }">
							<div class="mt-2 d-flex justify-content-end">
								<input type="submit" class="btn btn-dark ms-2" value="메인">
								<input class="btn btn-dark  ms-2" type="submit"
									value="비밀번호 수정" onclick="updatePassword(this.form)">
								<input class="btn btn-dark ms-2" type="submit"
									value="개인정보수정" onclick="updateInformation(this.form)">
							</div>
						</form>
					</div>
				</div>
			</main>
			<jsp:include page="../includes/footer.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript">
		function updatePassword(obj) {
			document.getElementById('emp_id').disabled = false;
			obj.action = "${cPath}/loginctr/pwChange.do";
			obj.method = "post";
			obj.submit();
		}
		function updateInformation(obj) {
			alert('개인정보수정이 완료되었습니다.');
			document.getElementById('emp_id').disabled = false;
			obj.action = "${cPath}/mainctr/updateInformationResult.do";
			obj.method = "post";
			obj.submit();
		}
	</script>
</body>
</html>