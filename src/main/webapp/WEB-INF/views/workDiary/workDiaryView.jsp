<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<c:set var="boardEmp_id" value="${boardList.emp_id}"/>
<c:set var="emp_id" value="${emp_id}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무 일지 보기</title>
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
					<h1 class="mt-4">게시글 보기</h1>
					<hr>
					<form name="frmMember" method="get"
						action="${cPath}/articleBoard/insertArticle.do">
						<div class="mb-3">
							<label for="id" class="form-label">직책 / 작성자</label> <input
								type="text" class="form-control" name=""
								value="${boardList.emp_rank} / ${boardList.emp_name}" id="id"
								disabled="disabled">
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">팀</label> <input
								type="text" class="form-control" name=""
								value="${boardList.emp_department}" id="department"
								disabled="disabled">

						</div>
						<div class="mb-3">
							<label for="title" class="form-label">글제목</label> <input
								type="text" class="form-control" name="diary_title"
								value="${boardList.diary_title}" id="diary_title"
								disabled="disabled">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">글내용</label>
							<textarea rows="5" id="diary_content" cols="30" maxlength="4000"
								class="form-control" name="diary_content" disabled="disabled">${boardList.diary_content}</textarea>
						</div>
						<div class="mb-3">
							<label for="wirte" class="form-label">작성일자</label> <input
								type="text" class="form-control" name="diary_date"
								value="${boardList.diary_date}" id="diary_date"
								disabled="disabled">
						</div>
						<div id="view_div d-flex flex-row-reverse">
							<c:if
								test="${boardEmp_id eq emp_id || employeeLogin.emp_id eq 'admin'}">
								<div class="mb-3" id="session_div">
									<input type="button" class="btn btn-dark" value="수정하기"
										onclick="boardModify()">
									<button type="button" class="btn btn-dark"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										삭제하기</button>
								</div>
							</c:if>
							<div class="mb-3" id="modify_div" style="display: none">
								<input type="button" class="btn btn-dark" value="수정반영하기"
									onclick="boardModifyResult(this.form)"> <input
									type="button" class="btn btn-dark" value="취소"
									onclick="cancelModify(this.form)"> <input
									type="hidden" name="boardList" value="${boardList.articleNo}">
							</div>
							<div>
								<input type="button" class="btn btn-dark" value="목록"
									onclick="backToList(this.form)">
							</div>
						</div>
					</form>
				</div>

				<!-- MODAL -->
				<script
					src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
					integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
					crossorigin="anonymous"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
					integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
					crossorigin="anonymous"></script>
				<div class="modal" tabindex="-1" id="exampleModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">게시글 삭제</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>게시글을 삭제하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-dark"
									onclick="boardRemove('${cPath}/workdiaryctr/workDiaryRemove.do', ${boardList.articleNo})">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="../includes/footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- jQuery 연결 -->
	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	//수정하기
	function boardModify(){
			document.getElementById('diary_title').disabled = false;
			document.getElementById('diary_content').disabled = false;
			document.getElementById('modify_div').style.display = "block";
			document.getElementById('session_div').style.display = "none";
	}
	
		//수정반영하기 처리하는 부분
	function boardModifyResult(html_form) {
		html_form.method = "post";
		html_form.action = "${cPath}/workdiaryctr/workDiaryModify.do";
		html_form.submit(); 
	}	
		
		//목록 돌아가기
	function backToList(html_form) {
		html_form.action = "${cPath}/workdiaryctr/workDiary.do?num=1";
		html_form.method = "post"; 
		html_form.submit();
	}
		//수정하기 취소
	function cancelModify(html_form) {
		document.getElementById('diary_title').disabled = true;
		document.getElementById('diary_content').disabled = true;
		document.getElementById('modify_div').style.display = "none";
		document.getElementById('session_div').style.display = "block";
	}
		
		//삭제하기
	function boardRemove(url, articleNo) {
		var form = document.createElement("form");

		form.setAttribute('method','post');
		form.setAttribute('action', url);
		
		var parentNOInput = document.createElement('input'); 
		parentNOInput.setAttribute('type', 'hidden');
		parentNOInput.setAttribute('name', 'articleNo');
		parentNOInput.setAttribute('value', articleNo);
		form.appendChild(parentNOInput);
		document.body.appendChild(form);
		form.submit();
		
		}
		
</script>
</body>
</html>