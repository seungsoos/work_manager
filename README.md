## 근태관리프로그램_포트폴리오

### 개요
  1.  개발기간 : 2022.12. ~ 2023.01(2개월)
  2.  개발인원 : 1명(개인프로젝트)
  3.  개발환경
      * 사용언어 및 기술: Java(jdk 11), jstl, JavaScript, CSS/HTML
      * 프레임워크 : Spring Legacy, MyBatis, Jquery, Ajax
      * 서버 : Apache Tomcat 9.0
      * DB : Maria DB
      * 편집툴 : STS, HeidiSQL

### 프로젝트 구성
  1.  패키지 구성
  
  ![패키지 구조](https://user-images.githubusercontent.com/113499796/221560150-70c19684-b5dd-45fe-a2f3-86c09e870486.png)
  
  
  ![패키지 구조-2](https://user-images.githubusercontent.com/113499796/221560193-cca8c51c-e043-40a1-8b13-e4e6336a255b.png)
  
  2. View 구성
  
  ![jsp구조](https://user-images.githubusercontent.com/113499796/221560030-3ce77595-41fd-4b4c-8d0e-bdb6eeec5eb8.png)

### 프로그램 구현
  1.  로그인페이지(gif)
  
  ![ezgif com-video-to-gif (1)](https://user-images.githubusercontent.com/113499796/221567246-71a11e8f-6998-4e51-a874-8820e2546fe2.gif)


  2.  근태관리(gif)  
  
  ![ezgif com-video-to-gif (2)](https://user-images.githubusercontent.com/113499796/221568380-6ebf3433-c4b2-4f77-8f60-81e78b740aa4.gif)

  * 주간 총 근무시간 메인페이지에 전시

  ![image](https://user-images.githubusercontent.com/113499796/221569018-2153b5b5-691b-4c92-b25d-01fb462c8bc7.png)

  3.  근무신청(gif)
  
  * 사원 -> 결재자 지정
    
  ![ezgif com-video-to-gif (4)](https://user-images.githubusercontent.com/113499796/221570470-bf49fbbd-db2f-4892-9c22-73f79b76bd29.gif)

  * 결재자 -> 승인/반려 처리
  * 승인처리시 DB 밒 캘린더 API 반영

  ![ezgif com-video-to-gif (5)](https://user-images.githubusercontent.com/113499796/221571781-771ea6a5-6d1e-42d2-ae8b-8d123a43958b.gif)

  4.  근태현황
  
  ![image](https://user-images.githubusercontent.com/113499796/221572582-1fd5b6fd-3245-41de-85dd-a44aead4dd78.png)

  5.  월별 근무시간 
  
  ![image](https://user-images.githubusercontent.com/113499796/221573074-f7f2ab09-6967-4989-85c5-8eff484dd2d9.png)
  
  6.  관리자 모드(사원관리)
  
  ![ezgif com-video-to-gif (6)](https://user-images.githubusercontent.com/113499796/221574491-744b262b-188b-4038-a474-7c8d265f0e03.gif)

### 주요데이터 흐름
  1.  근태관리 구성
  
  ![image](https://user-images.githubusercontent.com/113499796/221574671-cfe5029f-df10-4bc6-bbf6-5ff5eed63a65.png)
  
  ![image](https://user-images.githubusercontent.com/113499796/221574731-e9cee845-95e3-4e22-9792-69f058d2e663.png)
  
  * 일일 주/야간 근무 버튼 클릭시 DateTime이 DB에 저장
  * 주간 총 근무시간(근무종료 - 근무시작)으로 산출
  * 개인별 주간 총 근무시간이 산출되어 메인페이지에 전시 
  
  2.  근무신청 구성
  
  ![image](https://user-images.githubusercontent.com/113499796/221574777-a3343304-9487-4e75-ad23-e1e6157a7f0a.png)
  
  ![image](https://user-images.githubusercontent.com/113499796/221574810-2b87ced9-794d-4a86-bb01-e4f374698fb6.png)
  
  * 사원은 근무형태를 신청
  * 시작/종료 일자, 근무형태, 사유를 기입 후 결재자를 지정
  * 결재자는 승인/반려 처리, 승인시 캘린더 API에 반영
  * 팀별 근무신청 조회 가능
  
### 데이터베이스 구조

  ![image](https://user-images.githubusercontent.com/113499796/221574857-fce7c0af-ec43-43d1-b061-979a7d240c10.png)
