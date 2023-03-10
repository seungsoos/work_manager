<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 신청 페이지</title>
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
					<h1 class="mt-4">근태신청</h1>
					<hr>
					<form method="post" action="${cPath}/worktypectr/workTypeApproverSave.do">
						<div class="mb-3">
							<label for="work_date_start" class="form-label">근무시작날짜</label> <input
								type="date" class="work_date_start" name="work_date_start"
								id="work_date_start"> <label for="work_date_end"
								class="form-label">근무종료날짜</label> <input type="date"
								class="work_date_end" name="work_date_end" id="work_date_end">
						</div>
						<div class="mb-3">
							<label for="work_type" class="form-label">근무타입선택</label> <select
								class="form-select" required aria-label="select example"
								id="work_type" name="work_type">
								<option selected disabled>근무타입선택</option>
								<option value="휴가">휴가</option>
								<option value="외근">외근</option>
								<option value="출장">출장</option>
								<option value="재택근무">재택근무</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="work_content" class="form-label">사유</label> <input
								type="text" class="form-control" name="work_content"
								id="work_content">
						</div>
						<label for="work_approver" class="form-label">결재자 지정</label>
						<div class="mb-3 d-flex">
							<input type="text" class="form-control" name="approver_emp_id"
								id="approver_emp_id" disabled> <input type="button"
								class="btn btn-dark" value="검색" onclick="approver()">
						</div>
						<div class="d-flex justify-content-end">
							<input type="submit" class="btn btn-dark saveBtn" value="저장"
								> <input
								type="submit" class="btn btn-dark ms-2" value="목록"
								onclick="mainList(this.form)">
						</div>	
					</form>
				</div>
			</main>
			<jsp:include page="../includes/footer.jsp"></jsp:include>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.3.js" 
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
	crossorigin="anonymous"></script>	
<script type="text/javascript">

$(function() {
	
	$('.saveBtn').click(function(e) {
		
		if($('#work_date_start').val() != '' && $('#work_date_end').val() != ''){
			if($('#work_type').val() != null && $('#work_type').val() != ''){
				if($('#work_content').val() != null && $('#work_content').val() != ''){
					if($('#approver_emp_id').val() != null && $('#approver_emp_id').val() != ''){
						$('#approver_emp_id').attr("disabled",false);
						
						$('.saveBtn').submit();
					}else{
						alert('결재자를 지정해주세요.');
						e.preventDefault();
					}
				}else{
					alert('사유를 입력해주세요.');
					e.preventDefault();
				}
			}else{
				alert('근무타입을 입력해주세요.');
				e.preventDefault();
			}
		}else{
			alert('근무날짜를 입력해주세요.');
			e.preventDefault();
		}
	})

})
	function mainList(obj){
		obj.action = "${cPath}/mainctr/main.do"
		obj.method = "post";
		obj.submit();
	}

	function approver(){
		window.open("${cPath}/worktypectr/workTypeWindow.do", "_blank", "width=350, height=400");
	}
</script>
</body>
</html>