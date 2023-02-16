<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">
        .container{
            padding: 0;
            width: 500px;
        }
        .chkAll, .chk1, .chk2, .chk3, .chk4{
            width: 15px;
            height: 15px;
            margin-right: 5px;   
        }
        .mydiv{
            width: 100%;
            height: 100px;
            overflow: auto;
            border: 1px solid rgba(128, 128, 128, 0.789);
        }
        .myfont1{
            font-size: 14px;
        }
        .myfont2{
            font-size: 12px;
        }
        .myspan{
            font-size: 10px;
            color: rgb(102,102,102);
            padding: 0;
            letter-spacing: -0.23px;
        }
        .myspan2{
            font-size: 8px;
        }
        .mybtn{
	      width : 100px;
	      height : 40px;
        }
</style>
</head>
<body>
	<div class="container text-center mt-5">
		<img class="mb-4" src="${cPath}/resources/images/MainImage01.png" alt="" width="100" height="100">
		<div class="d-flex row">
		<form action="${cPath}/loginctr/join.do" method="post">
			<div class="col-12">
				<div class="d-flex">
					<input class="form-check-input chkAll " type="checkbox" name="chkAll" value="chkAll">
					<label class="form-check-label" for="">
						<p class="text-decoration-underline myfont1 fw-bolder">
							이용약관, 개인정보 수집 및 이용, 위치기반서비스 이용약관 (선택),<br> 프로모션 정보 수신(선택)에
							모두 동의합니다.
						</p>
					</label>
				</div>
			</div>
			<div class="col-12 mt-3">
				<div class="div1 d-flex align-content-center">
					<input class="form-check-input chk1 chk" type="checkbox" name="chk1" value="chk1">
					<label class="form-check-label" for="">
					<span class="myfont1 fw-bolder">이용약관 동의
						<span class="myspan2">(필수)</span>
					</span>
					</label>
				</div>
				<div class="mydiv myfont2">노트북 아련 컴퓨터 노트북 나래 포도 감사합니다 나래 도서관 비나리 도서 그루잠 사과 산들림 사과 아슬라 우리는 소록소록 도르레 미쁘다 책방 예그리나 아슬라 가온해 예그리나 노트북 나비잠 별빛 여우별 도서 소솜 여우비 아련 이플 별하 늘품 아련 노트북 곰다시 노트북 도서관 가온해 바람꽃 도서 아름드리 감또개 컴퓨터 소록소록 별빛 비나리.

달볓 옅구름 도르레 그루잠 소록소록 나비잠 바람꽃 여우별 안녕 산들림 소솜 예그리나 가온해 소록소록 아리아 노트북 미리내 나비잠 아련 컴퓨터 아름드리 별하 여우비 옅구름 소록소록 아슬라 소록소록 그루잠 노트북 나래 옅구름 곰다시 감또개 예그리나 로운 아리아 도담도담 달볓 옅구름 도르레 다솜 도담도담 가온해 산들림 나비잠 로운 도서 달볓 도담도담 그루잠.

나비잠 다솜 별빛 가온해 소록소록 우리는 도서관 로운 노트북 미쁘다 바람꽃 도담도담 이플 예그리나 늘품 아련 아련 바나나 로운 노트북 사과 다솜 산들림 포도 바나나 별하 달볓 미리내 소솜 함초롱하다 달볓 다솜 산들림 함초롱하다 다솜 소솜 함초롱하다 예그리나 산들림 로운 이플 나래 그루잠 도서 별하 이플 소솜 산들림 컴퓨터 안녕.</div>
				<div class="col-12 mt-3">
					<div class="div1 d-flex">
						<input class="form-check-input chk2 chk" type="checkbox" name="chk2" value="chk2">
						<label class="form-check-label" for="">
						<span class="myfont1 fw-bolder">개인정보 수집 및 이용 동의
							<span class="myspan2">(필수)</span>
						</span>
						</label>
					</div>
					<div class="mydiv myfont2">비나리 도서 바나나 가온누리 비나리 늘품 여우비 포도 포도 감사합니다 아슬라 아리아 감사합니다 로운 나비잠 도담도담 미쁘다 우리는 별빛 늘품 책방 바람꽃 미리내 우리는 바나나 가온해 노트북 바나나 별하 나비잠 예그리나 다솜 아름드리 예그리나 달볓 아련 아슬라 바나나 미쁘다 아름드리 이플 바나나 소록소록 소솜 아슬라 별빛 사과 여우비 아름드리 늘품.

여우비 나래 도서관 미리내 가온해 로운 감사합니다 로운 여우별 별빛 옅구름 우리는 비나리 별빛 도담도담 책방 아련 별빛 사과 아련 소록소록 우리는 옅구름 예그리나 책방 포도 바나나 함초롱하다 안녕 별빛 소솜 감사합니다 소솜 노트북 미리내 컴퓨터 바람꽃 책방 그루잠 소록소록 산들림 로운 도서관 함초롱하다 가온누리 나래 옅구름 미리내 나래 나래.

소록소록 미쁘다 도르레 함초롱하다 늘품 도서관 함초롱하다 아리아 이플 산들림 바나나 함초롱하다 도담도담 가온해 아슬라 산들림 바나나 도담도담 이플 나비잠 여우별 아리아 여우별 함초롱하다 노트북 소솜 도담도담 옅구름 도서관 달볓 사과 감사합니다 아련 안녕 함초롱하다 함초롱하다 안녕 도담도담 산들림 감또개 가온누리 책방 비나리 옅구름 우리는 도서 아련 예그리나 미쁘다 함초롱하다.</div>
				</div>
				<div class="col-12 mt-3">
					<div class="div1 d-flex">
						<input class="form-check-input chk3 " type="checkbox" name="chk3" value="chk3">
						<label class="form-check-label" for="">
							<span class="myfont1 fw-bolder">위치기반서비스 이용약관 동의
							<span class="myspan2">(선택)</span>
							</span>
						</label>
					</div>
					<div class="mydiv myfont2">도르레 옅구름 가온해 다솜 늘품 예그리나 가온누리 우리는 아련 아슬라 바람꽃 여우비 예그리나 그루잠 사과 책방 포도 함초롱하다 다솜 감또개 로운 미쁘다 예그리나 그루잠 소솜 노트북 나비잠 감사합니다 감사합니다 노트북 컴퓨터 아름드리 사과 바람꽃 감사합니다 가온해 도담도담 소솜 여우비 도르레 감사합니다 소록소록 나래 늘품 우리는 늘품 아리아 감또개 감또개 아슬라.

다솜 노트북 책방 가온해 사과 소록소록 나래 바람꽃 안녕 감또개 나비잠 아련 여우별 산들림 가온해 가온해 별빛 사과 나비잠 감사합니다 아름드리 안녕 산들림 아리아 도담도담 도서관 늘품 함초롱하다 안녕 안녕 아련 사과 포도 사과 별빛 별하 로운 예그리나 아련 다솜 가온해 달볓 노트북 포도 우리는 포도 예그리나 소솜 나래 나비잠.

포도 컴퓨터 우리는 안녕 도르레 별하 비나리 바람꽃 아름드리 함초롱하다 안녕 달볓 로운 아련 산들림 사과 여우별 바람꽃 곰다시 감사합니다 컴퓨터 도담도담 우리는 아리아 나비잠 아름드리 감사합니다 안녕 옅구름 옅구름 나래 컴퓨터 아리아 컴퓨터 미쁘다 다솜 아슬라 늘품 나비잠 책방 곰다시 여우비 도르레 도르레 감또개 로운 도담도담 산들림 미리내 늘품.</div>
				</div>
				<div class="col-12 mt-3">
					<div class="div1 d-flex">
						<input class="form-check-input chk4" type="checkbox" name="chk4" value="chk4">
						<label class="form-check-label" for="">
						<span class="myfont1 fw-bolder">프로모션 정보 수신 동의
							<span class="myspan2">(선택)</span>
						</span>
						</label>
					</div>
					<p class="myspan">이플 로운 늘품 포도 이플 안녕 가온해 가온해 아름드리 도서 예그리나 비나리 다솜 아름드리 감또개 도서 여우별 도담도담 도담도담 달볓 별하 사과 아리아 다솜 함초롱하다 아름드리 그루잠 포도 우리는 그루잠 예그리나 감사합니다 감또개 우리는 별빛 아슬라 포도 도르레 가온누리 사과 별하 나비잠 안녕 나비잠 늘품 컴퓨터 감또개 바람꽃 포도 책방.</p>
				</div>
				<div class="col-12 d-flex justify-content-center">
						<input 	type="submit" 
							class="btn btn-primary mybtn yes" 
							value="동의"
							disabled
							>
					<input 	type="button" 
							class="btn btn-primary mybtn ms-2 no" 
							value="미동의"
							onclick="notAgree(this.form)"
							>
				</div>
			</div>
			</form>
		</div>
	</div>

<script type="text/javascript">
	function notAgree(obj) {
		obj.action = "${cPath}/loginctr/login.do";
		obj.method = "get";
		obj.submit();
	}
	
	const chkAll = document.querySelector('.chkAll')
	const chk1 = document.querySelector('.chk1')
	const chk2 = document.querySelector('.chk2')
	const chk3 = document.querySelector('.chk3')
	const chk4 = document.querySelector('.chk4')
	const yes = document.querySelector('.yes')
	const no = document.querySelector('.no')


	chkAll.addEventListener('change',(e)=>{
	    chkState = e.target.checked
	    if(chkState){
	       console.log('전체동의')
	        chk1.checked = true
	        chk2.checked = true
	        chk3.checked = true
	        chk4.checked = true
	        yes.disabled = false
	    }else{
	        chk1.checked = false
	        chk2.checked = false
	        chk3.checked = false
	        chk4.checked = false
	        yes.disabled = true
	        console.log('해제')
	    }
	})

	const chkContainer = document.querySelectorAll('.chk')
	console.log(chkContainer.length)
	var chk_length = chkContainer.length
	const chkAllCount = document.querySelectorAll('.chk1,.chk2,.chk3,.chk4')

	var count=0;
	chkContainer.forEach(chk=>{
	    chk.addEventListener('change',() => {
	        count=0
	        chk_count()
	       
	    })
	  
	})

	chkAllCount.forEach(chk=>{
	    chk.addEventListener('change',()=>{
	        chk_All()
	    })
	})

	function chk_count(){
	   
	    chkContainer.forEach((chk)=>{
	        if(chk.checked){
	            count++
	            // console.log(count)
	        }
	    })

	    if(chk_length==count){
	        yes.disabled = false
	    }else{
	        yes.disabled=true
	    }
	}

	function chk_All(){
	    var count =0;
	    if(chk1.checked == true){
	        count++;
	        if(chk2.checked == true){
				count++;
				if(chk3.checked == true){
					count++;
					if(chk4.checked == true){
						count++;
						  if(count == 4){
						        chkAll.checked = true
						        console.log(count)
						    }else{
						        chkAll.checked = false
						    }

					}else{
						count--;
					}
				}else{
						count--;
				}
			}else{
				count--;
			}
	    }else{
	        count--
	        console.log(count)
	    }
	 }
</script>
</body>
</html>